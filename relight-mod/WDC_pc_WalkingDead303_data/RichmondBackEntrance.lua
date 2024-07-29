local kScript = "RichmondBackEntrance"
local kScene = "adv_richmondBackEntrance"
function RichmondBackEntrance()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
