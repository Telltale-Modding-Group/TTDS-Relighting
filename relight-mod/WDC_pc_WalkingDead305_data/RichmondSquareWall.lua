local kScript = "RichmondSquareWall"
local kScene = "adv_richmondSquareWall"
function RichmondSquareWall()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_creditsOpening")
