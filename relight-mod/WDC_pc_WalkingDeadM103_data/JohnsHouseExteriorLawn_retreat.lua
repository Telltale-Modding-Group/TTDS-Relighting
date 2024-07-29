local kScript = "JohnsHouseExteriorLawn_Retreat"
local kScene = "adv_johnsHouseExteriorLawn103"
local SceneInit = function()
  Game_SetSceneDialog("env_johnsHouseExterior_retreat.dlog")
end
function JohnsHouseExteriorLawn_Retreat()
  Game_NewScene(kScene, kScript, SceneInit)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
