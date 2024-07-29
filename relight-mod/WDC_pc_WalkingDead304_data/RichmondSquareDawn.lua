local kScript = "RichmondSquareDawn"
local kScene = "adv_richmondSquareDawn"
function RichmondSquareDawn_EndEpisode()
  WDAchievements_Unlock("achievement_15")
  Menu_EndEpisode("304", false)
  Menu_EndEpisode_CheckUpsell("304")
end
function RichmondSquareDawn()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
