local kScript = "RiverStreet"
local kScene = "adv_savannahRiverStreet105"
function RiverStreet()
  Mode(mode_Main)
  Mode_Push(mode_NoMovement)
  Navigate_Enable(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState(true, false, false, "A")
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
