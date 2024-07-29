local kScript = "JunkyardDay"
local kScene = "adv_junkyardDay"
function JunkyardDay()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
function JunkyardDay_EndEpisode()
  WDAchievements_Unlock("achievement_12")
  Menu_EndEpisode("301", false)
  Menu_EndEpisode_CheckUpsell("301")
end
SceneOpen(kScene, kScript)
