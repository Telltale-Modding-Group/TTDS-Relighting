local kScript = "Chapter3B"
local kScene = "adv_truckStopCh3"
local kChorePriority = 10000
local mGunshotThread, mMonitorThread, mNateCoverThread, mStruggleThread, mIdleController
local PlayGunshots = function()
  Sleep(0.15)
  local delayRange = Range(2, 3.25)
  while true do
    ChorePlay("adv_truckStopCh3_russell_cringeAtGunshot", kChorePriority)
    Sleep(RangeRandom(delayRange))
  end
end
local PlayNateCover = function()
  local chore
  if not Logic["3 - Got to Car"] and Logic["3 - Ran First"] then
    chore = "adv_truckStopCh3_nate_coveringFireTruck"
  else
    chore = "adv_truckstopch3_nate_coveringFireCar"
  end
  Sleep(1)
  local delayRange = Range(2.5, 4.5)
  while true do
    ChorePlay(chore)
    Sleep(RangeRandom(delayRange))
  end
end
local ChoredMovementMonitor = function()
  local kUnderCover = "3 - Under Cover"
  local bMoving = false
  local timeStopped = 0
  while true do
    Yield()
    if bMoving then
      if ChoredMovement_GetMoveDir() ~= 1 then
        ControllerFadeTo(mIdleController, 0.2, 1)
        bMoving = false
      end
    elseif ChoredMovement_GetMoveDir() == 1 then
      ControllerFadeTo(mIdleController, 0.2, 0)
      bMoving = true
      timeStopped = 0
    elseif not Mode_IsOnStack(mode_PauseMenu) then
      timeStopped = timeStopped + GetFrameTime() * SceneGetTimeScale(kScene)
      if timeStopped > 1 and not Logic[kUnderCover] then
        Chapter3B_OnChoredMovementEnd()
        Dialog_Play("cs_stopRunning")
        break
      end
    end
    if not AgentGetProperty("Russell", "ChoreScrub - OK To Stop") then
      Chapter3B_OnChoredMovementEnd()
      break
    end
    if not mGunshotThread and not Logic[kUnderCover] then
      mGunshotThread = ThreadStart(PlayGunshots)
    end
  end
  mMonitorThread = nil
end
local function OnPeekTruck(key, value)
  local RemoveCallback = function()
    Yield()
    PropertyRemoveKeyCallback(GameLogicGet(), key, OnPeekTruck)
  end
  if value then
    Dialog_Play("cs_locateSniper")
    ThreadStart(RemoveCallback)
  end
end
local StruggleMonitor = function(struggleAgent)
  while true do
    Yield()
    if struggleAgent.mProps["Button Mash - Current Percentage"] >= 0.666666 then
      break
    end
  end
  Struggle_End()
  mStruggleThread = nil
end
function Chapter3B()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if not Logic["3 - Pushed Truck"] then
    PropertyAddKeyCallback(GameLogicGet(), "3 - Peeking Truck", OnPeekTruck)
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic["3 - Got to Pumps"] then
    Dialog_Play("cs_runToTruck")
    return
  end
  if Logic["3 - Got to Truck"] then
    Dialog_Play("cs_getToTruck")
    return
  end
  if Logic["3 - Pushed Truck"] then
    Logic["3 - Got to Truck"] = true
    Dialog_Play("cs_coverChoice")
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function Chapter3B_OnChoredMovementBegin()
  if not mMonitorThread then
    mMonitorThread = ThreadStart(ChoredMovementMonitor)
    mIdleController = ChorePlay("sk54_idle_leeCrouchHide", kChorePriority, "Lee", "Russell", "obj_LeeLookHereEyes", "obj_RussellLookHereEyes")
    ControllerSetLooping(mIdleController, true)
    if Logic["3 - Got to Truck"] then
      mNateCoverThread = ThreadStart(PlayNateCover)
    end
    AgentSetProperty("logic_mode_choredMove", "ChoredMove - Autoscootch", false)
  end
end
function Chapter3B_OnChoredMovementEnd()
  if mMonitorThread then
    ThreadKill(mMonitorThread)
    mMonitorThread = nil
    ControllerKill(mIdleController)
    mIdleController = nil
    if mGunshotThread then
      ThreadKill(mGunshotThread)
      mGunshotThread = nil
    end
    if mNateCoverThread then
      ThreadKill(mNateCoverThread)
      mNateCoverThread = nil
    end
  end
end
function Chapter3B_OnTruckPeekEnd()
  Dialog_Play("cs_pushTruck")
end
function Chapter3B_PushTruck(struggleAgent)
  if not mStruggleThread then
    Struggle_Start(struggleAgent)
    mStruggleThread = ThreadStart(StruggleMonitor, AgentFind(struggleAgent))
  end
end
SceneOpen(kScene, kScript)
