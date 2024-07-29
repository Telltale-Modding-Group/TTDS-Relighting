local kScript = "RichmondTunnel"
local kScene = "adv_richmondTunnel"
function RichmondTunnel()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
