require("Menu_EndEpisode.lua")
local kScript = "NextTimeOn"
local kScene = "adv_nextTimeOnWDM102"
local kUIScene = "ui_nextTimeOn"
local PreloadAssets = function()
end
function NextTimeOn()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  SceneHide("ui_reticle.scene", true)
  ChorePlayAndWait(kUIScene)
  SceneRemove(kUIScene)
  PreloadAssets()
  Game_StartScene(true)
end
function NextTimeOn_EndEpisode()
  WDAchievements_Unlock("achievement_18")
  Menu_EndEpisode("WalkingDeadM102")
  Game_EndEpisode("MenuSeasonM", "Menu_Main")
end
SceneOpen(kScene, kScript)
SceneAdd(kUIScene)
