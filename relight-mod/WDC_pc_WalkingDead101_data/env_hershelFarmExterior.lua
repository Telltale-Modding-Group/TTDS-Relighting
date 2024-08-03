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
RelightConfigGlobal = RelightConfigData_Main.Global;
RelightConfigDevelopment = RelightConfigData_Development.DevelopmentTools;
--RelightConfigLevel = RelightConfigData_Season2.Level_202_LodgeMainRoom;

--Relight DOF
RELIGHT_DOF_AUTOFOCUS_UseCameraDOF = true;
RELIGHT_DOF_AUTOFOCUS_UseLegacyDOF = false;
RELIGHT_DOF_AUTOFOCUS_UseHighQualityDOF = true;
RELIGHT_DOF_AUTOFOCUS_FocalRange = 1.0;
RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames = {};
RELIGHT_DOF_AUTOFOCUS_ObjectEntries = 
{
    "Clementine"
};
RELIGHT_DOF_AUTOFOCUS_Settings =
{
    TargetValidation_IsOnScreen = true,
    TargetValidation_IsVisible = true,
    TargetValidation_IsWithinDistance = true,
    TargetValidation_IsFacingCamera = true,
    TargetValidation_IsOccluded = false,
    TargetValidation_RejectionAngle = 0.0, --goes from -1 to 1 (less than 0 is within the 180 forward facing fov of the given object)
    TargetValidation_RejectionDistance = 40.0, --the max distance before the agent is too far from camera to do autofocus
};
RELIGHT_DOF_AUTOFOCUS_BokehSettings =
{
    BokehBrightnessDeltaThreshold = 0.02,
    BokehBrightnessThreshold = 0.02,
    BokehBlurThreshold = 0.05,
    BokehMinSize = 0.0,
    BokehMaxSize = 0.03,
    BokehFalloff = 0.75,
    MaxBokehBufferAmount = 1.0,
    BokehPatternTexture = "bokeh_circle.d3dtx"
};

--Relight Volumetrics
RELIGHT_HackyCameraVolumetrics_Settings = 
{
    Samples = 256,
    SampleOffset = 0.15,
    SampleStartOffset = 1.0,
    FogColor = Color(0.1, 0.1, 0.1, 0.1)
};

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
  RELIGHT_ConfigurationStart();

  RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_Start();
    Callback_PostUpdate:Add(TLSE_Development_Editor_Update);
    do return end --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_PostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlay
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_PostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

Callback_AgentCreated:Add(onAgentCreate)
SceneOpen(kScene, kScript)
