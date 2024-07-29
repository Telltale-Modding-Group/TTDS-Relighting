local kScript = "FinaleOpenField"
local kScene = "adv_openField"
local PreloadAssets = function()
end
function FinaleOpenField()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_nextTimeOn")
