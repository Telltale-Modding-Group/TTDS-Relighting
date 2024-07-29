local kScript = "RiverBoat"
local kScene = "adv_riverBoat"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  local debugID = LogicGet("Debug ID")
  if debugID == 1 then
    Game_SetSceneDialog("env_riverBoat_act3Cells")
    Game_SetSceneDialogNode("cs_wakeUp")
  elseif debugID == 2 then
    Game_SetSceneDialog("env_riverBoat_act3Deck")
    Game_SetSceneDialogNode("cs_onDeck")
  end
end
function RiverBoat()
  Episode_SetClemButton()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
function RiverBoat_EndEpisode()
  WDAchievements_Unlock("achievement_22")
  Menu_EndEpisode("403", false)
  Menu_EndEpisode_CheckUpsell("403")
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
SceneAdd("ui_notification")
