local kScript = "CivilWarMemorialMuseum"
local kScene = "adv_cIvilWarMemorialMuseum"
local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "67")
  end
end
function CivilWarMemorialMuseum()
  Game_NewScene(kScene, kScript)
  if not LogicGet("bGotCoatCivilWar") then
    CivilWarMemorialMuseum_DisableMikeTris(true)
  end
  SceneAddOnCameraChangeCallback(kScene, "CivilWarMemorialMuseum_OnCamChange")
  if Game_GetDebug() and PropertyGet(GetPreferences(), "Skip Enter Cutscenes") then
    Game_RunSceneDialog("logic_enterMuseum", false)
  end
  PreloadAssets()
  if IsPlatformAndroid() then
    AgentSetProperty("cam_nav_fromAbove", "Clip Plane - Near", 0.4)
  end
  Game_StartScene()
end
function CivilWarMemorialMuseum_DisableMikeTris(bDisable)
  for i = 209, 218 do
    WalkBoxesDisableTri(kScene, i, bDisable)
  end
end
function CivilWarMemorialMuseum_OnCamChange(camName)
  AgentHide("blocker_east", camName ~= "cam_nav_map")
end
SceneOpen(kScene, kScript)
