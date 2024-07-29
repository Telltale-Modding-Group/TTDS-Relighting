local kScript = "RichmondGateNight"
local kScene = "adv_richmondGateNight"
function RichmondGateNight()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
