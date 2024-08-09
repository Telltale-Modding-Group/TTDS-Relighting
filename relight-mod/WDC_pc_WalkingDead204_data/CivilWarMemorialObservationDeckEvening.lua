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

local kScript = "CivilWarMemorialObservationDeckEvening"
local kScene = "adv_civilWarMemorialObservationDeckEvening"

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
RelightConfigLevel = RelightConfigData_Season2.Level_204_CivilWarMemorialObservationDeckEvening;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "320")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "328")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "262")
  end
end

function DeckEvening_ShootZombie(zombieNum)
  AgentSetSelectable("obj_zombieStairsHead" .. zombieNum, false)
  ChorePlay("env_civilWarMemorialObservationDeckEvening_shootZombie_" .. zombieNum)
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  if Game_GetDebug() then
    LogicSet(kAct, 3)
    if LogicGet("3 - Shot Zombies") then
      Game_SetSceneDialogNode("cs_shootingGallery")
    elseif LogicGet("3 - Comforted Rebecca") then
      Game_SetSceneDialogNode("cs_protectDeck")
    elseif LogicGet("3 - Pushed Cannon") then
      Game_SetSceneDialogNode("cs_collapseDeck")
    elseif LogicGet("3 - Baby Born") then
      Game_SetSceneDialog("env_civilWarMemorialObservationDeckEvening_postBirth.dlog")
      Game_SetSceneDialogNode("cs_familyGuy")
      Yield()
    end
  end
  Game_StartScene()
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function CivilWarMemorialObservationDeckEvening()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "204_";
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
