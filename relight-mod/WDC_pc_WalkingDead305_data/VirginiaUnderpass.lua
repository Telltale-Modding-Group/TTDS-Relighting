local kScript = "VirginiaUnderpass"
local kScene = "adv_virginiaUnderpass"
function VirginiaUnderpass()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  WDAchievements_Unlock("achievement_16")
  Menu_EndEpisode("305")
  Game_StartScene()
end
function VirginiaUnderpass_EndEpisode()
  Menu_EndEpisode_CheckUpsell("305")
end
SceneOpen(kScene, kScript)
SceneAdd("ui_creditsOpening")
