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

local kScript = "ManorExteriorDay"
local kScene = "adv_manorExterior_day"

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
RelightConfigLevel = RelightConfigData_Season1.Level_104_env_manorExteriorDay;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

function ManorExteriorDay_PreLoadZombieBite()

end

local biteChore

function ManorExteriorDay_InitialBiteDecision(bSet)
  local onSelect = function(choice)
    local index = DlgGetObjUserPropsValue(choice.Dlog, choice["Choice Object ID"], "Preferred Button Assignment")
    Logic["4FindClem - Bite Decision Chore Currently Playing"] = true
    if index == 2 then
      Logic["4FindClem - Initially Chose To Reveal Bite"] = true
      biteChore = ChorePlay("env_manorexterior_act4_cs_leehidesorshowsbite_2.chore")
      ControllerSetPriority(biteChore, 9999)
      Print("Don't hide bite.")
      WDNotifyChoice("InitialBiteShow", 1, 5)
    elseif index == 3 then
      Logic["4FindClem - Hid Bite"] = true
      biteChore = ChorePlay("env_manorexterior_act4_cs_leehidesorshowsbite_1.chore")
      ControllerSetPriority(biteChore, 9999)
      Print("Hide bite.")
      WDNotifyChoice("InitialBiteHide", 1, 5)
    end
    local thread = function()
      while ControllerIsPlaying(biteChore) do
        Yield()
      end
      Print("done playing bite chore")
      Logic["4FindClem - Bite Decision Chore Currently Playing"] = false
    end
    ThreadStart(thread)
  end
  if bSet then
    Callback_OnChoiceInit:Add(onSelect)
  else
    ControllerKill(biteChore)
    biteChore = nil
    Callback_OnChoiceInit:Remove(onSelect)
  end
end

function ManorExteriorDay_KennyScore()
  local shawnDuck = Logic["ShawnDuck Choice"] == "duck" and 2 or 0
  local larryArgument = Logic["Sided With Kenny"] == "true" and 1.5 or 0
  local lillyArgument102 = not ChoiceTracker_ChoiceWasMade(102, "env_motorinn_backatthemotel_cs_argument_8") and 0.75 or 0
  local killLarry = Logic["Helped Kill Larry"] == "true" and 1.5 or 0
  local shootBeatrice = Logic["Shot Beatrice"] == "false" and 0.75 or 0
  local lillyArgument103 = not (ChoiceTracker_ChoiceWasMade(103, "env_motelroominterior_cs_argumentlilly_7") or ChoiceTracker_ChoiceWasMade(103, "env_motelroominterior_cs_argumentkenny_7")) and 0.75 or 0
  local killDuck = Logic["Kill Duck Choice"] ~= "kenny" and 2 or 0
  local zombieBoy = Logic["1ManorAttic - Lee Killed Zombie"] and 0.75 or 0
  local benChoices = 0
  if Logic["3BellTower - Ben Dead"] then
    if Logic["3BellTower - Told Kenny about Ben"] then
      benChoices = 2
    elseif not Logic["3Classroom - Supported Ben"] then
      benChoices = 1
    end
  end
  return shawnDuck + larryArgument + lillyArgument102 + killLarry + shootBeatrice + lillyArgument103 + killDuck + zombieBoy + benChoices
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  local sceneAgent = SceneGetSceneAgent(kScene)
  if sceneAgent then
    if Logic["2ClemSearch - Found Boat"] then
      AgentSetProperty("trigger_cam_nearBoatHouse", "Trigger Enabled", false)
      AgentHide("Ben", Logic["3BellTower - Ben Dead"])
      ChorePlay("light_manorExteriorDay_discoverBoatSwitch.chore")
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_manorExterior_act4.dlog"
      SceneSetWalkBoxes(kScene, "adv_manorExterior_act4.wbox")
    elseif Logic["2ClemSearch - Entered Backyard"] then
      AgentSetProperty("trigger_cam_nearBoatHouse", "Trigger Enabled", false)
      ChorePlay("light_manorExteriorDay_discoverBoatSwitch.chore")
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_manorExterior_act2BoatDiscovery.dlog"
    elseif Logic["1ManorAttic - Zombie Boy Dead"] then
      AgentSetProperty("trigger_cam_nearBoatHouse", "Trigger Enabled", false)
      ChorePlay("light_manorExteriorDay_burialSwitch.chore")
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_manorExterior_act1Ending.dlog"
    end
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

function ManorExteriorDay()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "104_";
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
