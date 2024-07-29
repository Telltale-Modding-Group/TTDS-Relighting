local kScript = "WreckedTrain"
local kScene = "adv_trainTileWreckedTrain"
local kNotepadScene = "ui_notepad"
local kNotepadBlocker = "blocker_notepad"
local kNotepadCam = "cam_notepad"
local kControlRoomExteriorVisible = "Mesh obj_trainEngine_trainControlRoomExteriorSideLeft - Visible"
local kControlRoomInteriorVisible = "Mesh obj_trainEngine_trainControlRoomInteriorSideLeft - Visible"
local kPalletsVisible = "Mesh obj_trainBoxcar_boxcarPallets - Visible"
local mCamName, mEngineProps, mBoxcarProps
local mbMovementDisabled = false
local mbBackButtonInUse = false
local mbShowingNotepad = false
local SetSlowWalkAnim = function()
  AgentSetProperty("Lee", kWalkAnim, "sk54_move_lee_walk.chore")
end
local SetFastWalkAnim = function()
  AgentSetProperty("Lee", kWalkAnim, "sk54_move_lee_walkFast.chore")
end
function WreckedTrain()
  Mode(mode_Main)
  SceneHide(kNotepadScene, true)
  mEngineProps = AgentGetRuntimeProperties("obj_trainEngine")
  mBoxcarProps = AgentGetRuntimeProperties("obj_trainBoxcar")
  PropertyRemove(mEngineProps, kControlRoomExteriorVisible)
  PropertyRemove(mEngineProps, kControlRoomInteriorVisible)
  PropertyRemove(mBoxcarProps, kPalletsVisible)
  SceneAddOnCameraChangeCallback(kScene, "WreckedTrain_OnCameraChange")
  WreckedTrain_OnCameraChange(AgentGetName(SceneGetCamera(kScene)))
  WreckedTrain_UpdateWalkBoxState()
  Callback_DialogCutsceneBegin:Add(SetSlowWalkAnim)
  Callback_DialogCutsceneEnd:Add(SetFastWalkAnim)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Wrecked Train")
      DlgPreload("env_wreckedTrain.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function WreckedTrain_OnCameraChange(camName)
  if mCamName then
    if mCamName == "cam_nav_wreckedTrainCab" then
      PropertyRemove(mEngineProps, kControlRoomExteriorVisible)
      PropertyRemove(mEngineProps, kControlRoomInteriorVisible)
    elseif mCamName == "cam_nav_wreckedBoxcar" then
      PropertyRemove(mBoxcarProps, kPalletsVisible)
    end
  end
  mCamName = camName
  if mCamName == "cam_nav_wreckedTrainCab" then
    PropertySet(mEngineProps, kControlRoomExteriorVisible, false)
    PropertySet(mEngineProps, kControlRoomInteriorVisible, false)
  elseif mCamName == "cam_nav_wreckedBoxcar" then
    PropertySet(mBoxcarProps, kPalletsVisible, false)
  end
end
function WreckedTrain_ShowNotepad()
  if mbShowingNotepad then
    return
  end
  if not Mode_IsOnStack(mode_NoMovement) then
    Mode_Push(mode_NoMovement)
    mbMovementDisabled = true
  end
  CameraPush(kNotepadCam)
  ReticleUI_Disable()
  SceneHide(kNotepadScene, false)
  AgentHide(kNotepadBlocker, false)
  mbBackButtonInUse = WDBackButton_IsOccupied()
  WDBackButton_Set("cs_hideNotepad")
  WDBackButton_Show()
  if Input_IsUsingTouch() then
    Main_SuppressCameraIcon(true)
  end
  mbShowingNotepad = true
end
function WreckedTrain_HideNotepad()
  if not mbShowingNotepad then
    return
  end
  if mbMovementDisabled then
    Mode_Pop(mode_NoMovement)
    mbMovementDisabled = false
  end
  CameraPop(kNotepadCam)
  ReticleUI_Enable()
  if mbBackButtonInUse then
    if Logic["2Wreck - Station"] == 4 then
      WDBackButton_Set("cs_closeCompartmentA")
    else
      WDBackButton_Set("logic_consoleExit")
    end
  else
    WDBackButton_Clear()
  end
  SceneHide(kNotepadScene, true)
  AgentHide(kNotepadBlocker, true)
  if Input_IsUsingTouch() then
    Main_SuppressCameraIcon(false)
  end
  mbShowingNotepad = false
end
function WreckedTrain_UpdateWalkBoxState()
  WalkBoxesEnableAll(kScene)
  if not Logic["2Wreck - Lilly Stole RV"] then
    for i = 58, 59 do
      WalkBoxesDisableTri(kScene, i)
    end
  end
  if Logic["2Wreck - Opened Car Door"] then
    for i = 53, 57 do
      WalkBoxesDisableTri(kScene, i)
    end
  end
end
SceneOpen(kScene, kScript)
SceneAdd(kNotepadScene)
