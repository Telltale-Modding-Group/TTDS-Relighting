require("Menu_EndEpisode.lua")
local kScript = "NextTimeOn"
local kScene = "adv_nextTimeOnWDM101"
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
  if IsToolBuild() and PropertyGet(GetPreferences(), "Skip Enter Cutscenes") then
    NextTimeOn_EndEpisode()
  end
end
function NextTimeOn_EndEpisode()
  WDAchievements_Unlock("achievement_17")
  Menu_EndEpisode("WalkingDeadM101")
  Game_EndEpisode("MenuSeasonM", "Menu_Main")
end
SceneOpen(kScene, kScript)
SceneAdd(kUIScene)
