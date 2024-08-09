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

local kScript = "CabinShedInterior"
local kScene = "adv_cabinShedInterior"

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
RelightConfigLevel = RelightConfigData_Season2.Level_201_CabinShedInterior;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local PreloadAssets = function(bAct3)
  if bAct3 then
    if not LogicGet("3Shed - Bandaged Arm") then
      PreLoad("env_cabinShedInteriorAct3_drag_needle_1_chores_4.chore")
      PreLoad("env_cabinShedInteriorAct3_drag_needle_2_chores_3.chore")
      PreLoad("env_cabinShedInteriorAct3_drag_needle_3_chores_3.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_putDownNeedle_2.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_stitch_finisher_1.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_stitch_finisher_2.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_stitch_finisher_3.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_putDownNeedle_2_finalStitch.chore")
    end
    PreLoad("env_cabinShedInteriorAct3_cs_zombieAttacks_1.chore")
    PreLoad("env_cabinShedInteriorAct3_timer_ZombieInHole_1.chore")
    PreLoad("env_cabinShedInteriorAct3_cs_zombieBreaksFree_1.chore")
    PreLoad("env_cabinShedInteriorAct3_cs_zombieBreaksFree_2.chore")
    PreLoad("env_cabinShedInteriorAct3_timer_freeZombieLegGrabbed_1.chore")
    PreLoad("struggle_ZombieBraceFootClose.chore")
    PreLoad("struggle_ZombieBraceFootMed.chore")
    PreLoad("struggle_ZombieBraceFootFar.chore")
    PreLoad("sk56_idle_clementine200ZombieRakeStruggleCloseRight.chore")
    PreLoad("sk56_idle_clementine200ZombieRakeStruggleMedRight.chore")
    PreLoad("sk56_idle_clementine200ZombieRakeStruggleFarRight.chore")
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_SCM_CC_TINT_QLo.t3fxb", "264")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "258")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "258")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "130")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "258")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "264")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "263")
  end
end

function CabinShedInterior_SuppressPointer()
  while not LogicGet("3Shed - Stitched Arm") do
    if LogicGet("3Shed - About to Stitch") or LogicGet("3Shed - Did Intro Stitch") then
      Reticle_HidePointer(true)
    end
    Yield()
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  local bAct3 = LogicGet("Act") == 3
  if bAct3 then
    Navigate_Enable(false)
    if IsPlatformIOS() then
      AgentSetProperty("cam_fightStage5", "Pan Cam - Percentage Initial Vertical", 0.2)
    end
    if IsPlatformAndroid() then
      AgentSetProperty("cam_closeUp_needle", "Clip Plane - Near", 0.1)
      AgentSetProperty("cam_closeUp_finalStitch", "Clip Plane - Near", 0.04)
    end
  end
  PreloadAssets(bAct3)
  if Game_GetDebug() then
    LogicSet("bEnteredCabinExterior", true)
    if not bAct3 then
      Inventory_AddItem("knifePocket")
    else
      local sceneAgent = SceneGetSceneAgent(kScene)
      AgentSetProperty(sceneAgent, "Scene - Dialog", "env_cabinShedInteriorAct3.dlog")
      Yield()
      if LogicGet("3Shed - Bandaged Arm") then
        LogicSet("3Shed - Cleaned Arm", true)
        LogicSet("3Shed - Stitched Arm", true)
        Game_RunSceneDialog("logic_act2ObjectsOff")
        Game_SetSceneDialogNode("cs_zombieAttacks")
      end
    end
  end
  Game_StartScene(true)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function CabinShedInterior()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end
  
  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_OnPostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_OnPostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "201_";
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
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
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)
