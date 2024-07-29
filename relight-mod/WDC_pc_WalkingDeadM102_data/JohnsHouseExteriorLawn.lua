local kScript = "JohnsHouseExteriorLawn"
local kScene = "adv_johnsHouseExteriorLateNight"
function JohnsHouseExteriorLawn()
  Game_NewScene(kScene, kScript)
  if LogicGet("2JohnsHouseInteriorMain -  Randall") then
    Game_SetSceneDialog("env_johnsHouseExteriorLawn_randall.dlog")
  elseif LogicGet("3JohnsHouseExteriorLawn -  Garage Fight") then
    Game_SetSceneDialog("env_johnsHouseExteriorLawn_garageFight.dlog")
  elseif LogicGet("2JohnsHouseExteriorLawn - Intruder") then
    Game_SetSceneDialog("env_johnsHouseExteriorLawn_intruders.dlog")
  end
  Yield()
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
