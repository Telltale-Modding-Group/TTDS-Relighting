--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "TrainStationNight"
local kScene = "adv_trainStationNight"

local kLouisChore = "env_trainStationNight_act2_bg_louisDistract_1.chore"
local mbAbelPresent = false
local mbDebugText = false
local mClemDeathMonitorThread, mLouisController, mLouisFadeThread
local mFoodSlots = {
  false,
  false,
  false
}
local mPlaceController, mTakeController, mAJThread
local mFoodCollected = 0
local mFoodLimit
local mZombieStates = {}

local OnLogicReady = function()
  local debugID = LogicGet("Debug ID")

  if debugID == 1 then
    Game_SetSceneDialogNode("cs_onTop")
  elseif debugID == 2 then
    AgentSetProperty("Clementine", "Player - Over The Shoulder Control Mode", true)
    AgentHide("Zombie01", true)
    AgentHide("Zombie02", true)
    AgentHide("Zombie03", true)
    Game_SetSceneDialogNode("cs_clemWaitingBehindCover")
  elseif debugID == 3 then
    Game_SetSceneDialogNode("cs_madeIt")
  end
end

local DebugPrint = function(mesg, verbosity, bIsError)
  if not mbDebugText then
    return
  end
  Print(mesg, verbosity, bIsError)
end

local OnDeath = function()
  ThreadStart(TrainStationNight_EnableLouisDistraction, false, 1)
  TrainStationNight_MonitorForClemDeath(false)
  Dialog_StopBackground()
end

local FadeInVolume = function(controller, fadeTime)
  local elapsedTime = GetFrameTime()

  while fadeTime > elapsedTime and ControllerIsPlaying(controller) do
    ControllerSetSoundVolume(controller, elapsedTime / fadeTime)
    WaitForNextFrame()
    elapsedTime = elapsedTime + GetFrameTime()
  end

  ControllerSetSoundVolume(controller, 1)
end

local FadeOutVolume = function(controller, fadeTime)
  local elapsedTime = GetFrameTime()

  while fadeTime > elapsedTime and ControllerIsPlaying(controller) do
    ControllerSetSoundVolume(controller, 1 - elapsedTime / fadeTime)
    WaitForNextFrame()
    elapsedTime = elapsedTime + GetFrameTime()
  end

  ControllerSetSoundVolume(controller, 0)
end

local GetFoodPosition = function(desiredPosition)
  if desiredPosition and not mFoodSlots[desiredPosition] then
    return desiredPosition
  else
    for i = 1, #mFoodSlots do
      if mFoodSlots[i] == false then
        return i
      end
    end
  end

  return nil
end

local HideLogicals = function(bHide)
  for i = 1, #mFoodSlots do
    if mFoodSlots[i] then
      AgentHide("obj_logicalFood" .. i, bHide)
    end
  end
end

local RevealAbel = function(node, bWaitForPlace)
  if not mbAbelPresent then
    DebugPrint("Abel comin'")
    mbAbelPresent = true

    while ControllerIsPlaying(mTakeController) or bWaitForPlace and ControllerIsPlaying(mPlaceController) do
      WaitForNextFrame()
    end

    TrainStationNight_AJGatheringEnable(false)
    Game_RunSceneDialog(node, false)
  end
end

local AJManager = function(timeLimit)
  local gatheringTime = 0
  local lastPosition = 0

  while timeLimit > gatheringTime do
    if not mbAbelPresent and not Game_IsPaused() then
      if not ControllerIsPlaying(mPlaceController) then
        if lastPosition == 3 then
          lastPosition = 0
        end

        local position = GetFoodPosition(lastPosition + 1)

        if position then
          lastPosition = position
          TrainStationNight_PlaceFood(position)
        end
      end

      gatheringTime = gatheringTime + GetFrameTime() * SceneGetTimeScale(kScene)
    end

    WaitForNextFrame()
  end

  ThreadStart(RevealAbel, "cs_abelRevealTimeout", true)
end

function TrainStationNight()
  DlgPreloadAll(Game_GetPlayerDialog(), false)

  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end

function TrainStationNight_MonitorForClemDeath(bEnable)
  if bEnable == ThreadIsRunning(mClemDeathMonitorThread) then
    return
  end

  local bZombiesPayingAttention

  local OnKeyChange = function(key, value)
    if key == "2 - Zombies Paying Attention" then
      bZombiesPayingAttention = value
    end
  end

  if bEnable then
    bZombiesPayingAttention = LogicGet("2 - Zombies Paying Attention")
    LogicAddKeyCallback("2 - Zombies Paying Attention", OnKeyChange)

    local update = function()
      while Game_ModeIsOnStack(eModePeek) do
        if bZombiesPayingAttention then
          Game_RunSceneDialog("cs_clemBlowsCover")
          break
        end

        WaitForNextFrame()
      end

      LogicRemoveKeyCallback("2 - Zombies Paying Attention", OnKeyChange)
      mClemDeathMonitorThread = nil
    end

    mClemDeathMonitorThread = ThreadStart(update)
  else
    mClemDeathMonitorThread = ThreadKill(mClemDeathMonitorThread)
    LogicRemoveKeyCallback("2 - Zombies Paying Attention", OnKeyChange)
  end

