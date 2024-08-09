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

local kScript = "TrainBeforeStop"
local kScene = "adv_trainTile_beforeStop"

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
RelightConfigLevel = RelightConfigData_Season1.Level_103_env_trainBeforeStop;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kConsoleVisible = "Mesh obj_trainEngine_interiorConsole - Visible"
local kControlRoomVisible = "Mesh obj_trainEngine_trainControlRoomInteriorBack - Visible"

local kConsoleButtons = {
  "obj_lightPanel3SquareG",
  "obj_lightPanel3SquareH"
}

local kHideConsoleCams = {
  "cam_kenny_beginning_dlog",
  "cam_kenny_profile_MED"
}

local mCamName, mTrainProps, mIDKatjaaAmbient, mThreadKatjaaAmbient, mThreadKennyStruggle

local KatajaAmbient = function()
  local waitRange = Range(5, 15)
  while true do
    Sleep(RangeRandom(waitRange))
    mIDKatjaaAmbient = Dialog_Play("ambient_katjaa")
    while mIDKatjaaAmbient and DlgIsRunning(mIDKatjaaAmbient) do
      Sleep(1)
    end
  end
end

local KennyStruggle = function(struggleAgent)
  local struggleProps = AgentGetRuntimeProperties(struggleAgent)
  local elapsedTime = 0
  local maxPercent = 0
  while true do
    Yield()
    local mashPercent = struggleProps["Button Mash - Current Percentage"]
    if maxPercent < mashPercent then
      maxPercent = mashPercent
      Logic["3Train1 - Kenny Struggle Intensity"] = maxPercent
    end
    elapsedTime = elapsedTime + GetFrameTime()
    if elapsedTime > 5 then
      struggleProps["Struggle Finished"] = true
    end
  end
end

function TrainBeforeStop_OnCameraChange(camName)
  if mCamName then
    if table.contains(kHideConsoleCams, mCamName) then
      PropertyRemove(mTrainProps, kConsoleVisible)
    elseif mCamName == "cam_leeStranglesKenny_CU" then
      PropertyRemove(mTrainProps, kControlRoomVisible)
      for i, button in pairs(kConsoleButtons) do
        AgentHide(button, false)
      end
    end
  end
  mCamName = camName
  if table.contains(kHideConsoleCams, mCamName) then
    PropertySet(mTrainProps, kConsoleVisible, false)
  elseif mCamName == "cam_leeStranglesKenny_CU" then
    PropertySet(mTrainProps, kControlRoomVisible, false)
    for i, button in pairs(kConsoleButtons) do
      AgentHide(button, true)
    end
  end
end

function TrainBeforeStop_StartKatjaaAmbient()
  if mThreadKatjaaAmbient then
    return
  end
  mThreadKatjaaAmbient = ThreadStart(KatajaAmbient)
end

function TrainBeforeStop_StopKatjaaAmbient(bStopCurrent)
  if mThreadKatjaaAmbient then
    ThreadKill(mThreadKatjaaAmbient)
    mThreadKatjaaAmbient = nil
    if bStopCurrent ~= false then
      DlgStop(mIDKatjaaAmbient)
    end
  end
end

function TrainBeforeStop_StartKennyStruggle(struggleAgent)
  if mThreadKennyStruggle then
    ThreadKill(mThreadKennyStruggle)
  end
  Struggle_Start(AgentFind(struggleAgent))
  mThreadKennyStruggle = ThreadStart(KennyStruggle, struggleAgent)
  CameraActivate("cam_struggle")
end

function TrainBeforeStop_StopKennyStruggle()
  if mThreadKennyStruggle then
    ThreadKill(mThreadKennyStruggle)
  end
  Struggle_End()
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  mTrainProps = AgentGetRuntimeProperties("obj_trainEngine")
  PropertyRemove(mTrainProps, kConsoleVisible)
  PropertyRemove(mTrainProps, kControlRoomVisible)
  SceneAddOnCameraChangeCallback(kScene, "TrainBeforeStop_OnCameraChange")
  TrainBeforeStop_OnCameraChange(AgentGetName(SceneGetCamera(kScene)))
  WalkBoxesSetVertexPos("adv_trainTile_boxcarBeforeStop", 1, Vector(-1, 1.192, -15.8))
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentSetProperty("Ben", "Useable - Token Offset", Vector())
  if Logic["3Train1 - Got Physical"] then
    Dialog_Play("cs_kennyGetPhysical")
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Train Before Stop")
      DlgPreload("env_trainBeforeStop.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function TrainBeforeStop()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "103_";
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
