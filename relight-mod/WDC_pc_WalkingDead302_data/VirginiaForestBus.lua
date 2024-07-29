local kScript = "VirginiaForestBus"
local kScene = "adv_virginiaForestBus"
function VirginiaForestBus()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
