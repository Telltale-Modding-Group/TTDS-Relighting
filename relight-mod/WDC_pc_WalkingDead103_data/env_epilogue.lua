local kScript = "Epilogue"
local kScene = "adv_trainTileEpilogue"
function Epilogue()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetFightTextures(false)
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Epilogue")
      DlgPreload("env_trainEpilogue.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
