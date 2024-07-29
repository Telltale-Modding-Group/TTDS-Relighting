require("Shooting.lua")
local kScript = "FerryInterior"
local kScene = "adv_ferryInterior"
local OnLogicReady = function()
  if LogicGet("2FerryInterior - In Snack Bar") then
    Game_SetSceneDialog("env_ferryInterior_snackBar.dlog")
  end
end
function FerryInterior()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
