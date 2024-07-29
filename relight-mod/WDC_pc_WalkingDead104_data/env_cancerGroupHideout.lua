local kScript = "CancerGroupHideout"
local kScene = "adv_cancerGroupHideout"
function CancerGroupHideout()
  Mode(mode_Main)
  Logic["Inventory - Ice Axe"] = 1
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
