local kScript = "WoodsAbandonedCampDay"
local kScene = "adv_woodsAbandonedCampDay"
function WoodsAbandonedCampDay()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide(Logic["DougCarley Saved"], false)
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Woods to Dairy / forestAbandonedCampDay")
      DlgPreload("env_forestAbandonedCampDay.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
