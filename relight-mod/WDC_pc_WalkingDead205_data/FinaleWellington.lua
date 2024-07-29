local kScript = "FinaleWellington"
local kScene = "adv_wellington"
local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneSimple_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "324")
    RenderPreloadShader("Mesh_ENV_LGT_QLo.t3fxb", "324")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_QLo.t3fxb", "324")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "324")
  end
end
function FinaleWellington()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_nextTimeOn")
