local kScript = "JohnsHouseInteriorUpstairs_Daughters"
local kScene = "adv_johnsHouseInteriorUpstairsFire103"
local SceneInit = function()
  if LogicGet("3JohnsHouseUpstairsFire - Begun Saving Kids") then
    Game_SetSceneDialog("env_johnsHouseInteriorUpstairs_saveKids.dlog")
  else
    Game_SetSceneDialog("env_johnsHouseInteriorUpstairs_daughters.dlog")
  end
end
function JohnsHouseInteriorUpstairs_Daughters()
  Game_NewScene(kScene, kScript, SceneInit)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
