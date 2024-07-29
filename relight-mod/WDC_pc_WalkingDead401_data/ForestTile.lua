local kScript = "ForestTile"
local kScene = "adv_forestTile"
local mStationExitFunc
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("2 - Entered ForestShack") then
    Game_SetSceneDialogNode("cs_fromShack")
  end
end
function ForestTile()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
function ForestTile_OnButtonExit()
  ForestTile_OverrideStationExit(false)
  Station_Activate(false)
  Station_Exit()
  Game_RunSceneDialog("cs_funTimeOver")
end
function ForestTile_OverrideStationExit(bOverride)
  if bOverride then
    if not mStationExitFunc then
      mStationExitFunc = Station_OnButtonExit
      Station_OnButtonExit = ForestTile_OnButtonExit
    end
  elseif mStationExitFunc then
    Station_OnButtonExit = mStationExitFunc
    mStationExitFunc = nil
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
