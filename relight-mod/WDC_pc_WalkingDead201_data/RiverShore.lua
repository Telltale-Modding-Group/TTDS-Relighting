--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");
require("RELIGHT_RiverShore.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "RiverShore"
local kScene = "adv_riverShore"

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
    BokehBlurThreshold = 0.02,
    BokehMinSize = 0.0,
    BokehMaxSize = 0.035,
    BokehFalloff = 1.0,
    MaxBokehBufferAmount = 1.0,
    BokehPatternTexture = "bokeh_circle.d3dtx"
};

--Relight Volumetrics
RELIGHT_HackyCameraVolumetrics_Settings = 
{
    Samples = 256,
    SampleOffset = 0.1,
    SampleStartOffset = 1.0,
    FogColor = Color(0.1, 0.1, 0.1, 0.1)
};

RELIGHT_ProcedualGrass_PropFile = "obj_grassHIRiverCampWalk.prop";
RELIGHT_ProcedualGrass_DensityPerUnit = 0.4;
RELIGHT_ProcedualGrass_GrassScale = 0.5;
RELIGHT_ProcedualGrass_IgnoreZones = {};

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local envMeshes = {}

envMeshes.shoreline = {
  "group_shoreline",
  "obj_canoeBrokenRiverShore"
}

envMeshes.trail = {
  "group_trail"
}

envMeshes.trailLower = {
  "group_trailLower"
}

envMeshes.trailUpper = {
  "group_trailUpper"
}

envMeshes.forestFloor = {
  "group_forestFloor"
}

local mCurrentEnv

local PreloadAssets = function()
  PreLoad("env_riverShore_cs_wind_1.chore")
  PreLoad("env_riverShore_cs_crowsOnSign_1.chore")
  PreLoad("env_riverShore_cs_crowsFlyOver_1.chore")
  PreLoad("env_riverShore_cs_pathTransition_1.chore")
  PreLoad("env_riverShore_trigger_toForestFloor_2.chore")
end

function RiverShore_SetEnvironment(state)
  local hideEnv = function(env)
    for key, value in pairs(env) do
      if AgentHasProperty(value, "Group - Visible") then
        AgentSetProperty(value, "Group - Visible", false)
        local groupChildren = AgentGetChildren(value)
        for key, value in pairs(groupChildren) do
          if AgentHasProperty(value, "Trigger Enabled") then
            AgentSetProperty(value, "Trigger Enabled", false)
          end
        end
      else
        AgentHide(value, true)
        if AgentHasProperty(value, "Trigger Enabled") then
          AgentSetProperty(value, "Trigger Enabled", false)
        end
      end
    end
  end

  local meshesToShow

  for key, value in pairs(envMeshes) do
    if state == key then
      meshesToShow = envMeshes[state]
      break
    end
  end

  if not meshesToShow then
    print("RiverShore_SetEnvironment() didn't get a valid state!")
    return
  elseif mCurrentEnv == meshesToShow then
    print("RiverShore_SetEnvironment(): " .. tostring(meshesToShow) .. " is already active! Nothing to do!")
    return
  end

  if not mCurrentEnv then
    for key, value in pairs(envMeshes) do
      hideEnv(value)
    end
  else
    hideEnv(mCurrentEnv)
  end

  for key, value in pairs(meshesToShow) do
    if AgentHasProperty(value, "Group - Visible") then
      AgentSetProperty(value, "Group - Visible", true)
      local groupChildren = AgentGetChildren(value)

      for key, value in pairs(groupChildren) do
        if AgentHasProperty(value, "Trigger Enabled") then
          AgentSetProperty(value, "Trigger Enabled", true)
        end
      end
    else
      AgentHide(value, false)

      if AgentHasProperty(value, "Trigger Enabled") then
        AgentSetProperty(value, "Trigger Enabled", true)
      end
    end
  end

  mCurrentEnv = meshesToShow
end

function RiverShore_MakeAllObjsUnselectable()
  for key, value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end

function RiverShore_MoveCanoe()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_use_canoe_13.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_use_canoe_CM_outro")
  ChoredMovement_Start()
  ChoredMovement_ReverseControls(true)
end

function RiverShore_WalkThroughUnderbrush(pathArea)
  if pathArea == "lower" then
    print("RiverShore_WalkThroughUnderbrush(): LOWER")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_cs_pathTransition_1.chore")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "trigger_toForestFloor")
    ChoredMovement_Start()
    ChoredMovement_ReverseControls(false)
  elseif pathArea == "upper" then
    print("RiverShore_WalkThroughUnderbrush(): UPPER")
  else
    print("RiverShore_WalkThroughUnderbrush() didn't get a valid area!")
  end
end

function RiverShore_StartWalkAcrossLandslide(pathArea)
  if pathArea == "lower" then
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_choredMove_beforeLandslide_lower_1.chore")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "logic_prepForestFloor")
    ChoredMovement_Start()
    ChoredMovement_ReverseControls(false)
  elseif pathArea == "upper" then
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_choredMove_beforeLandslide_upper_1.chore")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "logic_prepForestFloor")
    ChoredMovement_Start()
    ChoredMovement_ReverseControls(false)
  else
    print("RiverShore_StartWalkAcrossLandslide() didn't get a valid area!")
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  PreloadAssets()

  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
  end

  if IsPlatformAndroid() then
    AgentSetProperty("cam_nav_shore", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_trailTileLowerC", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_trailTileLowerFork", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_forestFloor", "Pan Cam - Dampening", 2)
  end

  Game_StartScene(true)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function RiverShore()
  --RELIGHT_SetupConfigurationFiles();

  --Apply freecamera settings from ini dev file
  RELIGHT_ApplyFreecameraSettingsFromINI();

  RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);

  RELIGHT_WaterReplacement_Initalize();
  --RELIGHT_ProcedualGrass_Initalize(Vector(-23, 5, 6), Vector(25, 0, 25));

  RELIGHT_SkydomeReplacement_Initalize();


  RELIGHT_LensFlareEffect_Initalize();
  Callback_OnPostUpdate:Add(RELIGHT_LensFlareEffect_Update);


  AgentSetProperty(RELIGHT_SceneObjectAgentName, "LightEnv Reflection Texture", "RELIGHT_Cubemap_spruit_sunrise.d3dtx");











  --RELIGHT_HackyCameraVolumetrics_Initalize();
  --Callback_OnPostUpdate:Add(RELIGHT_HackyCameraVolumetrics_Update);

  --RELIGHT_Camera_DepthOfFieldAutofocus_SetupDOF(nil);
  --Callback_OnPostUpdate:Add(RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    do return end --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlay
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

if (RelightConfigDevelopment.EditorMode == false) or (RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
  SceneAdd("ui_openingCredits")
end
