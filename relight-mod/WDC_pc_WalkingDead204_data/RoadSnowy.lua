local kScript = "RoadSnowy"
local kScene = "adv_roadSnowy"
local PreloadAssets = function()
end
function RoadSnowy()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene()
end
function RoadSnowy_EndEpisode()
  SaveLoad_SaveEventLog()
  WDAchievements_Unlock("achievement_10")
  SaveLoad_SetEpisode("ShowEndCredits4")
  Menu_EndStats(4)
  Game_EndEpisode("MenuSeason2", "Menu_Main")
end
SceneOpen(kScene, kScript)
