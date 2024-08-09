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

local kScript = "RiverStreetRooftop"
local kScene = "adv_savannahRiverStreetRooftop"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_FreecamUseFOVScale = false;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene .. ".scene";
RelightConfigLevel = RelightConfigData_Season1.Level_105_env_riverStreetRooftop;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local mAmbientThread, mAmbientID, mKennyThread, mKennyController

local KennyFightsBack = function()
  mKennyController = ChorePlay("bg_kenny_duringChristaLift")
  ControllerWait(mKennyController)
  AgentSetProperty("Zombie2", kIdleAnim, "kennyFightDone.chore")
end

local PlayAmbient = function()
  local waitRange = Range(10, 30)
  while true do
    Sleep(RangeRandom(waitRange))
    mAmbientID = Dialog_Play("ambient_christaStuck")
    while mAmbientID and DlgIsRunning(mAmbientID) do
      Sleep(1)
    end
  end
end

function Rooftop_StartAmbient()
  if mAmbientThread then
    return
  end
  mAmbientThread = ThreadStart(PlayAmbient)
end

function Rooftop_StopAmbient()
  if not mAmbientThread then
    return
  end
  ThreadKill(mAmbientThread)
  mAmbientThread = nil
  DlgStop(mAmbientID)
end

function Rooftop_StartKennyFightsBack()
  if mKennyThread then
    return
  end
  mKennyThread = ThreadStart(KennyFightsBack)
end

function Rooftop_StopKennyFightsBack()
  if not mKennyThread then
    return
  end
  ThreadKill(mKennyThread)
  mKennyThread = nil
  if mKennyController then
    ControllerKill(mKennyController)
    mKennyController = nil
  end
  AgentSetProperty("Zombie2", kIdleAnim, "sk54_idle_zombieAverageStandA.anm")
end

function PreloadShaders()

end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  if Platform_IsIPhone() or Platform_IsAndroid() then
    AgentFind("fx_dirtDustEmitterA").mProps["Emitter - Number of Particles"] = 1
    AgentFind("fx_dirtDustEmitterC").mProps["Emitter - Number of Particles"] = 1
    AgentFind("obj_lightBeamsWDCam").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD01").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD02").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD03").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD04").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD05").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD06").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD07").mProps["D3D Mesh"] = ""
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState(true, false, false, "A")
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function RiverStreetRooftop()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "105_";
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
