local kScript = "ForestBarn"
local kScene = "adv_forestBarn"
function ForestBarn()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
Game_SceneOpen(kScene, kScript)
SceneAdd("ui_fxOverlay")
