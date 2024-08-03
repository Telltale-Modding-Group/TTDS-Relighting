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

local kScript = "WreckedTrain"
local kScene = "adv_trainTileWreckedTrain"

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

local kNotepadScene = "ui_notepad"
local kNotepadBlocker = "blocker_notepad"
local kNotepadCam = "cam_notepad"
local kControlRoomExteriorVisible = "Mesh obj_trainEngine_trainControlRoomExteriorSideLeft - Visible"
local kControlRoomInteriorVisible = "Mesh obj_trainEngine_trainControlRoomInteriorSideLeft - Visible"
local kPalletsVisible = "Mesh obj_trainBoxcar_boxcarPallets - Visible"
local mCamName, mEngineProps, mBoxcarProps
local mbMovementDisabled = false
local mbBackButtonInUse = false
local mbShowingNotepad = false

local SetSlowWalkAnim = function()
  AgentSetProperty("Lee", kWalkAnim, "sk54_move_lee_walk.chore")
end

local SetFastWalkAnim = function()
  AgentSetProperty("Lee", kWalkAnim, "sk54_move_lee_walkFast.chore")
end

function WreckedTrain_OnCameraChange(camName)
  if mCamName then
    if mCamName == "cam_nav_wreckedTrainCab" then
      PropertyRemove(mEngineProps, kControlRoomExteriorVisible)
      PropertyRemove(mEngineProps, kControlRoomInteriorVisible)
    elseif mCamName == "cam_nav_wreckedBoxcar" then
      PropertyRemove(mBoxcarProps, kPalletsVisible)
    end
  end
  mCamName = camName
  if mCamName == "cam_nav_wreckedTrainCab" then
    PropertySet(mEngineProps, kControlRoomExteriorVisible, false)
    PropertySet(mEngineProps, kControlRoomInteriorVisible, false)
  elseif mCamName == "cam_nav_wreckedBoxcar" then
    PropertySet(mBoxcarProps, kPalletsVisible, false)
  end
end

function WreckedTrain_ShowNotepad()
  if mbShowingNotepad then
    return
  end
  if not Mode_IsOnStack(mode_NoMovement) then
    Mode_Push(mode_NoMovement)
    mbMovementDisabled = true
  end
  CameraPush(kNotepadCam)
  ReticleUI_Disable()
  SceneHide(kNotepadScene, false)
  AgentHide(kNotepadBlocker, false)
  mbBackButtonInUse = WDBackButton_IsOccupied()
  WDBackButton_Set("cs_hideNotepad")
  WDBackButton_Show()
  if Input_IsUsingTouch() then
    Main_SuppressCameraIcon(true)
  end
  mbShowingNotepad = true
end

function WreckedTrain_HideNotepad()
  if not mbShowingNotepad then
    return
  end
  if mbMovementDisabled then
    Mode_Pop(mode_NoMovement)
    mbMovementDisabled = false
  end
  CameraPop(kNotepadCam)
  ReticleUI_Enable()
  if mbBackButtonInUse then
    if Logic["2Wreck - Station"] == 4 then
      WDBackButton_Set("cs_closeCompartmentA")
    else
      WDBackButton_Set("logic_consoleExit")
    end
  else
    WDBackButton_Clear()
  end
  SceneHide(kNotepadScene, true)
  AgentHide(kNotepadBlocker, true)
  if Input_IsUsingTouch() then
    Main_SuppressCameraIcon(false)
  end
  mbShowingNotepad = false
end

function WreckedTrain_UpdateWalkBoxState()
  WalkBoxesEnableAll(kScene)
  if not Logic["2Wreck - Lilly Stole RV"] then
    for i = 58, 59 do
      WalkBoxesDisableTri(kScene, i)
    end
  end
  if Logic["2Wreck - Opened Car Door"] then
    for i = 53, 57 do
      WalkBoxesDisableTri(kScene, i)
    end
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  SceneHide(kNotepadScene, true)
  mEngineProps = AgentGetRuntimeProperties("obj_trainEngine")
  mBoxcarProps = AgentGetRuntimeProperties("obj_trainBoxcar")
  PropertyRemove(mEngineProps, kControlRoomExteriorVisible)
  PropertyRemove(mEngineProps, kControlRoomInteriorVisible)
  PropertyRemove(mBoxcarProps, kPalletsVisible)
  SceneAddOnCameraChangeCallback(kScene, "WreckedTrain_OnCameraChange")
  WreckedTrain_OnCameraChange(AgentGetName(SceneGetCamera(kScene)))
  WreckedTrain_UpdateWalkBoxState()
  Callback_DialogCutsceneBegin:Add(SetSlowWalkAnim)
  Callback_DialogCutsceneEnd:Add(SetFastWalkAnim)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Wrecked Train")
      DlgPreload("env_wreckedTrain.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function WreckedTrain()
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

SceneOpen(kScene, kScript)

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  SceneAdd(kNotepadScene)
end