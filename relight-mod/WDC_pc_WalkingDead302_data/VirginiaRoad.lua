local kScript = "VirginiaRoad"
local kScene = "adv_virginiaRoadTile"
function VirginiaRoad()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
