local kScript = "MotorInnFinale"
local kScene = "adv_motorInn102Finale"
function MotorInnFinale()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  local dougley = Logic["DougCarley Saved"]
  AgentHide(dougley, false)
  if dougley ~= "doug" then
    AgentHide("obj_securityWarningSystemMotorInn", true)
    AgentHide("obj_securityWarningSystemBellA", true)
    AgentHide("obj_securityWarningSystemBellB", true)
    AgentHide("obj_securityWarningSystemBellC", true)
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: MotorInn Finale")
      DlgPreload("env_motorInn_finale.dlog", "cs_joleneVideo", 0, 15, 0, false)
    end
    Dialog_Play("cs_joleneVideo")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("fx_overlayScreenDigitalCam")
