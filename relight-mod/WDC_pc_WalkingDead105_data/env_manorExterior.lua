local kScript = "ManorExterior"
local kScene = "adv_manorExterior105"
function ManorExterior()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState()
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
