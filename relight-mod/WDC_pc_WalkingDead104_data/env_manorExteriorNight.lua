local kScript = "ManorExteriorNight"
local kScene = "adv_manorExterior_night"
function ManorExteriorNight()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
