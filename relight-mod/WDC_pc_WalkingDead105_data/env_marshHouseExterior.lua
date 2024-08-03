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

local kScript = "MarshHouseExterior"
local kScene = "adv_marshHouseExterior"

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

local kOverlay = "fx_overlayEyesBlink"
local mAgentWithFocus

function RemapAttack(oldAgent, newAgent)
  Dialog_Interruption()
  local origAgent = newAgent
  AgentFind(newAgent).mProps["Game Selectable"] = false
  if not AgentExists(newAgent .. "_remapped") then
    AgentDuplicate(newAgent .. "_remapped", newAgent)
  end
  newAgent = newAgent .. "_remapped"
  AgentSetPos(newAgent, AgentGetPos(oldAgent))
  AgentDetach(newAgent)
  DlgSetExchangeChoreAgentRemap(oldAgent, newAgent)
  local thread = function()
    while not Dialog_CutsceneIsRunning() do
      Yield()
    end
    AgentImportAgentPropertyKeyValues(newAgent, origAgent)
    AgentDetach(newAgent)
    AgentFind(newAgent).mProps["Render Share Skeleton With Agent"] = ""
    while Dialog_CutsceneIsRunning() do
      Yield()
      AgentHide(oldAgent, true)
    end
    AgentHide(newAgent, true)
    AgentHide(oldAgent, true)
  end
  ThreadStart(thread)
end

function MarshHouseExterior_CleaverAllowed()
  return not Input_IsUsingTouch()
end

function SetZombie(agent)
  local props = AgentGetSceneProperties(agent)
  props["Extents Max"].x = 0.25
  props["Extents Max"].y = 1.67
  props["Extents Max"].z = 0.3
  props["Extents Min"].x = -0.25
  props["Extents Min"].y = 0
  props["Extents Min"].z = -0.5
  props["Game Selectable"] = false
  agent.mProps["Game Selectable"] = true
  props["WDUseable - Action Use Dialog Start Node"] = "use_" .. AgentGetName(agent)
  DlgAddNode("env_marshhouseexterior.dlog", "Gauntlet", "exchange", "use_" .. AgentGetName(agent))
  Save("env_marshhouseexterior.dlog")
end

local OnMarshHouseAgentCreate = function(agent)
  local name = string.sub(AgentGetName(agent), 0, 3)
  if name == "Zom" and AgentHasProperty(agent, "Game Selectable") then
    local onKeyChange = function()
      if agent.mProps["Game Selectable"] then
        local dot = "ui_" .. AgentGetName(agent) .. "_dot"
        while not AgentExists(dot) do
          Yield()
        end
        if AgentFind(dot).mProps["Scene: Transient"] then
          local sceneProps = AgentGetSceneProperties(dot)
          sceneProps["Scene: Transient"] = false
          AgentAttachToNode(dot, agent, "spine3")
          AgentSetPos(dot, Vector(0, 0, 0))
          SceneCaptureAgentInfo(AgentGetScene(dot), dot)
          Print("Fixing: " .. dot)
        end
        local sceneProps = AgentGetSceneProperties(agent)
        sceneProps["WDUseable - Icon Fade Distance"] = 7.5
      else
        PropertyRemove(agent.mProps, "WDUseable - Action Use Dialog Start Node")
      end
    end
    PropertyAddKeyCallback(AgentGetProperties(agent), "Game Selectable", onKeyChange)
  end
end

Callback_AgentCreated:Add(OnMarshHouseAgentCreate)

function PreloadShaders()

end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  Mode_Push(mode_NoMovement)
  Navigate_Enable(false)
  AgentHide(SceneGetSceneAgent(kOverlay), true)
  SceneHide(kOverlay, true)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic.nAct == 2 then
    Episode_SetLeeState(true, false, false, "A")
  else
    Episode_SetLeeState(true, true, true, "A")
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

function MarshHouseExterior()
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
  SceneAdd(kOverlay)
end