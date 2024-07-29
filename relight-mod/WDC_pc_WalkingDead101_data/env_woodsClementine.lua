require("wd_tutorial.lua")
local kScript = "woodsClementine"
local kScene = "adv_woodsClementine.scene"
local kDialog = "env_forest.dlog"
function woodsClementine()
  Mode(mode_Main)
  if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - WoodsStartFromCop") then
    Yield()
    Logic["Woods - Escaped Backseat"] = true
    AgentSetProperty("trigger_seeKeys", "Trigger Enabled", false)
    AgentHide("obj_shellShotgunWD", false)
    if not SaveLoad_IsFromLoad() then
      Dialog_Play("cs_copIsZombie")
    end
    return
  end
  SceneAdd("fx_overlayEyesBlink.scene")
  if Platform_IsWiiU() then
    print("Dialog Preloading start")
    DlgPreload(kDialog, "cs_wakeUp", 0, 15, 0, false)
  end
  if not SaveLoad_IsFromLoad() then
    Yield()
    local prefs = GetPreferences()
    if not prefs["Skip Intro Cutscenes"] then
      Dialog_Play("cs_wakeUp", "Lee", nil, kDialog)
    end
  end
end
function BackSeat()
end
function Woods_nearCarTriggerEnter(trigger)
  Logic["Woods - Lee Near Cop Car"] = true
end
function Woods_nearCarTriggerExit(trigger)
  Logic["Woods - Lee Near Cop Car"] = false
end
function Woods_BackSeatSlideFinished()
  Mode(mode_thirdperson)
  Dialog_Play("Cop Car Window Passenger Side", "Lee", nil, kDialog)
end
function Woods_BackingAwayFromCopDone()
  Dialog_Play("backingAwayFromCopFinished", "Lee", nil, kDialog)
end
function Woods_PeekAwayFromCopCB()
  Dialog_Play("disable_keys", "Lee", nil, kDialog)
end
function Woods_PreLoadCopShoot()
end
SceneOpen(kScene, kScript)
