local kScript = "ForestShack"
local kScene = "adv_forestShack"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("2 - Entered ForestTile") then
    Game_SetSceneDialogNode("cs_shackAttack")
  end
end
function ForestShack()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
