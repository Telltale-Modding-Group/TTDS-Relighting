local kScript = "FlagshipInteriorEscape"
local kScene = "adv_flagshipInterior"
local OnLogicReady = function()
  Game_SetSceneDialog("env_flagshipInterior_escape.dlog")
  if LogicGet("3FlagshipInterior - Debug Jump To Greg Shot") then
    Game_SetSceneDialogNode("cs_greg_shot")
  end
  if LogicGet("3FlagshipInterior - Debug Jump To Kill Greg") then
    Game_SetSceneDialogNode("cs_greg_attacks")
  end
end
function FlagshipInteriorEscape()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
