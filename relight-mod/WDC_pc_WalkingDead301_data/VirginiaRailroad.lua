local kScript = "VirginiaRailroad"
local kScene = "adv_virginiaRailroad"
function VirginiaRailroad()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
