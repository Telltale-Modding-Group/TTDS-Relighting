local kScript = "AirportExteriorGate"
local kScene = "adv_airportExteriorGate"
function AirportExteriorGate()
  local kRenderQuality_Mid = 6
  local kFogFallofKey = "Env - Fog Height Falloff"
  local quality = RenderGetCurQualityLevel()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
  local agent_env = AgentFind("module_environment")
  if agent_env and kRenderQuality_Mid >= quality then
    AgentSetProperty(agent_env, kFogFallofKey, 20)
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_creditsOpening")
SceneAdd("ui_titleCard.scene")
