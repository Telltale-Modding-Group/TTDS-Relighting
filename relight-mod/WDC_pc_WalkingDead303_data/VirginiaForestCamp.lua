local kScript = "VirginiaForestCamp"
local kScene = "adv_virginiaForestCamp"
function VirginiaForestCamp()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
