require("Rain.lua")
local kScript = "Chapter4A"
local kScene = "adv_forestWaterTowerCh4"
function Chapter4A()
  Mode(mode_Main)
  Game_EnableMovement(false)
  Rain("fx_rainSphereWD")
  if SaveLoad_IsFromLoad() then
    return
  end
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_nav_runLikeHell", "Pan Cam - Keep Agent On Screen", true)
  end
  if Logic["4 - Done Arguing"] then
    Dialog_Play("cs_flashlights")
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_chaptercredits")
