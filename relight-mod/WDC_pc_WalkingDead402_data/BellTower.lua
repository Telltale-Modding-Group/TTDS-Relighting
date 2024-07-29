require("Constellation.lua")
local kScript = "BellTower"
local kScene = "adv_bellTower"
local mVioletClimbingThread
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_astrology")
  end
end
function BellTower()
end
function BellTower_VioletClimbEnable(bEnable, chore)
  if bEnable then
    mVioletClimbingThread = ChorePlay(chore, -1000)
  else
    mVioletClimbingThread = ControllerKill(mVioletClimbingThread)
  end
end
function BellTower_WaitAndStopBackground()
  local initialID = Subtitle_GetCurrentID()
  while true do
    local id = Subtitle_GetCurrentID()
    if id ~= initialID and id ~= -1 and SubtitleGetAgentName(id) ~= "Violet" then
      break
    end
    WaitForNextFrame()
  end
  Dialog_StopBackground()
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
