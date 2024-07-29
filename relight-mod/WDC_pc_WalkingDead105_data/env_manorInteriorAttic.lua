local kScript = "ManorInteriorAttic"
local kScene = "adv_manorInteriorAttic105"
local kOverlay = "fx_overlayEyesBlink"
function ManorInteriorAttic()
  Mode(mode_Main)
  Mode_Push(mode_NoMovement)
  AgentHide(SceneGetSceneAgent(kOverlay), true)
  SceneHide(kOverlay, true)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState(true)
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
SceneAdd(kOverlay)
