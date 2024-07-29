local kScript = "RichmondFactoryExterior"
local kScene = "adv_richmondFactoryExterior"
function RichmondFactoryExterior()
  Game_NewScene(kScene, kScript)
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  Game_StartScene()
end
function RichmondFactoryExterior_SetJesusState(state)
  state = LogicGet("3 - Jesus State") .. state
  LogicSet("3 - Jesus State", state)
  if state == "HelpMeJesus" then
    AgentSetSelectable("Jesus", true)
  end
end
SceneOpen(kScene, kScript)
