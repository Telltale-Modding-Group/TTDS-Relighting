local kScript = "RichmondGate"
local kScene = "adv_richmondGate"
function RichmondGate()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
function RichmondGate_EndEpisode()
  WDAchievements_Unlock("achievement_13")
  Menu_EndEpisode("302", false)
  Menu_EndEpisode_CheckUpsell("302")
end
SceneOpen(kScene, kScript)
