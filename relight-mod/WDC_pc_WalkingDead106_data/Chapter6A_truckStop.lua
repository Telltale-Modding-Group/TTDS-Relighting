local kScript = "Chapter6A"
local kScene = "adv_truckStopCh6"
function Chapter6A()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if not Logic["2 - Left Eddie"] then
    AgentHide("obj_carEddieLowPoly", false)
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_chaptercredits")
