local kScript = "hershelFarmExterior"
local kScene = "adv_hershelFarmExteriorNight.scene"
function hershelFarmExterior()
  Mode(mode_Main)
  Mode_Push(mode_NoMovement)
  Mode_Push(mode_NoInteraction)
  if not SaveLoad_IsFromLoad() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start")
      DlgPreload("env_hershelsfarm.dlog", "cs_arrivalAtHershels", 0, 15, 0, false)
    end
    DlgRun("env_hershelsfarm.dlog", "cs_arrivalAtHershels")
  end
end
if not IsRegistered() and not Platform_IsXfinity() then
  AgentFind("logic_game").mProps.bDemoMode = true
  local func = function()
    LoadScript("ui_demoUpsell.lua")
  end
  ThreadStart(func)
else
  SceneOpen(kScene, kScript)
end
