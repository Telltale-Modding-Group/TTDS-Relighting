local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOn104"
function PreviouslyOn()
  Mode(mode_Main)
  local id = Dialog_Play("cs_previouslyOn")
  DlgWait(id)
  UnloadAll()
  LoadScript("env_savannahStreets.lua")
end
SceneOpen(kScene, kScript)
