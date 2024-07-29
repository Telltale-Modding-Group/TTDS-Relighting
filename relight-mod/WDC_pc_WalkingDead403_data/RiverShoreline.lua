local kScript = "RiverShoreline"
local kScene = "adv_riverShoreline"
local OnSetGameMode = function(oldMode, newMode)
  AgentHide("ui_fxOverlay_binoculars", newMode == eModeCutscene)
end
function RiverShoreline()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
function RiverShoreline_BinocularsEnable(bEnable)
  if bEnable then
    Callback_OnSetGameMode:Add(OnSetGameMode)
  else
    Callback_OnSetGameMode:Remove(OnSetGameMode)
  end
  AgentHide("ui_fxOverlay_binoculars", not bEnable)
end
Game_SceneOpen(kScene, kScript)
