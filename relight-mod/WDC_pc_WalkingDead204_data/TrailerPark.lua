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

local kScript = "TrailerPark"
local kScene = "adv_trailerPark"

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

local kJaneClemMoveBodySFXDelayMax = 1.5
local kJaneClemMoveBodySFXDelayMin = 0.75
local mTruckPickupOutsideUseables = {
  "obj_truckPickupWindowUsePoint",
  "obj_truckPickupBedUsePoint"
}

local mTruckPickupInsideUseables = {
  "obj_truckPickupHornUsePoint",
  "obj_truckPickupIgnitionUsePoint"
}

local mMobileHomeDoorDialogTimerID, mLukeAndSarahPerilDialogID, mLukeSarahVolumeManagerThreadID, mZombieTrailerBGBlockingDialogID
local mRollTargetForSarahPerilVoice = 0.5
local mLukeAndSarahPerilDelayMin = 6
local mLukeAndSarahPerilDelayMax = 10
local mLukeSarahPerilVolumeCurrent = "full"
local mLukeSarahPerilVolumeChangeTo = "full"
local mClemAndJaneMoveBodySoundsDialogID
local mClemAndJaneMoveBodyProgressLast = 0

local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_VCOL_CC_TINT_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_VCOL_CC_TINT_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "256")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_ENV_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_ENV_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "70")
  end
end

local CombatReticleOnNav = function()
  while Game_GetMode() ~= eModeNavigate do
    Yield()
  end
  Reticle_EnableCombatMode()
end

local LukeSarahVolumeManager = function()

end

local tsBasedTimer = function(delayTime)
  if not delayTime or type(delayTime) ~= "number" then
    return
  end
  local curTime = GetTotalTime()
  local delay = curTime + delayTime
  local inc = 0
  while curTime < delay do
    inc = GetFrameTime() * SceneGetTimeScale(kScene)
    curTime = curTime + inc
    Yield()
  end
end

function TrailerPark_LukeSarahInPerilBGDialog(bPause, bStop, actionDelay)
  if actionDelay and type(actionDelay) == "number" then
    tsBasedTimer(actionDelay)
  end
  if bStop then
    if mLukeAndSarahPerilDialogID then
      DlgStop(mLukeAndSarahPerilDialogID)
      mLukeAndSarahPerilDialogID = nil
    end
  elseif bPause then
    if mLukeAndSarahPerilDialogID then
      DlgPause(mLukeAndSarahPerilDialogID)
    end
  elseif mLukeAndSarahPerilDialogID then
    DlgResume(mLukeAndSarahPerilDialogID)
  else
    mLukeAndSarahPerilDialogID = Game_RunDialog("bg_lukeSarah", false)
  end
end

function TrailerPark_LukeSarahInPerilBGDialogSetChanceForSarah(newValue)
  if newValue and type(newValue) == "number" then
    mRollTargetForSarahPerilVoice = newValue
  end
end

function TrailerPark_LukeSarahInPerilBGDialogDelay(newMinDelay, newMaxDelay, bOnlyUpdateMinMax)
  local pickSpeaker = function()
    if math.random() < mRollTargetForSarahPerilVoice then
      LogicSet("2 - Trailer Park Peril BG Speaker", "Sarah")
      print("speaker is Sarah!")
    else
      LogicSet("2 - Trailer Park Peril BG Speaker", "Luke")
      print("speaker is Luke!")
    end
  end
  if newMinDelay and type(newMinDelay) == "number" then
    mLukeAndSarahPerilDelayMin = newMinDelay
  end
  if newMaxDelay and type(newMaxDelay) == "number" then
    mLukeAndSarahPerilDelayMax = newMaxDelay
  end
  if not bOnlyUpdateMinMax then
    local delayTime = math.random(mLukeAndSarahPerilDelayMin, mLukeAndSarahPerilDelayMax)
    tsBasedTimer(delayTime)
    pickSpeaker()
    print("-->Luke and Sarah panic now!!!<--")
  end
