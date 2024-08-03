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

local kScene = "adv_drugstoreInteriorAct3.scene"

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

local preloadShaders = function()
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "263")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "258")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "135")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "3")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "64")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "74")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "196")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "131")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "132")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "10")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "259")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "330")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "3")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "263")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "258")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "132")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "135")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "131")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "74")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "10")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "330")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "64")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "196")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "323")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "259")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "0")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "258")
end

local callouts = {}
local calloutThread

function Callout_Add(dlgItem)
  table.insert(callouts, dlgItem)
end

function Callout_Remove(dlgItem)
  for i, v in ipairs(callouts) do
    if v == dlgItem then
      table.remove(callouts, i)
      return
    end
  end
end

local CalloutThreadFunc = function()
  calloutThread = GetCurrentThread()
  while true do
    Sleep(10)
    local n = table.getn(callouts)
    local id
    while n > 0 and id == nil do
      local item = TableGetRandomElement(callouts)
      id = Dialog_Play(item, SceneGetSceneAgent(SceneGetBottomScene()))
      if id == nil then
        Callout_Remove(item)
      end
    end
  end
end

local calloutActivate = function(bActive)
  if bActive then
    if not ThreadIsRunning(calloutThread) then
      calloutThread = ThreadStart(CalloutThreadFunc)
    end
  else
    ThreadKill(calloutThread)
    calloutThread = nil
  end
end

function dlgIdle(dlgItem, logicKey)
  while Logic[logicKey] do
    Dialog_PlayAndWait(dlgItem)
    Yield()
  end
end

local introDialogID

function hax()
  if introDialogID and DlgIsRunning(introDialogID) then
    RenderDelay(1)
    ControllerKill(DlgGetCurPlaybackController(introDialogID))
    DlgStop(introDialogID)
  end
end

local OriginalTelltaleLevelStartLogic = function()
  if IsEngineIPhone() or IsEngineAndroid() then
    preloadShaders()
  end
  Logic["Drugstore - Arrival"] = true
  if Logic["Drugstore - Secure"] then
    Logic["Drugstore - ArrivalComplete"] = true
    Logic["Drugstore - Window Boarded"] = true
    Logic["Drugstore - Window Barricaded"] = true
  end
  Mode(mode_thirdperson)
  Mode(mode_Main)
  CameraActivate("cam_nav")
  if not SaveLoad_IsFromLoad() then
    if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - DrugstoreStartFromWCZombie") then
      AgentSetProperty("logic_debug", "Debug - DrugstoreStartFromWCZombie", false)
      if Platform_IsWiiU() then
        print("Dialog Preloading start1")
        DlgPreload("env_drugstore.dlog", "cs_clementineOpensBathroom", 0, 15, 0, false)
      end
      introDialogID = Dialog_Play("cs_clementineOpensBathroom")
    elseif not IsToolBuild() or not GetPreferences()["Skip Intro Cutscenes"] then
      if Platform_IsWiiU() then
        print("Dialog Preloading start2")
        DlgPreload("env_drugstore.dlog", "Enter", 0, 15, 0, false)
      end
      introDialogID = Dialog_Play("Enter")
    end
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function Arrival()
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

SceneOpen(kScene, "Arrival")
