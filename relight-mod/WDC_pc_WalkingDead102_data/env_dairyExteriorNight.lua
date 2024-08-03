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

local kScript = "DairyExteriorNight"
local kScene = "adv_dairyExteriorNight"

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

require("Rain.lua")

local mThreadMovementMonitor

local PunchReticleUpdate = function()
  Print("Updating Reticle!")
  Reticle_Update(true)
end

local MovementMonitor = function()
  while true do
    Yield()
    if mode_Chored_Movement.bActive and ChoredMovement_GetMoveDir() ~= 0 then
      Dialog_Play("cs_brendaKillsLee", nil, nil, "dairyMainHouseInterior_lee_brenda")
      return
    end
  end
end

local OnPointGun = function(key, value)
  if mThreadMovementMonitor then
    ThreadKill(mThreadMovementMonitor)
    mThreadMovementMonitor = nil
  end
  if value then
    mThreadMovementMonitor = ThreadStart(MovementMonitor)
  end
end

local kNoseDamage = {
  "Mesh sk54_andy_nose - Visible",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "Mesh sk54_andy_noseDamageA - Visible",
  "",
  "Mesh sk54_andy_noseDamageB - Visible",
  "",
  "Mesh sk54_andy_noseDamageC - Visible",
  "",
  ""
}

local kTeethDamage = {
  "Mesh sk54_andy_teeth - Visible",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "Mesh sk54_andy_teethDamaged - Visible"
}

local kLeftEyeDamage = {
  "Mesh sk54_andy_eyeLeft - Visible",
  "Mesh sk54_andy_eyeLeftDamageA - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_eyeLeftDamageB - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_eyeLeftDamageC - Visible",
  "",
  "",
  "",
  "",
  ""
}

local kLeftMouthDamage = {
  "Mesh sk54_andy_mouthLeft - Visible",
  "",
  "",
  "Mesh sk54_andy_mouthLeftDamageA - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_mouthLeftDamageB - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_mouthLeftDamageC - Visible",
  "",
  "",
  ""
}

local kRightEyeDamage = {
  "Mesh sk54_andy_eyeRight - Visible",
  "Mesh sk54_andy_eyeRightDamageA - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_eyeRightDamageB - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_eyeRightDamageC - Visible",
  "",
  "",
  "",
  "",
  ""
}

local kRightMouthDamage = {
  "Mesh sk54_andy_mouthRight - Visible",
  "",
  "",
  "Mesh sk54_andy_mouthRightDamageA - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_mouthRightDamageB - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_mouthRightDamageC - Visible",
  "",
  "",
  ""
}

local DamageFacePart = function(keyTable, punchNumber)
  if keyTable[punchNumber] == "" then
    return
  end
  for i = 1, punchNumber - 1 do
    if keyTable[i] ~= "" then
      AgentSetProperty("Andy", keyTable[i], false)
    end
  end
  AgentSetProperty("Andy", keyTable[punchNumber], true)
end

function AndyFight_DamageFace(bLeftSide)
  local totalPunches = Logic["3AndyFight - FacePunches"]
  DamageFacePart(kNoseDamage, totalPunches)
  DamageFacePart(kTeethDamage, totalPunches)
  if bLeftSide then
    local thisSidePunches = Logic["3AndyFight - FacePunchesLeft"]
    DamageFacePart(kRightEyeDamage, thisSidePunches)
    DamageFacePart(kRightMouthDamage, thisSidePunches)
  else
    local thisSidePunches = Logic["3AndyFight - FacePunchesRight"]
    DamageFacePart(kLeftEyeDamage, thisSidePunches)
    DamageFacePart(kLeftMouthDamage, thisSidePunches)
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  Main_AllowMovement(false)
  local logicProps = AgentGetProperties("logic_game")
  PropertyAddKeyCallback(logicProps, "3AndyFight - Left Punch Ready", PunchReticleUpdate)
  PropertyAddKeyCallback(logicProps, "3AndyFight - Right Punch Ready", PunchReticleUpdate)
  if not Logic["3Rescue - Complete"] then
    PropertyAddKeyCallback(logicProps, "3Rescue - Gun Pointed At Lee", OnPointGun)
  end
  Rain("fx_rainSphereWD")
  if not Platform_IsPC() then
    AgentSetProperty("fx_rainSphereWD", "fx_rainHeavyWD - Visible", false)
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  if IsToolBuild() then
    if Logic["3Rescue - Debug to Rescue"] then
      Dialog_Play("logic_selectablesOff")
      Dialog_Play("cs_runToHouse")
      return
    end
    if Logic["3AndyFight - DebugToKillChoice"] then
      Dialog_Play("logic_selectablesOff")
      Dialog_Play("choice_Setup")
      return
    end
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Exterior Night")
      DlgPreload("env_dairyExterior_TrappingAndy.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function DairyExteriorNight()
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
