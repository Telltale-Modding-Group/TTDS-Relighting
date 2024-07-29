require("ui_stats.lua")
local kScript = "Chapter6B"
local kScene = "adv_groupCampCh6"
local OnCreditsComplete = function()
  SubProject_Switch("MenuSeason1", "MainMenuNoStartPane")
end
function Chapter6B()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic["2 - Left Eddie"] then
    AgentHide("obj_carEddie", false)
  end
  if not Logic["5 - Killed Stephanie"] then
    AgentHide("obj_rvCoach106", false)
  end
  if Platform_IsIOS() then
    AgentHide("obj_groupCampTrashB", true)
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function Chapter6B_EndGame()
  Persistent_Store()
  DataBackupManager_SubmitGameLogic(true)
  WDAchievements_Unlock("achievement_06")
  Callback_OnCreditsComplete:Add(OnCreditsComplete)
  SceneAdd("ui_credits", "Chapter6B_OnCreditsOpen")
  SceneAdd("ui_stats", "UI_Stats_Open")
end
function Chapter6B_OnCreditsOpen()
  local kTextureProp = "ui_background_brownie_1920x1080 - Texture"
  if Logic["1 - Shot Dan"] then
    AgentSetProperty("ui_credits106backgroundPhoto6", kTextureProp, "ui_credits106backgroundPhoto_ch1Dan.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto6", kTextureProp, "ui_credits106backgroundPhoto_ch1Justin.d3dtx")
  end
  if Logic["2 - Left Eddie"] then
    AgentSetProperty("ui_credits106backgroundPhoto7", kTextureProp, "ui_credits106backgroundPhoto_ch2Eddie.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto7", kTextureProp, "ui_credits106backgroundPhoto_ch2Nate.d3dtx")
  end
  if Logic["3 - Killed Zombie"] then
    AgentSetProperty("ui_credits106backgroundPhoto4", kTextureProp, "ui_credits106backgroundPhoto_ch3Bennet.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto4", kTextureProp, "ui_credits106backgroundPhoto_ch4Bennet.d3dtx")
  end
  if Logic["4 - Leland Stayed"] then
    AgentSetProperty("ui_credits106backgroundPhoto1", kTextureProp, "ui_credits106backgroundPhoto_ch4Leland.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto1", kTextureProp, "ui_credits106backgroundPhoto_ch4Dee.d3dtx")
  end
  if Logic["5 - Killed Stephanie"] then
    AgentSetProperty("ui_credits106backgroundPhoto3", kTextureProp, "ui_credits106backgroundPhoto_ch5Stay.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto3", kTextureProp, "ui_credits106backgroundPhoto_ch5Go.d3dtx")
  end
end
SceneOpen(kScene, kScript)
