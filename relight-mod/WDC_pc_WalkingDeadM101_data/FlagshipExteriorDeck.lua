local kScript = "FlagshipExteriorDeck"
local kScene = "adv_flagshipExteriorDeck"
local OnLogicReady = function()
  Game_SetSceneDialog("env_flagshipExteriorDeck_norma.dlog")
end
function FlagshipExteriorDeck()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
