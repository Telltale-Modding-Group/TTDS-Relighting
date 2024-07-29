local kScript = "CivilWarMemorialObservationDeck"
local kScene = "adv_civilWarMemorialObservationDeck"
local PreloadAssets = function()
end
function CivilWarMemorialObservationDeck()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if IsPlatformIOS() or IsPlatformAndroid() then
    AgentSetProperty("cam_nav_hallway", "Pan Cam - Dampening", 2)
  end
  if Game_GetDebug() then
    if LogicGet("2 - Left Courtyard") then
      Game_SetSceneDialogNode("cs_enterDeck")
    elseif LogicGet("2 - Told Luke about Arvo") then
      LogicSet("2 - Told Luke about Arvo", false)
      Game_SetSceneDialogNode("logic_exitDeck")
    end
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
