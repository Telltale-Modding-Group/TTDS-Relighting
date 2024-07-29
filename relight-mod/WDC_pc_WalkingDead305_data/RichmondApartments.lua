local kScript = "RichmondApartments"
local kScene = "adv_richmondApartments"
function RichmondApartments()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_creditsOpening")
