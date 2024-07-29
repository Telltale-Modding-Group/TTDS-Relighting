local kScript = "clementineHouseInterior"
local kScene = "adv_clementineHouseInterior.scene"
local kDialogHouse = "env_ClementineHouse.dlog"
local kDialogClem = "clementinehouse_clementine.dlog"
function ClemHouseInt_KitchenLivingCamTriggerEnter(trigger)
  AgentHide("blocker_kitchen", true)
  triggerCamera_EnterBox(trigger)
end
function ClemHouseInt_KitchenLivingCamTriggerExit(trigger)
  AgentHide("blocker_kitchen", false)
  triggerCamera_ExitBox(trigger)
end
local mAttackChoreCtl, mAttackChoreName
function ClemHouseInt_AttackStart(attackChore)
  mAttackChoreCtl = nil
  Main_AllowMovement(false)
  CameraActivate("cam_nav_JPStylePlayer")
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
  ClemHouseInt_AttackChoreStart(attackChore)
end
function ClemHouseInt_MovePhaseStart()
  local phaseNum = Logic["ClemHouseInt - BabysitterPhase"]
  assert(phaseNum > 0, "ClemHouseInt_MovePhaseStart: phaseNum <= 0")
  ChoredMovement_ReverseControls(true)
  ChoredMovement_Start("env_clementinehouse_choredmove_scootawayfromzombie_" .. phaseNum .. ".chore")
  Dialog_Play("babysitterChores_Leg" .. phaseNum, "Lee", nil, kDialogHouse)
end
function ClemHouseInt_OnBabysitterCatchesLee(trigger)
  trigger.mProps["Trigger Enabled"] = false
  Dialog_Play("cs_BabysitterCatchesLee", "Lee", nil, kDialogHouse)
end
function ClemHouseInt_AttackChoreStart(attackChore)
  if attackChore ~= nil then
    mAttackChoreName = attackChore
  end
  if mAttackChoreCtl then
    ControllerSetTime(mAttackChoreCtl, 0)
    ControllerPlay(mAttackChoreCtl)
  elseif mAttackChoreName then
    mAttackChoreCtl = ChorePlay(mAttackChoreName)
    PanicMeter_AttachItem("ui_panicmeter_overlay", mAttackChoreCtl)
  else
    Print("ClemHouseInt_AttackChoreStart: no chore specified")
  end
end
function ClemHouseInt_AttackChoreStop()
  if mAttackChoreCtl then
    ControllerKill(mAttackChoreCtl)
    mAttackChoreCtl = nil
    PanicMeter_RemoveItem("ui_panicmeter_overlay", mAttackChoreCtl)
  end
end
function ClemHouseInt_AttackFail(key, value)
  if value then
    Dialog_Play("cs_LeeDeath", "Lee", nil, kDialogHouse)
  end
end
function ClemHouseInt_AttackSuccess()
  ClemHouseInt_AttackChoreStop()
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
end
function clementineHouseInterior()
  if Platform_IsAndroid() then
    local sceneAgent = SceneGetSceneAgent(AgentGetScene(kScene))
    if sceneAgent then
      AgentSetProperty(sceneAgent, "FX Tonemap Enabled", true)
      AgentSetProperty(sceneAgent, "FX Tonemap Intensity", 1.5)
    end
  end
  Mode(mode_Main)
  if not IsRegistered() and Logic["ClemHouseInt - Babysitter Fight Started"] then
    Dialog_Play("debug_IntroFightFromDemo", "Lee", nil, kDialogHouse)
  elseif IsToolBuild and AgentGetProperty("logic_debug", "Debug - TestZombieBabysitter") then
    AgentSetProperty("logic_debug", "Debug - TestZombieBabysitter", false)
    AgentSetProperty("obj_bloodSpill", "Trigger Enabled", false)
    if Platform_IsWiiU() then
      print("Dialog Preloading start")
      DlgPreload(kDialogHouse, "cs_newFightIntro", 0, 10, 0, false)
    end
    Dialog_Play("cs_newFightIntro", "Lee", nil, kDialogHouse)
  elseif not SaveLoad_IsFromLoad() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start")
      DlgPreload(kDialogHouse, "cs_enterHouse", 0, 15, 0, false)
    end
    Dialog_Play("cs_enterHouse", "Lee", nil, kDialogHouse)
  end
end
local crawlChore, dollyChore
local bPlayedClemLine = false
function ClemHouseInt_StartFightCrawl()
  local thread = function()
    if Logic["ClemHouseInt - BabysitterPhase"] <= 2 then
      crawlChore = ChorePlay("env_clementinehouse_ambient_babysitterclimbs2_1.chore")
    else
      crawlChore = ChorePlay("env_clementinehouse_ambient_babysitterclimbs3_1.chore")
    end
    ControllerSetPriority(crawlChore, 9000)
    Sleep(0.5)
    while crawlChore and (ControllerIsPlaying(crawlChore) or ControllerIsPaused(crawlChore)) do
      Yield()
      if Logic["ClemHouseInt - BabysitterPhase"] > 3 and not bPlayedClemLine and AgentIsOnScreen("obj_hammerWD_Clementine") then
        Dialog_Play("ambient_clementineOffersHelp")
        bPlayedClemLine = true
      end
      if Dialog_CutsceneIsRunning() and not ControllerIsPaused(crawlChore) then
        ControllerPause(crawlChore)
        ControllerSetContribution(crawlChore, 0)
        ControllerSetTime(crawlChore, math.random(300) / 100)
      elseif not Dialog_CutsceneIsRunning() and ControllerIsPaused(crawlChore) then
        ControllerSetContribution(crawlChore, 1)
        ControllerPlay(crawlChore)
      end
    end
    if not Dialog_CutsceneIsRunning() then
      if Logic["ClemHouseInt - BabysitterPhase"] <= 2 then
        Dialog_StopAll()
        Dialog_Play("cs_leeDiesBetweenKitchenAndDoor")
      elseif Logic["ClemHouseInt - BabysitterPhase"] == 3 or Logic["ClemHouseInt - BabysitterPhase"] == 4 then
        Dialog_StopAll()
        Dialog_Play("cs_leeDiesAtSlidingGlassDoor")
      end
    end
  end
  ThreadStart(thread)
end
local hammerWait
function ClemHouseHint_WaitForHammer(bWait)
  if bWait and not ThreadIsRunning(hammerWait) then
    local thread = function()
      Sleep(3)
      while Dialog_CutsceneIsRunning() do
        Yield()
      end
      if Logic["ClemHouseInt - BabysitterLeeSafe"] then
        Logic["ClemHouseInt - Lee Did Not Use Hammer Enough"] = true
        Dialog_Play("use_Babysitter")
      else
        Dialog_Play("cs_leeDiesOnTopOfBabysitter")
      end
    end
    hammerWait = ThreadStart(thread)
  end
  if not bWait then
    ThreadKill(hammerWait)
    hammerWait = nil
  end
end
function ClemHouseInt_StopFightCrawl()
  ControllerKill(crawlChore)
  ControllerKill(dollyChore)
end
SceneOpen(kScene, kScript)
