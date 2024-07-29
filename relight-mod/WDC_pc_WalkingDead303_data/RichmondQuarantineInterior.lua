local kScript = "RichmondQuarantineInterior"
local kScene = "adv_richmondQuarantineInterior"
function RichmondQuarantineInterior()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
