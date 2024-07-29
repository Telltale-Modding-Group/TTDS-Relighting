local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOn105"
function PreviouslyOn()
  Mode(mode_Main)
  if Platform_IsIPhone() then
    AgentFind("obj_previouslyOn105_lightBeamCancerEpilogue").mProps["D3D Mesh"] = ""
  end
  local id = Dialog_Play("cs_previouslyOn")
  DlgWait(id)
  UnloadAll()
  LoadScript("env_morgue.lua")
end
SceneOpen(kScene, kScript)
