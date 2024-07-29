local kScript = "RichmondStreet"
local kScene = "adv_richmondStreet305"
function RichmondStreet()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
