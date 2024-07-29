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

local kScript = "SavannahSewers"
local kScene = "adv_savannahSewers"

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
RELIGHT_kScene = kScene;
RELIGHT_SceneObjectAgentName = kScene .. ".scene";
RelightConfigGlobal = RelightConfigData_Main.Global;
RelightConfigDevelopment = RelightConfigData_Development.DevelopmentTools;
--RelightConfigLevel = RelightConfigData_Season2.Level_101_ClementineHouseExterior;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local mStatusThread
local mbDied = false

local CheckProximity = function()
  local thread = function()
    while not mbDied do
      Yield()
      local zombie
      local nearestDist = 1000
      local dist, cam
      local panicPercentCur = 0
      local panicPercentDesired = 0
      local delta = 0
      while Logic["2Sewer - Freed Leg"] and not Logic["2Sewer - Alerted Zombies"] do
        Yield()
      end
      cam = AgentGetCamera("Lee")
      if AgentGetName(cam) ~= "cam_nav_lowerLevelMain" and not Logic["2Sewer - Caused Leak"] then
        nearestDist = 1000
      else
        for i = 1, 5 do
          zombie = AgentFind("trigger_dialog_ZombieAverage1")
          dist = VectorDistance(AgentGetWorldPos(zombie), AgentGetWorldPos("Lee"))
          if nearestDist > dist then
            nearestDist = dist
          end
        end
      end
      AgentFind("ui_panicmeter_combat").mProps["PanicMeter - Enabled"] = true
      local maxDist = Logic["2Sewer - Zombie Warn Distance"]
      panicPercentDesired = nearestDist / maxDist - 0.1
      if nearestDist >= maxDist then
        panicPercentDesired = 1
      end
      delta = panicPercentDesired - panicPercentCur
      panicPercentCur = panicPercentDesired + delta * (GetFrameTime() * 1)
      if panicPercentCur > 1 then
        panicPercentCur = 1
      elseif panicPercentCur < 0.1 then
        panicPercentCur = 0.1
      end
      AgentFind("ui_panicmeter_combat").mProps["PanicMeter - Progress"] = 1 - panicPercentCur
    end
    AgentFind("ui_panicmeter_combat").mProps["PanicMeter - Enabled"] = false
  end
  if not ThreadIsRunning(mStatusThread) then
    mStatusThread = ThreadStart(thread)
  end
end

local onDeath = function()
  mbDied = true
end

function SavannahSewers_SeenZombiesCallback(key, val)
  if val == true and Logic["2Sewer - SeenZombies"] == false then
    Dialog_Play("cs_spotZombies")
    Logic["2Sewer - SeenZombies"] = true
  end
end

function SavannahSewers_PreLoadArmGrab()
end

function SavannahSewers_PreLoadKillZombieEndOfHallway()
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  PropertyAddKeyCallback(AgentFind("logic_game").mProps, "2Sewer - SeenZombies Callback Trigger", SavannahSewers_SeenZombiesCallback)
  local thread = function()
    while not AgentExists("ui_panicmeter_combat") do
      Yield()
    end
    Callback_OnDeath:Add(onDeath)
    CheckProximity()
  end
  ThreadStart(thread)
  Logic["Inventory - Ice Axe"] = 1
  if SaveLoad_IsFromLoad() then
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

function SavannahSewers()
  --Apply freecamera settings from ini dev file
  RELIGHT_ApplyFreecameraSettingsFromINI();

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
