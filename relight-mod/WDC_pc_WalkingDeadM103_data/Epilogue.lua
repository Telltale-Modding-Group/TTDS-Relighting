require("Menu_EndEpisode.lua")
local kScript = "Epilogue"
local kScene = "adv_shorelineDock"
local kEndEpisodeScene = "ui_menuEndOfEpisode.scene"
local kCreditsScene = "ui_credits.scene"
local kStatsScene = IsPlatformSmallScreen() and "ui_statsBig.scene" or "ui_stats.scene"
function Epilogue()
  MenuUtils_AddScene(kEndEpisodeScene)
  AgentHide("cam_ui_menuEndOfEpisode", true)
  AgentHide("ui_menuEndOfEpisode_background", true)
  AgentHide("ui_menuEndOfEpisode_backgroundOverlay", true)
  AgentHide("ui_menuEndOfEpisode_fillForeground", true)
  MenuUtils_AddScene(kCreditsScene)
  SceneHide(kCreditsScene, true)
  MenuUtils_AddScene(kStatsScene)
  SceneHide(kStatsScene, true)
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene(true)
end
function Epilogue_EndEpisode()
  AgentHide("cam_ui_menuEndOfEpisode", false)
  AgentHide("ui_menuEndOfEpisode_background", false)
  AgentHide("ui_menuEndOfEpisode_backgroundOverlay", false)
  AgentHide("ui_menuEndOfEpisode_fillForeground", false)
  WDAchievements_Unlock("achievement_19")
  Menu_EndEpisode("WalkingDeadM103")
  Game_EndEpisode("MenuSeasonM", "Menu_Main")
end
SceneOpen(kScene, kScript)
