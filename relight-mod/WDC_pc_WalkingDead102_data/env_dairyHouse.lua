--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "DairyHouse"
local kScene = "adv_dairyHouseInterior"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_FreecamUseFOVScale = false;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene .. ".scene";
RelightConfigLevel = RelightConfigData_Season1.Level_102_env_dairyHouse;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

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

local OriginalTelltaleLevelStartLogic = function()
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

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function DairyHouse()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end

  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_PostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_PostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "102_";
    TLSE_Development_Editor_Start();
    Callback_PostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_PostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_PostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)
