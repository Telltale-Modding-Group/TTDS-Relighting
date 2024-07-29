local kScript = "ClementineHouseExterior_Night"
local kScene = "adv_clementineHouseExterior_Night"
local kDialog = "env_clementineYard.dlog"
function ClementineHouseExterior_Night()
  if Platform_IsWiiU() then
    print("Dialog Preloading start")
    DlgPreload(kDialog, "Enter", 0, 15, 0, false)
  end
  Mode(mode_Main)
  Logic["ClemHouseInt - Test Fight Prototype"] = true
  if not SaveLoad_IsFromLoad() then
    Dialog_Play("Enter", "Lee", nil, kDialog)
  elseif Logic["ClemHouseExt - Entered From House"] and not Logic["ClemHouseInt - ChoseLookForHelp"] then
    ClemHouseExt_RestrictWalkbox()
  end
end
function ClemHouseExt_RestrictWalkbox()
  for i = 40, 77 do
    WalkBoxesDisableTri(kScene, i)
  end
end
local isTrial = Platform_IsXfinity() and not GetPreferences().DLC.WalkingDead102.Purchased
if isTrial then
  AgentFind("logic_game").mProps.bDemoMode = true
  local func = function()
    LoadScript("ui_demoUpsell.lua")
  end
  ThreadStart(func)
else
  SceneOpen(kScene, kScript)
end
