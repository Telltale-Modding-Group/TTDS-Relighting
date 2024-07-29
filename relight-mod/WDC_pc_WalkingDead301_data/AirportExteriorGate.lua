local kScript = "AirportExteriorGate"
local kScene = "adv_airportExteriorGate"
function AirportExteriorGate()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
