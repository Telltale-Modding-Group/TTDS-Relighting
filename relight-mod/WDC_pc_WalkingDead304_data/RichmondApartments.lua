local kScript = "RichmondApartments"
local kScene = "adv_richmondApartment"
function RichmondApartments()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
