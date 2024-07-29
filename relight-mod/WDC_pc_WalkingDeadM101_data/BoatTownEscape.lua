local kScript = "BoatTownEscape"
local kScene = "adv_boatTownShoreTreeline"
function BoatTownEscape()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
