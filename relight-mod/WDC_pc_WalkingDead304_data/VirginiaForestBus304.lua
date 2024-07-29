local kScript = "VirginiaForestBus304"
local kScene = "adv_virginiaForestBus304"
function VirginiaForestBus304()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_creditsOpening")
