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

local kScript = "Morgue"
local kScene = "adv_cancerGroupHideout105"

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

local kCredits = "ui_openingcredits"
local kOverlay = "fx_overlayEyesBlink"
local mDangleAmbientThread, mDangleAmbientID

local PlayDangleAmbient = function()
  local waitRange = Range(1, 3)
  while true do
    Sleep(RangeRandom(waitRange))
    mDangleAmbientID = Dialog_Play("ambient_danglingByLeg")
    while mDangleAmbientID and DlgIsRunning(mDangleAmbientID) do
      Sleep(1)
    end
  end
end

function Morgue_StartDangleAmbient()
  if mDangleAmbientThread then
    return
  end
  mDangleAmbientThread = ThreadStart(PlayDangleAmbient)
end

function Morgue_StopDangleAmbient()
  if not mDangleAmbientThread then
    return
  end
  ThreadKill(mDangleAmbientThread)
  mDangleAmbientThread = nil
  DlgStop(mDangleAmbientID)
end

function PreloadShaders()

end

local OriginalTelltaleLevelStartLogic = function()
  if LangGetCurLanguage() == "german" and Platform_IsVita() then
    AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
  end
  Mode(mode_Main)
  if Platform_IsIOS() then
    AgentFind("obj_lightBeamcancerGroupHideout105A").mProps["D3D Mesh"] = ""
    AgentFind("obj_lightBeamcancerGroupHideout105B").mProps["D3D Mesh"] = ""
    AgentFind("obj_lightBeamcancerGroupHideout105C").mProps["D3D Mesh"] = ""
    AgentHide("fx_lightBeamsShadowed", true)
    for i = 1, 5 do
      AgentHide("fx_lightBeamsShadowed0" .. i, true)
    end
  end
  SceneHide(kCredits, true)
  AgentHide(SceneGetSceneAgent(kOverlay), true)
  SceneHide(kOverlay, true)
  local bMorgueComplete = Logic["1Morgue - Complete"]
  if not bMorgueComplete then
    if Logic["With Ben"] == "true" then
      for i = 116, 118 do
        WalkBoxesDisableTri(kScene, i)
      end
    end
    if Logic["With Christa And Omid"] == "true" then
      for i = 97, 115 do
        WalkBoxesDisableTri(kScene, i)
      end
    end
  elseif SaveLoad_IsFromLoad() then
    Mode_Push(mode_NoMovement)
    Navigate_Enable(false)
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState()
  if Logic["1Morgue - Passed Out"] then
    Dialog_Play("cs_enterSawStation")
    return
  end
  if bMorgueComplete then
    AgentSetProperty(SceneGetSceneAgent(kScene), "Dialog Agent - File Primary", "env_elevatorShaft.dlog")
    Dialog_Play("cs_enterShaft")
    return
  end
  local props = AgentGetRuntimeProperties("Lee")
  if Logic["Hid Bite"] == "true" then
    props["Mesh sk54_lee105_armLBite - Visible"] = false
    props["Mesh sk54_lee105_armLSleeveDown - Visible"] = true
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

function Morgue()
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
  SceneAdd(kCredits)
  SceneAdd(kOverlay)
end