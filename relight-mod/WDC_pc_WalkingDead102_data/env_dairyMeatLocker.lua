--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");
require("RELIGHT_adv_dairyMeatLocker.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "DairyMeatLocker"
local kScene = "adv_dairyMeatLocker"

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
RELIGHT_DOF_AUTOFOCUS_FocalRange = 0.125;
RELIGHT_DOF_AUTOFOCUS_Aperture = 1.4; --f/1.0, f/1.4, f/2, f/2.8, f/4, f/5.6, f/8, f/11, f/16, f22, f/32
RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames = 
{
    "cam_struggle",
    "cam_larryPockets_nav",
    "cam_larryPockets_parent",
    "cam_airConditioner_nav",
    "cam_airConditioner_parent",
    "cam_mainNav_parent",
    "cam_mainNav",
    "cam_postDeathNav",
    "cam_postDeathNav_parent",
    "cam_larryPockets_nav",
    "cam_larryPockets_nav",
    "cam_larryPockets_nav",
};
RELIGHT_DOF_AUTOFOCUS_ObjectEntries = 
{
    "Clementine",
    "Kenny",
    "Lee",
    "Larry",
    "Lilly"
};
RELIGHT_DOF_AUTOFOCUS_Settings =
{
    TargetValidation_IsOnScreen = true,
    TargetValidation_IsVisible = true,
    TargetValidation_IsWithinDistance = true,
    TargetValidation_IsFacingCamera = true,
    TargetValidation_IsOccluded = false,
    TargetValidation_RejectionAngle = 0.0, --goes from -1 to 1 (less than 0 is within the 180 forward facing fov of the given object)
    TargetValidation_RejectionDistance = 5.0, --the max distance before the agent is too far from camera to do autofocus
};
RELIGHT_DOF_AUTOFOCUS_BokehSettings =
{
    BokehBrightnessDeltaThreshold = 0.02,
    BokehBrightnessThreshold = 0.02,
    BokehBlurThreshold = 0.02,
    BokehMaxSizeClamp = 0.075,
    BokehFalloff = 0.65,
    MaxBokehBufferAmount = 1.0,
    BokehPatternTexture = "bokeh_circle.d3dtx"
    --BokehPatternTexture = "bokeh_anamorphic2.d3dtx"
};

--Relight Volumetrics
RELIGHT_HackyCameraVolumetrics_Settings = 
{
    Samples = 128,
    SampleOffset = 0.05,
    SampleStartOffset = 1.0,
    FogColor = Color(0.065, 0.065, 0.065, 0.065)
};

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kOverlay = "fx_overlayEyesBlink"

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  Main_AllowMovement(true)
  if SaveLoad_IsFromLoad() then
    return
  end
  if IsToolBuild() and Logic["3MeatLocker - DebugToChoice"] then
    SceneHide(kOverlay, true)
    Logic["3MeatLocker - LarryHadHeartAttack"] = true
    Dialog_Play("cs_KennyDecidesToKillLarry")
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Meat Locker")
      DlgPreload("env_dairyMeatLocker.dlog", "cs_enter", 0, 15, 0, false)
    end
    Checkpoint("cs_enter", "meatLocker_intro")
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function DairyMeatLocker()
  --TLSE_Development_PrintAllSceneAgentNames("meatlocker_full", TLSE_Development_SceneObject);

  RELIGHT_ConfigurationStart();

  RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);

  RELIGHT_Camera_DepthOfFieldAutofocus_SetupDOF(nil);
  Callback_PostUpdate:Add(RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus);

  RELIGHT_HackyCameraVolumetrics_Initalize();
  Callback_PostUpdate:Add(RELIGHT_HackyCameraVolumetrics_Update);

  RELIGHT_SceneStart();
  Callback_PostUpdate:Add(RELIGHT_SceneUpdate);

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
  SceneAdd(kOverlay)
end