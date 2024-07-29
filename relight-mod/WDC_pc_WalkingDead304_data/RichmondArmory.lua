local kScript = "RichmondArmory"
local kScene = "adv_richmondArmoryInterior"
function RichmondArmory()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
