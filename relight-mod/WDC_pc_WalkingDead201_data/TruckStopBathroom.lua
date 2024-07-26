--NOTE: DOF IS BROKEN IN THIS SCENE (IT WORKS BUT THE SCENE THATS BEING ADDED AT THE END BREAKS IT)

require("RELIGHT_Include.lua");

--original telltale level variables
local kScript = "TruckStopBathroom";
local kScene = "adv_truckStopBathroom";
RELIGHT_kScene = kScene;

TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_UseSeasonOneAPI = false;
TLSE_Development_FreecamUseFOVScale = false;

--some relighting variables
RelightConfigGlobal = RelightConfigData_Main.Global;
RelightConfigDevelopment = RelightConfigData_Development.DevelopmentTools;
RelightConfigLevel = RelightConfigData_Season2.Level_201_TruckStopBathroom;

local PreloadAssets = function()
  PreLoad("cs_omidEntersTruckstop.chore")
  
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "263")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_QLo.t3fxb", "130")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_ENV_VCOL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_ENV_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "270")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_QLo.t3fxb", "258")
    RenderPreloadShader("Mesh_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_BMP_DTL_DBMP_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_BMP_DTL_DBMP_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_QLo.t3fxb", "132")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "6")
    RenderPreloadShader("SceneSimple_QLo.t3fxb", "0")
  end
end

--main level script
TruckStopBathroom = function()
    --global (apply global after so it overrides anything set in scene)
    RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);
    Callback_OnPostUpdate:Add(RELIGHT_Global_ForceGraphicBlackOffUpdate);
    

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













    --continue the scene like telltale intended
    --Game_NewScene(kScene, kScript);
    --PreloadAssets();
    --Game_StartScene(true);
end

SceneOpen(kScene, kScript)
SceneAdd("ui_openingCredits") --don't disable, this will screw post processing when omid enters the bathroom