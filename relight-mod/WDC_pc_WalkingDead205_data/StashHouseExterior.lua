local kScript = "StashHouseExterior"
local kScene = "adv_stashHouseExterior"
local PreloadAssets = function()
end
function StashHouseExterior()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  Game_StartScene()
end
SceneOpen(kScene, kScript)
