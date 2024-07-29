local kScript = "CabinInterior"
local kScene = "adv_cabinInterior"
local mDialogID, mbPanicOn
local GetPanicLength = function()
  if mDialogID then
    local controller = Dialog_GetController(mDialogID)
    if controller then
      return (ControllerGetLength(controller) - ControllerGetTime(controller)) * 0.666667
    end
  end
  return nil
end
local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    AgentHide("fx_lightBeamBathroomCabinInterior", true)
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_DTL_TONE_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_DTL_TONE_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_TONE_QLo.t3fxb", "200")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_ENV_TONE_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_ENV_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_ENV_VCOL_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "194")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "322")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_TONE_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_DTL_TONE_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_TONE_QLo.t3fxb", "200")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "206")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_ENV_VCOL_TONE_QLo.t3fxb", "200")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_TONE_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_LGT_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "195")
  end
end
function CabinInterior()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if Game_GetDebug() then
    LogicSet("bEnteredCabinExterior", true)
    LogicSet("2CabinExterior - Opened Trap Door", true)
    Inventory_AddItem("hammer")
    Inventory_AddItem("knifePocket")
  end
  Game_StartScene(true)
end
function CabinInterior_RunAmbientDialog(dialogNode)
  if dialogNode then
    mDialogID = Game_RunSceneDialog(dialogNode, false)
  end
end
function CabinInterior_KillAmbientDialog()
  if mDialogID and DlgIsRunning(mDialogID) then
    DlgStop(mDialogID)
  else
    print("No DLG ID to stop, yo.")
  end
end
function CabinInterior_RunPanicMeter()
  local panicLength = GetPanicLength()
  if panicLength then
    PanicMeter_FadeTo(1, panicLength, 0)
  end
end
SceneOpen(kScene, kScript)
