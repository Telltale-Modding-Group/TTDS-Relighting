local kScript = "HardwareStore"
local kScene = "adv_hardwareStore301"
function HardwareStore()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
