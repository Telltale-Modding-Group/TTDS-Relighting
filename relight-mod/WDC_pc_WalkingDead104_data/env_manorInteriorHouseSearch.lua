local kScript = "ManorInteriorHouseSearch"
local kScene = "adv_manorInterior_houseSearch"
function ManorInteriorHouseSearch()
  Mode(mode_Main)
  DoManorVisibilityManagement()
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
