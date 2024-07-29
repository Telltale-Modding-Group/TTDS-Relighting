local kScript = "DairyMeatLocker"
local kScene = "adv_dairyMeatLocker"
local kOverlay = "fx_overlayEyesBlink"
function DairyMeatLocker()
  Mode(mode_Main)
  Main_AllowMovement(true)
  if SaveLoad_IsFromLoad() then
    return
  end
  if IsToolBuild() and Logic["3MeatLocker - DebugToChoice"] then
    SceneHide(kOverlay, true)
    Logic["3MeatLocker - LarryHadHeartAttack"] = true
    Dialog_Play("cs_KennyDecidesToKillLarry")
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Meat Locker")
      DlgPreload("env_dairyMeatLocker.dlog", "cs_enter", 0, 15, 0, false)
    end
    Checkpoint("cs_enter", "meatLocker_intro")
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd(kOverlay)
