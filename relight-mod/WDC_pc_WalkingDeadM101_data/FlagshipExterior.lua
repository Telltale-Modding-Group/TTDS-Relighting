local kScript = "FlagshipExterior"
local kScene = "adv_boatTownApproach"
local OnLogicReady = function()
  Game_SetSceneDialog("env_flagshipExterior.dlog")
end
function FlagshipExterior()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
