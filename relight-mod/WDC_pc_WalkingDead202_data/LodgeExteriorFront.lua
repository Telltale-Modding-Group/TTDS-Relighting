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

local kScript = "LodgeExteriorFront"
local kScene = "adv_lodgeExteriorFront"

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
RelightConfigLevel = RelightConfigData_Season2.Level_202_LodgeExteriorFront;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "334")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_QLo.t3fxb", "199")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "66")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "323")
    RenderPreloadShader("SceneToonOutline2_CC_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "74")
    RenderPreloadShader("SceneToonOutline2_CC_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "266")
  end
end

function LodgeExteriorFront_ShootZombie()
  local zombieNum = LogicGet("3LodgeFront - Target Zombie")
  local zombie = AgentFind("Zombie" .. zombieNum)
  if not zombie.mShotChorePriority then
    zombie.mShotChorePriority = 100
  end
  local targetType = LogicGet("3LodgeFront - Target Type")
  if targetType == 3 then
    AgentSetProperty(zombie, kIdleAnim, "adv_lodgeExteriorFront_zombieDead.chore")
    AgentSetSelectable("obj_zombieHead" .. zombieNum, false)
    AgentSetProperty("trigger_zombieDeath" .. zombieNum, kTriggerEnabled, false)
  end
  local choreName = string.format("env_lodgeExteriorFront_fight_shootZombie%d_%d", zombieNum, targetType)
  ChorePlay(choreName, zombie.mShotChorePriority)
  zombie.mShotChorePriority = zombie.mShotChorePriority + 1
end

function LodgeExteriorFront_OnZombieTrigger(agent, trigger)
  if Game_IsPlayMode() or Game_GetMode() == eModeCutscene then
    Game_RunDialog(agent.mProps["Trigger - Dialog Node Enter"])
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if LogicGet("3LodgeFront - Met Bonnie") == false and IsPlatformAndroid() then
    AgentSetProperty("cam_cutsceneChore", "Clip Plane - Near", 0.2)
  end
  PreloadAssets()
  if Game_GetDebug() and LogicGet("3LodgeFront - Zombies Surrounded") then
    Game_SetSceneDialog("env_lodgeExteriorFront_fight")
    Yield()
  end
  Game_StartScene(true)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function LodgeExteriorFront()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "202_";
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
