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

local kScript = "RestStop"
local kScene = "adv_restStop"

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

local mZombieHeads

local ZombieMonitor = function()
  local worldPos = AgentGetWorldPos(Game_GetPlayer())
  for _, head in ipairs(mZombieHeads) do
    if AgentGetProperty(head, kGameSelectable) then
      local distance = VectorDistance(AgentGetWorldPos(head), worldPos)
      AgentHide(head, distance > 5)
    else
      AgentHide(head, true)
    end
  end
end

local PreloadAssets = function()
  local kPreLoadList = {
    "env_restStop_cs_enterSnowstorm_1.chore",
    "NV_Clem_Breathing_Shivering_Lp_02.wav",
    "sk56_clem204WalkSnowStormHoldGun_sheltersArmRight.chore",
    "clementine200_eyes_lookAtsOff.chore",
    "clementine_face_blinkPainA.chore",
    "sk56_clem204WalkSnowStormHoldGun_sheltersArmRight_add.chore",
    "amb_wind_gust_01.wav",
    "sk56_move_clem204WalkSnowStormHoldGun.chore",
    "adv_restStop_clemColdInSnowstorm.chore",
    "sk56_idle_clementine200PainA.chore",
    "sk56_idle_clementine200.chore",
    "amb_winter_wind_gusty.wav",
    "mus_loop_Ominous_04.wav",
    "vox_zomb_group_idol_lp_2.wav",
    "trigger_chorebox_snowstorm_depth.chore",
    "trigger_chorebox_snowstorm_width.chore",
    "sk56_clementine200PainA.ptable",
    "FS_Player_Snow_Walk_01.wav",
    "FS_Player_Snow_Walk_02.wav",
    "FS_Player_Snow_Walk_03.wav",
    "FS_Player_Snow_Walk_04.wav",
    "FS_Player_Snow_Walk_05.wav",
    "fs_concrete_light_grit_01.wav",
    "fs_concrete_light_grit_02.wav",
    "fs_concrete_light_grit_03.wav",
    "fs_concrete_light_grit_04.wav",
    "fs_concrete_light_grit_05.wav",
    "adv_restStop_zombieSnowstorm1Wandering.chore",
    "adv_restStop_zombieSnowstorm2Wandering.chore",
    "adv_restStop_zombieSnowstorm3Wandering.chore",
    "adv_restStop_zombieSnowstorm4Wandering.chore",
    "adv_restStop_zombieSnowstorm5Wandering.chore",
    "sk55_zombie200_torsoLongSleeveAwarmGrey.d3dtx",
    "sk55_zombie200_legsShortShortsAblueDenim.d3dtx",
    "sk55_zombie200_hairStraggleyBlack.d3dtx",
    "sk55_zombie200_hairStraggleyBlackAlpha.d3dtx",
    "sk54_zombie200_shirtAwhite.d3dtx",
    "sk54_zombie200_summerShirtPlaid.d3dtx",
    "sk54_zombie200_jacketABrownLeather.d3dtx",
    "sk54_zombie200_shortsAafrican.d3dtx",
    "sk54_zombie200_pantsAgreenTrack.d3dtx",
    "sk54_zombie200_faceCafrican.d3dtx",
    "sk54_zombie200_faceBafrican.d3dtx",
    "sk54_zombie200_headAafrican.d3dtx",
    "sk54_zombie200_fullArmsAfrican.d3dtx",
    "sk54_zombie200_stragglyHairAgreyAlpha.d3dtx",
    "sk54_zombie200_spikeyHairAgrey.d3dtx",
    "sk54_zombie200_spikeyHairAgreyAlpha.d3dtx",
    "sk54_zombie200_armStumpAfrican.d3dtx",
    "sk54_zombie200_foreArmChopAfrican.d3dtx",
    "sk54_zombie200_headEafrican.d3dtx",
    "sk54_zombie200_shirtAwhite_nm.d3dtx",
    "sk54_zombie200_shirtAwhite_detail.d3dtx",
    "sk54_zombie200_faceBafrican_detail.d3dtx",
    "sk54_zombie200_headAafrican_detail.d3dtx",
    "sk55_zombie200_legsBareAafrican.d3dtx",
    "sk55_zombie200_headBafrican.d3dtx",
    "sk55_zombie200_headAafrican.d3dtx",
    "sk55_zombie200_fullArmsAfrican.d3dtx",
    "sk55_zombie200_armStumpAfrican.d3dtx",
    "sk55_zombie200_foreArmChopAfrican.d3dtx",
    "sk55_zombie200_hairCurlyBlack.d3dtx",
    "sk55_zombie200_hairCurlyBlackAlpha.d3dtx",
    "sk54_zombie200_summerShirtBlue.d3dtx",
    "sk54_zombie200_jacketBbrownLeather.d3dtx",
    "sk54_zombie200_longHairAgrey.d3dtx",
    "sk54_zombie200_longHairAgreyAlpha.d3dtx",
    "sk54_zombie200_jacketBgreenTrack.d3dtx"
  }
  for _, item in ipairs(kPreLoadList) do
    PreLoad(item)
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "326")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_TOON_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_ENV_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_ENV_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_DTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_QLo.t3fxb", "455")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "3")
  end
end

function RestStop_FaceZombie(zombieNum)
  PathAgentFacePos(Game_GetPlayer(), AgentGetSelectionCenter("ZombieSnowstorm" .. zombieNum, true))
end

function RestStop_DisableZombieWalkBoxes(zombieNum)
  WalkBoxesDisableAreaAroundAgent(kScene, "ZombieSnowstorm" .. zombieNum)
end

function RestStop_ResetZombies()
  if mZombieHeads then
    for _, zombieHead in ipairs(mZombieHeads) do
      AgentSetSelectable(zombieHead, true)
    end
  end
  WalkBoxesEnableAll(kScene)
end

function RestStop_ZombieMonitor(bStart)
  if bStart then
    mZombieHeads = {
      AgentFind("obj_zombieSnowstormHead1"),
      AgentFind("obj_zombieSnowstormHead2"),
      AgentFind("obj_zombieSnowstormHead3"),
      AgentFind("obj_zombieSnowstormHead4"),
      AgentFind("obj_zombieSnowstormHead5")
    }
    Callback_OnPostUpdate:Add(ZombieMonitor)
  else
    Callback_OnPostUpdate:Remove(ZombieMonitor)
    if mZombieHeads then
      for _, zombieHead in ipairs(mZombieHeads) do
        AgentHide(zombieHead, true)
      end
      mZombieHeads = nil
    end
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  local bFightStarted = LogicGet("3 - Fight Started")
  if Game_GetLoaded() and bFightStarted then
    Navigate_Enable(false)
  end
  if Game_GetDebug() and bFightStarted then
    Game_SetSceneDialog("env_restStop_fight")
    if LogicGet("3 - Fight Stage") == 1 then
      Game_SetSceneDialogNode("cs_fightStarts")
    else
      Navigate_Enable(false)
      AgentHide("Jane", false)
      AgentHide("Kenny", false)
      AgentSetProperty("group_restStop", "Group - Visible", true)
      AgentSetProperty("group_snowstorm", "Group - Visible", false)
      Game_SetSceneDialogNode("cs_grabGun")
    end
    Yield()
  end
  PreloadAssets()
  Game_StartScene()
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function RestStop()
  RELIGHT_ConfigurationStart();

  RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);

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
