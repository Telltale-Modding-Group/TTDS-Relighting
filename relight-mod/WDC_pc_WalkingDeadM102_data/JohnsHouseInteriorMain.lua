local kScript = "JohnsHouseInteriorMain"
local kScene = "adv_johnsHouseInteriorMain"
local OnLogicReady = function()
  if LogicGet("2JohnHouseInterior - bLeftApartment?") then
    Game_SetSceneDialog("env_johnsHouseInteriorMain_paige.dlog")
  elseif LogicGet("2JohnHouseInterior - bEnteredApartment?") then
    Game_SetSceneDialog("env_johnsHouseInteriorMain_flashback.dlog")
  else
    SceneAdd("ui_struggle.scene")
    Game_SetSceneDialog("env_johnsHouseInteriorMain_intro.dlog")
  end
  WaitForNextFrame()
end
function JohnsHouseInteriorMain()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
