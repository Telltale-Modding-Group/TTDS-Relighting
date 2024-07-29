local kScript = "RichmondStreetTile"
local kScene = "adv_richmondStreetTile"
function RichmondStreetTile()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
