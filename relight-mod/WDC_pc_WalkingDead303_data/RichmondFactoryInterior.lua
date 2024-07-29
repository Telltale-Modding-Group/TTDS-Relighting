local kScript = "RichmondFactoryInterior"
local kScene = "adv_richmondFactoryInterior"
local OnLogicReady = function()
  if not Game_GetLoaded() and LogicGet("3 - Let David In") then
    AgentHide("David", false)
    if LogicGet("2 - Gave Conrad Gun") then
      AgentHide("Conrad", false)
    end
    Game_SetSceneDialogNode("cs_badguys")
  end
end
function RichmondFactoryInterior()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
SceneOpen(kScene, kScript)
