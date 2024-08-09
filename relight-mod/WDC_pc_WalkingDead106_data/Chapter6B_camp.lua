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

local kScript = "Chapter6B"
local kScene = "adv_groupCampCh6"

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
RelightConfigLevel = RelightConfigData_Season1.Level_106_Chapter6B_camp;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

require("ui_stats.lua")

local OnCreditsComplete = function()
  SubProject_Switch("MenuSeason1", "MainMenuNoStartPane")
end

function Chapter6B_EndGame()
  Persistent_Store()
  DataBackupManager_SubmitGameLogic(true)
  WDAchievements_Unlock("achievement_06")
  Callback_OnCreditsComplete:Add(OnCreditsComplete)
  SceneAdd("ui_credits", "Chapter6B_OnCreditsOpen")
  SceneAdd("ui_stats", "UI_Stats_Open")
end

function Chapter6B_OnCreditsOpen()
  local kTextureProp = "ui_background_brownie_1920x1080 - Texture"
  if Logic["1 - Shot Dan"] then
    AgentSetProperty("ui_credits106backgroundPhoto6", kTextureProp, "ui_credits106backgroundPhoto_ch1Dan.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto6", kTextureProp, "ui_credits106backgroundPhoto_ch1Justin.d3dtx")
  end
  if Logic["2 - Left Eddie"] then
    AgentSetProperty("ui_credits106backgroundPhoto7", kTextureProp, "ui_credits106backgroundPhoto_ch2Eddie.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto7", kTextureProp, "ui_credits106backgroundPhoto_ch2Nate.d3dtx")
  end
  if Logic["3 - Killed Zombie"] then
    AgentSetProperty("ui_credits106backgroundPhoto4", kTextureProp, "ui_credits106backgroundPhoto_ch3Bennet.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto4", kTextureProp, "ui_credits106backgroundPhoto_ch4Bennet.d3dtx")
  end
  if Logic["4 - Leland Stayed"] then
    AgentSetProperty("ui_credits106backgroundPhoto1", kTextureProp, "ui_credits106backgroundPhoto_ch4Leland.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto1", kTextureProp, "ui_credits106backgroundPhoto_ch4Dee.d3dtx")
  end
  if Logic["5 - Killed Stephanie"] then
    AgentSetProperty("ui_credits106backgroundPhoto3", kTextureProp, "ui_credits106backgroundPhoto_ch5Stay.d3dtx")
  else
    AgentSetProperty("ui_credits106backgroundPhoto3", kTextureProp, "ui_credits106backgroundPhoto_ch5Go.d3dtx")
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic["2 - Left Eddie"] then
    AgentHide("obj_carEddie", false)
  end
  if not Logic["5 - Killed Stephanie"] then
    AgentHide("obj_rvCoach106", false)
  end
  if Platform_IsIOS() then
    AgentHide("obj_groupCampTrashB", true)
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

function Chapter6B()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "106_";
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
