local kScript = "DairyExteriorDay"
local kScene = "adv_dairyExteriorDay"
function DairyExteriorDay()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Exterior Day")
      DlgPreload("env_dairyExterior_AtTheDairy.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
