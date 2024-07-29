local kScript = "Chapter5A"
local kScene = "adv_truckStopInteriorCh5"
function Chapter5A()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic["4 - Leland Stayed"] then
    AgentHide("obj_bagDuffel", false)
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_chaptercredits")
