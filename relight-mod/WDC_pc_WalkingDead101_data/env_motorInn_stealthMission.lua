local kScript = "motorInn_Stealth"
local kScene = "adv_motorInn_stealthMission.scene"
local kDialog = "env_motorInnMission.dlog"
local mStation1, mStation2, mStation3, mStation4, mStation5, mStation6, logicAgent
function motorInn_Stealth()
  ResourceSetNonPurgable("env_motorInn.dlog", true)
  AgentAddOnDestroyCallback(SceneGetSceneAgent(kScene), function()
    ResourceSetNonPurgable("env_motorInn.dlog", false)
  end)
  Mode(mode_Main)
  Main_AllowMovement(false)
  mStation1 = AgentFind("obj_station1")
  mStation2 = AgentFind("obj_station2")
  mStation3 = AgentFind("obj_station3")
  mStation4 = AgentFind("obj_station4")
  mStation5 = AgentFind("obj_station5")
  mStation6 = AgentFind("obj_station6")
  logicAgent = AgentFind("logic_game")
  if not SaveLoad_IsFromLoad() then
    local prefs = GetPreferences()
    if Logic["MotorInn - Debug Skip To upstairs"] then
      Dialog_Play("debug_startUpstairs", "Lee", nil, kDialog)
    elseif prefs["Skip Intro Cutscenes"] then
      if Platform_IsWiiU() then
        print("Dialog Preloading start1")
        DlgPreload(kDialog, "Station 1 Keepalive", 0, 10, 0, false)
      end
      Dialog_Play("Station 1 Keepalive", "Lee", nil, kDialog)
    else
      if Platform_IsWiiU() then
        print("Dialog Preloading start2")
        DlgPreload(kDialog, "cs_enterMotorInnMissionNEW", 0, 10, 0, false)
      end
      Dialog_Play("cs_enterMotorInnMissionNEW", "Lee", nil, kDialog)
    end
    if logicAgent.mProps["MotorInn - Clicked on Ice Machine"] and not logicAgent.mProps["MotorInn - Tried to Help Girl"] then
      SceneSetWalkBoxes(kScene, "adv_motorinn.wbox")
    else
      SceneSetWalkBoxes(kScene, "adv_motorinnFloor2.wbox")
    end
  end
  Yield()
  PanicMeter_AttachItem("ui_panicmeter_overlay", "timer_ZombiesSeeLee")
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "MotorInn - Peeking In Truck Window", "MotorInnStealth_PeekInTruckUpdate")
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "MotorInn - Peek Tutorial 2", "MotorInnStealth_PeekTutorial2")
end
function MotorInnStealth_ZombieRVTriggerFailure(trigger)
  trigger.mProps["Trigger Enabled"] = false
  Dialog_Play("cs_zombieAwlKillStation2Failure", "Lee", nil, kDialog)
end
function MotorInnStealth_PeekTutorial2(key, val)
  if val and not Logic["MotorInn - Peek Tutorial 2 Shown"] and not Logic["MotorInn - Left Station 1"] then
    HelpText_Show("tutorial_peek2")
    Logic["MotorInn - Peek Tutorial 2 Shown"] = true
    Dialog_Play("PeekHintTimer", "Lee", nil, kDialog)
  end
end
function MotorInnStealth_PeekInTruckUpdate()
  Reticle_Update(true)
end
function MotorInnStealth_ArriveStation1()
  Print("Station 1 Callback")
  Dialog_Play("Station 1 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end
function MotorInnStealth_ArriveStation2()
  Dialog_Play("Station 2 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end
function MotorInnStealth_ArriveStation3()
  Dialog_Play("Station 3 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end
function MotorInnStealth_ArriveStation4()
  Dialog_Play("Station 4 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end
function MotorInnStealth_ArriveStation5()
  Print("Station 5 callback")
  Dialog_Play("Station 5 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end
function MotorInnStealth_ArriveStation6()
  Dialog_Play("Station 6 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end
function MotorInnStealth_ResetStationChores()
  Dialog_Play("Reset Station Camera Chores", "Lee", nil, kDialog)
end
SceneOpen(kScene, kScript)
