local kScript = "CivilWarMemorialCenterMorning"
local kScene = "adv_civilWarMemorialCenterMorning"
function CivilWarMemorialCenterMorning()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  local state
  if LogicGet("Episode 203 - Got Knocked Out") or LogicGet("Episode 203 - Restrained Sarita") then
    state = "dying"
  else
    state = "dyingCut"
  end
  AgentSetProperty("Sarita", "Current State", state)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingCredits")
