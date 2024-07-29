require("AI_PlayerProjectile.lua")
local kScript = "RiverShorelineNight"
local kScene = "adv_riverShorelineNight"
local mFlashlightThread, mFlashlightController
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  local debugID = LogicGet("Debug ID")
  if debugID > 0 then
    Game_SetSceneDialog("env_riverShorelineNight_act2Action")
    if debugID == 1 then
      Game_SetSceneDialogNode("cs_followMe")
    else
      Game_SetSceneDialogNode("cs_climbPier")
    end
  end
end
function RiverShorelineNight()
  Episode_SetClemButton()
end
function RiverShorelineNight_EnableFlashlightTracking(bEnable)
  if bEnable == ControllerIsPlaying(mFlashlightController) then
    return
  end
  local scene = Game_GetScene()
  if bEnable then
    mFlashlightController = ChorePlay("adv_riverShorelineNight_flashlightPointAtClem.chore", 9910)
    ControllerSetLooping(mFlashlightController, true)
    ControllerSetContribution(mFlashlightController, 0)
    local t = 0
    while t <= 1 do
      ControllerSetContribution(mFlashlightController, math.min(1, t))
      t = t + GetFrameTime() * SceneGetTimeScale(scene)
      WaitForNextFrame()
    end
  else
    local t = 1
    while t > 0 do
      ControllerSetContribution(mFlashlightController, math.max(0, t))
      t = t - GetFrameTime() * SceneGetTimeScale(scene)
      WaitForNextFrame()
    end
    mFlashlightController = ControllerKill(mFlashlightController)
  end
end
function RiverShorelineNight_FlashlightChoreIsPlaying()
  return ControllerIsPlaying(mFlashlightController)
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
SceneAdd("ui_notification")
