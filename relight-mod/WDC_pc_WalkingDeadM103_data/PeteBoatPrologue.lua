local kScript = "PeteBoatPrologue"
local kScene = "adv_johnsHouseGarage"
local Scene_Init = function()
  if LogicGet("1JohnsHouseInteriorMain - Flashback Over") then
    Game_SetSceneDialog("env_johnsHouseGarage_randall.dlog")
  else
    Game_SetSceneDialog("env_peteBoat_103prologue")
  end
end
function PeteBoatPrologue()
  Game_NewScene(kScene, kScript, Scene_Init)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
