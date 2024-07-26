--include our custom scripts/extensions
require("RELIGHT_Include.lua");
--require("RELIGHT_Camera_DepthOfFieldAutofocus.lua");
--require("RELIGHT_Effect_HackyCameraVolumetrics.lua");
--require("RELIGHT_Effect_LensFlare.lua");

--coreesponding level
--require("RELIGHT_ClearingCampfire.lua");

--ResourceSetEnable("ProjectSeason1")
--ResourceSetEnable("WalkingDead101")

--original telltale level variables
local kScript = "ClearingCampfire";
local kScene = "adv_clearingCampfire";
RELIGHT_kScene = kScene;

TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_UseSeasonOneAPI = false;
TLSE_Development_FreecamUseFOVScale = false;

--some relighting variables
RelightConfigGlobal = RelightConfigData_Main.Global;
RelightConfigDevelopment = RelightConfigData_Development.DevelopmentTools;
RelightConfigLevel = RelightConfigData_Season2.Level_201_ClearingCampfire;

--[[
--relighting dof autofocus variables
RELIGHT_DOF_AUTOFOCUS_SceneObject = kScene;
RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName = kScene .. ".scene";
RELIGHT_DOF_AUTOFOCUS_UseCameraDOF = true;
RELIGHT_DOF_AUTOFOCUS_UseLegacyDOF = false;
RELIGHT_DOF_AUTOFOCUS_UseHighQualityDOF = true;
RELIGHT_DOF_AUTOFOCUS_FocalRange = 1.0;
RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames = 
{ 
    "cam_nav_fireArea",
    "cam_nav_fireArea_parent",
    "cam_nav_Clementine_chaseToCampfire",
    "cam_nav_Clementine_chaseToCampfire_parent",
    "cam_nav_backpackArea",
    "cam_nav_backpackArea_parent",
    "cam_pan_fireInDistance",
    "cam_pan_fireInDistance_parent",
    "cam_closeUp_rummageBackpack_parent",
    "cam_closeUp_rummageBackpack",
    "cam_Clementine_track",
    "cam_pan_examineTheFire",
    "cam_pan_examineTheFire_parent"
};
RELIGHT_DOF_AUTOFOCUS_ObjectEntries = 
{
    "Clementine",
    "Christa",
    "Victor",
    "Ralph",
    "Winston"
};
RELIGHT_DOF_AUTOFOCUS_Settings =
{
    TargetValidation_IsOnScreen = true,
    TargetValidation_IsVisible = true,
    TargetValidation_IsWithinDistance = true,
    TargetValidation_IsFacingCamera = true,
    TargetValidation_IsOccluded = false
};
RELIGHT_DOF_AUTOFOCUS_BokehSettings =
{
    BokehBrightnessDeltaThreshold = 0.01,
    BokehBrightnessThreshold = 0.01,
    BokehBlurThreshold = 0.01,
    BokehMinSize = 0.0,
    BokehMaxSize = 0.035,
    BokehFalloff = 0.5,
    MaxBokehBufferAmount = 1.0,
    BokehPatternTexture = "bokeh_circle.d3dtx"
};
]]

--[[
HackyCameraVolumetrics_kScene = kScene;
HackyCameraVolumetrics_Settings = 
{
    Samples = 256,
    SampleOffset = 0.095,
    SampleStartOffset = 1.5,
    FogColor = Color(0.035, 0.035, 0.035, 1.0) --fog color is additive, alpha doesn't do anything
};
]]

--LensFlareEffect_kScene = kScene;

local kDragHintDelay = 0.5
local mbIsKindlingBurning = false
local mBanterDialogID = nil
local multiAgents = {}

