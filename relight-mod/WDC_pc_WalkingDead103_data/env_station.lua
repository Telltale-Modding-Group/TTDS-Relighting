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

local kScript = "Station"
local kScene = "adv_trainTileStation"

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

local mZombieApproachController, mZombieApproachThread
local mbZombieApproachPaused = false

local DestroyUnusedWeapons = function()
  if AgentGetProperty("logic_inventory_items", "Inventory - Monkey Wrench") == 1 then
    AgentDestroy("obj_spikeRemoverWD")
    AgentDestroy("obj_spikeRemoverWD_lee")
    AgentDestroy("obj_spikeRemoverWD_world")
    AgentDestroy("obj_spannerOversizedWD")
    AgentDestroy("obj_spannerOversizedWD_lee")
    AgentDestroy("obj_spannerOversizedWD_world")
  elseif AgentGetProperty("logic_inventory_items", "Inventory - Spanner") == 1 then
    AgentDestroy("obj_spikeRemoverWD")
    AgentDestroy("obj_spikeRemoverWD_lee")
    AgentDestroy("obj_spikeRemoverWD_world")
    AgentDestroy("obj_wrenchMonkeyRustedWD")
    AgentDestroy("obj_wrenchMonkeyRustedWD_lee")
    AgentDestroy("obj_wrenchMonkeyRustedWD_world")
  elseif AgentGetProperty("logic_inventory_items", "Inventory - Spike Remover") == 1 then
    AgentDestroy("obj_wrenchMonkeyRustedWD")
    AgentDestroy("obj_wrenchMonkeyRustedWD_lee")
    AgentDestroy("obj_wrenchMonkeyRustedWD_world")
    AgentDestroy("obj_spannerOversizedWD")
    AgentDestroy("obj_spannerOversizedWD_lee")
    AgentDestroy("obj_spannerOversizedWD_world")
  end
end

local OnCloseToDoor = function(key, value)
  if value then
    Reticle_Update(true)
  end
end

local ZombieApproach = function()
  local dist
  local bClearedHelpText = false
  while ControllerIsPlaying(mZombieApproachController) do
    Yield()
    if bClearedHelpText or ChoredMovement_GetMoveDir() == -1 then
    end
    dist = VectorDistance(AgentGetWorldPos("SurpriseZombie1"), AgentGetWorldPos("Lee"))
    if dist <= 0.75 and not DebugHalted() then
      ControllerKill(mZombieApproachController)
    end
  end
  mZombieApproachController = nil
  mZombieApproachController = nil
  if not bClearedHelpText then
    HelpText_Clear()
    bClearedHelpText = true
  end
  Mode_Pop(mode_Chored_Movement)
  Dialog_Play("cs_killedWhileTwoZombiesApproach")
end

function Station_FirstSwipePreLoad()

end

function Station_SecondSwipePreLoad()

end

function Station_TwoZombiesApproach()
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Station - Close to Door", OnCloseToDoor)
  ChoredMovement_Start("env_station_move_LeeMoveBackwardsToDoor_1")
  ChoredMovement_ReverseControls(true)
  ChoredMovement_AllowReverse(false)
  ChoredMovement_EndOnChoreFinish(false)
  CameraActivate("cam_nav_twoZombiesApproach")
  mZombieApproachController = ChorePlay("env_station_ambient_twoZombiesApproach_1")
  mZombieApproachThread = ThreadStart(ZombieApproach)
end

function Station_OnGetWeapon()
  Mode_Pop(mode_Chored_Movement)
  Mode_Push(mode_NoMovement)
  CameraActivate("cam_nav_KillZombieOne")
  mZombieApproachController = ChorePlay("env_station_ambient_twoZombiesApproach_2")
  mZombieApproachThread = ThreadStart(ZombieApproach)
end

function Station_StopApproach()
  ThreadKill(mZombieApproachThread)
  mZombieApproachThread = nil
  ControllerKill(mZombieApproachController)
  mZombieApproachController = nil
end

function Station_PauseApproach(bPause)
  if bPause == mbZombieApproachPaused then
    return
  end
  mbZombieApproachPaused = bPause
  if mbZombieApproachPaused then
    ChoredMovement_AllowMovement(false)
    ControllerPause(mZombieApproachController)
    ControllerSetContribution(mZombieApproachController, 0)
    ThreadSleep(mZombieApproachThread)
  else
    ChoredMovement_AllowMovement(true)
    ControllerPlay(mZombieApproachController)
    ControllerSetContribution(mZombieApproachController, 1)
    ThreadWake(mZombieApproachThread)
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  if IsEngineVita() then
    DestroyUnusedWeapons()
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetFightTextures(true)
  if IsToolBuild() then
    local weapon
    local weapons = {
      "Inventory - Monkey Wrench",
      "Inventory - Spanner",
      "Inventory - Spike Remover"
    }
    for i, curWeapon in pairs(weapons) do
      if WDInventory_ItemExists(curWeapon) then
        weapon = curWeapon
        break
      end
    end
    if not weapon then
      weapon = TableGetRandomElement(weapons)
      WDInventory_AddItem(weapon)
    end
    local kDebugToFight = "3Station - Debug to Fight"
    if Logic[kDebugToFight] then
      Logic[kDebugToFight] = false
      Logic["3Station - Propped Door"] = true
      Logic["3Station - Unlocked Door"] = true
      if weapon == weapons[1] then
        AgentHide("obj_wrenchMonkeyRustedWD", false)
      elseif weapon == weapons[2] then
        AgentHide("obj_spannerOversizedWD", false)
      else
        AgentHide("obj_spikeRemoverWD", false)
      end
      WDInventory_RemoveItem(weapon)
      Dialog_Play("logic_enterStation")
      Dialog_Play("cs_zombieAttack")
      return
    end
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Station")
      DlgPreload("env_station.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function Station()
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
