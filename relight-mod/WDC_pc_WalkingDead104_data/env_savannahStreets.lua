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

local kScript = "SavannahStreets"
local kScene = "adv_savannahStreets"

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

local mClemZombieControllers
local mbTriggerUsed = false

local onTriggerFire = function()
  ChoiceTracker_SetCustomData(SubProject_GetEpisodeNumber(), "Player Fired With Trigger When Saving Kenny in Prologue", true)
  mbTriggerUsed = true
end

function SavannahStreets_PreLoadShootKennyLegZombie()

end

function SavannahStreets_PreLoadTurnToClementine()

end

function SavannahStreets_StartClemZombieApproach()
  mClemZombieControllers = {}
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_1.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_2.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_3.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_4.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_5.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_6.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_7.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_8.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_9.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_10.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_11.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_12.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_13.chore"))
  AgentSetProperty("obj_shootClemZombie1", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie2", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie3", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie4", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie5", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie6", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie7", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie8", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie9", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie10", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie11", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie12", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie13", "Game Selectable", true)
  AgentHide("obj_shootClemZombie1", false)
  AgentHide("obj_shootClemZombie2", false)
  AgentHide("obj_shootClemZombie3", false)
  AgentHide("obj_shootClemZombie4", false)
  AgentHide("obj_shootClemZombie5", false)
  AgentHide("obj_shootClemZombie6", false)
  AgentHide("obj_shootClemZombie7", false)
  AgentHide("obj_shootClemZombie8", false)
  AgentHide("obj_shootClemZombie9", false)
  AgentHide("obj_shootClemZombie10", false)
  AgentHide("obj_shootClemZombie11", false)
  AgentHide("obj_shootClemZombie12", false)
  AgentHide("obj_shootClemZombie13", false)
  AgentSetProperty("trigger_dialog_ClemZombie1", "Trigger Enabled", true)
  AgentSetProperty("trigger_dialog_ClemZombie2", "Trigger Enabled", true)
  AgentSetProperty("trigger_dialog_ClemZombie3", "Trigger Enabled", true)
  Logic["1Prologue - Clem Zombies Killed"] = 0
end

function SavannahStreets_ShootClemZombie(index)
  Logic["1Prologue - Clem Zombies Killed"] = Logic["1Prologue - Clem Zombies Killed"] + 1
  AgentSetProperty("obj_shootClemZombie" .. index, "Game Selectable", false)
  if index < 4 then
    AgentSetProperty("trigger_dialog_ClemZombie" .. index, "Trigger Enabled", false)
  end
  if mClemZombieControllers[index] then
    ControllerKill(mClemZombieControllers[index])
    mClemZombieControllers[index] = nil
  end
end

function SavannahStreets_SniperSceneAddCallback()
  AgentHide("ui_scopeRifle_scope", true, true)
end

function SavannahStreets_StartSniperMode(hChore, vChore)
  if not SceneIsActive("ui_sniper.scene") then
    SceneAdd("ui_sniper.scene", "SavannahStreets_SniperSceneAddCallback")
  end
  AgentSetProperty("logic_mode_sniper", "Sniper - Fire Dialog Node", "action_fireGun")
  AgentSetProperty("logic_mode_sniper", "Sniper - Hide Back Button", true)
  Sniper_Start(hChore, vChore)
end

function Tutorial_MessageTriggers()
  if not mbTriggerUsed then
    local bVitaDeviceMode = not Input_IsUsingTouch()
    if not Logic.bUsingJoystick and not bVitaDeviceMode and not IsEnginePS3() and not IsEngineXbox360() then
      return
    end
    HelpText_Show("tutorial_trigger")
    Sleep(4)
    HelpText_Clear()
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  Main_AllowMovement(false)
  Navigate_Enable(false)
  SceneHide("ui_openingcredits", true)
  RenderDelay(1)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Platform_IsVita() then
    if LangGetCurLanguage() == "german" then
      AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
    end
    if LangGetCurLanguage() == "spanish" and Platform_IsVita() then
      AgentSetProperty("ui_openingcredits_episodename", "Text Scale", 0.95)
    end
  end
  Yield()
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
  Callack_OnReticleTrigger:Add(onTriggerFire)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function SavannahStreets()
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

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  SceneAdd("ui_openingcredits")
end