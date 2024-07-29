local kScript = "RiverShorelineNight"
local kScene = "adv_riverShorelineNight"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_separateWays")
  end
end
function RiverShorelineNight()
  Episode_SetClemState()
  if not Game_GetLoaded() and LogicGet("Episode 402 - Saved Violet") then
    AgentSetState("Minerva", "shoulderRWound")
  end
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
