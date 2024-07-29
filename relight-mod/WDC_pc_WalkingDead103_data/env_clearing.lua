local kScript = "Clearing"
local kScene = "adv_trainTileClearing"
local mControllerDuckBreathing
function Clearing()
  Mode(mode_Main)
  Main_AllowMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetFightTextures(true)
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Clearing")
      DlgPreload("env_clearing.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function Clearing_StartDuckBreathing()
  if mControllerDuckBreathing then
    return
  end
  Print("Start Duck breathing")
  mControllerDuckBreathing = ChorePlay("adv_trainTileClearing_duckBreathingLoop")
end
function Clearing_StopDuckBreathing()
  if not mControllerDuckBreathing then
    return
  end
  Print("Stop Duck breathing")
  ControllerKill(mControllerDuckBreathing)
  mControllerDuckBreathing = nil
  Yield()
  AgentSetProperty("Duck", "Sound Emitter - File", "")
end
SceneOpen(kScene, kScript)
