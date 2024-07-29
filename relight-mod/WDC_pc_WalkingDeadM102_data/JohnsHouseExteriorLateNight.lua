local kScript = "JohnsHouseExteriorLateNight"
local kScene = "adv_johnsHouseExteriorLateNight"
local OnLogicReady = function()
  if LogicGet("2JohnsHouseInteriorMain -  Randall") then
    Game_SetSceneDialog("env_johnsHouseExteriorLawn_randall.dlog")
    Print(" _Randall")
  elseif LogicGet("3JohnsHouseExteriorLawn -  Garage Fight") then
    Game_SetSceneDialog("env_johnsHouseExteriorLawn_garageFight.dlog")
    Print(" _Garage Fight")
  elseif LogicGet("2JohnsHouseExteriorLawn - Intruder") then
    Game_SetSceneDialog("env_johnsHouseExteriorLawn_intruders.dlog")
    Print(" _Intruder")
  else
    Game_SetSceneDialog("env_johnsHouseExterior_wall.dlog")
    Print(" _Wall")
  end
  WaitForNextFrame()
end
function JohnsHouseExteriorLateNight()
  Game_NewScene(kScene, kScript)
  SceneAdd("ui_struggle.scene")
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
