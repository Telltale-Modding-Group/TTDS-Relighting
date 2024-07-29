local kScript = "NextTimeOn"
local kScene = "adv_nextTimeOn208"
local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    print(">>>>>>>>> PRELOADING SHADERS: " .. kScene)
  end
end
function NextTimeOn()
  Game_NewScene(kScene, kScript)
  SaveLoad_SaveEventLog()
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene(true)
end
function NextTimeOn_EndEpisode()
  SaveLoad_SetEpisode("ShowEndCredits6")
  Menu_EndStats(8)
  Game_EndEpisode("MenuSeasonM", "Menu_Main")
end
SceneOpen(kScene, kScript)
SceneAdd("ui_nextTimeOn")
