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

local kScript = "BoardingSchoolExteriorGateNight"
local kScene = "adv_boardingSchoolExteriorGateNight"

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

local kRaiderLimits = {
  xMin = 0.25,
  xMax = 0.75,
  yMin = 0.35,
  yMax = 0.65
}

local mbHardMode = false
local mbClemWonLastRound = false
local mbTimedOut = false
local mbAJRuthless, mLastAJPick, mLastClemPick
local mRPSWins = 0
local mRPSLosses = 0
local mConsecutiveDraws = 0
local mRaiderMonitorThread

local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  Episode_SetAbelArm()
  Episode_SetAJShirt()
  mbAJRuthless = not LogicGet("1 - AJ Compassionate")
  if LogicGet("Episode 401 - Let AJ Cuss") then
    LogicSet("3 - AJ Cussing Level", 9001)
  end
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_rockPaperScissors")
  end
end

local LookingAt = function(agent)
  local pos = AgentGetLogicalScreenPos(agent)
  if not pos or AgentIsHidden(agent) or not AgentIsOnScreen(agent) then
    return false
  end
  return pos.x >= kRaiderLimits.xMin and pos.x <= kRaiderLimits.xMax and pos.y >= kRaiderLimits.yMin and pos.y <= kRaiderLimits.yMax
end

local RaiderSearch = function(agent)
  local elapsedTime = 0
  local timeBuffer = 1.5
  while true do
    if Game_IsPlayMode() then
      if LookingAt(agent) then
        elapsedTime = elapsedTime + GetFrameTime() * SceneGetTimeScale(kScene)
        if timeBuffer <= elapsedTime then
          break
        end
      else
        elapsedTime = 0
      end
    end
    WaitForNextFrame()
  end
  Game_RunSceneDialog("cs_exit")
end

function BoardingSchoolExteriorGateNight_BestOf3()
  if mRPSWins == mRPSLosses or mRPSWins + mRPSLosses < 2 then
    Game_RunSceneDialog("cs_nextRound")
    return
  elseif mRPSWins > mRPSLosses then
    Game_RunSceneDialog("cs_clemWins")
  else
    Game_RunSceneDialog("cs_ajWins")
  end
  mRPSWins = 0
  mRPSLosses = 0
end

function BoardingSchoolExteriorGateNight_ClemThrow(clemPick)
  local GetWinner = function(move)
    return (move + 1) % 3
  end
  local GetLoser = function(move)
    return (move - 1) % 3
  end
  local ajPick
  if mbHardMode or not mLastClemPick then
    ajPick = RandomInt(0, 2)
  elseif mbTimedOut or mConsecutiveDraws >= 1 then
    if mbAJRuthless then
      ajPick = GetWinner(clemPick)
    else
      ajPick = GetLoser(clemPick)
    end
  elseif mbClemWonLastRound then
    if mbAJRuthless then
      ajPick = GetWinner(GetWinner(mLastClemPick))
    else
      ajPick = GetWinner(mLastClemPick)
    end
  elseif mbAJRuthless then
    ajPick = GetWinner(GetWinner(mLastAJPick))
  else
    ajPick = LogicGet("3 - AJ RPS Pick")
  end
  mLastClemPick = clemPick
  mLastAJPick = ajPick
  LogicSet("3 - AJ RPS Pick", ajPick)
  LogicIncrement("3 - RPS Rounds")
  Game_RunDialog("logic_ajThrow")
end

function BoardingSchoolExteriorGateNight_EndRound(bWin)
  mbTimedOut = false
  if bWin == true then
    mRPSWins = mRPSWins + 1
    mConsecutiveDraws = 0
  elseif bWin == false then
    mRPSLosses = mRPSLosses + 1
    mConsecutiveDraws = 0
  else
    mConsecutiveDraws = mConsecutiveDraws + 1
  end
end

function BoardingSchoolExteriorGateNight_Timeout()
  mbTimedOut = true
end

function BoardingSchoolExteriorGateNight_EnableRaiderSearch(bEnable)
  if bEnable == ThreadIsRunning(mRaiderMonitorThread) then
    return
  elseif bEnable == false then
    mRaiderMonitorThread = ThreadKill(mRaiderMonitorThread)
  else
    mRaiderMonitorThread = ThreadStart(RaiderSearch, "dummy_raider")
  end
end

local OriginalTelltaleLevelStartLogic = function()

end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function BoardingSchoolExteriorGateNight()
  RELIGHT_ConfigurationStart();

  RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    do return end --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlay
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

Callback_OnLogicReady:Add(OnLogicReady)

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  Game_SceneOpen(kScene, kScript)
else
  SceneOpen(kScene, kScript)
end