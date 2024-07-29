local kScript = "DockChesapeakeBay"
local kScene = "adv_dockChesapeakeBay"
local kImap = "Radio.imap"
local mRadioChoreController, mSquelchChoreController, mBinocularThread
local mbUsingRadioDial = false
local mbUsingSquelchDial = false
local mbMouseDown = false
local mbHoldingLeft = false
local mbHoldingRight = false
local mLastMouseX = 0
local mDeltaMouse = 0
local mRadioTurnLeftController, mRadioTurnRightController, mSquelchTurnLeftController, mSquelchTurnRightController, mRadioThreadController, mSquelchThreadController, mRadioDialThreadController, mSquelchDialThreadController
local DockChesapeakeBay_SquelchDialThread = function()
  local theTime = GetTotalTime()
  local theValue = LogicGet("1DockChesapeakeBay - Squelch Value")
  while mbUsingRadioDial or mbUsingSquelchDial do
    if mbHoldingLeft then
      if ControllerIsPlaying(mSquelchTurnRightController) then
        ControllerKill(mSquelchTurnRightController)
      end
      if not ControllerIsPlaying(mSquelchTurnLeftController) and ControllerGetTime(mSquelchChoreController) > 0.1 then
        mSquelchTurnLeftController = ChorePlay("env_dockChesapeakBay_squelch_arrowLeft.chore")
      end
      DockChesapeakeBay_DecreaseSquelch()
    elseif mbHoldingRight then
      if ControllerIsPlaying(mSquelchTurnLeftController) then
        ControllerKill(mSquelchTurnLeftController)
      end
      if not ControllerIsPlaying(mSquelchTurnRightController) and ControllerGetTime(mSquelchChoreController) < 5.9 then
        mSquelchTurnRightController = ChorePlay("env_dockChesapeakBay_squelch_arrowRight.chore")
      end
      DockChesapeakeBay_IncreaseSquelch()
    else
      ControllerKill(mSquelchTurnLeftController)
      ControllerKill(mSquelchTurnRightController)
    end
    WaitForNextFrame()
  end
end
local DockChesapeakeBay_RadioDialThread = function()
  local theTime = GetTotalTime()
  local theValue = LogicGet("1DockChesapeakeBay - Radio Value")
  while mbUsingRadioDial or mbUsingSquelchDial do
    if mbHoldingLeft then
      if ControllerIsPlaying(mRadioTurnRightController) then
        ControllerKill(mRadioTurnRightController)
      end
      if not ControllerIsPlaying(mRadioTurnLeftController) and ControllerGetTime(mRadioChoreController) > 0.1 then
        mRadioTurnLeftController = ChorePlay("env_dockChesapeakBay_radio_arrowLeft.chore")
      end
      DockChesapeakeBay_DecreaseRadio()
    elseif mbHoldingRight then
      if ControllerIsPlaying(mRadioTurnLeftController) then
        ControllerKill(mRadioTurnLeftController)
      end
      if not ControllerIsPlaying(mRadioTurnRightController) and ControllerGetTime(mRadioChoreController) < 4.9 then
        mRadioTurnRightController = ChorePlay("env_dockChesapeakBay_radio_arrowRight.chore")
      end
      DockChesapeakeBay_IncreaseRadio()
    else
      ControllerKill(mRadioTurnLeftController)
      ControllerKill(mRadioTurnRightController)
    end
    WaitForNextFrame()
  end
end
local DockChesapeakeBay_RadioThread = function(bInc)
  if bInc then
    ControllerSetTimeScale(mRadioChoreController, 1)
    while mbHoldingRight and ControllerGetTime(mRadioChoreController) < 4.9 do
      DlgRun("env_dockChesapeakeBay_peteBoat_below.dlog", "logic_checkRadioValues")
      Yield()
    end
    ControllerPause(mRadioChoreController)
  else
    ControllerSetTimeScale(mRadioChoreController, -1)
    while mbHoldingLeft and ControllerGetTime(mRadioChoreController) > 0.1 do
      DlgRun("env_dockChesapeakeBay_peteBoat_below.dlog", "logic_checkRadioValues")
      Yield()
    end
    ControllerPause(mRadioChoreController)
  end
end
local DockChesapeakeBay_SquelchThread = function(bInc)
  if bInc then
    ControllerSetTimeScale(mSquelchChoreController, 1)
    while mbHoldingRight and ControllerGetTime(mSquelchChoreController) < 5.9 do
      DlgRun("env_dockChesapeakeBay_peteBoat_below.dlog", "logic_checkRadioValues")
      Yield()
    end
    if ControllerGetTime(mSquelchChoreController) >= 5.9 then
      ControllerSetTime(mSquelchChoreController, 0.1)
    end
    ControllerPause(mSquelchChoreController)
  else
    ControllerSetTimeScale(mSquelchChoreController, -1)
    while mbHoldingLeft and ControllerGetTime(mSquelchChoreController) > 0.1 do
      DlgRun("env_dockChesapeakeBay_peteBoat_below.dlog", "logic_checkRadioValues")
      Yield()
    end
    if ControllerGetTime(mSquelchChoreController) <= 0.1 then
      ControllerSetTime(mSquelchChoreController, 5.9)
    end
    ControllerPause(mSquelchChoreController)
  end
end
local DockChesapeakeBay_BinocularThread = function()
  while true do
    Reticle_HideSelectionCursor(true)
    Yield()
  end
end
function DockChesapeakeBay_GetRadioController()
  return mRadioChoreController
