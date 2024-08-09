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

local kScript = "motorInn_Stealth"
local kScene = "adv_motorInn_stealthMission.scene"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene;
TLSE_Development_FreecamUseFOVScale = false;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene;
RelightConfigLevel = RelightConfigData_Season1.Level_101_env_motorInn_stealthMission;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kDialog = "env_motorInnMission.dlog"
local mStation1, mStation2, mStation3, mStation4, mStation5, mStation6, logicAgent

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

local OriginalTelltaleLevelStartLogic = function()
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

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function motorInn_Stealth()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end

  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_PostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_PostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "101_";
    TLSE_Development_Editor_Start();
    Callback_PostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_PostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_PostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)
