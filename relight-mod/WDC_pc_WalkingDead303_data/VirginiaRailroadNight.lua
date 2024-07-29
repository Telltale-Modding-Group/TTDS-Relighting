local kScript = "VirginiaRailroadNight"
local kScene = "adv_virginiaRailroadNight"
local OnLogicReady = function()
  if not Game_GetLoaded() and LogicGet("2 - Tripp Mess Choice") == 1 then
    if not LogicGet("Episode 302 - Shot Conrad") then
      AgentHide("Clementine", false)
      AgentHide("Conrad", false)
    end
    Game_SetSceneDialogNode("cs_zombiesAround")
  end
end
function VirginiaRailroadNight()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
SceneOpen(kScene, kScript)
