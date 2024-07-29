local kScript = "VirginiaRoadCar"
local kScene = "adv_virginiaRoadTileCar"
function VirginiaRoadCar()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
