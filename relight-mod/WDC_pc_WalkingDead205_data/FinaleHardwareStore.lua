local kScript = "FinaleHardwareStore"
local kScene = "adv_hardwareStore205"
local PreloadAssets = function()
end
function FinaleHardwareStore()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_nextTimeOn")
