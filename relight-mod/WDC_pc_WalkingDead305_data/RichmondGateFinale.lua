local kScript = "RichmondGateFinale"
local kScene = "adv_richmondGateFinale"
function RichmondGateFinale()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
