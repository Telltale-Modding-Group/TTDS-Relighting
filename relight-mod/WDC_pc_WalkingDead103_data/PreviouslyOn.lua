local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOn103"
function PreviouslyOn()
  Mode(mode_Main)
  if Platform_IsWiiU() then
    DlgPreload("previouslyOn_episode2.dlog", "cs_previouslyOn", 0, 15, 0, false)
  end
  local id = Dialog_Play("cs_previouslyOn")
  DlgWait(id)
  UnloadAll()
  LoadScript("env_drugstoreExterior.lua")
end
SceneOpen(kScene, kScript)
SceneAdd("fx_overlayScreenDigitalCam")
