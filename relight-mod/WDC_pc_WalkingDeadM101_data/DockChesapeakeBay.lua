--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.
-- But also Telltale's original INCLUDES.

require("RELIGHT_Include.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "DockChesapeakeBay"
local kScene = "adv_dockChesapeakeBay"
local kImap = "Radio.imap"

local mRadioTurnLeftController, mRadioTurnRightController, mSquelchTurnLeftController, mSquelchTurnRightController, mRadioThreadController, mSquelchThreadController, mRadioDialThreadController, mSquelchDialThreadController
local mRadioChoreController, mSquelchChoreController, mBinocularThread

local mbUsingRadioDial = false
local mbUsingSquelchDial = false
local mbMouseDown = false
local mbHoldingLeft = false
local mbHoldingRight = false

local mLastMouseX = 0
local mDeltaMouse = 0

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_FreecamUseFOVScale = true;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene .. ".scene";
RelightConfigLevel = RelightConfigData_SeasonM.Level_M101_DockChesapeakeBay;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.


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

local OriginalTelltaleLevelStartLogic = function()
 SceneAdd("ui_titleCard.scene")
  WaitForNextFrame()
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function DockChesapeakeBay()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end
  
  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_OnPostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_OnPostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "M101_";
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

Callback_OnLogicReady:Add(OnLogicReady)
if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
else
  SceneOpen(kScene, kScript)
end