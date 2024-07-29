local kScript = "JohnsHouseInteriorMain103"
local kScene = "adv_johnsHouseInteriorMain103"
local OnLogicReady = function()
  if LogicGet("1JohnsHouseInteriorMain - Burial") then
    Game_SetSceneDialog("env_johnsHouseInteriorMain_burial.dlog")
  elseif LogicGet("1JohnsHouseInteriorMain - Funeral") then
    Game_SetSceneDialog("env_johnsHouseInteriorMain_funeral.dlog")
  else
    Game_SetSceneDialog("env_johnsHouseInteriorMain_freewalk.dlog")
  end
  WaitForNextFrame()
end
function JohnsHouseInteriorMain103()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
