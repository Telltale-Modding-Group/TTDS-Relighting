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

local kScript = "MotorInn"
local kScene = "adv_motorInn103_exterior"

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

local mInitialPositions = {}
local mInitialRotations = {}

local SetSlowWalkAnim = function()
  AgentFind("Lee").mProps["Walk Animation - Forward"] = "sk54_move_lee_walk.chore"
end

local SetFastWalkAnim = function()
  AgentFind("Lee").mProps["Walk Animation - Forward"] = "sk54_move_lee_walkfast.chore"
end

function MotorInn_SetAgentToInitialPosAndRot(agent)
  if mInitialPositions[agent] then
    AgentSetPos(agent, mInitialPositions[agent])
  end
  if mInitialRotations[agent] then
    AgentSetRot(agent, mInitialRotations[agent])
  end
  PropertyRemove(AgentGetRuntimeProperties(agent), "Walk Animation - Idle")
end

local doug_dialogChoicesRemain = 2
local doug_missionDialogExists = false
local doug_missionGenericExists = true
local doug_missionUpdates = 0

function MotorInn_UpdateDialog_Doug(updateType)
  if updateType == "dialog" then
    doug_dialogChoicesRemain = doug_dialogChoicesRemain - 1
  elseif updateType == "missionGeneric" then
    doug_missionGenericExists = false
  elseif updateType == "missionDialog" then
    doug_missionDialogExists = false
  elseif updateType == "missionUpdate" then
    doug_missionUpdates = doug_missionUpdates + 1
    if doug_missionUpdates < 3 then
      doug_missionDialogExists = true
    else
      doug_missionDialogExists = false
    end
  else
    Print("** Chris made a mistake in wiring: updateType = " .. updateType)
  end
  Print("**********")
  Print("Updating Doug's Dialog: " .. updateType)
  Print("doug_dialogChoicesRemain: " .. doug_dialogChoicesRemain)
  Print("doug_missionDialogExists: " .. tostring(doug_missionDialogExists))
  Print("doug_missionGenericExists: " .. tostring(doug_missionGenericExists))
  Print("doug_missionUpdates = " .. doug_missionUpdates)
  if doug_dialogChoicesRemain > 0 or doug_missionDialogExists or doug_missionGenericExists then
    Logic["1MotorInn - Doug Has Dialog"] = true
  else
    Logic["1MotorInn - Doug Has Dialog"] = false
  end
end

local carley_confessedToLilly = 0
local carley_confessedToKenny = 0
local carley_confessedToKatjaa = 0
local carley_confessedToClem = 0
local carley_confessedToBen = 0
local carley_dialogChoicesRemain = 1
local carley_missionDialogExists = false
local carley_missionGenericExists = true
local carley_missionUpdates = 0

