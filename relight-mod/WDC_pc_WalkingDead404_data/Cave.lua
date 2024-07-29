local kScript = "Cave"
local kScene = "adv_cave"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_theOtherSide")
    if not LogicGet("Episode 403 - Killed Lilly") then
      AgentSetProperty("James", "Current State", "zombie")
    end
  end
end
function Cave()
  Episode_SetClemState()
  if LogicGet("Episode 403 - Killed Lilly") then
    WalkBoxesDisableAreaAroundAgent("adv_cave", "dummy_walkBoxJames")
  end
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
