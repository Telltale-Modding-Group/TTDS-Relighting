require("AI_PlayerProjectile.lua")
local kScript = "CliffBridge"
local kScene = "adv_cliffBridge"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  local debugID = LogicGet("Debug ID")
  if debugID == 0 then
    return
  end
  if debugID < 3 then
    if not LogicGet("Episode 402 - Saved Violet") then
      AgentHide("Louis", false)
    else
      AgentHide("Violet", false)
    end
  end
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_theBridge")
  elseif debugID == 2 then
    Game_SetSceneDialogNode("cs_scatter")
    AgentHide("Minerva", false)
  else
    Game_SetSceneDialogNode("cs_separated")
  end
end
function CliffBridge()
  Episode_SetClemState()
  if not Game_GetLoaded() and LogicGet("Episode 402 - Saved Violet") then
    AgentSetState("Minerva", "shoulderRWound")
  end
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
SceneAdd("ui_notification")
