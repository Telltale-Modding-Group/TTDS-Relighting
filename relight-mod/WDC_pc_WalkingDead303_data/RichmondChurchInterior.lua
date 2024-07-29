local kScript = "RichmondChurchInterior"
local kScene = "adv_richmondChurchInterior"
local OnLogicReady = function()
  if not Game_GetLoaded() and LogicGet(kAct) == 3 then
    Game_SetSceneDialog("env_richmondChurchInterior_return")
    Game_SetSceneDialogNode("cs_returnToChurch")
  end
end
function RichmondChurchInterior()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
function RichmondChurchInterior_EndEpisode()
  WDAchievements_Unlock("achievement_14")
  Menu_EndEpisode("303", false)
  Menu_EndEpisode_CheckUpsell("303")
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
