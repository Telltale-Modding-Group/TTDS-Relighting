local kScript = "ShorelineApproachFerry"
local kScene = "adv_shorelineApproachFerry"
local OnLogicReady = function()
  Game_SetSceneDialog("env_shorelineApproachFerry.dlog")
end
function ShorelineApproachFerry()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