end

function TrailerPark_ClemJaneMoveBodyBGDialog(bPause, bStop)
  if bStop then
    if mClemAndJaneMoveBodySoundsDialogID then
      DlgStop(mClemAndJaneMoveBodySoundsDialogID)
      mClemAndJaneMoveBodySoundsDialogID = nil
    end
  elseif bPause then
    if mClemAndJaneMoveBodySoundsDialogID then
      DlgPause(mClemAndJaneMoveBodySoundsDialogID)
    end
  elseif mClemAndJaneMoveBodySoundsDialogID then
    DlgResume(mClemAndJaneMoveBodySoundsDialogID)
  else
    mClemAndJaneMoveBodySoundsDialogID = Game_RunDialog("bg_clemJaneMoveBody", false)
  end
end

function TrailerPark_ClemJaneMoveBodySfxDelay()
  Sleep(math.random(kJaneClemMoveBodySFXDelayMin, kJaneClemMoveBodySFXDelayMax))
  local moveBodyProgressCur = AgentGetProperty("struggle_zombieToPickupHorn", "Button Mash - Current Percentage")
  while not AgentGetProperty("struggle_zombieToPickupHorn", "Struggle - Complete") and (SceneGetTimeScale() < 1 or moveBodyProgressCur <= mClemAndJaneMoveBodyProgressLast) do
    Yield()
    mClemAndJaneMoveBodyProgressLast = moveBodyProgressCur
    moveBodyProgressCur = AgentGetProperty("struggle_zombieToPickupHorn", "Button Mash - Current Percentage")
  end
  mClemAndJaneMoveBodyProgressLast = moveBodyProgressCur
end

function TrailerPark_MakeAllObjsUnselectable()
  for key, value in pairs(SceneGetAgents(kScene)) do
    if Game_IsUseable(value) then
      AgentSetSelectable(value, false)
    end
  end
end

function TrailerPark_TruckInsideObjsMakeSelectable()
  for key, value in pairs(mTruckPickupInsideUseables) do
    AgentSetSelectable(value, true)
  end
end

function TrailerPark_TruckOutsideObjsMakeSelectable()
  for key, value in pairs(mTruckPickupOutsideUseables) do
    AgentSetSelectable(value, true)
  end
end

function TrailerPark_TruckInsideUsedIgnition()
  LogicSet("2 - Examined Truck Ignition", true)
  if #mTruckPickupInsideUseables > 1 then
    table.remove(mTruckPickupInsideUseables)
  end
end

function TrailerPark_TruckOutsideUsedBed()
  LogicSet("2 - Examined Truck Bed", true)
  if #mTruckPickupOutsideUseables > 1 then
    table.remove(mTruckPickupOutsideUseables)
  end
end

function TrailerPark_ZombieTrailerBGBlockingDialog(bPause, bStop)
  if bStop then
    if mZombieTrailerBGBlockingDialogID then
      DlgStop(mZombieTrailerBGBlockingDialogID)
      mZombieTrailerBGBlockingDialogID = nil
    end
  elseif bPause then
    if mZombieTrailerBGBlockingDialogID then
      DlgPause(mZombieTrailerBGBlockingDialogID)
    end
  elseif mZombieTrailerBGBlockingDialogID then
    DlgResume(mZombieTrailerBGBlockingDialogID)
  else
    mZombieTrailerBGBlockingDialogID = Game_RunDialog("bg_blockingZombieScare", false)
  end
end

function TrailerPark_MobileHomeDoorTimer(bStart)
  if bStart then
    print("Walkers advancing on Mobile Home door!")
    mMobileHomeDoorDialogTimerID = Game_RunDialog("bg_mobileHomeDoorZombieApproach", false)
  elseif mMobileHomeDoorDialogTimerID then
    print("DOOR IS BREACHED!")
    DlgStop(mMobileHomeDoorDialogTimerID)
    mMobileHomeDoorDialogTimerID = nil
  end
