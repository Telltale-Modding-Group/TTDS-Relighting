local kScript = "RichmondGate"
local kScene = "adv_richmondGate305"
function RichmondGate()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
