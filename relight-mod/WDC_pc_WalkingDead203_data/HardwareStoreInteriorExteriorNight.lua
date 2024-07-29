local kScript = "HardwareStoreInteriorExteriorNight"
local kScene = "adv_hardwareStoreInteriorExteriorNight"
local mDialogId
local PreloadAssets = function()
  if not Game_GetLoaded() then
    PreLoad("env_hardwareStoreInteriorExteriorNight_CS_Enter_1.chore")
  end
  if Platform_NeedShaderPreload() then
    print(">>>>>>>>> PRELOADING SHADERS: " .. kScene)
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "334")
    RenderPreloadShader("SceneToonOutline2_CC_TONE_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_CC_TONE_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_DTL_CC_TONE_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("SceneToonOutline2_CC_TONE_QLo.t3fxb", "192")
    RenderPreloadShader("SceneToonOutline2_CC_TONE_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TONE_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TONE_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TONE_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "328")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "264")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "270")
  end
end
function HardwareStoreIntExtNight_navTimerCheck()
  while not Game_IsPlayMode() do
    Yield()
  end
end
function HardwareStoreInteriorExteriorNight_RunBackground(dialogNode)
  if Game_DialogExists(dialogNode) then
    mDialogId = Game_RunDialog(dialogNode, false)
  else
    Print("WARNING: --" .. dialogNode .. "-- does not exist!!")
    return
  end
  Print("Success: mDialogId is --" .. tostring(mDialogId) .. "--")
end
function HardwareStoreInteriorExteriorNight_ResumeBackground()
  if not mDialogId then
    Print("WARNING: mDialogId == " .. mDialogID .. " for resume.")
    return
  end
  Print("--Dialog Resume--")
  DlgResume(mDialogId)
end
function HardwareStoreInteriorExteriorNight_StopBackground()
  if not mDialogId then
    Print("WARNING: mDialogId == " .. mDialogID .. " for pause.")
    return
  end
  Print("--Dialog Stop--")
  DlgStop(mDialogId)
end
function HardwareStoreInteriorExteriorNight()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  Game_StartScene()
end
SceneOpen(kScene, kScript)