end

function TrailerPark_ActivateZombieFence1UsePoints()
  AgentSetProperty("obj_zombieFence1UsePoint_knee", "Game Selectable", true)
end

function TrailerPark_LockBreakBGDialog()
  local dialogID = Game_RunDialog("bg_struggle_lock", false)
  while DlgIsRunning(dialogID) do
    Yield()
  end
  AgentSetProperty("struggle_lock", "Button Mash - Max Percentage", 0)
end

function TrailerPark_ChoredMoveThroughTrailer()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_trailerPark_move_trailer.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_reachDoor")
  Yield()
  if not Navigate_IsEnabled() then
    Navigate_Enable(true)
  end
  ChoredMovement_Start()
end

function TrailerPark_NavOffAfterChoredMove()
  while Game_GetMode() ~= eModeNavigate do
    Yield()
  end
  local navOn = Navigate_IsEnabled()
  if navOn then
    Navigate_Enable(false)
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if not Game_GetLoaded() and Game_GetDebug() then
    if LogicGet("2 - Went Through Trailer") then
      TrailerPark_LukeSarahInPerilBGDialog()
      Inventory_AddItem("glassesSarah")
      AgentSetProperty("Jane", "Mesh sk55_jane_gunBelt - Visible", true)
      AgentSetProperty("Jane", "Mesh sk55_jane_gunGlock - Visible", true)
      LogicSet("2 - Reached Trailer Park", true)
      LogicSet("2 - Killed ZombieFence", true)
      LogicSet("2 - Barricade Zombies Cleared", true)
      LogicSet("2 - Active Trailer Park Station", "freewalk")
      AgentSetProperty("dummy_zombiesBarricadeADVManager", "Walk Animation - Idle", "")
      AgentSetProperty("ZombieTrailer2", "Runtime: Visible", true)
      AgentSetProperty("ZombieBackground1", "Runtime: Visible", true)
      AgentSetProperty("ZombieBackground2", "Runtime: Visible", true)
      AgentSetProperty("ZombieBackground4", "Runtime: Visible", true)
      AgentSetProperty("ZombieTrailer1", "Walk Animation - Idle", "adv_trailerPark_zombieTrailer1Dead.chore")
      AgentSetProperty("ZombieTrailer3", "Walk Animation - Idle", "adv_trailerPark_zombieTrailer3Dead.chore")
      Game_SetSceneDialogNode("cs_phase2")
    elseif LogicGet("2 - Killed ZombieFence") then
      LogicSet("2 - Reached Trailer Park", true)
      Inventory_AddItem("glassesSarah")
      AgentSetProperty("Jane", "Mesh sk55_jane_gunBelt - Visible", true)
      AgentSetProperty("Jane", "Mesh sk55_jane_gunGlock - Visible", true)
      ThreadStart(CombatReticleOnNav)
      Game_SetSceneDialogNode("cs_enterPark")
    elseif LogicGet("2 - Reached Trailer Park") then
      Game_SetSceneDialogNode("cs_arriveTrailerPark")
    end
  end
  if Game_GetLoaded() then
    if LogicGet("2 - Reached Trailer Park") and not LogicGet("2 - Went Through Trailer") then
      print("restart Luke'n Sarah BG VO")
      TrailerPark_LukeSarahInPerilBGDialog()
    end
    if LogicGet("2 - Examined Truck Bed") then
      TrailerPark_TruckOutsideUsedBed()
    end
    if LogicGet("2 - Examined Truck Ignition") then
      TrailerPark_TruckInsideUsedIgnition()
    end
  end
  if LogicGet("2 - Active Trailer Park Station") == "freewalk" then
    Navigate_Enable(true)
  else
    Navigate_Enable(false)
  end
  Game_StartScene()
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function TrailerPark()
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

SceneOpen(kScene, kScript)
