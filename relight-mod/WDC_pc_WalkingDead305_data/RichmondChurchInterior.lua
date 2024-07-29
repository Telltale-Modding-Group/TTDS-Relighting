local kScript = "RichmondChurchInterior"
local kScene = "adv_richmondChurchInterior"
function RichmondChurchInterior()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_creditsOpening")
