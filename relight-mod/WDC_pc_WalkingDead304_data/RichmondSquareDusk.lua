local kScript = "RichmondSquareDusk"
local kScene = "adv_richmondSquareDusk"
function RichmondSquareDusk()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_creditsOpening")
SceneAdd("ui_titleCard.scene")
