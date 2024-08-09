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

local kScript = "clementineHouseInterior"
local kScene = "adv_clementineHouseInterior.scene"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene;
TLSE_Development_FreecamUseFOVScale = false;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene;
RelightConfigLevel = RelightConfigData_Season1.Level_101_env_clementineHouseInterior;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kDialogHouse = "env_ClementineHouse.dlog"
local kDialogClem = "clementinehouse_clementine.dlog"

function ClemHouseInt_KitchenLivingCamTriggerEnter(trigger)
  AgentHide("blocker_kitchen", true)
  triggerCamera_EnterBox(trigger)
end

function ClemHouseInt_KitchenLivingCamTriggerExit(trigger)
  AgentHide("blocker_kitchen", false)
  triggerCamera_ExitBox(trigger)
end

local mAttackChoreCtl, mAttackChoreName

function ClemHouseInt_AttackStart(attackChore)
  mAttackChoreCtl = nil
  Main_AllowMovement(false)
  CameraActivate("cam_nav_JPStylePlayer")
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
  ClemHouseInt_AttackChoreStart(attackChore)
end

function ClemHouseInt_MovePhaseStart()
  local phaseNum = Logic["ClemHouseInt - BabysitterPhase"]
  assert(phaseNum > 0, "ClemHouseInt_MovePhaseStart: phaseNum <= 0")
  ChoredMovement_ReverseControls(true)
  ChoredMovement_Start("env_clementinehouse_choredmove_scootawayfromzombie_" .. phaseNum .. ".chore")
  Dialog_Play("babysitterChores_Leg" .. phaseNum, "Lee", nil, kDialogHouse)
end

function ClemHouseInt_OnBabysitterCatchesLee(trigger)
  trigger.mProps["Trigger Enabled"] = false
  Dialog_Play("cs_BabysitterCatchesLee", "Lee", nil, kDialogHouse)
end

function ClemHouseInt_AttackChoreStart(attackChore)
  if attackChore ~= nil then
    mAttackChoreName = attackChore
  end
  if mAttackChoreCtl then
    ControllerSetTime(mAttackChoreCtl, 0)
    ControllerPlay(mAttackChoreCtl)
  elseif mAttackChoreName then
    mAttackChoreCtl = ChorePlay(mAttackChoreName)
    PanicMeter_AttachItem("ui_panicmeter_overlay", mAttackChoreCtl)
  else
    Print("ClemHouseInt_AttackChoreStart: no chore specified")
  end
end

function ClemHouseInt_AttackChoreStop()
  if mAttackChoreCtl then
    ControllerKill(mAttackChoreCtl)
    mAttackChoreCtl = nil
    PanicMeter_RemoveItem("ui_panicmeter_overlay", mAttackChoreCtl)
  end
end

function ClemHouseInt_AttackFail(key, value)
  if value then
    Dialog_Play("cs_LeeDeath", "Lee", nil, kDialogHouse)
  end
end

function ClemHouseInt_AttackSuccess()
  ClemHouseInt_AttackChoreStop()
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
end

local crawlChore, dollyChore
local bPlayedClemLine = false

function ClemHouseInt_StartFightCrawl()
  local thread = function()
    if Logic["ClemHouseInt - BabysitterPhase"] <= 2 then
      crawlChore = ChorePlay("env_clementinehouse_ambient_babysitterclimbs2_1.chore")
    else
      crawlChore = ChorePlay("env_clementinehouse_ambient_babysitterclimbs3_1.chore")
    end
    ControllerSetPriority(crawlChore, 9000)
    Sleep(0.5)
    while crawlChore and (ControllerIsPlaying(crawlChore) or ControllerIsPaused(crawlChore)) do
      Yield()
      if Logic["ClemHouseInt - BabysitterPhase"] > 3 and not bPlayedClemLine and AgentIsOnScreen("obj_hammerWD_Clementine") then
        Dialog_Play("ambient_clementineOffersHelp")
        bPlayedClemLine = true
      end
      if Dialog_CutsceneIsRunning() and not ControllerIsPaused(crawlChore) then
        ControllerPause(crawlChore)
        ControllerSetContribution(crawlChore, 0)
        ControllerSetTime(crawlChore, math.random(300) / 100)
      elseif not Dialog_CutsceneIsRunning() and ControllerIsPaused(crawlChore) then
        ControllerSetContribution(crawlChore, 1)
        ControllerPlay(crawlChore)
      end
    end
    if not Dialog_CutsceneIsRunning() then
      if Logic["ClemHouseInt - BabysitterPhase"] <= 2 then
        Dialog_StopAll()
        Dialog_Play("cs_leeDiesBetweenKitchenAndDoor")
      elseif Logic["ClemHouseInt - BabysitterPhase"] == 3 or Logic["ClemHouseInt - BabysitterPhase"] == 4 then
        Dialog_StopAll()
        Dialog_Play("cs_leeDiesAtSlidingGlassDoor")
      end
    end
  end
  ThreadStart(thread)
end

local hammerWait

function ClemHouseHint_WaitForHammer(bWait)
  if bWait and not ThreadIsRunning(hammerWait) then
    local thread = function()
      Sleep(3)
      while Dialog_CutsceneIsRunning() do
        Yield()
      end
      if Logic["ClemHouseInt - BabysitterLeeSafe"] then
        Logic["ClemHouseInt - Lee Did Not Use Hammer Enough"] = true
        Dialog_Play("use_Babysitter")
      else
        Dialog_Play("cs_leeDiesOnTopOfBabysitter")
      end
    end
    hammerWait = ThreadStart(thread)
  end
  if not bWait then
    ThreadKill(hammerWait)
    hammerWait = nil
  end
end

function ClemHouseInt_StopFightCrawl()
  ControllerKill(crawlChore)
  ControllerKill(dollyChore)
end

local OriginalTelltaleLevelStartLogic = function()
  if Platform_IsAndroid() then
    local sceneAgent = SceneGetSceneAgent(AgentGetScene(kScene))
    if sceneAgent then
      AgentSetProperty(sceneAgent, "FX Tonemap Enabled", true)
      AgentSetProperty(sceneAgent, "FX Tonemap Intensity", 1.5)
    end
  end
  Mode(mode_Main)
  if not IsRegistered() and Logic["ClemHouseInt - Babysitter Fight Started"] then
    Dialog_Play("debug_IntroFightFromDemo", "Lee", nil, kDialogHouse)
  elseif IsToolBuild and AgentGetProperty("logic_debug", "Debug - TestZombieBabysitter") then
    AgentSetProperty("logic_debug", "Debug - TestZombieBabysitter", false)
    AgentSetProperty("obj_bloodSpill", "Trigger Enabled", false)
    if Platform_IsWiiU() then
      print("Dialog Preloading start")
      DlgPreload(kDialogHouse, "cs_newFightIntro", 0, 10, 0, false)
    end
    Dialog_Play("cs_newFightIntro", "Lee", nil, kDialogHouse)
  elseif not SaveLoad_IsFromLoad() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start")
      DlgPreload(kDialogHouse, "cs_enterHouse", 0, 15, 0, false)
    end
    Dialog_Play("cs_enterHouse", "Lee", nil, kDialogHouse)
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function clementineHouseInterior()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "101_";
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