end
function DockChesapeakeBay_GetSquelchController()
  return mSquelchChoreController
end
function DockChesapeakeBay_IncreaseRadio()
  if not ControllerIsPaused(mRadioChoreController) then
    return
  end
  ControllerPlay(mRadioChoreController)
  mRadioThreadController = ThreadStart(DockChesapeakeBay_RadioThread, true)
end
function DockChesapeakeBay_DecreaseRadio()
  if not ControllerIsPaused(mRadioChoreController) then
    return
  end
  ControllerPlay(mRadioChoreController)
  mRadioThreadController = ThreadStart(DockChesapeakeBay_RadioThread, false)
end
function DockChesapeakeBay_IncreaseSquelch()
  if not ControllerIsPaused(mSquelchChoreController) then
    return
  end
  ControllerPlay(mSquelchChoreController)
  mSquelchThreadController = ThreadStart(DockChesapeakeBay_SquelchThread, true)
end
function DockChesapeakeBay_DecreaseSquelch()
  if not ControllerIsPaused(mSquelchChoreController) then
    return
  end
  ControllerPlay(mSquelchChoreController)
  mSquelchThreadController = ThreadStart(DockChesapeakeBay_SquelchThread, false)
end
function DockChesapeakeBay_BeginRadioDial()
  mbUsingRadioDial = true
  mbUsingSquelchDial = false
  InputMapperActivate(kImap)
  mRadioDialThreadController = ThreadStart(DockChesapeakeBay_RadioDialThread)
end
function DockChesapeakeBay_BeginSquelchDial()
  mbUsingRadioDial = false
  mbUsingSquelchDial = true
  InputMapperActivate(kImap)
  mSquelchDialThreadController = ThreadStart(DockChesapeakeBay_SquelchDialThread)
end
function DockChesapeakeBay_EndDialInteraction()
  ControllerPause(mRadioChoreController)
  ControllerPause(mSquelchChoreController)
  ControllerKill(mRadioTurnLeftController)
  ControllerKill(mRadioTurnRightController)
  ControllerKill(mSquelchTurnLeftController)
  ControllerKill(mSquelchTurnRightController)
  ThreadKill(mRadioDialThreadController)
  ThreadKill(mSquelchDialThreadController)
  ThreadKill(mRadioThreadController)
  ThreadKill(mSquelchThreadController)
  mbHoldingLeft = false
  mbHoldingRight = false
  mbUsingRadioDial = false
  mbUsingSquelchDial = false
  InputMapperDeactivate(kImap)
end
function DockChesapeakeBay_BeginRadio()
  mRadioChoreController = ChorePlay("obj_skipJackCompanion_radio_arrowRight.chore")
  ControllerPause(mRadioChoreController)
  ControllerSetTime(mRadioChoreController, 4)
  mSquelchChoreController = ChorePlay("obj_skipJackCompanion_squelch_right.chore")
  ControllerPause(mSquelchChoreController)
  ControllerSetTime(mSquelchChoreController, 5)
end
function DockChesapeakeBay_EndRadio()
  ControllerKill(mRadioChoreController)
  ControllerKill(mSquelchChoreController)
end
function DockChesapeakeBay_BinocularStart()
  mBinocularThread = ThreadStart(DockChesapeakeBay_BinocularThread)
end
function DockChesapeakeBay_BinocularEnd()
  ThreadKill(mBinocularThread)
end
local OnLogicReady = function()
  if LogicGet("1DockChesapeakeBay - On Top Deck") then
    Game_SetSceneDialog("env_dockChesapeakeBay_peteBoat_deck.dlog")
  end
end
function DockChesapeakeBay()
  Game_NewScene(kScene, kScript)
  SceneAdd("ui_titleCard.scene")
  WaitForNextFrame()
  Game_StartScene(true)
end
function DockChesapeakeBay_OnLeftStick(event)
  if event.x < -0.25 then
    mbHoldingLeft = true
  elseif event.x > 0.25 then
    mbHoldingRight = true
  else
    mbHoldingLeft = false
    mbHoldingRight = false
  end
end
function DockChesapeakeBay_OnLeftDown(event)
  mbHoldingLeft = true
end
function DockChesapeakeBay_OnRightDown(event)
  mbHoldingRight = true
end
function DockChesapeakeBay_OnLeftUp(event)
  mbHoldingLeft = false
end
function DockChesapeakeBay_OnRightUp(event)
  mbHoldingRight = false
end
function DockChesapeakeBay_OnMouseLeftDown(event)
  if not Input_UseTouch() then
    return
  end
  mbMouseDown = true
end
function DockChesapeakeBay_OnMouseLeftUp(event)
  if not Input_UseTouch() then
    return
  end
  mbMouseDown = false
  mbHoldingLeft = false
  mbHoldingRight = false
end
function DockChesapeakeBay_OnMouseMove(event)
  if not Input_UseTouch() then
    return
  end
  local theMouse = event.x
  if mbMouseDown then
    mDeltaMouse = event.x - mLastMouseX
    mLastMouseX = theMouse
    print("DELTA MOUSE: " .. mDeltaMouse)
    print("THE MOUSE: " .. theMouse)
    print("LAST MOUSE: " .. mLastMouseX)
    if mDeltaMouse < 0 then
      mbHoldingLeft = true
    elseif mDeltaMouse > 0 then
      mbHoldingRight = true
    else
      mbHoldingLeft = false
      mbHoldingRight = false
    end
  else
    mbHoldingLeft = false
    mbHoldingRight = false
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
