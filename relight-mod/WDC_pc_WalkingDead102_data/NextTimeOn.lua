require("ui_stats.lua")
local kScript = "NextTimeOn"
local kScene = "adv_nextTimeOn102"
local OnCreditsComplete = function()
  SubProject_Switch("MenuSeason1", "MainMenuNoStartPane")
end
function NextTimeOn()
  Mode(mode_Main)
  Persistent_Store()
  DataBackupManager_SubmitGameLogic(true)
  if Platform_IsWiiU() then
    DlgPreload("nextTimeOn_episode3.dlog", "cs_nextTimeOn", 0, 15, 0, false)
  end
  DlgWait(Dialog_Play("cs_nextTimeOn"))
  WDAchievements_Unlock("achievement_02")
  Callback_OnCreditsComplete:Add(OnCreditsComplete)
  SceneAdd("ui_stats", "UI_Stats_Open")
end
SceneOpen(kScene, kScript)
SceneAdd("ui_nexttime")