end
function TrainStationNight_EnableLouisDistraction(bEnable, fadeTime)
  if bEnable then
    if ControllerIsPlaying(mLouisController) then
      return
    end

    mLouisController = ChorePlay(kLouisChore, 9900)
  else
    if mLouisFadeThread then
      mLouisFadeThread = ThreadKill(mLouisFadeThread)
    end

    if not ControllerIsPlaying(mLouisController) then
      mLouisController = nil
      return
    end

    if fadeTime and fadeTime > 0 then
      FadeOutVolume(mLouisController, fadeTime)
    end

    mLouisController = ControllerKill(mLouisController)
  end
end

function TrainStationNight_ResumeLouisDistraction(fadeTime)
  if not Game_GetLoaded() or ControllerIsPlaying(mLouisController) then
    return
  end

  local pct = LogicGet("2 - Louis Distraction Percentage")

  if pct < 1 then
    mLouisController = ChorePlayAndAdvance(kLouisChore, ChoreGetLength(kLouisChore) * pct)

    if fadeTime then
      mLouisFadeThread = ThreadStart(FadeInVolume, mLouisController, fadeTime)
    end
  end

end

function TrainStationNight_PlaceFood(desiredPosition)
  if ControllerIsPlaying(mPlaceController) then
    DebugPrint("tried to place food while a place chore is already playing")
    return false
  end

  local availablePosition = GetFoodPosition(desiredPosition)

  if not availablePosition then
    DebugPrint("food already in place at position " .. desiredPosition)
    return false
  end

  mFoodSlots[availablePosition] = true
  DebugPrint("placing food at position " .. availablePosition)
  AgentHide("obj_logicalFood" .. availablePosition, false)
  mPlaceController = ChorePlay("env_trainStationNight_act2_ajRetrievesJar_" .. availablePosition, 9800)

  return availablePosition
end
function TrainStationNight_TakeFood(desiredPosition)
  if ControllerIsPlaying(mTakeController) then
    DebugPrint("tried to take food while a take chore is already playing")
    return false
  end

  if not mFoodSlots[desiredPosition] then
    DebugPrint("no food present in position " .. desiredPosition)
    return false
  end

  HideLogicals(true)
  mTakeController = ChorePlayAndWait("env_trainStationNight_act2_clemTakesJar_" .. desiredPosition, 9900)
  mFoodSlots[desiredPosition] = false
  mFoodCollected = mFoodCollected + 1

  if desiredPosition == 3 then
    ThreadStart(RevealAbel, "cs_creepyEncounter", false)
  else
    HideLogicals(false)
  end

  return true
end

function TrainStationNight_AJGatheringEnable(bEnable, timeLimit, foodLimit)
  if bEnable then
    if not mAJThread then
      timeLimit = timeLimit or 30
      mFoodLimit = foodLimit or mFoodLimit
      mFoodCollected = 0
      mAJThread = ThreadStart(AJManager, timeLimit)
      mbAbelPresent = false
    end
  else
    mAJThread = ThreadKill(mAJThread)
    mPlaceController = nil
    mTakeController = ControllerKill(mTakeController)

    for i = 1, #mFoodSlots do
      AgentHide("obj_logicalFood" .. i, true)
      mFoodSlots[i] = false
    end
  end
end

function TrainStationNight_ZombiesDetectionEnable(bEnable)
  if bEnable == false then
    mZombieStates = {}
    for i = 1, 8 do
      local zombie = "Zombie0" .. i
      local props = AgentGetProperties(zombie)
      if props["AI Agent - AI Agent Enable"] then
        local oldState = props["AI Agent - Current State"]
        mZombieStates[zombie] = oldState
        if string.find(oldState, "Path To") then
          props["AI Agent - Current State"] = "Patrol"
        else
          local newState = string.gsub(oldState, " With Detection And Interaction", "")
          newState = string.gsub(newState, " With Interaction", "")
          newState = string.gsub(newState, " With Detection", "")
          props["AI Agent - Current State"] = newState
        end
      end
    end
  else
    for zombie, state in pairs(mZombieStates) do
      AgentSetProperty(zombie, "AI Agent - Current State", "Patrol With Detection")
      AgentSetProperty(zombie, "AI Agent - Detection State To Switch To", "Path To With Interaction")
    end
    mZombieStates = {}
  end
end

function TrainStationNight_DisableZombat()
  local disableAI = function(agent)
    if AgentExists(agent) then
      AgentSetProperty(agent, "AI Agent - AI Agent Enable", false)
    end
  end
  for i = 1, 10 do
    disableAI(string.format("Zombie%02d", i))
    disableAI(string.format("ZombieHerd%02d", i))
  end
end

if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end

Game_SceneOpen(kScene, kScript)
Callback_OnDeath:Add(OnDeath)
