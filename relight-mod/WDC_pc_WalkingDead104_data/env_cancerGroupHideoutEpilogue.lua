require("ui_stats.lua")
local kScript = "CancerGroupHideoutEpilogue"
local kScene = "adv_cancerGroupHideoutEpilogue"
local OnCreditsComplete = function()
  SubProject_Switch("MenuSeason1", "MainMenuNoStartPane")
end
local SetPartyCompositionDatum = function()
  Print("SetPartyCompositionDatum called")
  local bWithBen = ChoiceTracker_FindEntry("with_ben - true") ~= nil
  Print("bWithBen: " .. tostring(bWithBen))
  local bWithKenny = ChoiceTracker_FindEntry("with_kenny - true") ~= nil
  Print("bWithKenny: " .. tostring(bWithKenny))
  local bWithChristaAndOmid = ChoiceTracker_FindEntry("with_christa_and_omid - true") ~= nil
  Print("bWithChristaAndOmid: " .. tostring(bWithChristaAndOmid))
  local withBen = bWithBen and "_ben" or ""
  local withKenny = bWithKenny and "_kenny" or ""
  local withChristaAndOmid = bWithChristaAndOmid and "_christa_omid" or ""
  local key = "party_lee" .. withBen .. withKenny .. withChristaAndOmid
  Print("SetPartyCompositionDatum: key is " .. key)
  ChoiceTracker_SetCustomData(SubProject_GetEpisodeNumber(), key, "true")
end
function CancerGroupHideoutEpilogue()
  Mode(mode_Main)
  Main_AllowMovement(false)
  Navigate_Enable(false)
  SceneAdd("ui_nexttime.scene", "CancerGroupHideoutEpilogue_HideNextTime")
  Callback_OnCreditsComplete:Add(OnCreditsComplete)
  if SaveLoad_IsFromLoad() then
    return
  end
  SetPartyCompositionDatum()
  AgentSetProperty("Lee", "Mesh sk54_lee104_armL - Visible", false)
  if Logic["4FindClem - Hid Bite"] then
    AgentSetProperty("Lee", "Mesh sk54_lee104_armLSleeveDown - Visible", true)
  else
    AgentSetProperty("Lee", "Mesh sk54_lee104_armLBite - Visible", true)
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function CancerGroupHideoutEpilogue_HideNextTime()
  SceneHide("ui_nexttime.scene", true)
end
function CancerGroupHideoutEpilogue_EndEpisode()
  Persistent_Store()
  DataBackupManager_SubmitGameLogic(true)
  WDAchievements_Unlock("achievement_04")
  SceneAdd("ui_stats", "UI_Stats_Open")
end
SceneOpen(kScene, kScript)
