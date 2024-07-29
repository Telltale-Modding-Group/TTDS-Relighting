local kScript = "ManorInteriorClementineSearch"
local kScene = "adv_manorInterior_clementineSearch"
function ManorInteriorClementineSearch()
  Mode(mode_Main)
  DoManorVisibilityManagement()
  WalkBoxesDisableAreaAroundAgent("adv_manorInterior_secondFloor.wbox", "obj_manorInteriorDoorStudy")
  if Logic["2ClemSearch - manorInteriorDoorStudy Open"] then
    WalkBoxesEnableAreaAroundAgent("adv_manorInterior_secondFloor.wbox", "obj_manorInteriorDoorStudy")
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function ManorInteriorClemSearch_FinishDownStairs()
  Dialog_Play("cs_findKenny")
end
SceneOpen(kScene, kScript)
