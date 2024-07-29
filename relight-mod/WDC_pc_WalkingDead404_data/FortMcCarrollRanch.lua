local kScript = "FortMcCarrolRanch"
local kScene = "adv_fortMcCarrolRanch"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_carTrouble")
  end
end
function FortMcCarrolRanch()
  if Game_GetLoaded() then
    return
  end
  AgentSetState("Clementine", "mccarroll")
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
function FortMcCarrolRanch_ShutTheFuckUpLloyd(stringIDs)
  while LogicGet("2 - Lloyd Speaking") do
    WaitForNextFrame()
  end
  for _, stringID in ipairs(stringIDs) do
    Dialog_StopStringID(stringID)
  end
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
