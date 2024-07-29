local kScript = "VirginiaRoad"
local kScene = "adv_virginiaRoadTile"
local OnLogicReady = function()
  if not Game_GetLoaded() and LogicGet("bEnteredJunkyardHill") then
    if not Game_GetDebug() or not LogicGet("1 - Met Clementine") then
      Game_SetSceneDialog("env_virginiaRoad_truck")
      Game_SetSceneDialogNode("cs_wakeUp")
    else
      Game_SetSceneDialog("env_virginiaRoad_walk")
      Game_SetSceneDialogNode("cs_clementine")
    end
  end
end
function VirginiaRoad()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
