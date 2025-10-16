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

local kScript = "FlagshipInteriorEscape"
local kScene = "adv_flagshipInterior"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_FreecamUseFOVScale = true;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene .. ".scene";
RelightConfigLevel = RelightConfigData_SeasonM.Level_M102_FlagshipInteriorEscape;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local OnLogicReady = function()
  Game_SetSceneDialog("env_flagshipInterior_escape_102.dlog")
end

local OriginalTelltaleLevelStartLogic = function()
  if LogicGet("Episode 101 - Zach is Dead") then
    ShaderOverrideTexture("Zachary", "sk54_zachary_head.d3dtx", "sk54_zachary_headGunshot.d3dtx")
    ShaderOverrideTexture("Samantha", "sk55_samantha_BodyUpper.d3dtx", "sk55_samantha_bodyUpperGregSplatter.d3dtx")
    ShaderOverrideTexture("Samantha", "sk55_samantha_head.d3dtx", "sk55_samantha_headGregSplatter.d3dtx")
  elseif LogicGet("Episode 101 - Punched Zach") then
    ShaderOverrideTexture("Zachary", "sk54_zachary_head.d3dtx", "sk54_zachary_headBruised.d3dtx")
  end
  AgentSetProperty("Greg", "Mesh sk54_greg_head - Visible", false)
  AgentSetProperty("Greg", "Mesh sk54_greg_eyesMouth - Visible", false)
  AgentSetProperty("Greg", "Mesh sk54_greg_bodyUpper - Visible", false)
  AgentSetProperty("Greg", "Mesh sk54_greg_bodyUpperZombie - Visible", true)
  ShaderOverrideTexture("Greg", "sk54_greg_bodyUpperZombie.d3dtx", "sk54_gregZombie_bodyUpperZombieBrained.d3dtx")
  if LogicGet("Episode 101 - Weapon") == "screwdriver" then
    AgentSetProperty("Greg", "Mesh sk54_greg_headZombieScrewdriver - Visible", true)
    local punchCount = LogicGet("Episode 101 - Greg Punch Count")
    if punchCount == "one" then
      ShaderOverrideTexture("Greg", "sk54_greg_headZombieScrewdriver.d3dtx", "sk54_greg_headZombieScrewdriverBeatenPunchB.d3dtx")
    elseif punchCount == "two" then
      ShaderOverrideTexture("Greg", "sk54_greg_headZombieScrewdriver.d3dtx", "sk54_greg_headZombieScrewdriverBeatenPunchC.d3dtx")
    else
      ShaderOverrideTexture("Greg", "sk54_greg_headZombieScrewdriver.d3dtx", "sk54_greg_headZombieScrewdriverBeatenPunchA.d3dtx")
    end
  else
    AgentSetProperty("Greg", "Mesh sk54_greg_headZombieDamagedB - Visible", true)
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function FlagshipInteriorEscape()
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end
  
  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_OnPostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_OnPostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "M102_";
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end
  
  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

Callback_OnLogicReady:Add(OnLogicReady)

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
else
  SceneOpen(kScene, kScript)
end
