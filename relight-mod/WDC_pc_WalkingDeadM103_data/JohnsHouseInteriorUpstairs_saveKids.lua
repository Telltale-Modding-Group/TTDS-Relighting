local kScript = "JohnsHouseInteriorUpstairs_SaveKids"
local kScene = "adv_johnsHouseInteriorUpstairsFire103"
local OnLogicReady = function()
  Game_SetSceneDialog("env_johnsHouseInteriorUpstairs_saveKids.dlog")
end
function JohnsHouseInteriorUpstairs_SaveKids()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
Callback_OnLogicReady:Add(OnLogicReady)
