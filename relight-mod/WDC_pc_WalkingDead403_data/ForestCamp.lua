local kScript = "ForestCamp"
local kScene = "adv_forestCamp"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("Debug ID") == 1 then
    AgentSetProperty("group_forestTile", "Group - Visible", false)
    AgentSetProperty("group_forestCamp", "Group - Visible", true)
    Game_SetSceneDialogNode("cs_zombieDistraction")
  end
end
function ForestCamp()
  DlgPreloadAll(Game_GetPlayerDialog(), false)
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