function MotorInn_UpdateDialog_Carley(updateType)
  if updateType == "dialog" then
    carley_dialogChoicesRemain = carley_dialogChoicesRemain - 1
  elseif updateType == "missionGeneric" then
    carley_missionGenericExists = false
  elseif updateType == "missionDialog" then
    carley_missionDialogExists = false
  elseif updateType == "missionUpdate" then
    carley_missionUpdates = carley_missionUpdates + 1
    if carley_missionUpdates < 3 then
      carley_missionDialogExists = true
    else
      carley_missionDialogExists = false
    end
  elseif updateType == "confessLilly" then
    carley_confessedToLilly = carley_confessedToLilly + 1
  elseif updateType == "confessKenny" then
    carley_confessedToKenny = carley_confessedToKenny + 1
  elseif updateType == "confessKatjaa" then
    carley_confessedToKatjaa = carley_confessedToKatjaa + 1
  elseif updateType == "confessClem" then
    carley_confessedToClem = carley_confessedToClem + 1
  elseif updateType == "confessBen" then
    carley_confessedToBen = carley_confessedToBen + 1
  else
    Print("** Chris made a mistake in wiring: updateType = " .. updateType)
  end
  if carley_dialogChoicesRemain > 0 or carley_missionGenericExists or carley_missionDialogExists or carley_confessedToLilly == 1 or carley_confessedToKenny == 1 or carley_confessedToKatjaa == 1 or carley_confessedToClem == 1 or carley_confessedToBen == 1 then
    Logic["1MotorInn - Carley Has Dialog"] = true
  else
    Logic["1MotorInn - Carley Has Dialog"] = false
  end
  Print("**********")
  Print("Updating Carley's Dialog: " .. updateType)
  Print("carley_confessedToLilly = " .. carley_confessedToLilly)
  Print("carley_confessedToKenny = " .. carley_confessedToKenny)
  Print("carley_confessedToKatjaa = " .. carley_confessedToKatjaa)
  Print("carley_confessedToClem = " .. carley_confessedToClem)
  Print("carley_confessedToBen = " .. carley_confessedToBen)
  Print("carley_dialogChoicesRemain = " .. carley_dialogChoicesRemain)
  Print("carley_missionDialogExists = " .. tostring(carley_missionDialogExists))
  Print("carley_missionGenericExists = " .. tostring(carley_missionDialogExists))
  Print("carley_missionUpdates = " .. carley_missionUpdates)
end

function MotorInn_TalkToClem(nodeName)
  local dialogID = DlgRun("motorInn_clementine", nodeName)
  if dialogID == -1 then
    return
  end
  local clemProps = AgentGetProperties("Clementine")
  if not clemProps then
    return
  end
  PropertySet(clemProps, kIdleAnim, "")
  ControllerSetTimePercent(ChorePlay("sk56_clementineLeafEtching_peek"), 1)
  DlgWait(dialogID)
  PropertyRemove(clemProps, kIdleAnim)
end

local OriginalTelltaleLevelStartLogic = function()
  print("MotorInn() called.")
  Mode(mode_Main)
  Callback_DialogCutsceneBegin:Add(SetSlowWalkAnim)
  Callback_DialogCutsceneEnd:Add(SetFastWalkAnim)
  if SaveLoad_IsFromLoad() then
    return
  end
  mInitialPositions.Doug = AgentGetPos("Doug")
  mInitialRotations.Doug = AgentGetRot("Doug")
  mInitialPositions.Carley = AgentGetPos("Carley")
  mInitialRotations.Carley = AgentGetRot("Carley")
  AgentHide(Logic["DougCarley Saved"], false)
  AgentHide("obj_motorInnStairs", Logic["DougCarley Saved"] == "doug")
  AgentHide("trigger_dialog_stairs", Logic["DougCarley Saved"] == "doug")
  AgentHide("obj_securityWarningSystemBellAMotorInn103", Logic["DougCarley Saved"] == "carley")
  AgentHide("obj_securityWarningSystemBellBMotorInn103", Logic["DougCarley Saved"] == "carley")
  AgentHide("obj_securityWarningSystemBellCMotorInn103", Logic["DougCarley Saved"] == "carley")
  AgentHide("obj_securityWarningSystemMotorInn103", Logic["DougCarley Saved"] == "carley")
  if Logic["Gave Irene Gun"] == "true" then
    AgentHide("obj_balconyFull103", false)
    AgentHide("obj_balconyFallen103", true)
    SceneSetWalkBoxes(kScene, "adv_motorInn103_exterior_balcony.wbox")
  else
    AgentHide("obj_balconyFull103", true)
    AgentHide("obj_balconyFallen103", false)
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Motor Inn")
      DlgPreload("env_motorInn103.dlog", "cs_enter", 0, 15, 0, false)
    end
    print("Attempting to call Dialog_Play() for cs_enter.")
    local success = Dialog_Play("cs_enter")
    print("Dialog_Play returned: " .. tostring(success))
    if not success or success == -1 then
      DlgRun("env_motorInn103.dlog", "cs_enter")
    end
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function MotorInn()
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
