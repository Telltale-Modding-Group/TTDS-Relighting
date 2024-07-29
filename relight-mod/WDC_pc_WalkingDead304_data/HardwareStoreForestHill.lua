local kScript = "HardwareStoreForestHill"
local kScene = "adv_hardwareStoreForestHill"
function HardwareStoreForestHill()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
