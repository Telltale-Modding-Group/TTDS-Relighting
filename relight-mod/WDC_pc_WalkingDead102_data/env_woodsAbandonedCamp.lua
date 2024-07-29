local kScript = "WoodsAbandonedCamp"
local kScene = "adv_woodsAbandonedCamp"
function WoodsAbandonedCamp()
  Mode(mode_Main)
  Main_AllowMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide(Logic["DougCarley Saved"], false)
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Abandoned Camp")
      DlgPreload("env_forestAbandonedCamp.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  else
    if Platform_IsWiiU() then
      print("Dialog Preloading start2: Abandoned Camp")
      DlgPreload("env_forestAbandonedCamp.dlog", "logic_door", 0, 15, 0, false)
    end
    Dialog_Play("logic_door")
  end
end
SceneOpen(kScene, kScript)
