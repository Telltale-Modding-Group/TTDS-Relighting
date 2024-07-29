local kScript = "Chapter3A"
local kScene = "adv_roadTile106Ch3"
function Chapter3A()
  Mode(mode_Main)
  Game_EnableMovement(false)
  Navigate_Enable(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide(Logic["DougCarley Saved"], false)
  if Platform_IsIOS() then
    AgentHide("obj_roadTileA106Ch5", true)
    AgentHide("obj_roadTileC106Ch3", true)
  end
  if Logic["3 - Hid from Truck"] then
    Dialog_Play("logic_truckAppears")
    Dialog_Play("cs_russellGetsInTruck")
    return
  end
  if Logic["3 - Nate Drove Away"] then
    Dialog_Play("logic_truckAppears")
    Dialog_Play("cs_nateDrivesAway")
    return
  end
  if AllowIntroCutscenes() then
    ChoredMovement_AllowOnlyAbsoluteForwardBack(true)
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_chaptercredits")
