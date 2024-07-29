local kScript = "CivilWarMemorialCenter"
local kScene = "adv_civilWarMemorialCenter"
local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_CC_TONE_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_DTL_CC_TONE_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_QLo.t3fxb", "135")
    RenderPreloadShader("SceneToonOutline2_CC_TONE_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TONE_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TONE_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_LGT_CC_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_VCOL_CC_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_TONE_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TONE_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_1SKN_CC_TONE_QLo.t3fxb", "263")
  end
end
function CivilWarMemorialCenter()
  Game_NewScene(kScene, kScript)
  local bEnteredDeck = LogicGet("bEnteredCivilWarMemorialObservationDeck")
  local bEnteredMuseum = LogicGet("bEnteredCivilWarMemorialMuseum")
  if bEnteredDeck and bEnteredMuseum then
    PreloadAssets()
  end
  if Game_GetDebug() then
    if PropertyGet(GetPreferences(), "Skip Enter Cutscenes") then
      if bEnteredDeck or bEnteredMuseum then
        Game_RunSceneDialog("logic_afterAwayMission", false)
      else
        Game_RunSceneDialog("logic_approachTent", false)
      end
    elseif bEnteredDeck and bEnteredMuseum and SystemConfirmDialog("Are you coming from the Observation Deck?", "Coming from Deck?", false) then
      AgentSetProperty("logic_script", "Script - Previous", "CivilWarMemorialObservationDeck")
    end
  end
  if IsPlatformTouch() and (bEnteredDeck or bEnteredMuseum) then
    SceneAddOnCameraChangeCallback(kScene, "CivilWarMemorialCenter_OnCamChange")
  end
  Game_StartScene()
end
function CivilWarMemorialCenter_OnCamChange(camName)
  AgentHide("blocker_touch", camName == ("cam_nav_main_right" or "cam_nav_mapCorner"))
end
SceneOpen(kScene, kScript)