multiAgents.kindling = {}
-- DECOMPILER ERROR at PC13: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.kindling).agents = {"obj_kindlingClearingCampfire", "obj_kindlingClearingCampfire_clementineWristL", "newFireLight"}
-- DECOMPILER ERROR at PC15: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.kindling).lastUpdateTime = -1
multiAgents.lighter = {}
-- DECOMPILER ERROR at PC24: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.lighter).agents = {"obj_lighterWD", "obj_lighterWD_clementine", "obj_lighterWD_christa"}
-- DECOMPILER ERROR at PC26: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.lighter).lastUpdateTime = -1
multiAgents.backpack = {}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.backpack).agents = {"obj_backpackClearingCampfire", "obj_backpackClearingCampfire_clementine"}
-- DECOMPILER ERROR at PC36: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.backpack).lastUpdateTime = -1
multiAgents.drawings = {}
-- DECOMPILER ERROR at PC45: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.drawings).agents = {"obj_drawingClementineClearingCampfireA", "obj_drawingClementineClearingCampfireA_clementine", "obj_drawingClementineClearingCampfireA_backpack"}
-- DECOMPILER ERROR at PC47: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.drawings).lastUpdateTime = -1
multiAgents.photo = {}
-- DECOMPILER ERROR at PC56: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.photo).agents = {"obj_photoTornLeeClearingCampfire", "obj_photoTornLeeClearingCampfire_clementine", "obj_photoTornLeeClearingCampfire_backpack"}
-- DECOMPILER ERROR at PC58: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.photo).lastUpdateTime = -1

local UpdateContextSensitiveComment = function()
  -- function num : 0_0 , upvalues : _ENV
  local choice = DlgEvaluateToNode(Game_GetSceneDialog(), "use_winston_contextual", "exchange", false)
  local text = DlgGetExchangeNodeText(Game_GetSceneDialog(), choice.NodeID, false)
  if text[1] then
    text = text[1]
  else
    text = nil
  end
  if text and AgentExists("ui_dialog_choice3") then
    AgentSetProperty("ui_dialog_choice3", "Text String", text)
  end
end

local ShowDragTut = function()
  -- function num : 0_1 , upvalues : _ENV
  Notification_ShowTutorial("tut_campfireClearing_holdAndDrag")
end

ClearingCampfire_DragHintDelay = function()
  -- function num : 0_2 , upvalues : _ENV, kDragHintDelay
  Sleep(kDragHintDelay)
  LogicSet("1Campfire - Okay for Drag Hint", true)
end

ClearingCampfire_MultiAgents_Init = function()
  -- function num : 0_3 , upvalues : _ENV, multiAgents
  print("Clearing Campfire: multi agents INIT")
  local multiAgentKey, multiAgentValue = nil, nil
  local actionTime = 0
  for multiAgentKey,multiAgentValue in pairs(multiAgents) do
    do
      for key,value in pairs(multiAgentValue.agents) do
        local agent = value
        do
          local MultiAgentsVisCheck = function(propKey, bVisible)
    -- function num : 0_3_0 , upvalues : multiAgentValue, _ENV, multiAgents, multiAgentKey, agent
    if bVisible then
      if multiAgentValue.lastUpdateTime == GetTotalTime() then
        return 
      end
      for key,value in pairs((multiAgents[multiAgentKey]).agents) do
        if value ~= agent then
          AgentHide(value, true)
        end
      end
      multiAgentValue.lastUpdateTime = GetTotalTime()
    end
  end

          PropertyAddKeyCallback(AgentGetProperties(agent), "Runtime: Visible", MultiAgentsVisCheck)
        end
      end
    end
  end
end

ClearingCampfire_MultiAgents_Off = function()
  -- function num : 0_4 , upvalues : _ENV, multiAgents
  for multiAgentKey,multiAgentValue in pairs(multiAgents) do
    for key,value in pairs(multiAgentValue.agents) do
      PropertyClearKeyCallbacks(AgentGetProperties(value), "Runtime: Visible")
    end
  end
  print("Clearing Campfire: multi agents OFF")
end

