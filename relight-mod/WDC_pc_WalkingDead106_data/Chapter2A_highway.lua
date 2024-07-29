local kScript = "Chapter2A"
local kScene = "adv_ruralHighwayTileCh2"
local mReticleNoiseController
function Chapter2A()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function Chapter2A_ReticleNoiseEnable(bEnable)
  if bEnable then
    if not mReticleNoiseController then
      mReticleNoiseController = ChorePlay("ui_reticle_noiseHoriz", 0)
      ControllerSetLooping(mReticleNoiseController, true)
    end
  elseif mReticleNoiseController then
    ControllerKill(mReticleNoiseController)
    mReticleNoiseController = nil
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_chaptercredits")
