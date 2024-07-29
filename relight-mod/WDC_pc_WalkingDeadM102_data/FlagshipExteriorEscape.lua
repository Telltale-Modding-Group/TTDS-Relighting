local kScript = "FlagshipExteriorEscape"
local kScene = "adv_boatTownShoreLineView"
local bTimerRunning = false
local bTimerController = null
local shouldAddCredits = function()
  return false
end
function FlagshipExterior_StartTimer()
  if bTimerController then
    return
  end
  bTimerRunning = true
  bTimerController = ChorePlay("env_flagshipExterior_escape_logic_onPeekUp_scopeOut_1.chore")
  ControllerSetScene(bTimerController, kScene)
  while bTimerRunning do
    WaitForNextFrame()
    if bTimerController and not ControllerIsPlaying(bTimerController) then
      Game_RunDialog("fail_scopeOutSituation")
      bTimerRunning = false
    end
  end
  ControllerKill(bTimerController)
  bTimerController = null
end
function FlagshipExterior_StopTimer()
  bTimerRunning = false
end
function FlagshipExterior_DialogLineWait()
  while Subtitle_GetCurrentID() ~= -1 do
    Yield()
  end
end
function FlagshipExteriorEscape()
  Game_NewScene(kScene, kScript)
  AgentHide("Pete", false)
  if shouldAddCredits() then
    SceneAdd("adv_openingCredits102.scene")
  end
  SceneAdd("ui_struggle.scene")
  if LogicGet("3FlagShipExterior - Beat Norma And Randall") then
    Game_SetSceneDialogNode("cs_untiePete")
    WaitForNextFrame()
  end
  if shouldAddCredits() then
    while not SceneIsActive("adv_openingCredits102.scene") do
      WaitForNextFrame()
    end
  end
  SceneHide("adv_openingCredits102.scene", true)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