ClearingCampfire_BanterStart = function()
  -- function num : 0_5 , upvalues : mBanterDialogID, _ENV, UpdateContextSensitiveComment
  mBanterDialogID = Dialog_Run(Game_GetSceneDialog(), "cs_banter", false)
  print("^^STARTING^^ scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "1Campfire - Clem Context Comment Group to Winston", UpdateContextSensitiveComment)
end

ClearingCampfire_BanterPause = function(bPause)
  -- function num : 0_6 , upvalues : _ENV, mBanterDialogID
  if not bPause then
    print("** RESUMING ** scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgResume(mBanterDialogID)
  else
    print(">> PAUSING << scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgPause(mBanterDialogID)
  end
end

ClearingCampfire_BanterEnd = function()
  -- function num : 0_7 , upvalues : _ENV, UpdateContextSensitiveComment
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "1Campfire - Clem Context Comment Group to Winston", UpdateContextSensitiveComment)
end

ClearingCampfire_IsKindlingBurning = function()
  -- function num : 0_8 , upvalues : mbIsKindlingBurning
  return mbIsKindlingBurning
end

ClearingCampfire_SetKindlingBurning = function(bool)
  -- function num : 0_9 , upvalues : mbIsKindlingBurning
  if not bool then
    mbIsKindlingBurning = false
  else
    mbIsKindlingBurning = true
  end
end

ClearingCampfire_StartWalkToFire = function()
  -- function num : 0_10 , upvalues : _ENV
  AgentSetPos(Game_GetPlayer(), Vector(6.962573, 1e-006, 14.51492))
  AgentSetRot(Game_GetPlayer(), Vector(-180, -7.4572, -180))
  Navigate_Enable(true)
  TargetedWalk_Start("tgtWalk_ClemToCampfire")
  CameraActivate("cam_nav_Clementine_chaseToCampfire")
end

ClearingCampfire_MakeAllObjsUnselectable = function()
  -- function num : 0_11 , upvalues : _ENV, kScene
  for key,value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end

ClearingCampfire_SpecialAgentFocus = function()
  -- function num : 0_12 , upvalues : _ENV, kScene, ShowDragTut
  if AgentGetName(SceneGetCamera(kScene)) == "cam_closeUp_burnYourMemories" then
    if AgentGetName(Reticle_GetSelectedAgent()) == "obj_drawingClementineClearingCampfireA_clementine" then
      print("Clem\'s looking at the drawings!")
    else
      if AgentGetName(Reticle_GetSelectedAgent()) == "obj_photoTornLeeClearingCampfire_clementine" then
        print("Clem\'s looking at the photo!")
      else
        print("Clem\'s looking at NEITHER burnable object!")
      end
    end
  else
    if AgentGetName(Reticle_GetSelectedAgent()) == "obj_lighterUsePoint" and LogicGet("1Campfire - Okay for Drag Hint") then
      LogicSet("1Campfire - Okay for Drag Hint", false)
      ShowDragTut()
    end
  end
end

--telltale asset level preload (moved into a seperate function because it's big and annoying)
local LevelAssetPreload = function()
    if Platform_NeedShaderPreload() then
        RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
        RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "78")
        RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
        RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "70")
        RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "70")
        RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
        RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
        RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
        RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
        RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
        RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "326")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "206")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "135")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "334")
        RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "78")
        RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
        RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
        RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
        RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "3")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "134")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "134")
        RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "206")
        RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "135")
        RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "135")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "7")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "263")
        RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "262")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "270")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
        RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
        RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
        RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
        RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "142")
        RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "266")
        RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "198")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "198")
        RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
        RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "138")
    end
end

OriginalLevelLogic_ClearingCampfire = function()
  Game_NewScene(kScene, kScript);
        
  LevelAssetPreload();
  Callback_OnSetReticleAgent:Add(ClearingCampfire_SpecialAgentFocus);
        
  Game_StartScene(true);
end

