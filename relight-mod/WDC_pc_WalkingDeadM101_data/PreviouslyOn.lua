local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOn206"
local PreloadAssets = function()
end
function PreviouslyOn()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  S1_LoadIntoLogic()
  PersistentLogic_SetGameLogic()
  PreloadAssets()
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
