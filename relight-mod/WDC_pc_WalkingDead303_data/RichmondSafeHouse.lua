local kScript = "RichmondSafeHouse"
local kScene = "adv_richmondSafeHouse"
function RichmondSafeHouse()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
