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

local kScript = "WoodsBearTrap"
local kScene = "adv_woodsBearTrap"

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
RelightConfigLevel = RelightConfigData_Season1.Level_102_env_woodsBearTrap;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kPreloadableAssets = {
  "obj_axefireblood.d3dtx",
  "obj_axefireblood_spec.d3dtx",
  "obj_axefireblood_nm.d3dtx",
  "obj_axefirebloodB.d3dtx",
  "obj_axefirebloodB_spec.d3dtx",
  "fx_bloodspurtradb2.d3dtx",
  "fx_bloodSpurtDirNrwB2.d3dtx",
  "fx_bloodSpurtDirWdeC2.d3dtx",
  "fx_bloodspurtradahigh.d3dtx",
  "fx_bloodspurtrada2high.d3dtx",
  "fx_bloodSplatDirWdeB2.d3dtx",
  "fx_bloodSplatRadD3.d3dtx",
  "fx_bloodSpurtDirWdeA2.d3dtx",
  "fx_bloodspurtradc2.d3dtx",
  "fx_bloodspurtdiravgd2.d3dtx",
  "fx_bloodSpurtDirNrwA2.d3dtx",
  "fx_bloodspurtrada2.d3dtx",
  "fx_bloodspurtradb2high.d3dtx",
  "fx_bloodSpurtDirAvgA2.d3dtx",
  "fx_bloodSpurtDirAvgB2.d3dtx",
  "fx_bloodspurtdirwdeb2.d3dtx",
  "fx_bloodSpurtDirAvgC2.d3dtx"
}

local mControllerBackgroundChore, mControllerWalkAndTalk, mDlgIDBenFreakOut, mDlgIDChatter, mDlgIDDavidAmbient

function WoodsBearTrap_StartBackgroundChore(chore)
  if mControllerBackgroundChore then
    return
  end
  mControllerBackgroundChore = ChorePlay(chore, kBGChorePriority)
  ControllerSetLooping(mControllerBackgroundChore, true)
end

function WoodsBearTrap_StopBackgroundChore()
  if not mControllerBackgroundChore then
    return
  end
  ControllerKill(mControllerBackgroundChore)
  mControllerBackgroundChore = nil
end

function WoodsBearTrap_StartBenFreakOut()
  if mDlgIDBenFreakOut then
    return
  end
  mDlgIDBenFreakOut = Dialog_Play("ambient_benFreakOut")
end

function WoodsBearTrap_StopBenFreakOut()
  if not mDlgIDBenFreakOut then
    return
  end
  DlgStop(mDlgIDBenFreakOut)
  mDlgIDBenFreakOut = nil
end

function WoodsBearTrap_StartChatter()
  if mDlgIDChatter then
    return
  end
  mDlgIDChatter = Dialog_Play("ambient_chatter")
end

function WoodsBearTrap_StopChatter()
  if not mDlgIDChatter then
    return
  end
  DlgStop(mDlgIDChatter)
  mDlgIDChatter = nil
end

function WoodsBearTrap_StartDavidAmbient()
  if mDlgIDDavidAmbient then
    return
  end
  mDlgIDDavidAmbient = Dialog_Play("ambient_davidLegInTrap")
end

function WoodsBearTrap_StopDavidAmbient()
  if not mDlgIDDavidAmbient then
    return
  end
  DlgStop(mDlgIDDavidAmbient)
  mDlgIDDavidAmbient = nil
end

function WoodsBearTrap_StartWalkAndTalk()
  if not mControllerWalkAndTalk then
    mControllerWalkAndTalk = ChorePlay("bg_forestBearTrap_markLeeWalkAndTalkTrack")
  end
end

function WoodsBearTrap_StopWalkAndTalk()
  if not mControllerWalkAndTalk then
    return
  end
  ControllerKill(mControllerWalkAndTalk)
  mControllerWalkAndTalk = nil
end

local OriginalTelltaleLevelStartLogic = function()
  for i, asset in ipairs(kPreloadableAssets) do
    LoadAsync(asset)
  end
  if LangGetCurLanguage() == "german" and Platform_IsVita() then
    AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
  end
  Mode(mode_Main)
  Main_AllowMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Bear Trap")
      DlgPreload("env_forestBearTrap.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  else
    if Platform_IsWiiU() then
      print("Dialog Preloading start2: Bear Trap cutscene skip")
      DlgPreload("env_forestBearTrap.dlog", "logic_zombieKill", 0, 15, 0, false)
    end
    Dialog_Play("logic_zombieKill")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function WoodsBearTrap()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "102_";
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
SceneAdd("ui_openingcredits102")
