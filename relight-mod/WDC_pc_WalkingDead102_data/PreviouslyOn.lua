local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOn102"
function PreviouslyOn()
  if Platform_IsWiiU() then
    DlgPreload("previouslyOn_episode1.dlog", "cs_previouslyOn", 0, 15, 0, false)
  end
  Mode(mode_Main)
  local id = Dialog_Play("cs_previouslyOn")
  DlgWait(id)
  LoadScript("env_woodsBearTrap.lua")
end
SceneOpen(kScene, kScript)
