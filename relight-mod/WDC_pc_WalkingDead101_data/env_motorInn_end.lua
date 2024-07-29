local kScript = "motorInn_End"
local kScene = "adv_motorInn_end.scene"
local kDialog = "env_motorInnEnd.dlog"
function motorInn_End()
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_motorInnEnd_carToTruck", "Pan Cam - Keep Agent On Screen", true)
  end
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  local prefs = GetPreferences()
  if not prefs["Skip Intro Cutscenes"] then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1")
      DlgPreload(kDialog, "cs_IntroEndEpisode", 0, 15, 0, false)
    end
    Dialog_Play("cs_IntroEndEpisode", "Lee", nil, kDialog)
  end
  if Logic["Drugstore - CarleyLives"] == true then
    AgentHide("Doug", true)
  else
    AgentHide("Carley", true)
  end
end
function MotorInnEnd_TriggerLarryConfrontation(trigger)
  trigger.mProps["Trigger Enabled"] = false
  Dialog_Play("cs_larryConfrontation", "Lee", nil, kDialog)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_tobecontinued")
