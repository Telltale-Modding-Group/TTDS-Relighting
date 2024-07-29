local kScript = "DairyHouse"
local kScene = "adv_dairyHouseInterior"
local kFloor = "3House - Floor"
local mbMountedStairs = false
local MountStairsThread = function()
  while true do
    Yield()
    if mode_Chored_Movement.bActive then
      if ChoredMovement_GetMoveDir() == -1 then
        if not mbMountedStairs then
          Mode_Pop(mode_Chored_Movement)
          Dialog_Play("cs_dismountStairs")
          return
        end
      elseif ChoredMovement_GetMoveDir() == 1 or autoscootching() then
        Mode_Pop(mode_Chored_Movement)
        Dialog_Play("cs_climbStairs")
        mbMountedStairs = true
        return
      end
    end
  end
end
local DairyHouse_CheckForBackingDownStairsThread = function()
  Yield()
  local choreController = ChorePlay("move_dairyHouseInterior_leeWalksUpStairs_lookBehind.chore", 9900)
  ControllerPause(choreController)
  ControllerSetContribution(choreController, 0)
  local contrib = 0
  local curTime = 0
  local maxTime = ControllerGetLength(choreController)
  while true do
    Yield()
    if mode_Chored_Movement.bActive and ChoredMovement_GetMoveDir() == -1 then
      contrib = Clamp(contrib + GetFrameTime() * 2, 0, 1)
      curTime = Clamp(curTime + GetFrameTime(), 0, maxTime)
    else
      curTime = Clamp(curTime - GetFrameTime(), 0, maxTime)
      if curTime == 0 then
        contrib = Clamp(contrib - GetFrameTime() * 2, 0, 1)
      end
    end
    ControllerSetTime(choreController, curTime)
    ControllerSetContribution(choreController, contrib)
    if mode_Chored_Movement.bActive == false and contrib == 0 then
      ControllerKill(choreController)
      return
    end
  end
end
local SetFloor = function(floor)
  Logic[kFloor] = floor
  WalkBoxesEnableAll(kScene)
  if floor == 1 then
    for i = 16, 49 do
      WalkBoxesDisableTri(kScene, i, true)
    end
  else
    for i = 0, 15 do
      WalkBoxesDisableTri(kScene, i, true)
    end
    if not Logic["3House - Opened Bedroom Door"] then
      DairyHouse_DisableBedroomWalkBoxes(true)
    end
  end
end
function DairyHouse()
  SetFloor(Logic[kFloor])
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy House")
      DlgPreload("env_dairyMainHouseInterior.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  elseif Logic["3House - Complete"] then
    if Platform_IsWiiU() then
      print("Dialog Preloading start2: Dairy House")
      DlgPreload("env_dairyMainHouseInterior.dlog", "cs_discoverMavid", 0, 15, 0, false)
    end
    Logic["3House - Opened Bedroom Door"] = true
    SetFloor(2)
    Dialog_Play("cs_discoverMavid")
  end
end
function DairyHouse_DisableBedroomWalkBoxes(bDisable)
  for i = 28, 36 do
    WalkBoxesDisableTri(kScene, i, bDisable)
  end
end
function DairyHouse_DisableHallwayWalkBoxes(bDisable)
  for i = 24, 27 do
    WalkBoxesDisableTri(kScene, i, bDisable)
  end
end
function DairyHouse_OnEnterTriggerFloor1(trigger)
  SetFloor(1)
end
function DairyHouse_OnEnterTriggerFloor2(trigger)
  SetFloor(2)
end
function DairyHouse_MountStairs()
  ChoredMovement_Start("move_dairyHouseInterior_leeMountsStairs")
  ChoredMovement_AllowReverse(false)
  ThreadStart(MountStairsThread)
end
function DairyHouse_ClimbStairs()
  ChoredMovement_Start("move_dairyHouseInterior_leeWalksUpStairs")
  ChoredMovement_AllowReverse(false)
  ThreadStart(DairyHouse_CheckForBackingDownStairsThread)
end
function DairyHouse_OnReachStairBottom()
  SceneSetWalkBoxes(kScene, "adv_dairyHouseInterior_dinner")
end
SceneOpen(kScene, kScript)
