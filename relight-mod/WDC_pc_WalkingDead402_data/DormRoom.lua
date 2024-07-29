local kScript = "DormRoom"
local kScene = "adv_dormRoom"
local mFlashbackLightingController
local OnLogicReady = function()
  Episode_SetUpCollectibles()
  AgentSetState("Clementine", "headHatless")
end
function DormRoom()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
function DormRoom_FlashbackLightingEnable(bEnable)
  if bEnable == ControllerIsPlaying(mFlashbackLightingController) then
    return
  end
  if not bEnable then
    mFlashbackLightingController = ControllerKill(mFlashbackLightingController)
  else
    mFlashbackLightingController = ChorePlay("lightSettings_dormRoom_exterior.chore")
    ControllerSetLooping(mFlashbackLightingController, true)
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
