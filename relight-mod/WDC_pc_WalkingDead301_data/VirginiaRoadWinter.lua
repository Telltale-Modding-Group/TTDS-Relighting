local kScript = "VirginiaRoadWinter"
local kScene = "adv_virginiaRoadTileWinter"
function VirginiaRoadWinter()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