--main level
ClearingCampfire = function()
    --RELIGHT_PrintProperties(AgentFindInScene("Clementine", kScene));
    --RELIGHT_GetCacheObjectNamesFromProperties(AgentFindInScene("Clementine", kScene), "cacheObjectNamesPart2Cleaned.txt");
    --RELIGHT_PrintValidPropertyNames(AgentFindInScene("Clementine", kScene));
    --RELIGHT_PrintProperties(AgentFindInScene("module_lightprobe", kScene));
    --RELIGHT_PrintSceneListToTXT(kScene, "sceneobject_201-clearingcampfire.txt")
    --RELIGHT_PrintValidPropertyNames(AgentFindInScene("Winston", kScene));

    --RELIGHT FUNCTIONS
    --scene
    --Apply_Scene_RelightScene(relightConfigLevel);
    --Apply_Scene_ApplyExposureAdjustment(relightConfigLevel);
    --Apply_Scene_ReplaceRain(relightConfigLevel);
    --Apply_Scene_AddProcedualGrass(relightConfigLevel);
    --Apply_Scene_MotionBlur(relightConfigGlobal, relightConfigLevel);
    --Apply_Scene_ForceBloomOff(relightConfigLevel);

    --LensFlareEffect_Initalize();
    --Callback_OnPostUpdate:Add(LensFlareEffect_Update);
    
    --if (relightConfigLevel.EnableVolumetricLighting == true) then
      --HackyCameraVolumetrics_Initalize();
      --Callback_OnPostUpdate:Add(HackyCameraVolumetrics_Update);
    --end
    
    --if (relightConfigLevel.EnableFlashlights == true) then
      --Apply_Scene_CreateFlashlights();
      --Callback_OnPostUpdate:Add(Apply_Scene_UpdateFlashlights);
    --end

    --RELIGHTING DEPTH OF FIELD
    --RELIGHT_DOF_AUTOFOCUS_UseHighQualityDOF = relightConfigLevel.HighQualityDepthOfField;
    --RELIGHT_Camera_DepthOfFieldAutofocus_SetupDOF(relightConfigLevel);

    --if (relightConfigLevel.EnableDepthOfField == true) then
        --Callback_OnPostUpdate:Add(RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus);
    --end
    
    --global (apply global after so it overrides anything set in scene)
    RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);
    Callback_OnPostUpdate:Add(RELIGHT_Global_ForceGraphicBlackOffUpdate);
    
    --if someone only wants the freecam and not the tools
    --if (relightConfigDev.RelightTools_FreecamOnly == true) then
        --RELIGHT_Development_CreateFreeCamera(kScene);
        --Callback_OnPostUpdate:Add(RELIGHT_Development_UpdateFreeCamera);
        
        --do return end --don't continue
    --end
    
    --development tools enabled in config
    --if (RelightConfigDevelopment.RelightTools == true) then        
        --RELIGHT_Development_CreateFreeCamera(kScene);
        --RELIGHT_Development_InitalizeRelightTools(kScene);

        --Callback_OnPostUpdate:Add(RELIGHT_Development_UpdateFreeCamera);
        --Callback_OnPostUpdate:Add(RELIGHT_Development_UpdateRelightTools_Input);
        --Callback_OnPostUpdate:Add(RELIGHT_Development_UpdateRelightTools_Main);
    --else
        --continue the scene like telltale intended
        --Game_NewScene(kScene, kScript);
        
        --LevelAssetPreload();
        --Callback_OnSetReticleAgent:Add(ClearingCampfire_SpecialAgentFocus);
        
        --Game_StartScene(true);
    --end

    if (RelightConfigDevelopment.FreeCameraOnlyMode == true) or (RelightConfigDevelopment.EditorMode == true) then     
      TLSE_Development_CreateFreeCamera();
      Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
    end

    if (RelightConfigDevelopment.PerformanceMetrics == true) then     
      TLSE_Development_PerformanceMetrics_Initalize();
      Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
    end

    if (RelightConfigDevelopment.EditorMode == true) then
      TLSE_Development_Editor_Start();
      Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
      do return end --don't continue
    end

    if (RelightConfigDevelopment.EditorMode == false) or (RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == true) then
      OriginalLevelLogic_ClearingCampfire();
    end
end

SceneOpen(kScene, kScript);
--SceneAdd("ui_openingCredits");