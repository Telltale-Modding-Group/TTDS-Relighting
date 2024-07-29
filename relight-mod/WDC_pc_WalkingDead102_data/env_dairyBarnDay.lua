local kScript = "DairyBarnDay"
local kScene = "adv_dairyBarnInteriorDay"
function DairyBarnDay()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Barn Day / dairyBarnInterior")
      DlgPreload("env_dairyBarnInterior.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function DairyBarnDay_DisableKennyWalkBoxes()
  for i = 35, 41 do
    WalkBoxesDisableTri(kScene, i, true)
  end
end
SceneOpen(kScene, kScript)
