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

local kScript = "Chapter3B"
local kScene = "adv_truckStopCh3"

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
RelightConfigGlobal = RelightConfigData_Main.Global;
RelightConfigDevelopment = RelightConfigData_Development.DevelopmentTools;
--RelightConfigLevel = RelightConfigData_Season2.Level_202_LodgeMainRoom;

--Relight DOF
RELIGHT_DOF_AUTOFOCUS_UseCameraDOF = true;
RELIGHT_DOF_AUTOFOCUS_UseLegacyDOF = false;
RELIGHT_DOF_AUTOFOCUS_UseHighQualityDOF = true;
RELIGHT_DOF_AUTOFOCUS_FocalRange = 1.0;
RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames = {};
RELIGHT_DOF_AUTOFOCUS_ObjectEntries = 
{
    "Clementine"
};
RELIGHT_DOF_AUTOFOCUS_Settings =
{
    TargetValidation_IsOnScreen = true,
    TargetValidation_IsVisible = true,
    TargetValidation_IsWithinDistance = true,
    TargetValidation_IsFacingCamera = true,
    TargetValidation_IsOccluded = false,
    TargetValidation_RejectionAngle = 0.0, --goes from -1 to 1 (less than 0 is within the 180 forward facing fov of the given object)
    TargetValidation_RejectionDistance = 40.0, --the max distance before the agent is too far from camera to do autofocus
};
RELIGHT_DOF_AUTOFOCUS_BokehSettings =
{
    BokehBrightnessDeltaThreshold = 0.02,
    BokehBrightnessThreshold = 0.02,
    BokehBlurThreshold = 0.05,
    BokehMinSize = 0.0,
    BokehMaxSize = 0.03,
    BokehFalloff = 0.75,
    MaxBokehBufferAmount = 1.0,
    BokehPatternTexture = "bokeh_circle.d3dtx"
};

--Relight Volumetrics
RELIGHT_HackyCameraVolumetrics_Settings = 
{
    Samples = 256,
    SampleOffset = 0.15,
    SampleStartOffset = 1.0,
    FogColor = Color(0.1, 0.1, 0.1, 0.1)
};

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kChorePriority = 10000
local mGunshotThread, mMonitorThread, mNateCoverThread, mStruggleThread, mIdleController

local PlayGunshots = function()
  Sleep(0.15)
  local delayRange = Range(2, 3.25)
  while true do
    ChorePlay("adv_truckStopCh3_russell_cringeAtGunshot", kChorePriority)
    Sleep(RangeRandom(delayRange))
  end
end

local PlayNateCover = function()
  local chore
  if not Logic["3 - Got to Car"] and Logic["3 - Ran First"] then
    chore = "adv_truckStopCh3_nate_coveringFireTruck"
  else
    chore = "adv_truckstopch3_nate_coveringFireCar"
  end
  Sleep(1)
  local delayRange = Range(2.5, 4.5)
  while true do
    ChorePlay(chore)
    Sleep(RangeRandom(delayRange))
  end
end

local ChoredMovementMonitor = function()
  local kUnderCover = "3 - Under Cover"
  local bMoving = false
  local timeStopped = 0
  while true do
    Yield()
    if bMoving then
      if ChoredMovement_GetMoveDir() ~= 1 then
        ControllerFadeTo(mIdleController, 0.2, 1)
        bMoving = false
      end
    elseif ChoredMovement_GetMoveDir() == 1 then
      ControllerFadeTo(mIdleController, 0.2, 0)
      bMoving = true
      timeStopped = 0
    elseif not Mode_IsOnStack(mode_PauseMenu) then
      timeStopped = timeStopped + GetFrameTime() * SceneGetTimeScale(kScene)
      if timeStopped > 1 and not Logic[kUnderCover] then
        Chapter3B_OnChoredMovementEnd()
        Dialog_Play("cs_stopRunning")
        break
      end
    end
    if not AgentGetProperty("Russell", "ChoreScrub - OK To Stop") then
      Chapter3B_OnChoredMovementEnd()
      break
    end
    if not mGunshotThread and not Logic[kUnderCover] then
      mGunshotThread = ThreadStart(PlayGunshots)
    end
  end
  mMonitorThread = nil
end

local function OnPeekTruck(key, value)
  local RemoveCallback = function()
    Yield()
    PropertyRemoveKeyCallback(GameLogicGet(), key, OnPeekTruck)
  end
  if value then
    Dialog_Play("cs_locateSniper")
    ThreadStart(RemoveCallback)
  end
end

local StruggleMonitor = function(struggleAgent)
  while true do
    Yield()
    if struggleAgent.mProps["Button Mash - Current Percentage"] >= 0.666666 then
      break
    end
  end
  Struggle_End()
  mStruggleThread = nil
end

function Chapter3B_OnChoredMovementBegin()
  if not mMonitorThread then
    mMonitorThread = ThreadStart(ChoredMovementMonitor)
    mIdleController = ChorePlay("sk54_idle_leeCrouchHide", kChorePriority, "Lee", "Russell", "obj_LeeLookHereEyes", "obj_RussellLookHereEyes")
    ControllerSetLooping(mIdleController, true)
    if Logic["3 - Got to Truck"] then
      mNateCoverThread = ThreadStart(PlayNateCover)
    end
    AgentSetProperty("logic_mode_choredMove", "ChoredMove - Autoscootch", false)
  end
end

function Chapter3B_OnChoredMovementEnd()
  if mMonitorThread then
    ThreadKill(mMonitorThread)
    mMonitorThread = nil
    ControllerKill(mIdleController)
    mIdleController = nil
    if mGunshotThread then
      ThreadKill(mGunshotThread)
      mGunshotThread = nil
    end
    if mNateCoverThread then
      ThreadKill(mNateCoverThread)
      mNateCoverThread = nil
    end
  end
end

function Chapter3B_OnTruckPeekEnd()
  Dialog_Play("cs_pushTruck")
end

function Chapter3B_PushTruck(struggleAgent)
  if not mStruggleThread then
    Struggle_Start(struggleAgent)
    mStruggleThread = ThreadStart(StruggleMonitor, AgentFind(struggleAgent))
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if not Logic["3 - Pushed Truck"] then
    PropertyAddKeyCallback(GameLogicGet(), "3 - Peeking Truck", OnPeekTruck)
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic["3 - Got to Pumps"] then
    Dialog_Play("cs_runToTruck")
    return
  end
  if Logic["3 - Got to Truck"] then
    Dialog_Play("cs_getToTruck")
    return
  end
  if Logic["3 - Pushed Truck"] then
    Logic["3 - Got to Truck"] = true
    Dialog_Play("cs_coverChoice")
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function Chapter3B()
  RELIGHT_ConfigurationStart();

  RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_Start();
    Callback_PostUpdate:Add(TLSE_Development_Editor_Update);
    do return end --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_PostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlay
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_PostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)
