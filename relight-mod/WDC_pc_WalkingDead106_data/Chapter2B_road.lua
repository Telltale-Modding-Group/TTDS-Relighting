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

local kScript = "Chapter2B"
local kScene = "adv_ruralRoadTileCh2"

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

require("mode_drag.lua")

local mZombies
local mbLetGoTutorial = false

local function OnDragStart(bStart)
  if bStart ~= mbLetGoTutorial then
    Callback_OnDragStart:Remove(OnDragStart)
    HelpText_Clear()
  end
end

local OnPostUpdate = function()
  local worldPos = AgentGetWorldPos("Wyatt")
  for i, zombie in pairs(mZombies) do
    if not zombie.mbSelectable and not AgentIsHidden(zombie) then
      local distance = VectorDistance(AgentGetWorldPos(zombie), worldPos)
      if distance < 6 then
        AgentSetSelectable(zombie, true)
        zombie.mbSelectable = true
        if not mbLetGoTutorial and Mode_IsActive(mode_drag) then
          Callback_OnDragStart:Add(OnDragStart)
          HelpText_Show("tutorial_letGoToShoot")
          mbLetGoTutorial = true
        end
      end
    end
  end
end

function Chapter2B_OnDragAgentFocus()
  Callback_OnDragAgentFocus:Remove(Chapter2B_OnDragAgentFocus)
  Callback_OnDragStart:Add(OnDragStart)
  HelpText_Show("tutorial_dragClyde")
end

function Chapter2B_StartShootingGallery()
  mZombies = {
    AgentFind("Zombie01"),
    AgentFind("Zombie02"),
    AgentFind("Zombie03"),
    AgentFind("Zombie04"),
    AgentFind("Zombie05"),
    AgentFind("Zombie06")
  }
  Callback_PostUpdate:Add(OnPostUpdate)
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_zombiesAttack", "Pan Cam - Enabled", false)
  end
end

function Chapter2B_StopShootingGallery()
  Callback_PostUpdate:Remove(OnPostUpdate)
  mZombies = nil
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  Game_EnableMovement(false)
  PathAgentSetSpeedScale("Wyatt", 1.5)
  if SaveLoad_IsFromLoad() then
    return
  end
  local kHitClyde = "2 - Hit Clyde"
  local kInvestigationComplete = "2 - Investigation Complete"
  local kPlayedRoshambo = "2 - Played Roshambo"
  local kWonRoshambo = "2 - Won Roshambo"
  if Logic[kHitClyde] then
    Dialog_Play("cs_hitAGuyNew")
    return
  end
  if Logic[kInvestigationComplete] then
    Logic[kHitClyde] = true
    Dialog_Play("cs_roshamboIntro3")
    return
  end
  if Logic[kPlayedRoshambo] then
    Logic[kHitClyde] = true
    Logic[kInvestigationComplete] = true
    if Logic[kWonRoshambo] then
      Dialog_Play("cs_eddieGoes")
    else
      Dialog_Play("cs_wyattGoes")
    end
    return
  end
  if Logic["2 - Zombies Attacked"] then
    Logic[kHitClyde] = true
    Logic[kInvestigationComplete] = true
    Logic[kPlayedRoshambo] = true
    Logic[kWonRoshambo] = false
    Logic["2 - Approached Clyde"] = true
    Logic["2 - Revealed Clyde"] = true
    AgentSetProperty("dummy_attachmentWyatt", kIdleAnim, "attach_wyatt_nothing.chore")
    AgentSetProperty("Wyatt", kIdleAnim, "sk54_idle_wyattStandA.chore")
    AgentSetProperty("Wyatt", kWalkAnim, "sk54_move_wyattWalk.chore")
    AgentHide("Clyde", false)
    Dialog_Play("cs_zombiesAttack")
    return
  end
  if Logic["2 - Got Keys"] then
    Logic[kHitClyde] = true
    Logic[kInvestigationComplete] = true
    Logic[kPlayedRoshambo] = true
    Logic[kWonRoshambo] = true
    AgentHide("Eddie", true)
    Dialog_Play("cs_wyattAttacked")
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

function Chapter2B()
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
