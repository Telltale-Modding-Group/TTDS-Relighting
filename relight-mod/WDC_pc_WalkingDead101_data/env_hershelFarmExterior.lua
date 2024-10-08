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

local kScript = "hershelFarmExterior"
local kScene = "adv_hershelFarmExterior.scene"

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
RelightConfigLevel = RelightConfigData_Season1.Level_101_env_hershelFarmExterior;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

require("wd_tutorial.lua")

local onAgentCreate = function(agent)
  if AgentGetName(agent) ~= "Lee" then
    return
  end
  
  local onIdleChange = function(key, idle)
    Print("CHANGE!")

    if ResourceGetName(idle) == "sk54_idle_leebodyb.anm" then
      Print("adjust")
      AgentFind("Lee").mProps["Walk Animation - Idle"] = "adv_everywhere_lee.chore"
    end
  end

  Print("added")
  PropertyAddKeyCallback(agent.mProps, "Walk Animation - Idle", onIdleChange)
end

function HershelFarm_SwitchMusic(trigger)
  if Logic["Farm - DisableTriggerFunctions"] then
    return
  end

  local name = AgentGetName(trigger)
  local sceneProps = SceneGetSceneAgent(AgentGetScene(trigger)).mProps
  local music

  if name == "trigger_MusicKatjaa" then
    music = "mus_loop_Neutral_01c.wav"
  elseif name == "trigger_MusicKenny" then
    music = "mus_loop_Neutral_01b.wav"
  elseif name == "trigger_MusicHershel" then
    music = "mus_loop_Neutral_01d.wav"
  elseif name == "trigger_MusicShawn" then
    music = "mus_loop_Neutral_01a.wav"
  end

  if music then
    print("switching music to: " .. music)
    soundModule_SwitchMusic(music)
  end
end

function HershelsFarm_BarnToTractor(trigger)
  AgentSetProperty("Shawn", "Walk Animation - Idle", "adv_hershelfarmexterior_shawnBuildingFence.chore")
  triggerCamera_EnterBox(trigger)
end

function HershelsFarm_TractorToBarn(trigger)
  AgentSetProperty("Shawn", "Walk Animation - Idle", "sk54_idle_kennyStandA.anm")
  triggerCamera_EnterBox(trigger)
end

function HershelsFarm_WideCamTrigger(trigger)
  if Logic["Farm - DisableTriggerFunctions"] then
    return
  end

  AgentSetProperty("trigger_cam_nav_frontPorch", "Trigger Enabled", true)
  AgentSetProperty("Shawn", "Walk Animation - Idle", "sk54_idle_kennyStandA.anm")
  Logic["Farm - FrontOfHouseWideShot"] = true
  triggerCamera_EnterBox(trigger)
end

function HershelsFarm_FromWideCamTrigger(trigger)
  if Logic["Farm - DisableTriggerFunctions"] then
    return
  end

  Logic["Farm - FrontOfHouseWideShot"] = false

  if AgentGetName(trigger) == "trigger_cam_tractor" then
    AgentSetProperty("Shawn", "Walk Animation - Idle", "adv_hershelfarmexterior_shawnBuildingFence.chore")
  end

  triggerCamera_EnterBox(trigger)
end

local mWalkAndTalkCtl

function HershelsFarm_StartWalkAndTalk(choreName)
  mWalkAndTalkCtl = ChorePlay(choreName)
end

function HershelsFarm_StopWalkAndTalk()
  ControllerKill(mWalkAndTalkCtl)
end

local mAttackAmbientIDs = {}

function HershelsFarm_Attack_FireAmbient(startNodeName)
  if not startNodeName then
    return
  end

  if not mAttackAmbientIDs[startNodeName] or not DlgIsRunning(mAttackAmbientIDs[startNodeName]) then
    mAttackAmbientIDs[startNodeName] = Dialog_Play(startNodeName)
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  if not SaveLoad_IsFromLoad() and (not IsToolBuild() or not GetPreferences()["Skip Intro Cutscenes"]) then
    if Logic["Farm - Zombies Present"] then
      if Platform_IsWiiU() then
        print("Dialog Preloading start")
        DlgPreload("env_hershelsfarm.dlog", "cs_runtoshawn", 0, 15, 0, false)
      end

      Dialog_Play("cs_runtoshawn")
    else
      if Platform_IsWiiU() then
        print("Dialog Preloading start")
        DlgPreload("env_hershelsfarm.dlog", "Wake-Up", 0, 15, 0, false)
      end

      Dialog_Play("Wake-Up")
    end
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function hershelFarmExterior()
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

Callback_AgentCreated:Add(onAgentCreate)
SceneOpen(kScene, kScript)
