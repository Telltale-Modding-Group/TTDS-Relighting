local kScript = "TrainBeforeStop"
local kScene = "adv_trainTile_beforeStop"
local kConsoleVisible = "Mesh obj_trainEngine_interiorConsole - Visible"
local kControlRoomVisible = "Mesh obj_trainEngine_trainControlRoomInteriorBack - Visible"
local kConsoleButtons = {
  "obj_lightPanel3SquareG",
  "obj_lightPanel3SquareH"
}
local kHideConsoleCams = {
  "cam_kenny_beginning_dlog",
  "cam_kenny_profile_MED"
}
local mCamName, mTrainProps, mIDKatjaaAmbient, mThreadKatjaaAmbient, mThreadKennyStruggle
local KatajaAmbient = function()
  local waitRange = Range(5, 15)
  while true do
    Sleep(RangeRandom(waitRange))
    mIDKatjaaAmbient = Dialog_Play("ambient_katjaa")
    while mIDKatjaaAmbient and DlgIsRunning(mIDKatjaaAmbient) do
      Sleep(1)
    end
  end
end
local KennyStruggle = function(struggleAgent)
  local struggleProps = AgentGetRuntimeProperties(struggleAgent)
  local elapsedTime = 0
  local maxPercent = 0
  while true do
    Yield()
    local mashPercent = struggleProps["Button Mash - Current Percentage"]
    if maxPercent < mashPercent then
      maxPercent = mashPercent
      Logic["3Train1 - Kenny Struggle Intensity"] = maxPercent
    end
    elapsedTime = elapsedTime + GetFrameTime()
    if elapsedTime > 5 then
      struggleProps["Struggle Finished"] = true
    end
  end
end
function TrainBeforeStop()
  Mode(mode_Main)
  mTrainProps = AgentGetRuntimeProperties("obj_trainEngine")
  PropertyRemove(mTrainProps, kConsoleVisible)
  PropertyRemove(mTrainProps, kControlRoomVisible)
  SceneAddOnCameraChangeCallback(kScene, "TrainBeforeStop_OnCameraChange")
  TrainBeforeStop_OnCameraChange(AgentGetName(SceneGetCamera(kScene)))
  WalkBoxesSetVertexPos("adv_trainTile_boxcarBeforeStop", 1, Vector(-1, 1.192, -15.8))
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentSetProperty("Ben", "Useable - Token Offset", Vector())
  if Logic["3Train1 - Got Physical"] then
    Dialog_Play("cs_kennyGetPhysical")
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Train Before Stop")
      DlgPreload("env_trainBeforeStop.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function TrainBeforeStop_OnCameraChange(camName)
  if mCamName then
    if table.contains(kHideConsoleCams, mCamName) then
      PropertyRemove(mTrainProps, kConsoleVisible)
    elseif mCamName == "cam_leeStranglesKenny_CU" then
      PropertyRemove(mTrainProps, kControlRoomVisible)
      for i, button in pairs(kConsoleButtons) do
        AgentHide(button, false)
      end
    end
  end
  mCamName = camName
  if table.contains(kHideConsoleCams, mCamName) then
    PropertySet(mTrainProps, kConsoleVisible, false)
  elseif mCamName == "cam_leeStranglesKenny_CU" then
    PropertySet(mTrainProps, kControlRoomVisible, false)
    for i, button in pairs(kConsoleButtons) do
      AgentHide(button, true)
    end
  end
end
function TrainBeforeStop_StartKatjaaAmbient()
  if mThreadKatjaaAmbient then
    return
  end
  mThreadKatjaaAmbient = ThreadStart(KatajaAmbient)
end
function TrainBeforeStop_StopKatjaaAmbient(bStopCurrent)
  if mThreadKatjaaAmbient then
    ThreadKill(mThreadKatjaaAmbient)
    mThreadKatjaaAmbient = nil
    if bStopCurrent ~= false then
      DlgStop(mIDKatjaaAmbient)
    end
  end
end
function TrainBeforeStop_StartKennyStruggle(struggleAgent)
  if mThreadKennyStruggle then
    ThreadKill(mThreadKennyStruggle)
  end
  Struggle_Start(AgentFind(struggleAgent))
  mThreadKennyStruggle = ThreadStart(KennyStruggle, struggleAgent)
  CameraActivate("cam_struggle")
end
function TrainBeforeStop_StopKennyStruggle()
  if mThreadKennyStruggle then
    ThreadKill(mThreadKennyStruggle)
  end
  Struggle_End()
end
SceneOpen(kScene, kScript)
