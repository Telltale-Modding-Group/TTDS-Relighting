local kScript = "FerryExteriorDeck"
local kScene = "adv_ferryExteriorDeck"
function FerryExteriorDeck()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
