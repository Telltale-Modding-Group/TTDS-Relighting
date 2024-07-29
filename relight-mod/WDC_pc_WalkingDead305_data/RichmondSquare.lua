local kScript = "RichmondSquare"
local kScene = "adv_richmondSquare305"
function RichmondSquare()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
