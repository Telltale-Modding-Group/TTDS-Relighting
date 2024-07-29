local kScript = "CrawfordSchoolNursesOffice"
local kScene = "adv_crawfordSchoolNursesOffice"
function CrawfordSchoolNursesOffice_PreLoadSecondVideo()
end
function CrawfordSchoolNursesOffice()
  if Platform_IsIOS() then
    AgentSetProperty("cam_closeUp_tray", "Pan Cam - Speed", 0.005)
    AgentSetProperty("cam_closeUp_tray", "Reticle - Sticks to World", false)
  end
  Mode(mode_Main)
  SceneHide("fx_overlayScreenDigitalCam.scene", true)
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide("Christa", Logic["3Medicine - Finished"])
  AgentHide("Vernon", Logic["3Medicine - Finished"])
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("fx_overlayScreenDigitalCam")
