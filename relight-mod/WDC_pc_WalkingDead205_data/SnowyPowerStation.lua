--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");
require("RELIGHT_SnowyPowerStation.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "SnowyPowerStation"
local kScene = "adv_snowyPowerStation"

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
RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames = {};
RELIGHT_DOF_AUTOFOCUS_ObjectEntries = 
{
    "Clementine",
    "Bonnie",
    "Baby_kenny",
    "Kenny",
    "Mike",
    "Arvo",
    "Luke",
    "Jane",
    "Baby",
    "Baby_kenny_wrist_L",
    "Baby_clementine",
    "Baby_bonnie",

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
    BokehBrightnessDeltaThreshold = 0.05,
    BokehBrightnessThreshold = 0.05,
    BokehBlurThreshold = 0.05,
    BokehMaxSizeClamp = 0.05,
    BokehFalloff = 0.75,
    MaxBokehBufferAmount = 1.0,
    --BokehPatternTexture = "bokeh_circle.d3dtx"
    BokehPatternTexture = "bokeh_anamorphic2.d3dtx"
};

--Relight Volumetrics
RELIGHT_HackyCameraVolumetrics_Settings = 
{
    Samples = 256,
    SampleOffset = 0.05,
    SampleStartOffset = 1.0,
    FogColor = Color(0.05, 0.05, 0.05, 0.05)
};

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kPreLoadList = {
  "env_snowyPowerStation_CS_Enter_1.chore",
  "359067760.lang",
  "359067760.wav",
  "359067763.lang",
  "359067763.wav",
  "sk54_idle_kennyHoldBaby.chore",
  "kenny200_face_blink.chore",
  "sk54_kenny200_toAngryB.chore",
  "kenny200_headGesture_lookUpQuick_add.chore",
  "kenny200_headGesture_lookRightQuick_add.chore",
  "sk54_move_kennyWalkHoldBabyPointGunRelaxed.chore",
  "359067765.lang",
  "359067765.wav",
  "arvo_headGesture_lookLeft_add.chore",
  "arvo_face_blink.chore",
  "sk54_arvo_toSadA.chore",
  "arvo_headGesture_lookDown_add.chore",
  "clementine200_headGesture_lookUpRight_add.chore",
  "bonnie_face_blink.chore",
  "bonnie_eyes_dartR.chore",
  "bonnie_eyes_dartDownR.chore",
  "bonnie_eyes_dartDownL.chore",
  "bonnie_eyes_dartL.chore",
  "bonnie_eyes_dartDown.chore",
  "bonnie_headGesture_lookUpQuick_add.chore",
  "bonnie_headgesture_lookDownQuickLeft_add.chore",
  "bonnie_headgesture_lookDownQuick_add.chore",
  "bonnie_headgesture_lookUpRight_add.chore",
  "bonnie_headGesture_lookUp_add.chore",
  "bonnie_headgesture_lookUpLeft_add.chore",
  "bonnie_headgesture_lookRight_add.chore",
  "bonnie_headGesture_lookRightQuick_add.chore",
  "bonnie_headgesture_lookLeft_add.chore",
  "bonnie_headgesture_lookLeftQuick_add.chore",
  "bonnie_headgesture_lookDown_add.chore",
  "bonnie_headgesture_lookDownQuickRight_add.chore",
  "sk54_mike_walkHelpLukeWithAK47.chore",
  "fs_tiny_tim_1.wav",
  "fs_tiny_tim_2.wav",
  "fs_tiny_tim_3.wav",
  "fs_tiny_tim_4.wav",
  "fs_tiny_tim_5.wav",
  "fs_tiny_tim_6.wav",
  "sk56_idle_clementine200SadA.chore",
  "sk56_idle_clementine200.chore",
  "sk55_idle_bonnieNormalA.chore",
  "sk54_idle_kenny200NormalA.chore",
  "kenny200_eyes_default.chore",
  "sk54_idle_arvoNormalA.chore",
  "amb_winter_night_owl_lp.wav",
  "amb_winter_wind_forest_creaky.wav",
  "sk56_clementine200SadA.ptable",
  "sk55_lillyNormalA.ptable",
  "fs_snow_fast_dull_06.wav",
  "fs_snow_fast_dull_07.wav",
  "fs_snow_fast_dull_08.wav",
  "fs_snow_fast_dull_10.wav",
  "fs_snow_slow_01.wav",
  "fs_snow_slow_02.wav",
  "fs_snow_slow_03.wav",
  "fs_snow_slow_04.wav",
  "fs_snow_slow_05.wav",
  "fs_snow_fast_dull_11.wav",
  "fs_snow_fast_dull_12.wav",
  "fs_snow_fast_dull_13.wav",
  "fs_snow_fast_dull_14.wav",
  "fs_snow_fast_dull_15.wav",
  "fs_snow_slow_06.wav",
  "fs_snow_slow_07.wav",
  "fs_snow_slow_08.wav",
  "fs_snow_slow_09.wav",
  "fs_snow_slow_10.wav",
  "sk54_idle_kenny200AngryB.chore",
  "sk54_kenny202FearA.ptable",
  "fs_snow_fast_06.wav",
  "fs_snow_fast_07.wav",
  "fs_snow_fast_08.wav",
  "fs_snow_fast_09.wav",
  "fs_snow_fast_10.wav",
  "fs_snow_fast_01.wav",
  "fs_snow_fast_02.wav",
  "fs_snow_fast_03.wav",
  "fs_snow_fast_04.wav",
  "fs_snow_fast_05.wav",
  "sk54_idle_arvoSadA.chore",
  "sk54_matthewSadA.ptable",
  "fs_snow_fast_dull_01.wav",
  "fs_snow_fast_dull_02.wav",
  "fs_snow_fast_dull_03.wav",
  "fs_snow_fast_dull_04.wav",
  "fs_snow_fast_dull_05.wav"
}

local PreloadAssets = function()
  for _, item in ipairs(kPreLoadList) do
    PreLoad(item)
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  Game_StartScene()
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function SnowyPowerStation()
  RELIGHT_ConfigurationStart();
  RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);

  RELIGHT_SceneStart();
  Callback_OnPostUpdate:Add(RELIGHT_SceneUpdate);

  RELIGHT_Camera_DepthOfFieldAutofocus_SetupDOF(nil);
  Callback_OnPostUpdate:Add(RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus);

  --TLSE_Development_CameraInfo_Initalize();
  --Callback_OnPostUpdate:Add(TLSE_Development_CameraInfo_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);

    --OriginalTelltaleLevelStartLogic();
    do return end --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)