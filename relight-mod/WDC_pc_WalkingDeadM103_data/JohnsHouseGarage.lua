local kScript = "JohnsHouseGarage"
local kScene = "adv_johnsHouseGarage"
local SceneInit = function()
  LogicSet("1JohnsHouseInteriorMain - Flashback Over", true)
  Game_SetSceneDialog("env_johnsHouseGarage_randall.dlog")
end
function JohnsHouseGarage()
  Game_NewScene(kScene, kScript, SceneInit)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
