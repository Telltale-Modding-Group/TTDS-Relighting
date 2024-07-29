local kScript = "RichmondApartmentsRoof"
local kScene = "adv_richmondApartmentsRoof"
function RichmondApartmentsRoof()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
