require("ui_stats.lua")
local kScript = "NextTimeOn"
local kScene = "adv_nextTimeOn101"
local OnCreditsComplete = function()
  SubProject_Switch("MenuSeason1", "MainMenuNoStartPane")
end
function NextTimeOn()
  Persistent_Store()
  DataBackupManager_SubmitGameLogic(true)
  Mode(mode_Main)
  if Logic["MotorInn - Gave Girl The Gun"] then
    AgentDetach("adv_nextTimeOn101_motorInnMeshesBalconyFallen")
  else
    AgentDetach("adv_nextTimeOn101_motorInnMeshesBalconyFull")
  end
  if Platform_IsWiiU() then
    DlgPreload("nextTimeOn_Episode2.dlog", "cs_nextTimeOn", 0, 15, 0, false)
  end
  local id = Dialog_Play("cs_nextTimeOn")
  DlgWait(id)
  WDAchievements_Unlock("achievement_01")
  Callback_OnCreditsComplete:Add(OnCreditsComplete)
  SceneAdd("ui_stats.scene", "UI_Stats_Open")
end
SceneOpen(kScene, kScript)
SceneAdd("ui_nexttime")
