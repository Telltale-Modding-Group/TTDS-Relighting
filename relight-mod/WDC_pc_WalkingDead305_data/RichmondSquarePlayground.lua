local kScript = "RichmondSquarePlayground"
local kScene = "adv_richmondSquarePlayground"
function RichmondSquarePlayground()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
