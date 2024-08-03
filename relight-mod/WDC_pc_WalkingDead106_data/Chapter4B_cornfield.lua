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

local kScript = "Chapter4B"
local kScene = "adv_cornfieldCh4"
local kSceneAgent = "adv_cornfieldCh4.scene"

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
require("mode_drag.lua")
require("VirtualStick.lua")

local kCutsceneAnchor = "obj_cornfieldCutsceneAnchor"
local kbDoConsolePrints = true
local kSpawnPursuers = true
local kPreventPursuerKills = false
local kSuppressPursuerPanicMeter = false
local kPursuerSpawnPositionTest = 0
local kPursuerSpawnPosToBlockHeadOn = {
  1,
  2,
  4,
  5
}

local kPursuerSpawnOffsetZ_headOn = 28.5
local kPursuerSpawnOffsetZ_fromSide = 20
local kPursuerSpawnOffsetZ_fromSideClose = 15.5
local kPlayerInCornrowBaseWorldPosX = 82.25
local kPursuerSpawnOffsets = {}

kPursuerSpawnOffsets.HeadOn = {
  Forward = {
    x = 0,
    y = 0,
    z = kPursuerSpawnOffsetZ_headOn
  },
  Backward = {
    x = 0,
    y = 0,
    z = -1 * kPursuerSpawnOffsetZ_headOn
  }
}

kPursuerSpawnOffsets.HeadOnInLeftRow = {
  Forward = {
    x = 2,
    y = 0,
    z = kPursuerSpawnOffsetZ_headOn
  },
  Backward = {
    x = -2,
    y = 0,
    z = -1 * kPursuerSpawnOffsetZ_headOn
  }
}

kPursuerSpawnOffsets.HeadOnInRightRow = {
  Forward = {
    x = -2,
    y = 0,
    z = kPursuerSpawnOffsetZ_headOn
  },
  Backward = {
    x = 2,
    y = 0,
    z = -1 * kPursuerSpawnOffsetZ_headOn
  }
}

kPursuerSpawnOffsets.FromLeft = {
  Forward = {
    x = 14,
    y = 0,
    z = kPursuerSpawnOffsetZ_fromSide
  },
  Backward = {
    x = -14,
    y = 0,
    z = -1 * kPursuerSpawnOffsetZ_fromSide
  }
}

kPursuerSpawnOffsets.FromRight = {
  Forward = {
    x = -14,
    y = 0,
    z = kPursuerSpawnOffsetZ_fromSide
  },
  Backward = {
    x = 14,
    y = 0,
    z = -1 * kPursuerSpawnOffsetZ_fromSide
  }
}

kPursuerSpawnOffsets.FromLeftClose = {
  Forward = {
    x = 14,
    y = 0,
    z = kPursuerSpawnOffsetZ_fromSideClose
  },
  Backward = {
    x = -14,
    y = 0,
    z = -1 * kPursuerSpawnOffsetZ_fromSideClose
  }
}

kPursuerSpawnOffsets.FromRightClose = {
  Forward = {
    x = -14,
    y = 0,
    z = kPursuerSpawnOffsetZ_fromSideClose
  },
  Backward = {
    x = 14,
    y = 0,
    z = -1 * kPursuerSpawnOffsetZ_fromSideClose
  }
}

local kPursuerOverrideFlashlightAttach = false
local kPursuerDeeTrigger = "trigger_PursuerDeeReachesTractor"
local kEnablePursuerDeeTrigger = true
local kDelayForBonnieNeedsWeaponAmbient = 18
local kStealthSeqTime = 33
local kStealthSeqTimerAgent = "timer_stealthSequence"
local kEndStealthBackupTimerTime = 7.5
local kCampPeopleReaction1Time = 15
local kCampPeopleConfabTime = 25
local kCampPeopleReaction2Enabled = false
local kCampPeopleReaction2Time = 35
local kMysteryShotsTime = 0.5
local kSequenceDelayBeforeShots = 2.5
local kRepeatMysteryShots = false
local kSequenceCoolDownTime = 1.5
local kPursuerTimerAgent = "timer_pursuerSpawnDelay"
local kPursuerHeadOnTimerAgent = "timer_ForceHeadOnPursuer"
local kPursuerHeadOnTimerLength = 12
local kPursuerSpawnDelayMin = 5
local kPursuerSpawnDelayMax = 8
local kPursuerSpawnDelayStarting = 0.25
local kPlayerInactivityTimerEnabled = false
local kPlayerInactivityTimerAgent = "timer_playerInactivity"
local kPlayerInactivityFlashlightAgent = "obj_sneakyFlashlight"
local kPlayerInactivityFlashlightMoveInc = 0.025
local kPlayerInactivityTimerLength = 5
local kPlayerInactivityTimerWarnFraction = 0.5
local kPlayerInactivityTimerMulti = 1
local kPursuerDeeIdleLoopsBeforeApproach = 0
local kPursuerDeeMinRestartTime = 30.5
local kPursuerDeeMaxRestartTime = 30.5

if Input_IsUsingTouch() then
  kPursuerDeeMinRestartTime = 27.5
  kPursuerDeeMaxRestartTime = kPursuerDeeMinRestartTime
end

local kPursuerBanterMinDelay = 3
local kPursuerBanterMaxDelay = 8
local kPursuerFactorForCeleb = 0.25
local kSoundSuffix = ".wav"
local kDirtFootstepSoundPrefix = "fs_BootOnDirt"
local kDirtFootstepSoundsMax = 15
local kAmbientRustleSoundPrefix = "amb_foliage_rustle_"
local kAmbientRustleSoundsMin = 4
local kAmbientRustleSoundsMax = 16
local kPursuerSoundEmittersAllowedMax = 4
local kCornEndChoreTimeTargetIncrement = 3

local kCamsToScaleInRain = {
  names = {
    "cam_Dee_CU",
    "cam_Dee_LelandOTS"
  },
  scales = {1, 0.25}
}

local kCornfieldInputMap = "Cornfield.imap"
local anchorPos = Vector()
local pAnchorPos = Vector()
local playerStartAgent = "obj_playerStartCornfield"
local playerAgent = "Bonnie"
local playerAgentWalkAnims = {}
playerAgentWalkAnims.Normal = {}
playerAgentWalkAnims.Normal.Forward = "sk55_move_bonnieRun.chore"
playerAgentWalkAnims.Normal.Idle = "sk55_idle_bonniestanda.chore"
playerAgentWalkAnims.Clearing = {}
playerAgentWalkAnims.Clearing.Forward = ""
playerAgentWalkAnims.Clearing.Idle = "adv_cornfieldCh4_bonnie_CrouchHideBehindTractor.chore"
playerAgentWalkAnims.Stealth = {}
playerAgentWalkAnims.Stealth.Forward = "sk55_bonnie_sneak.anm"
playerAgentWalkAnims.Stealth.Idle = "sk55_idle_bonnie_cornfield_stealth.chore"
local kCornrowAgentsMaster = "obj_corn_ScrollingStalks_All"

local kCornrowAgentsCentral = {
  "obj_corn_ScrollingStalks_chunkN1",
  "obj_corn_ScrollingStalks_chunkC",
  "obj_corn_ScrollingStalks_chunkS1"
}

local kCornrowVisTriggers = {
  "trigger_cornVisCenter",
  "trigger_cornVisNorth",
  "trigger_cornVisNorth2",
  "trigger_cornVisNorth3",
  "trigger_cornVisNorth4",
  "trigger_cornVisNorth5",
  "trigger_cornVisNorth6",
  "trigger_cornVisNorth7",
  "trigger_cornVisSouth"
}

local kCornrowMaxChunks = 7
local kCornfieldIdleAnims = {}

kCornfieldIdleAnims.chores = {
  "obj_cornstalk_leanfront.chore",
  "obj_cornstalk_leanback.chore",
  "obj_cornstalk_leanleft.chore",
  "obj_cornstalk_leanright.chore"
}

kCornfieldIdleAnims.rots = {
  90,
  -90,
  0,
  0
}

local kCampCharacters = {
  "Clive",
  "Roman",
  "Shel",
  "Stephanie"
}

local kEnvAgentsForNormalGameplay = {
  "adv_cornfieldCh4_meshesA",
  "adv_cornfieldCh4_meshesB",
  "obj_corn_fixedStalks",
  "obj_cornTileBackground",
  "obj_busPrisonerLow",
  "obj_cornfieldCh4CarsA",
  "obj_cornfieldCh4CarsB",
  "obj_cornfieldCh4CarsFlatsA",
  "obj_cornfieldCh4CarsFlatsB",
  "obj_cornfieldCh4RoadGrassA",
  "obj_cornfieldCh4RoadGrassB",
  "obj_cornfieldCh4RoadGrassC",
  "obj_folliageCornfieldCh4A",
  "obj_folliageCornfieldCh4B",
  "obj_folliageCornfieldCh4C",
  "obj_skydomeCornfieldCh4",
  "obj_backdropCornfieldCh4",
  "fx_rainSphereWD"
}

local kEnvAgentsForStealthGameplay = {
  "obj_corn_ScrollingStalks_All",
  "obj_skydomeCornfieldCh4",
  "obj_backdropCornfieldCh4",
  "fx_rainSphereWD"
}

local kEnvAgentsForClearingGameplay = {
  "obj_folliageCornfieldCh4C",
  "dummy_attach_Bonnie",
  "obj_playerStartClearing",
  "obj_tractorCornField",
  "obj_rebar",
  "obj_rebar_usePoint",
  "adv_cornfieldCh4_meshesB",
  "obj_skydomeCornfieldCh4",
  "obj_backdropCornfieldCh4",
  "fx_rainSphereWD",
  "adv_cornfieldCh4_meshesB",
  "obj_corn_fixedStalks",
  "obj_cornTileBackground",
  "obj_cornStalksGround",
  "obj_grassCornfieldDeeDeath",
  "obj_grassCornfieldDeeDeath01",
  "obj_grassCornfieldDeeDeath02",
  "obj_grassCornfieldDeeDeath03",
  "obj_grassCornfieldDeeDeath04",
  "obj_grassCornfieldDeeDeath05",
  "obj_grassCornfieldDeeDeath06",
  "obj_grassCornfieldDeeDeath07"
}

local numGuys = 6
local numCelebGuys = 4
local CelebGuyIDsToSkip = {2, 4}
local pParent
local pTimer = false
local pAnchorTracker = 0
local bFirstMove = true
local kPursuerPanicMeterTimer = "timer_PursuerReachesBonnie"
local kPursuerPanicMeterRampDownDecrement = 0.025
local kPursuerPanicMeterRampDownCoolDown = 1.5
local kPursuerPanicMeterTriggerExtentsMax = Vector(0.3, 2, 29)
local kPanicMeterUpdateFudgeFactor = 0.2

local kCornfieldFogColor = {
  r = 0.42745,
  g = 0.42745,
  b = 0.42745,
  a = 1
}

local kCornfieldFogFarPlane = 14
local kCornfieldFogNearPlane = 2

local kUIvibratePos = {
  x = 0,
  y = -1.1,
  z = 0
}

local kChanceForBonnieReaction = 0.7
local kChanceForBonnieReactionMulti = 0.95
gChapter4B_Cornfield_ChoredMovesStartTime = 90
gChapter4B_Cornfield_CurrentLocTrigger = "trigger_cornVisCenter"
gChapter4B_Cornfield_OkayForPursuerCloseCall = false
gChapter4B_Cornfield_DoABonniePursuerReaction = false
gChapter4B_Cornfield_BonnieIsReacting = false
gChapter4B_Cornfield_DeeCaughtBonnie = false
gChapter4B_Cornfield_TriedAClearingObj = false
gChapter4B_Cornfield_DeadFromInactivity = false

local mOutsideCornfieldFogColor = {
  r = 0.309804,
  g = 0.301961,
  b = 0.423529,
  a = 1
}

local mOutsideCornfieldFogFarPlane = 1400
local mOutsideCornfieldFogNearPlane = 2
local mSequenceActive = false
local mEndStealthBackupTimerExpired = false
local mbOkayToUpdateDirection = true
local mCornfieldCameraActive = false
local mOkayToSpawnPursuers = false
local mStealthPositionChangeActive = false
local mStealthPositionChange_ShiftActive = false
local mStealthPositionChange_TurnaroundActive = false
local mPursuerTimerThread
local mLastPursuerSpawnPosIndex = 0
local mbBadGuysShifting = false
local mPursuerPanicMeterLastProgress = 0
local mPursuerPanicMeterThread, mPursuerPanicMeterRampDownThread, mCornfieldSeqTimerThread
local mbMysteryShotsFiring = false
local mbMysteryShotsFired = false
local mPursuerBanterActive = false
local mPursuerForceNextToBeHeadOn = false
local mPursuerLastHeadOn, mPursuerTriggerLastHeadOn
local mPursuerForceNextToBeCloseCall = false
local mPursuerHeadOnBeforeRomanArrives, mPursuerTriggerHeadOnBeforeRomanArrives
local mPursuerSoundEmittersActive = 0
local mActivePursuers = {}
local mActivePursuersControllers = {}
local mActivePursuersPositions = {}
local mSpawningCloseCallPursuer = false
local mUIvibrateThread
local mUIvibrateAgent = "ui_reticle_gamePad1"
local mUI_PressAndHoldAnimateThread
local mOkayToVibrateUI = false
local mUIvibrateChore
local mChoredMovementTime_current = 0
local mChoredMovementTime_last = 0
local mChoredMovementTrackerThread, mPursuerDeeController
local mbShownPressAndHoldTut = false
local mGotADirForRebarDrag = false
local mChanceForBonnieReaction = kChanceForBonnieReaction
local mPanicMeterRampDownActive = false
local mbPlayerIsDying = false
local mbHeadOnPursuerTriggerActivated = false
local mbOKForNeedWeaponAmbient = true
local mRainScale, mScriptedEventsThread, mReticleNoiseController, mSneakyFlashlightPosBase
local mAdvanceSneakyFlashlight = false
local mCornEndChoreTimeTarget = 0
local mCornEndFired = false
local mbOKForCampPeopleReaction1 = false
local mbOKForCampPeopleReaction2 = false
local mbOKForCampPeopleConfab = false
local mbScriptedEventActive = false
local mPlayerLookingBack = false
local mStealthMoveController

local consolePrint = function(str)
  if kbDoConsolePrints then
    print(str)
  end
end

local LeadingZero = function(number)
  if not number then
    return ""
  end
  if number < 10 then
    return "0" .. tostring(number)
  else
    return tostring(number)
  end
end

local TimedDelay = function(timerAgent, delay)
  AgentSetProperty(timerAgent, "Timer Enabled", false)
  AgentSetProperty(timerAgent, "Timer Progress", 0)
  Yield()
  AgentSetProperty(timerAgent, "Timer Length", delay)
  AgentSetProperty(timerAgent, "Timer Enabled", true)
  Yield()
  while AgentGetProperty(timerAgent, "Timer Progress") < 1 do
    Yield()
  end
end

local DoScriptedEvent = function(dlogNode, banterReturnDelay, tCharacterAgents, bForceEndStealth)
  if mbPlayerIsDying then
    return
  end
  mbScriptedEventActive = true
  Yield()
  banterReturnDelay = banterReturnDelay or 0
  AgentSetProperty(kPlayerInactivityTimerAgent, "Timer Enabled", false)
  local ref = AgentGetWorldPos(playerAgent)
  local rot
  if Logic["Cornfield - Forward"] == true then
    rot = Vector(0, 0, 0)
  else
    rot = Vector(0, 180, 0)
  end
  AgentSetPos(kCutsceneAnchor, ref)
  AgentSetRot(kCutsceneAnchor, rot)
  if tCharacterAgents and type(tCharacterAgents) == "table" then
    for key, value in pairs(tCharacterAgents) do
      if AgentExists(value) then
        AgentAttach(value, kCutsceneAnchor)
        AgentSetPos(value, Vector(0, 0, 0))
        AgentSetRot(value, rot)
        AgentHide(value, false)
      end
    end
  end
  Dialog_PlayAndWait(dlogNode)
  if tCharacterAgents and type(tCharacterAgents) == "table" then
    for key, value in pairs(tCharacterAgents) do
      if AgentExists(value) then
        AgentDetach(value, true)
        AgentHide(value, true, true)
      end
    end
  end
  mbScriptedEventActive = false
  Yield()
  if kPlayerInactivityTimerEnabled then
    AgentSetProperty(kPlayerInactivityTimerAgent, "Timer Enabled", true)
  end
  if bForceEndStealth then
    Logic["Cornfield - bSceneTimer"] = false
  else
    AgentSetProperty(kStealthSeqTimerAgent, "Timer Enabled", true)
    Chapter4B_Cornfield_StartPursuerBanter(banterReturnDelay)
  end
end

local HideCornForMysteryShots = function(bHide)
  bHide = bHide or false
  local objPrefix = "obj_cornStalk"
  local chunk = AgentGetName(AgentGetParent(gChapter4B_Cornfield_CurrentLocTrigger))
  local objs = AgentGetChildren(chunk)
  for key, value in pairs(objs) do
    local agentName = AgentGetName(value)
    local agentPos = AgentGetPos(agentName)
    if string.find(agentName, objPrefix) and agentPos.z < 0 then
      AgentHide(agentName, bHide, true)
    end
  end
end

local UpdateSneakyFlashlight = function()
  mSneakyFlashlightPosBase = AgentGetPos(kPlayerInactivityFlashlightAgent)
  local sneakLightCurPos
  while mSequenceActive do
    sneakLightCurPos = AgentGetPos(kPlayerInactivityFlashlightAgent)
    if mAdvanceSneakyFlashlight then
      if AgentIsHidden(kPlayerInactivityFlashlightAgent) then
        AgentHide(kPlayerInactivityFlashlightAgent, false, true)
      end
      if sneakLightCurPos.z < 0 then
        AgentSetPos(kPlayerInactivityFlashlightAgent, Vector(sneakLightCurPos.x, sneakLightCurPos.y, sneakLightCurPos.z + kPlayerInactivityFlashlightMoveInc))
      end
    elseif sneakLightCurPos.z > mSneakyFlashlightPosBase.z then
      AgentSetPos(kPlayerInactivityFlashlightAgent, Vector(sneakLightCurPos.x, sneakLightCurPos.y, sneakLightCurPos.z - kPlayerInactivityFlashlightMoveInc))
    elseif not AgentIsHidden(kPlayerInactivityFlashlightAgent) then
      AgentHide(kPlayerInactivityFlashlightAgent, true, true)
    end
    Yield()
  end
end

local IsPursuerOnScreen = function(i)
  local pursuer = "Pursuer" .. i
  local pursuerFlashlight = "Flashlight" .. i
  local pursuerCeleb = "CelebrityPursuer" .. i
  local pursuerCelebFlashlight = "CelebrityFlashlight" .. i
  if AgentExists(pursuerCeleb) then
    if AgentIsHidden(pursuer) and AgentIsHidden(pursuerFlashlight) and AgentIsHidden(pursuerCeleb) and AgentIsHidden(pursuerCelebFlashlight) then
      return false
    end
  elseif AgentIsHidden(pursuer) and AgentIsHidden(pursuerFlashlight) then
    return false
  end
  if AgentExists(pursuerCeleb) and (AgentIsOnScreen(pursuerCeleb) or AgentIsOnScreen(pursuerCelebFlashlight)) then
    return true
  end
  if AgentIsOnScreen(pursuer) or AgentIsOnScreen(pursuerFlashlight) then
    return true
  end
  return false
end

local WaitForNoCrossingHeadonPursuers = function()
  local okToProceed = true
  repeat
    okToProceed = true
    while mStealthPositionChangeActive do
      Yield()
    end
    for i = 1, numGuys do
      for key, value in pairs(kPursuerSpawnPosToBlockHeadOn) do
        if mActivePursuers[i] == true and mActivePursuersPositions[i] == value and IsPursuerOnScreen(i) then
          okToProceed = false
          break
        end
      end
    end
    Yield()
  until okToProceed == true
end

local WaitForAllPursuersToBeOffscreen = function()
  local okToProceed = true
  repeat
    okToProceed = true
    while mStealthPositionChangeActive do
      Yield()
    end
    for i = 1, numGuys do
      if IsPursuerOnScreen(i) then
        okToProceed = false
        break
      end
    end
    Yield()
  until okToProceed == true
end

local WaitForAllPursuersToDespawn = function()
  local okToProceed = true
  repeat
    okToProceed = true
    for key, value in pairs(mActivePursuersControllers) do
      if ControllerIsPlaying(value) then
        okToProceed = false
        break
      end
    end
    Yield()
  until okToProceed == true
end

local AssignCornfieldIdles = function(chunk)
  if not chunk then
    return
  end
  local objPrefix = "obj_cornStalk"
  local objs = AgentGetChildren(chunk)
  local masterAnimObjs = {
    nil,
    nil,
    nil,
    nil
  }
  for key, value in pairs(objs) do
    local agentName = AgentGetName(value)
    local agentPos = AgentGetPos(agentName)
    local agentRot = AgentGetRot(agentName)
    local agentIndex = 1
    if string.find(agentName, objPrefix) then
      for i = 1, #kCornfieldIdleAnims.rots do
        if math.floor(agentRot.y) == kCornfieldIdleAnims.rots[i] then
          agentIndex = i
          break
        end
      end
      if agentPos.z > 0 then
        if agentIndex == 1 then
          agentIndex = 2
        elseif agentIndex == 2 then
          agentIndex = 1
        else
          agentIndex = 4
        end
      end
      if AgentHasProperty(value, "Walk Animation - Idle") and AgentHasProperty(value, "Render Share Skeleton With Agent") then
        local curWalkIdle = AgentGetProperty(value, "Walk Animation - Idle")
        local curSharedSkeleton = AgentGetProperty(value, "Render Share Skeleton With Agent")
        if curWalkIdle == nil and curSharedSkeleton == "" then
          if masterAnimObjs[agentIndex] == nil then
            AgentSetProperty(agentName, "Walk Animation - Idle", kCornfieldIdleAnims.chores[agentIndex])
            masterAnimObjs[agentIndex] = agentName
          else
            AgentSetProperty(agentName, "Render Share Skeleton With Agent", masterAnimObjs[agentIndex])
          end
        else
        end
      end
    end
  end
end

local PlayBonnieNeedsWeaponAmbient = function()
  TimedDelay("timer_BonnieWeaponHint", kDelayForBonnieNeedsWeaponAmbient)
  if not mbShownPressAndHoldTut and not Logic["4 - Got the Rebar"] and not mbPlayerIsDying and not gChapter4B_Cornfield_DeeCaughtBonnie then
    while not mbOKForNeedWeaponAmbient do
      Yield()
    end
    consolePrint("Playing Bonnie weapon hint!")
    Dialog_Play("ambient_BonnieInClearing")
  end
end

local UI_Vibrate_Callback = function(propSet, bEnabled)
  local vibration = function()
    while SceneIsActive(kScene) and mOkayToVibrateUI do
      local randXDeltaMaxFrac = 0.05
      local randYDeltaMaxFrac = 0.05
      local multi = 1
      local coinFlip = math.random()
      if coinFlip < 0.5 then
        multi = -1
      end
      local randXDelta = math.random() * randXDeltaMaxFrac * multi
      local randYDelta = math.random() * randYDeltaMaxFrac * multi
      local newPos = {
        x = kUIvibratePos.x + randXDelta,
        y = kUIvibratePos.y + randYDelta,
        z = kUIvibratePos.z
      }
      AgentSetPos(mUIvibrateAgent, Vector(newPos.x, newPos.y, newPos.z))
      Yield()
    end
  end
  if bEnabled then
    if not ThreadIsRunning(mUIvibrateThread) then
      mUIvibrateThread = ThreadStart(vibration)
      consolePrint("UI vibrate started!")
    end
  elseif ThreadIsRunning(mUIvibrateThread) then
    ThreadKill(mUIvibrateThread)
    Yield()
    AgentSetPos(mUIvibrateAgent, Vector(kUIvibratePos.x, kUIvibratePos.y, kUIvibratePos.z))
    consolePrint("UI vibrate stopped!")
  end
end

local SetupPressAndHoldUIVibration = function()
  while not AgentExists(mUIvibrateAgent) do
    Yield()
  end
  consolePrint("UI vibrate agent pos set! it's " .. kUIvibratePos.x .. ", " .. kUIvibratePos.y .. ", " .. kUIvibratePos.z)
  PropertyAddKeyCallback(AgentGetProperties(mUIvibrateAgent), "Motion Blur Enabled", UI_Vibrate_Callback)
end

local LoopPressAndHoldUIChore = function()
  while SceneIsActive(kScene) do
    consolePrint("Looping UI anim!")
    mUIvibrateChore = ChorePlay("ui_reticle_pressAndHold_loop.chore", 100, "default", mUIvibrateAgent)
    Yield()
    Sleep(ChoreGetLength("ui_reticle_pressAndHold_loop.chore"))
  end
end

local ResetHeadOnPursuerTimer = function()
  AgentSetProperty(kPursuerHeadOnTimerAgent, "Timer Enabled", false)
  AgentSetProperty(kPursuerHeadOnTimerAgent, "Timer Length", kPursuerHeadOnTimerLength)
  AgentSetProperty(kPursuerHeadOnTimerAgent, "Timer Progress", 0)
  AgentSetProperty(kPursuerHeadOnTimerAgent, "Timer Enabled", true)
end

local AssignRandomPursuerEmittingSound = function(agent)
  if not AgentHasProperty(agent, "Sound Emitter - File") then
    return
  end
  consolePrint("Assigning " .. tostring(agent) .. " a random emitter sound!")
  if mPursuerSoundEmittersActive >= kPursuerSoundEmittersAllowedMax then
    AgentSetProperty(agent, "Sound Emitter - File", "")
    consolePrint("...but there were too many sound emitters!  Blanked!")
    return
  end
  local soundIndex = math.random(kAmbientRustleSoundsMin, kDirtFootstepSoundsMax)
  local sound = kAmbientRustleSoundPrefix .. LeadingZero(soundIndex) .. kSoundSuffix
  AgentSetProperty(agent, "Sound Emitter - File", sound)
  consolePrint("Assigned sound " .. sound)
  mPursuerSoundEmittersActive = mPursuerSoundEmittersActive + 1
  consolePrint("Sound Emitters active: " .. mPursuerSoundEmittersActive)
end

local AssignRandomFootstepSounds = function(agent)
  local steps = {
    0,
    0,
    0,
    0
  }
  local stepsFiles = {}
  local curStepIndex = 0
  local notTaken = true
  for i = 1, #steps do
    repeat
      curStepIndex = math.random(1, kDirtFootstepSoundsMax)
      notTaken = true
      for i = 1, #steps do
        if curStepIndex == steps[i] then
          notTaken = false
          break
        end
      end
    until notTaken == true
    steps[i] = curStepIndex
  end
  for i = 1, #steps do
    stepsFiles[i] = kDirtFootstepSoundPrefix .. steps[i] .. kSoundSuffix
  end
end

local CornfieldPursuerPanicMeter_RampDown = function()
  mPanicMeterRampDownActive = true
  while SceneIsActive(kScene) and mPursuerPanicMeterLastProgress > 0 do
    AgentSetProperty(kPursuerPanicMeterTimer, "Timer Progress", mPursuerPanicMeterLastProgress)
    mPursuerPanicMeterLastProgress = mPursuerPanicMeterLastProgress - kPursuerPanicMeterRampDownDecrement
    Yield()
  end
  mPursuerPanicMeterLastProgress = 0
  AgentSetProperty(kPursuerPanicMeterTimer, "Timer Progress", 0)
  Sleep(kPursuerPanicMeterRampDownCoolDown)
  mPanicMeterRampDownActive = false
  mPursuerPanicMeterRampDownThread = nil
end

local CornfieldInactivityPanicMeter_Update = function(progress)
  if mbPlayerIsDying or mbScriptedEventActive then
    return
  end
  AgentSetProperty(kPursuerPanicMeterTimer, "Timer Progress", progress)
end

local CornfieldPursuerPanicMeter_Update = function(pursuerAgent, pursuerAgentTrigger, pursuerAgentKillTrigger)
  if not (not mbPlayerIsDying and not kSuppressPursuerPanicMeter and pursuerAgent) or not pursuerAgentTrigger then
    return
  end
  local distanceFromPlayer = 0
  local triggerMaxExtents = AgentGetProperty(pursuerAgentTrigger, "Extents Max")
  local triggerKillMaxExtents = AgentGetProperty(pursuerAgentKillTrigger, "Extents Max")
  local maxDistance = triggerMaxExtents.z
  local distToKillTrigger = triggerKillMaxExtents.z
  local fractionDistance = 0
  Chapter4B_Cornfield_PeekUI_HideArrowsShowNextArrow(3, 4)
  while mSequenceActive and not mStealthPositionChange_ShiftActive do
    Yield()
    distanceFromPlayer = AgentDistanceToAgent(pursuerAgent, playerAgent) - distToKillTrigger
    fractionDistance = distanceFromPlayer / maxDistance + kPanicMeterUpdateFudgeFactor
    mPursuerPanicMeterLastProgress = 1 - fractionDistance
    AgentSetProperty(kPursuerPanicMeterTimer, "Timer Progress", mPursuerPanicMeterLastProgress)
  end
end

local SetupEnvironment = function(mode)
  local bStealthMode = false
  local bClearingMode = false
  if mode == "normal" then
  elseif mode == "stealth" then
    bStealthMode = true
  elseif mode == "clearing" then
    bClearingMode = true
  else
    consolePrint("SetupEnvironment() received unknown mode: " .. tostring(mode))
    consolePrint("Defaulting to normal mode")
  end
  for key, value in pairs(kEnvAgentsForNormalGameplay) do
    AgentHide(value, true, true)
  end
  for key, value in pairs(kEnvAgentsForStealthGameplay) do
    AgentHide(value, true, true)
  end
  for key, value in pairs(kEnvAgentsForClearingGameplay) do
    AgentHide(value, true, true)
  end
  if bStealthMode then
    for key, value in pairs(kEnvAgentsForStealthGameplay) do
      AgentHide(value, false, true)
    end
    Yield()
    AgentHide(kCornrowAgentsMaster, true, true)
    for key, value in pairs(kCornrowAgentsCentral) do
      AgentHide(value, false, true)
    end
  elseif bClearingMode then
    for key, value in pairs(kEnvAgentsForClearingGameplay) do
      AgentHide(value, false, true)
    end
    for key, value in pairs(kCampCharacters) do
      AgentHide(value, true, true)
    end
  else
    for key, value in pairs(kEnvAgentsForNormalGameplay) do
      AgentHide(value, false, true)
    end
  end
end

local CreateCornfieldAssets = function()
  for key, value in pairs(kCornrowAgentsCentral) do
    AssignCornfieldIdles(value)
    AgentHide(value, false, true)
  end
  for i = 1, numGuys do
    table.insert(mActivePursuers, false)
    local agent = "Pursuer" .. i
    local celebAgent = "CelebrityPursuer" .. i
    local killTriggerAgent = "trigger_pursuer" .. i
    local panicTriggerAgent = "trigger_PanicMeter_pursuer" .. i
    AgentSetProperty(agent, "Render Diffuse Color", {
      r = 0.2,
      g = 0.2,
      b = 0.2,
      a = 1
    })
    local PursuerVisCallback = function(propSet, bVisible)
      consolePrint("Pursuer Vis Callback!")
      consolePrint("agent is " .. tostring(agent))
      consolePrint("celebrity agent is " .. tostring(celebAgent))
      consolePrint("kill trigger is " .. tostring(killTriggerAgent))
      consolePrint("panic trigger is " .. tostring(panicTriggerAgent))
      consolePrint("bVisible is " .. tostring(bVisible))
      if bVisible == true then
        mActivePursuers[i] = true
        AssignRandomPursuerEmittingSound(agent)
        Yield()
        AgentHide(killTriggerAgent, false)
        AgentSetProperty(killTriggerAgent, "Trigger Enabled", true)
        AgentHide(panicTriggerAgent, false)
        AgentSetProperty(panicTriggerAgent, "Trigger Enabled", true)
      else
        AgentSetProperty(killTriggerAgent, "Trigger Enabled", false)
        AgentSetProperty(panicTriggerAgent, "Trigger Enabled", false)
        AgentSetPos(agent, Vector(0, 0, 0))
        if mActivePursuers[i] == true then
          AgentSetProperty(agent, "Sound Emitter - File", "")
          if mPursuerSoundEmittersActive > 0 then
            mPursuerSoundEmittersActive = mPursuerSoundEmittersActive - 1
          end
          consolePrint("Sound Emitters active: " .. mPursuerSoundEmittersActive)
          mActivePursuers[i] = false
          mActivePursuersPositions[i] = 0
        end
      end
    end
    PropertyAddKeyCallback(AgentGetProperties(agent), "Runtime: Visible", PursuerVisCallback)
    if AgentExists(celebAgent) then
      PropertyAddKeyCallback(AgentGetProperties(celebAgent), "Runtime: Visible", PursuerVisCallback)
    end
    AgentSetProperty(panicTriggerAgent, "Extents Max", kPursuerPanicMeterTriggerExtentsMax)
  end
end

local StealthSeqChoredMovementTracker = function()
  while mSequenceActive and not mbPlayerIsDying do
    local delta = 0
    local timerProgress = AgentGetProperty(kPlayerInactivityTimerAgent, "Timer Progress")
    local controller = ChoredMovement_GetController()
    if controller then
      mChoredMovementTime_current = ControllerGetTime(controller)
      if mChoredMovementTime_current == 0 then
        mChoredMovementTime_current = gChapter4B_Cornfield_ChoredMovesStartTime
      end
    else
      consolePrint("--- COULDN'T GET CHORED MOVEMENT CONTROLLER! ---")
      consolePrint("using gChapter4B_Cornfield_ChoredMovesStartTime")
      mChoredMovementTime_current = gChapter4B_Cornfield_ChoredMovesStartTime
    end
    if not mPanicMeterRampDownActive then
      delta = math.abs(mChoredMovementTime_last - mChoredMovementTime_current) * kPlayerInactivityTimerMulti
      timerProgress = timerProgress - delta
      AgentSetProperty(kPlayerInactivityTimerAgent, "Timer Progress", timerProgress)
      if timerProgress > kPlayerInactivityTimerWarnFraction then
        if AgentIsHidden("ui_peek_arrow1_combat") then
          Chapter4B_Cornfield_PeekUI_HideArrowsShowNextArrow(1)
        end
        mAdvanceSneakyFlashlight = true
        CornfieldInactivityPanicMeter_Update(timerProgress, true)
      else
        if not AgentIsHidden("ui_peek_arrow1_combat") then
          Chapter4B_Cornfield_PeekUI_HideArrowsShowNextArrow()
        end
        mAdvanceSneakyFlashlight = false
        CornfieldInactivityPanicMeter_Update(timerProgress, false)
      end
      mChoredMovementTime_last = mChoredMovementTime_current
    end
    Yield()
  end
end

local StealthSeqInactivityTimerEnable = function(bEnable)
  if bEnable then
    AgentSetProperty(kPlayerInactivityTimerAgent, "Timer Progress", 0)
    AgentSetProperty(kPlayerInactivityTimerAgent, "Timer Length", kPlayerInactivityTimerLength)
    Yield()
    AgentSetProperty(kPlayerInactivityTimerAgent, "Timer Enabled", true)
    if not ThreadIsRunning(mChoredMovementTrackerThread) then
      mChoredMovementTrackerThread = ThreadStart(StealthSeqChoredMovementTracker)
    end
  else
    AgentSetProperty(kPlayerInactivityTimerAgent, "Timer Enabled", false)
    Yield()
    if ThreadIsRunning(mChoredMovementTrackerThread) then
      ThreadKill(mChoredMovementTrackerThread)
    end
    Yield()
    mAdvanceSneakyFlashlight = false
  end
end

local PlayerLooksBack = function()
  mPlayerLookingBack = true
  Yield()
  mStealthMoveController = ChorePlay("bonnie_stealth_lookBehind.chore")
  Sleep(ChoreGetLength("bonnie_stealth_lookBehind.chore"))
  local delay = math.random(75, 100) * 0.01
  Sleep(delay)
  mPlayerLookingBack = false
  Yield()
end

local HideHeadOnPursuerBeforeRoman = function(delay)
  if delay and type(delay) == "number" then
    Sleep(delay)
  end
  if AgentExists(mPursuerHeadOnBeforeRomanArrives) then
    AgentHide(mPursuerHeadOnBeforeRomanArrives, true, true)
    AgentSetPos(mPursuerHeadOnBeforeRomanArrives, Vector(0, 0, 0))
  end
end

local UpdateDirection = function(dir)
  if not mbOkayToUpdateDirection or dir == eUp or mbPlayerIsDying then
    return
  end
  mStealthPositionChangeActive = true
  Yield()
  consolePrint("Player movement BEGIN")
  InputMapperDeactivate(kCornfieldInputMap)
  ChoredMovement_AllowMovement(false)
  if dir == eDown then
    if not mPlayerLookingBack and not mStealthPositionChange_ShiftActive then
      consolePrint("Player looking back!")
      ThreadStart(PlayerLooksBack)
    end
  elseif dir == eLeft then
    mStealthPositionChange_ShiftActive = true
    Yield()
    consolePrint("Player shifting left!")
    ControllerKill(mStealthMoveController)
    if mCornEndFired then
      StealthSeqInactivityTimerEnable(false)
    end
    Dialog_PlayAndWait("cs_moveLeft")
    if not mbPlayerIsDying and not mbHeadOnPursuerTriggerActivated and (not AgentIsHidden("ui_peek_arrow3_combat") or not AgentIsHidden("ui_peek_arrow4_combat")) then
      consolePrint("<<EXTRA>> panic meter deactivate called!")
      Chapter4B_Cornfield_PursuerPanicMeter_Deactivate()
    end
    if mbOKForCampPeopleReaction1 then
      mbOKForCampPeopleReaction1 = false
      DoScriptedEvent("cs_25secondsLeft", 2.5, {"Roman"})
    elseif mbOKForCampPeopleReaction2 then
      mbOKForCampPeopleReaction2 = false
      DoScriptedEvent("cs_45secondsLeft", 2.5)
    end
  elseif dir == eRight then
    mStealthPositionChange_ShiftActive = true
    Yield()
    consolePrint("Player shifting right!")
    ControllerKill(mStealthMoveController)
    if mCornEndFired then
      StealthSeqInactivityTimerEnable(false)
    end
    Dialog_PlayAndWait("cs_moveRight")
    if not mbPlayerIsDying and not mbHeadOnPursuerTriggerActivated and (not AgentIsHidden("ui_peek_arrowParent3") or not AgentIsHidden("ui_peek_arrowParent4")) then
      consolePrint("<<EXTRA>> panic meter deactivate called!")
      Chapter4B_Cornfield_PursuerPanicMeter_Deactivate()
    end
    if mbOKForCampPeopleReaction1 then
      mbOKForCampPeopleReaction1 = false
      DoScriptedEvent("cs_25secondsRight", 2.5, {"Roman"})
    elseif mbOKForCampPeopleReaction2 then
      mbOKForCampPeopleReaction2 = false
      DoScriptedEvent("cs_45secondsRight", 2.5)
    end
  end
  ChoredMovement_AllowMovement(true)
  InputMapperActivate(kCornfieldInputMap)
  mStealthPositionChange_TurnaroundActive = false
  mStealthPositionChange_ShiftActive = false
  mStealthPositionChangeActive = false
  RenderDelay(1)
  Yield()
  consolePrint("Player movement ^^^END^^^")
end

local UpdateVirtualStick = function(dir)
  if not (not mStealthPositionChangeActive and Mode_IsActive(mode_Main)) or not mSequenceActive then
    return
  end
  ThreadStart(UpdateDirection, Input_GetJoystickDir(dir))
end

local pursuerTimer = function(delayOverride, bRunOnlyOnce)
  consolePrint("oh no bad guys!  PURSUER TIMER ACTIVATED")
  while mOkayToSpawnPursuers or bRunOnlyOnce do
    Yield()
    if mbOKForCampPeopleConfab then
      mbOKForCampPeopleConfab = false
      WaitForAllPursuersToBeOffscreen()
      Sleep(2.5)
      DoScriptedEvent("cs_35seconds", 5.5, {"Roman", "Stephanie"}, true)
    else
      local delay = 0
      if delayOverride and type(delayOverride) == "number" then
        delay = delayOverride
      elseif not mPursuerForceNextToBeCloseCall and not bFirstMove then
        delay = math.random(kPursuerSpawnDelayMin, kPursuerSpawnDelayMax)
        if mSpawningCloseCallPursuer then
          mSpawningCloseCallPursuer = false
          delay = delay * 0.5
        end
      end
      if delay > 0 then
        TimedDelay(kPursuerTimerAgent, delay)
      end
      local pursuerFocus = ""
      local celebPursuerFocus = ""
      local pursuerReady = false
      repeat
        if pAnchorTracker < numGuys then
          pAnchorTracker = pAnchorTracker + 1
        else
          pAnchorTracker = 1
        end
        pursuerFocus = "Pursuer" .. pAnchorTracker
        celebPursuerFocus = "CelebrityPursuer" .. pAnchorTracker
        if AgentIsHidden(pursuerFocus) and (not AgentExists(celebPursuerFocus) or AgentIsHidden(celebPursuerFocus)) then
          pursuerReady = true
        end
        Yield()
      until pursuerReady == true
      local anchorFocus = "obj_pursuerAnchor_" .. pAnchorTracker
      local pursuerFlashlightObj = "obj_flashlightMaglite_pursuer" .. pAnchorTracker
      local celebPursuerFlashlight = "CelebrityFlashlight" .. pAnchorTracker
      local celebPursuerFlashlightObj = "obj_flashlightMaglite_celebrityPursuer" .. pAnchorTracker
      local flashlightAgent = "flashlight" .. pAnchorTracker
      local killTriggerAgent = "trigger_pursuer" .. pAnchorTracker
      local rot = Vector()
      local horiz, int
      if kPursuerSpawnPositionTest > 0 and kPursuerSpawnPositionTest < 9 then
        int = kPursuerSpawnPositionTest
      elseif mbMysteryShotsFired then
        repeat
          int = math.random(8)
        until int ~= mLastPursuerSpawnPosIndex
      else
        local validInts = {
          3,
          6,
          7,
          8
        }
        local intIndex = 0
        repeat
          intIndex = math.random(#validInts)
          int = validInts[intIndex]
        until int ~= mLastPursuerSpawnPosIndex
      end
      while mbScriptedEventActive do
        Yield()
      end
      while mStealthPositionChangeActive do
        Yield()
        Sleep(0.1)
      end
      local refOrig = AgentGetWorldPos(playerAgent)
      refOrig.x = kPlayerInCornrowBaseWorldPosX
      local ref = Vector(refOrig.x, refOrig.y, refOrig.z)
      local SpawnHeadOnPursuer = function()
        WaitForNoCrossingHeadonPursuers()
        if Logic["Cornfield - Forward"] == true then
          ResetHeadOnPursuerTimer()
          ref.x = ref.x + kPursuerSpawnOffsets.HeadOn.Forward.x
          ref.z = ref.z + kPursuerSpawnOffsets.HeadOn.Forward.z
          rot = Vector(0, 180, 0)
        else
          ResetHeadOnPursuerTimer()
          ref.x = ref.x + kPursuerSpawnOffsets.HeadOn.Backward.x
          ref.z = ref.z + kPursuerSpawnOffsets.HeadOn.Backward.z
          rot = Vector(0, 0, 0)
        end
        horiz = false
        ResetHeadOnPursuerTimer()
        mPursuerLastHeadOn = pursuerFocus
        mPursuerTriggerLastHeadOn = killTriggerAgent
        if mbOKForCampPeopleReaction1 then
          mPursuerHeadOnBeforeRomanArrives = pursuerFocus
          mPursuerTriggerHeadOnBeforeRomanArrives = killTriggerAgent
        end
      end
      if mPursuerForceNextToBeCloseCall then
        mPursuerForceNextToBeCloseCall = false
        pursuerFocus = "PursuerCloseCall"
        mSpawningCloseCallPursuer = true
        consolePrint("SPAWNING CLOSE CALL PURSUER - *** DEE/LELAND FOLLOW-UP***")
        if Logic["Cornfield - Forward"] == true then
          ref.x = ref.x + 3
          ref.z = ref.z + 3
          rot = Vector(0, -90, 0)
        else
          ref.x = ref.x - 3
          ref.z = ref.z - 3
          rot = Vector(0, 90, 0)
        end
        horiz = true
      elseif mPursuerForceNextToBeHeadOn or bFirstMove then
        SpawnHeadOnPursuer()
        Chapter4B_Cornfield_NextPursuerHeadOn(false)
      elseif int == 1 then
        if Logic["Cornfield - Forward"] == true then
          ref.x = ref.x + kPursuerSpawnOffsets.FromLeft.Forward.x
          ref.z = ref.z + kPursuerSpawnOffsets.FromLeft.Forward.z
          rot = Vector(0, -90, 0)
        else
          ref.x = ref.x + kPursuerSpawnOffsets.FromLeft.Backward.x
          ref.z = ref.z + kPursuerSpawnOffsets.FromLeft.Backward.z
          rot = Vector(0, 90, 0)
        end
        horiz = true
      elseif int == 2 then
        if Logic["Cornfield - Forward"] == true then
          ref.x = ref.x + kPursuerSpawnOffsets.FromRight.Forward.x
          ref.z = ref.z + kPursuerSpawnOffsets.FromRight.Forward.z
          rot = Vector(0, 90, 0)
        else
          ref.x = ref.x + kPursuerSpawnOffsets.FromRight.Backward.x
          ref.z = ref.z + kPursuerSpawnOffsets.FromRight.Backward.z
          rot = Vector(0, -90, 0)
        end
        horiz = true
      elseif int == 3 then
        SpawnHeadOnPursuer()
      elseif int == 4 then
        if Logic["Cornfield - Forward"] == true then
          ref.x = ref.x + kPursuerSpawnOffsets.FromLeftClose.Forward.x
          ref.z = ref.z + kPursuerSpawnOffsets.FromLeftClose.Forward.z
          rot = Vector(0, -90, 0)
        else
          ref.x = ref.x + kPursuerSpawnOffsets.FromLeftClose.Backward.x
          ref.z = ref.z + kPursuerSpawnOffsets.FromLeftClose.Backward.z
          rot = Vector(0, 90, 0)
        end
        horiz = true
      elseif int == 5 then
        if Logic["Cornfield - Forward"] == true then
          ref.x = ref.x + kPursuerSpawnOffsets.FromRightClose.Forward.x
          ref.z = ref.z + kPursuerSpawnOffsets.FromRightClose.Forward.z
          rot = Vector(0, 90, 0)
        else
          ref.x = ref.x + kPursuerSpawnOffsets.FromRightClose.Backward.x
          ref.z = ref.z + kPursuerSpawnOffsets.FromRightClose.Backward.z
          rot = Vector(0, -90, 0)
        end
        horiz = true
      elseif int == 6 then
        if Logic["Cornfield - Forward"] == true then
          ref.x = ref.x + kPursuerSpawnOffsets.HeadOnInLeftRow.Forward.x
          ref.z = ref.z + kPursuerSpawnOffsets.HeadOnInLeftRow.Forward.z
          rot = Vector(0, 180, 0)
        else
          ref.x = ref.x + kPursuerSpawnOffsets.HeadOnInLeftRow.Backward.x
          ref.z = ref.z + kPursuerSpawnOffsets.HeadOnInLeftRow.Backward.z
          rot = Vector(0, 0, 0)
        end
        horiz = false
      elseif int == 7 then
        if Logic["Cornfield - Forward"] == true then
          ref.x = ref.x + kPursuerSpawnOffsets.HeadOnInRightRow.Forward.x
          ref.z = ref.z + kPursuerSpawnOffsets.HeadOnInRightRow.Forward.z
          rot = Vector(0, 180, 0)
        else
          ref.x = ref.x + kPursuerSpawnOffsets.HeadOnInRightRow.Backward.x
          ref.z = ref.z + kPursuerSpawnOffsets.HeadOnInRightRow.Backward.z
          rot = Vector(0, 0, 0)
        end
        horiz = false
      else
        SpawnHeadOnPursuer()
      end
      AgentSetPos(anchorFocus, ref)
      AgentSetRot(anchorFocus, rot)
      local z = Vector(0, 0, 0)
      AgentAttach(pursuerFocus, anchorFocus)
      AgentSetPos(pursuerFocus, z)
      AgentSetRot(pursuerFocus, rot)
      if mSpawningCloseCallPursuer then
        flashlightAgent = "FlashlightCloseCall"
        killTriggerAgent = "trigger_CloseCall"
      end
      local showCelebPursuer = false
      local skipCelebPursuer = false
      for key, value in pairs(CelebGuyIDsToSkip) do
        if value == pAnchorTracker then
          skipCelebPursuer = true
          break
        end
      end
      if not mSpawningCloseCallPursuer and not skipCelebPursuer and AgentExists(celebPursuerFocus) then
        local dieRoll = math.random()
        if dieRoll > kPursuerFactorForCeleb then
          showCelebPursuer = true
        end
      end
      if not mSpawningCloseCallPursuer and kPursuerOverrideFlashlightAttach then
        AgentAttach(flashlightAgent, pursuerFocus)
      end
      Yield()
      if mOkayToSpawnPursuers or bRunOnlyOnce then
        ControllerKill(mActivePursuersControllers[pAnchorTracker])
        Yield()
        if horiz == true then
          if mSpawningCloseCallPursuer then
            mActivePursuersControllers[pAnchorTracker] = ChorePlay("env_cornfield2_pursuerRunsHorizontal.chore", 100, "default", pursuerFocus, "flashlight", flashlightAgent)
            ChorePlay("env_cornfield2_pursuerRunsHorizontal_visibility.chore", 100, "default", pursuerFocus)
          elseif showCelebPursuer then
            mActivePursuersControllers[pAnchorTracker] = ChorePlay("env_cornfield2_pursuerWalksHorizontal.chore", 100, "default", pursuerFocus)
            ChorePlay("env_cornfield2_pursuerWalksHorizontal_anim.chore", 100, "default", celebPursuerFocus, "flashlight", celebPursuerFlashlightObj, "flashlightMaglite", celebPursuerFlashlight)
            ChorePlay("env_cornfield2_pursuerWalksHorizontal_visibility.chore", 100, "default", celebPursuerFocus)
          else
            mActivePursuersControllers[pAnchorTracker] = ChorePlay("env_cornfield2_pursuerWalksHorizontal.chore", 100, "default", pursuerFocus, "flashlight", flashlightAgent, "flashlightMaglite", pursuerFlashlightObj)
            ChorePlay("env_cornfield2_pursuerWalksHorizontal_visibility.chore", 100, "default", pursuerFocus)
          end
        elseif horiz == false then
          if showCelebPursuer then
            mActivePursuersControllers[pAnchorTracker] = ChorePlay("env_cornfield2_pursuerWalksVertical.chore", 100, "default", pursuerFocus)
            ChorePlay("env_cornfield2_pursuerWalksVertical_anim.chore", 100, "default", celebPursuerFocus, "flashlight", celebPursuerFlashlight, "flashlightMaglite", celebPursuerFlashlightObj)
            ChorePlay("env_cornfield2_pursuerWalksVertical_visibility.chore", 100, "default", celebPursuerFocus)
          else
            mActivePursuersControllers[pAnchorTracker] = ChorePlay("env_cornfield2_pursuerWalksVertical.chore", 100, "default", pursuerFocus, "flashlight", flashlightAgent, "flashlightMaglite", pursuerFlashlightObj)
            ChorePlay("env_cornfield2_pursuerWalksVertical_visibility.chore", 100, "default", pursuerFocus)
          end
        end
        consolePrint("Here comes " .. pursuerFocus .. " doing action " .. int .. "!")
        consolePrint("reference position is " .. refOrig.x .. ", " .. refOrig.y .. ", " .. refOrig.z)
        consolePrint("spawn position is " .. ref.x .. ", " .. ref.y .. ", " .. ref.z)
        if showCelebPursuer then
          consolePrint("And " .. celebPursuerFocus .. " is taking its place!")
        end
        mLastPursuerSpawnPosIndex = int
        mActivePursuersPositions[pAnchorTracker] = int
        consolePrint("mLastPursuerSpawnPosIndex is " .. tostring(mLastPursuerSpawnPosIndex))
        consolePrint("mActivePursuersPositions index " .. pAnchorTracker .. " is " .. tostring(int))
        if bFirstMove then
          bFirstMove = false
          while true do
            Yield()
          end
        end
      end
    end
    bRunOnlyOnce = false
  end
end

local EndStealthBackupTimer = function()
  TimedDelay(kStealthSeqTimerAgent, kEndStealthBackupTimerTime)
  if mSequenceActive then
    mCornEndChoreTimeTarget = 99999
    Chapter4B_Cornfield_NextPursuerHeadOn(true)
    mPursuerTimerThread = ThreadStart(pursuerTimer, 0, true)
  end
end

local cornEnd = function()
  if mCornEndFired then
    return
  end
  mCornEndFired = true
  ThreadStart(EndStealthBackupTimer)
  if mCornEndChoreTimeTarget >= 0 then
    local controller = ChoredMovement_GetController()
    if controller then
      local curTime = ControllerGetTime(controller)
      while curTime < mCornEndChoreTimeTarget and not mbBadGuysShifting and not mEndStealthBackupTimerExpired do
        curTime = ControllerGetTime(controller)
        Yield()
      end
    end
  end
  mSequenceActive = false
  Logic["4 - Cornfield Pursuit Ended"] = true
  Yield()
  consolePrint("Cornfield sequence -- IT'S OVER!")
  Dialog_Interruption()
  InputMapperDeactivate(kCornfieldInputMap)
  if Input_IsUsingTouch() then
    Callback_OnVirtualStick:Remove(UpdateVirtualStick)
  end
  StealthSeqInactivityTimerEnable(false)
  AgentHide(kPlayerInactivityFlashlightAgent, true, true)
  while mStealthPositionChangeActive do
    consolePrint("Stalling cornEnd() to wait for player move to stop!!")
    Yield()
  end
  consolePrint("cornEnd() is corn beginning")
  RenderDelay(5, true)
  Chapter4B_Cornfield_SetPlayerWalkAnims("Normal")
  Mode_Pop(mode_Chored_Movement)
  AgentDetach(playerAgent)
  Yield()
  Chapter4B_Cornfield_PursuerPanicMeter_Deactivate(true)
  Yield()
  PanicMeter_RemoveItem("ui_panicmeter_overlay", kPursuerPanicMeterTimer)
  Chapter4B_Cornfield_PeekUI_HideArrowsShowNextArrow()
  SceneHide("ui_panicmeter.scene", true)
  for i = 1, numGuys do
    local agent = "Pursuer" .. i
    PropertyClearKeyCallbacks(AgentGetProperties(agent), "Runtime: Visible")
  end
  SetupEnvironment("clearing")
  if ThreadIsRunning(mPursuerTimerThread) then
    ThreadKill(mPursuerTimerThread)
  end
  for i = 1, numGuys do
    local agent = "Pursuer" .. i
    AgentHide(agent, true, true)
    ControllerKill(mActivePursuersControllers[i])
  end
  AgentHide("Pursuer1", false, true)
  AgentSetWorldPos(playerAgent, AgentGetWorldPos("obj_playerStartClearing"))
  AgentSetWorldRot(playerAgent, AgentGetWorldRot("obj_playerStartClearing"))
  mCornfieldCameraActive = false
  Yield()
  Dialog_Play("cs_findClearing")
end

local CornEndPrep = function()
  WaitForAllPursuersToBeOffscreen()
  Yield()
  WaitForAllPursuersToBeOffscreen()
  TimedDelay(kStealthSeqTimerAgent, kSequenceCoolDownTime)
  local controller = ChoredMovement_GetController()
  if controller then
    mCornEndChoreTimeTarget = ControllerGetTime(controller) + kCornEndChoreTimeTargetIncrement
    if mCornEndChoreTimeTarget > ControllerGetLength(controller) then
      mCornEndChoreTimeTarget = ControllerGetLength(controller)
    end
  else
    mCornEndChoreTimeTarget = -1
  end
  consolePrint("Cornfield sequence -- the end begins")
  Chapter4B_Cornfield_PursuerTriggersEnable(false)
  if not mbPlayerIsDying then
    ThreadStart(cornEnd)
  end
end

function Chapter4B_Cornfield_ArePursuerKillsEnabled()
  return not kPreventPursuerKills
end

function Chapter4B_Cornfield_ReticleNoiseEnable(bEnable)
  if bEnable then
    if not mReticleNoiseController then
      mReticleNoiseController = ChorePlay("ui_reticle_noiseHoriz", 0)
      ControllerSetLooping(mReticleNoiseController, true)
    end
  elseif mReticleNoiseController then
    ControllerKill(mReticleNoiseController)
    mReticleNoiseController = nil
    Yield()
  end
end

function Chapter4B_Cornfield_EnableNeedWeaponAmbient(bEnable, delay)
  if delay and type(delay) == "number" then
    Sleep(delay)
  end
  if bEnable then
    mbOKForNeedWeaponAmbient = true
  else
    mbOKForNeedWeaponAmbient = false
  end
end

function Chapter4B_Cornfield_CamChangeCallback()
  Chapter4B_Cornfield_RainScaler()
  if mbMysteryShotsFiring and not mbMysteryShotsFired and AgentGetName(SceneGetCamera(kScene)) == "cam_mysteryShots" then
    ChoredMovement_AllowMovement(false)
    mbOkayToUpdateDirection = false
    HideCornForMysteryShots(true)
  end
end

function Chapter4B_Cornfield_RainScaler()
  local cam = AgentGetName(SceneGetCamera(kScene))
  local bScaleRain = false
  local scaleIndex = 1
  for key, value in ipairs(kCamsToScaleInRain.names) do
    if tostring(cam) == value then
      bScaleRain = true
      scaleIndex = key
    end
  end
  if bScaleRain then
    AgentSetProperty("fx_rainSphereWD", "Render Global Scale", kCamsToScaleInRain.scales[scaleIndex])
  else
    AgentSetProperty("fx_rainSphereWD", "Render Global Scale", mRainScale)
  end
end

function Chapter4B_Cornfield_RebarDragStart_OnLeft()
  if mGotADirForRebarDrag then
    return
  end
  mGotADirForRebarDrag = true
  if Input_UseCursor() then
    ChorePlay("ui_reticle_bracket_pressHold_arrowOff.chore")
    ChorePlayAndWait("adv_cornfieldch4_drag_bonnietugrebarstage1left.chore")
    Dialog_Play("logic_dragRebarLeft1_to_2")
  else
    Dialog_Play("logic_dragRebar_startLeft")
  end
end

function Chapter4B_Cornfield_RebarDragStart_OnRight()
  if mGotADirForRebarDrag then
    return
  end
  mGotADirForRebarDrag = true
  if Input_UseCursor() then
    ChorePlay("ui_reticle_bracket_pressHold_arrowOff.chore", 100, "ui_reticle_bracket_arrowRight", "ui_reticle_bracket_arrowLeft")
    ChorePlayAndWait("adv_cornfieldch4_drag_bonnietugrebarstage1right.chore")
    Dialog_Play("logic_dragRebarRight1_to_2")
  else
    Dialog_Play("logic_dragRebar_startRight")
  end
end

function Chapter4B_Cornfield_PursuerTriggersEnable(bEnable)
  if not bEnable then
    bEnable = false
  else
    bEnable = true
  end
  for i = 1, numGuys do
    AgentSetProperty("trigger_pursuer" .. i, "Trigger Enabled", bEnable)
    AgentSetProperty("trigger_PanicMeter_pursuer" .. i, "Trigger Enabled", bEnable)
  end
  AgentSetProperty("trigger_CloseCall", "Trigger Enabled", bEnable)
  AgentSetProperty("trigger_CloseCall_cutscene", "Trigger Enabled", bEnable)
  AgentSetProperty("trigger_PanicMeter_CloseCall", "Trigger Enabled", bEnable)
end

function Chapter4B_Cornfield_RebarDrag_ChooseStartDir()
  if Input_IsUsingTouch() or Platform_IsWiiU() or Input_UseCursor() and Platform_HasTVRemote() then
    Dialog_Play("cs_freeRebar")
    return
  end
  InputMapperActivate("mode_drag_rebarChoice.imap")
  local dir
  local virtStickDir = Vector(0, 0, 0)
  mGotADirForRebarDrag = false
  AgentSetProperty("logic_reticle", "Reticle System Enabled", false)
  AgentHide("ui_reticle_bracket_arrowLeft", false)
  AgentHide("ui_reticle_bracket_arrowRight", false)
  AgentHide("ui_reticle_bracketLeft", false)
  AgentHide("ui_reticle_bracketRight", false)
  Drag_SetFocus()
  ControllerSetLooping(Drag_GetIdleController(), false)
  local uiBracketController = ChorePlay("ui_reticle_bracket_pressHold_contract")
  local UpdateVirtualStickDir = function(dir)
    virtStickDir = dir
  end
  if Input_UseCursor() then
    VirtualStick_Activate()
    Callback_OnVirtualStick:Add(UpdateVirtualStickDir)
  end
  ChorePlayAndWait("env_cornfieldch4_use_rebar_1.chore")
  while Input_IsButtonPressed(kEventCodeButtonA) or Input_IsButtonPressed(kEventCodeMouseL) do
    dir = Input_GetLeftStick()
    if Input_GetJoystickDir(dir) == eLeft or Input_GetJoystickDir(virtStickDir) == eLeft then
      Chapter4B_Cornfield_RebarDragStart_OnLeft()
    elseif Input_GetJoystickDir(dir) == eRight or Input_GetJoystickDir(virtStickDir) == eRight then
      Chapter4B_Cornfield_RebarDragStart_OnRight()
    end
    if mGotADirForRebarDrag or gChapter4B_Cornfield_DeeCaughtBonnie then
      break
    end
    Yield()
  end
  consolePrint("Chapter4B_Cornfield_RebarDrag_ChooseStartDir() is exiting!!")
  InputMapperDeactivate("mode_drag_rebarChoice.imap")
  if Input_UseCursor() then
    VirtualStick_Deactivate()
    Callback_OnVirtualStick:Remove(UpdateVirtualStickDir)
  end
  if not mGotADirForRebarDrag then
    ControllerKill(uiBracketController)
    ChorePlayAndSync("ui_reticle_bracket_pressHold_expand", Drag_GetIdleController())
    AgentSetProperty("logic_reticle", "Reticle System Enabled", true)
    Dialog_Play("logic_dragRebarEnd")
  end
end

function Chapter4B_Cornfield_ShouldBonnieReact()
  local dieRoll = math.random()
  if dieRoll < mChanceForBonnieReaction then
    gChapter4B_Cornfield_DoABonniePursuerReaction = true
    mChanceForBonnieReaction = mChanceForBonnieReaction * kChanceForBonnieReactionMulti
  else
    gChapter4B_Cornfield_DoABonniePursuerReaction = false
    mChanceForBonnieReaction = kChanceForBonnieReaction
  end
end

function Chapter4B_Cornfield_PursuerDeePause(bPause)
  if mPursuerDeeController then
    if bPause then
      ControllerPause(mPursuerDeeController)
    else
      local curTime = ControllerGetTime(mPursuerDeeController)
      if curTime > kPursuerDeeMaxRestartTime then
        ControllerSetTime(mPursuerDeeController, kPursuerDeeMaxRestartTime)
        consolePrint("Resetting Pursuer Dee chore time to " .. kPursuerDeeMaxRestartTime)
      elseif curTime < kPursuerDeeMinRestartTime then
        ControllerSetTime(mPursuerDeeController, kPursuerDeeMinRestartTime)
        consolePrint("Resetting Pursuer Dee chore time to " .. kPursuerDeeMinRestartTime)
      end
      ControllerPlay(mPursuerDeeController)
    end
  end
end

function Chapter4B_Cornfield_ActivateRebarTut(agent)
  if AgentGetName(agent) == "obj_rebar_usePoint" and not mbShownPressAndHoldTut then
    mbShownPressAndHoldTut = true
    HelpText_Show("tutorial_grabRebar", 0.5)
    Callback_OnItemFocus:Remove(Chapter4B_Cornfield_ActivateRebarTut)
  end
end

function Chapter4B_Cornfield_ActivatePressAndHoldUI(agent, bActivateOverride)
  local bGotAPressNHoldObj = false
  for key, value in ipairs(kPressAndHoldAgents) do
    if AgentGetName(agent) == value then
      bGotAPressNHoldObj = true
    end
  end
  if bGotAPressNHoldObj == true or bActivateOverride == true then
    mOkayToVibrateUI = true
    if not ThreadIsRunning(mUI_PressAndHoldAnimateThread) then
      mUI_PressAndHoldAnimateThread = ThreadStart(LoopPressAndHoldUIChore)
    end
    if not mbShownPressAndHoldTut then
      mbShownPressAndHoldTut = true
      HelpText_Show("tutorial_holdAndManipulate", 0.5)
    end
  else
    mOkayToVibrateUI = false
    if ThreadIsRunning(mUI_PressAndHoldAnimateThread) then
      ThreadKill(mUI_PressAndHoldAnimateThread)
      ControllerKill(mUIvibrateChore)
    end
    if ThreadIsRunning(mUIvibrateThread) then
      ThreadKill(mUIvibrateThread)
    end
    Yield()
    AgentSetPos(mUIvibrateAgent, Vector(kUIvibratePos.x, kUIvibratePos.y, kUIvibratePos.z))
    AgentSetProperty(mUIvibrateAgent, "Render Axis Scale", Vector(1, 1, 1))
  end
end

function Chapter4B_Cornfield_SetPlayerWalkAnims(animKey)
  if not AgentHasProperty(playerAgent, "Walk Animation - Idle") then
    consolePrint("Error - player agent has no walk animator!")
    return
  end
  local foundValidAnimKey = false
  for key in pairs(playerAgentWalkAnims) do
    if key == animKey then
      foundValidAnimKey = true
      break
    end
  end
  if not foundValidAnimKey then
    consolePrint("Chapter4B_Cornfield_SetPlayerWalkAnims() got unknown anim key " .. tostring(animKey) .. "! defaulting to normal")
    animKey = "Normal"
  end
  AgentSetProperty(playerAgent, "Walk Animation - Forward", playerAgentWalkAnims[animKey].Forward)
  AgentSetProperty(playerAgent, "Walk Animation - Idle", playerAgentWalkAnims[animKey].Idle)
end

function Chapter4B_Cornfield_EnableVisTriggers(bEnable)
  bEnable = bEnable or false
  Yield()
  for key, value in ipairs(kCornrowVisTriggers) do
    AgentSetProperty(value, "Trigger Enabled", bEnable)
  end
  Yield()
end

function Chapter4B_Cornfield_SetPlayerLocation(trigger)
  if trigger == nil then
    consolePrint("Chapter4B_Cornfield_SetPlayerLocation() didn't get a valid trigger!")
    return
  end
  consolePrint("Chapter4B_Cornfield_SetPlayerLocation() called by trigger " .. trigger)
  gChapter4B_Cornfield_CurrentLocTrigger = trigger
end

function Chapter4B_Cornfield_ChunksOnOff(agent, visTrigger, bTurningAround)
  local trigger = visTrigger
  if trigger == nil then
    trigger = gChapter4B_Cornfield_CurrentLocTrigger
  else
    gChapter4B_Cornfield_CurrentLocTrigger = trigger
  end
  local chunk = AgentGetName(AgentGetParent(trigger))
  consolePrint("Chapter4B_Cornfield_ChunksOnOff() called!")
  consolePrint("chunk is " .. tostring(chunk))
  consolePrint("trigger is " .. tostring(trigger))
  if chunk ~= nil then
    if not AgentExists(chunk) then
      consolePrint("...but it didn't get a valid anchor chunk!")
      return
    end
  else
    consolePrint("...chunk is nil, bailing out!")
    return
  end
  local playerForward = Logic["Cornfield - Forward"]
  local chunkPrefix = "obj_corn_ScrollingStalks_chunk"
  local chunkForward = ""
  local chunkForward2 = ""
  local chunkBehind = ""
  local chunkBehind2 = ""
  local chunkForwardIndex = -1
  local chunkForward2Index = -1
  local chunkBehindIndex = -1
  local chunkBehind2Index = -1
  local chunkDir, chunkIndex
  consolePrint("Unhiding " .. chunk)
  AssignCornfieldIdles(chunk)
  AgentHide(chunk, false, true)
  consolePrint("Player facing forward? " .. tostring(playerForward))
  local chunkID = string.gsub(chunk, chunkPrefix, "")
  if chunkID == "C" then
    if playerForward then
      chunkForward = chunkPrefix .. "N1"
      chunkForward2 = chunkPrefix .. "N2"
      chunkBehind = chunkPrefix .. "S1"
      chunkBehind2 = chunkPrefix .. "S2"
    else
      chunkForward = chunkPrefix .. "S1"
      chunkForward2 = chunkPrefix .. "S2"
      chunkBehind = chunkPrefix .. "N1"
      chunkBehind2 = chunkPrefix .. "N2"
    end
  else
    chunkDir = string.sub(chunkID, 1, 1)
    local indexStr = string.gsub(chunkID, chunkDir, "")
    chunkIndex = tonumber(indexStr)
    if playerForward then
      if chunkDir == "N" then
        if chunkIndex == 1 then
          chunkForward = chunkPrefix .. "N2"
          chunkForward2 = chunkPrefix .. "N3"
          chunkBehind = chunkPrefix .. "C"
          chunkBehind2 = chunkPrefix .. "S1"
        elseif chunkIndex == 2 then
          chunkForward = chunkPrefix .. "N3"
          chunkForward2 = chunkPrefix .. "N4"
          chunkBehind = chunkPrefix .. "N1"
          chunkBehind2 = chunkPrefix .. "C"
        else
          chunkForwardIndex = chunkIndex + 1
          chunkForward2Index = chunkIndex + 2
          chunkForward = chunkPrefix .. "N" .. chunkForwardIndex
          chunkForward2 = chunkPrefix .. "N" .. chunkForward2Index
          chunkBehindIndex = chunkIndex - 1
          chunkBehind2Index = chunkIndex - 2
          chunkBehind = chunkPrefix .. "N" .. chunkBehindIndex
          chunkBehind2 = chunkPrefix .. "N" .. chunkBehind2Index
        end
      elseif chunkIndex == 1 then
        chunkForward = chunkPrefix .. "C"
        chunkForward2 = chunkPrefix .. "N1"
        chunkBehind = chunkPrefix .. "S2"
        chunkBehind2 = chunkPrefix .. "S3"
      elseif chunkIndex == 2 then
        chunkForward = chunkPrefix .. "S1"
        chunkForward2 = chunkPrefix .. "C"
        chunkBehind = chunkPrefix .. "S3"
        chunkBehind2 = chunkPrefix .. "S4"
      else
        chunkForwardIndex = chunkIndex - 1
        chunkForward2Index = chunkIndex - 2
        chunkForward = chunkPrefix .. "S" .. chunkForwardIndex
        chunkForward2 = chunkPrefix .. "S" .. chunkForward2Index
        chunkBehindIndex = chunkIndex + 1
        chunkBehind2Index = chunkIndex + 2
        chunkBehind = chunkPrefix .. "S" .. chunkBehindIndex
        chunkBehind2 = chunkPrefix .. "S" .. chunkBehind2Index
      end
    elseif chunkDir == "N" then
      if chunkIndex == 1 then
        chunkForward = chunkPrefix .. "C"
        chunkForward2 = chunkPrefix .. "S1"
        chunkBehind = chunkPrefix .. "N2"
        chunkBehind2 = chunkPrefix .. "N3"
      elseif chunkIndex == 2 then
        chunkForward = chunkPrefix .. "N1"
        chunkForward2 = chunkPrefix .. "C"
        chunkBehind = chunkPrefix .. "N3"
        chunkBehind2 = chunkPrefix .. "N4"
      else
        chunkForwardIndex = chunkIndex - 1
        chunkForward2Index = chunkIndex - 2
        chunkForward = chunkPrefix .. "N" .. chunkForwardIndex
        chunkForward2 = chunkPrefix .. "N" .. chunkForward2Index
        chunkBehindIndex = chunkIndex + 1
        chunkBehind2Index = chunkIndex + 1
        chunkBehind = chunkPrefix .. "N" .. chunkBehindIndex
        chunkBehind2 = chunkPrefix .. "N" .. chunkBehind2Index
      end
    elseif chunkIndex == 1 then
      chunkForward = chunkPrefix .. "S2"
      chunkForward2 = chunkPrefix .. "S3"
      chunkBehind = chunkPrefix .. "C"
      chunkBehind2 = chunkPrefix .. "N1"
    elseif chunkIndex == 2 then
      chunkForward = chunkPrefix .. "S3"
      chunkForward2 = chunkPrefix .. "S4"
      chunkBehind = chunkPrefix .. "S1"
      chunkBehind2 = chunkPrefix .. "C"
    else
      chunkForwardIndex = chunkIndex + 1
      chunkForwardIndex = chunkIndex + 2
      chunkForward = chunkPrefix .. "S" .. chunkForwardIndex
      chunkForward2 = chunkPrefix .. "S" .. chunkForward2Index
      chunkBehindIndex = chunkIndex - 1
      chunkBehind2Index = chunkIndex - 2
      chunkBehind = chunkPrefix .. "S" .. chunkBehindIndex
      chunkBehind2 = chunkPrefix .. "S" .. chunkBehind2Index
    end
  end

  if not bTurningAround then
    consolePrint("Corn Vis update - player NOT turning around!")
    consolePrint("Unhiding " .. chunkForward .. " and " .. chunkForward2)
    if AgentExists(chunkForward) then
      AssignCornfieldIdles(chunkForward)
      AgentHide(chunkForward, false, true)
    end
    if AgentExists(chunkForward2) then
      AssignCornfieldIdles(chunkForward2)
      AgentHide(chunkForward2, false, true)
    end
    consolePrint("Hiding " .. chunkBehind .. " and " .. chunkBehind2)
    if AgentExists(chunkBehind) then
      AgentHide(chunkBehind, true, true)
    end
    if AgentExists(chunkBehind2) then
      AgentHide(chunkBehind2, true, true)
    end
  else
    consolePrint("Corn Vis update - player TURNING AROUND!")
    consolePrint("Unhiding " .. chunkForward .. " and " .. chunkBehind)
    if AgentExists(chunkForward) then
      AssignCornfieldIdles(chunkForward)
      AgentHide(chunkForward, false, true)
    end
    if AgentExists(chunkBehind) then
      AssignCornfieldIdles(chunkBehind)
      AgentHide(chunkBehind, false, true)
    end
  end
end

function Chapter4B_Cornfield_NextPursuerHeadOn(bEnable)
  if bEnable == nil then
    bEnable = false
  end
  mPursuerForceNextToBeHeadOn = bEnable
end

function Chapter4B_Cornfield_PeekUI_Add()
  if not SceneIsActive("ui_peek.scene") then
    SceneAdd("ui_peek.scene")
  end
end

function Chapter4B_Cornfield_PeekUI_Remove()
  SceneRemove("ui_peek.scene")
end

function Chapter4B_Cornfield_PeekUI_HideArrowsShowNextArrow(...)
  local arg = {
    n = select("#", ...),
    ...
  }
  consolePrint("All Peek arrows hidden!")
  for i = 1, 4 do
    AgentHide("ui_peek_arrowParent" .. i, true, true)
  end
  if arg.n > 0 then
    for key, value in ipairs(arg) do
      local index = value
      consolePrint("Showing Peek arrow " .. index)
      if type(index) == "number" and index >= 1 and index <= 4 then
        AgentHide("ui_peek_arrow" .. tostring(math.floor(index)) .. "_combat", false)
      end
    end
  end
end

function Chapter4B_Cornfield_PursuerPanicMeter_Activate(pursuerAgent, pursuerAgentTrigger, pursuerAgentKillTrigger)
  consolePrint("panic meter --ACTIVATE-- called by " .. pursuerAgent .. " and " .. pursuerAgentTrigger)
  if mbHeadOnPursuerTriggerActivated then
    consolePrint("...but panic meter is already active! bail out!")
    return
  end
  mbHeadOnPursuerTriggerActivated = true
  StealthSeqInactivityTimerEnable(false)
  if ThreadIsRunning(mPursuerPanicMeterRampDownThread) then
    ThreadKill(mPursuerPanicMeterRampDownThread)
    Yield()
    mPursuerPanicMeterRampDownThread = nil
  end
  if not ThreadIsRunning(mPursuerPanicMeterThread) then
    mPursuerPanicMeterThread = ThreadStart(CornfieldPursuerPanicMeter_Update, pursuerAgent, pursuerAgentTrigger, pursuerAgentKillTrigger)
  end
end

function Chapter4B_Cornfield_PursuerPanicMeter_Deactivate(bInstant)
  mbHeadOnPursuerTriggerActivated = false
  consolePrint("PANIC METER OFF!!")
  if ThreadIsRunning(mPursuerPanicMeterThread) then
    ThreadKill(mPursuerPanicMeterThread)
    Yield()
    mPursuerPanicMeterThread = nil
  end
  Chapter4B_Cornfield_PeekUI_HideArrowsShowNextArrow()
  Yield()
  if bInstant then
    mPursuerPanicMeterLastProgress = 0
    AgentSetProperty(kPursuerPanicMeterTimer, "Timer Progress", 0)
  elseif not mPursuerPanicMeterRampDownThread then
    mPursuerPanicMeterRampDownThread = ThreadStart(CornfieldPursuerPanicMeter_RampDown)
  end
  if kPlayerInactivityTimerEnabled and kSpawnPursuers then
    StealthSeqInactivityTimerEnable(true)
  end
end

function Chapter4B_Cornfield_HideAllCornrows(bHide)
  if bHide == nil then
    bHide = false
  end
  local cornrows = AgentGetChildren(kCornrowAgentsMaster)
  for key, value in pairs(cornrows) do
    AgentHide(value, bHide, true)
  end
end

function Chapter4B_Cornfield_DeeApproachAsPursuer()
  AgentHide("PursuerDee", false, true)
  mPursuerDeeController = ChorePlay("env_cornfield2_mysteryPursuerIdle.chore", 100)
  ControllerSetLooping(mPursuerDeeController, true)
  local delay = ChoreGetLength("env_cornfield2_mysteryPursuerIdle.chore") * kPursuerDeeIdleLoopsBeforeApproach
  Sleep(delay)
  ControllerStop(mPursuerDeeController)
  mPursuerDeeController = ChorePlay("env_cornfield2_mysteryPursuerWalksVertical.chore", 100)
  ControllerSetLooping(mPursuerDeeController, false)
  ThreadStart(PlayBonnieNeedsWeaponAmbient)
  consolePrint("Here comes Dee!")
end

function Chapter4B_Cornfield_TimerCallback(key, val)
  consolePrint("Chapter4B_Cornfield_TimerCallback() invoked!")
  if val == true then
    mSequenceActive = true
    mCornfieldCameraActive = true
    mOkayToSpawnPursuers = true
    consolePrint("Cornfield sequence STARTED!")
    Yield()
    Chapter4B_Cornfield_PursuerTriggersEnable(true)
    ThreadStart(camAnchorPosition)
    mCornfieldSeqTimerThread = ThreadStart(Chapter4B_Cornfield_SequenceTimer)
    if kPlayerInactivityTimerEnabled then
      ThreadStart(UpdateSneakyFlashlight)
    end
    if kSpawnPursuers then
      Sleep(kPursuerSpawnDelayStarting)
      mPursuerTimerThread = ThreadStart(pursuerTimer)
    end
  elseif mOkayToSpawnPursuers then
    mOkayToSpawnPursuers = false
    Yield()
    consolePrint("Cornfield sequence ending!  Will end when last pursuer is gone")
    Chapter4B_Cornfield_StopPursuerBanter()
    ThreadStart(CornEndPrep)
  end
end

function camAnchorPosition()
  while mCornfieldCameraActive do
    Yield()
    anchorPos = AgentGetWorldPos(playerAgent)
    AgentSetWorldPos("obj_camAnchor", anchorPos)
  end
end

function badGuysMoveRight(key, val)
  mbBadGuysShifting = val
  if val == true then
    if mbOKForCampPeopleReaction1 then
      ThreadStart(HideHeadOnPursuerBeforeRoman)
    end
    for i = 1, numGuys do
      local pos = AgentGetPos("obj_pursuerAnchor_" .. i)
      if Logic["Cornfield - Forward"] == true then
        pos.x = pos.x + 2.25
      else
        pos.x = pos.x - 2.25
      end
      AgentSetPos("obj_pursuerAnchor_" .. i, pos)
    end
  end
end

function badGuysMoveLeft(key, val)
  mbBadGuysShifting = val
  if val == true then
    if mbOKForCampPeopleReaction1 then
      ThreadStart(HideHeadOnPursuerBeforeRoman)
    end
    for i = 1, numGuys do
      local pos = AgentGetPos("obj_pursuerAnchor_" .. i)
      if Logic["Cornfield - Forward"] == true then
        pos.x = pos.x - 2.25
      else
        pos.x = pos.x + 2.25
      end
      AgentSetPos("obj_pursuerAnchor_" .. i, pos)
    end
  end
end

function Chapter4B_Cornfield_AttachPlayerToMover()
  AgentAttach(playerAgent, "obj_cornAnchor")
  AgentAttachToNode(playerAgent, "obj_cornAnchor", "obj_cornAnchor")
end

function Chapter4B_Cornfield_StartStealthSeq()
  consolePrint("Starting Cornfield sequence!")
  CreateCornfieldAssets()
  Chapter4B_Cornfield_PeekUI_Add()
  Yield()
  Logic["4 - Cornfield Pursuit Begun"] = true
  SetupEnvironment("stealth")
  AgentSetWorldPos(playerAgent, AgentGetWorldPos(playerStartAgent))
  Chapter4B_Cornfield_SetPlayerWalkAnims("Stealth")
  Yield()
  Chapter4B_Cornfield_AttachPlayerToMover()
  ChoredMovement_ReverseControls(false)
  ChoredMovement_AllowOnlyAbsoluteForwardBack(true)
  ChoredMovement_AllowReverse(false)
  ChoredMovement_EndOnChoreFinish(false)
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_cornfield", "Pan Cam - Enabled", false)
    AgentSetProperty("logic_mode_choredMove", "ChoredMove - Autoscootch", false)
    Callback_OnVirtualStick:Add(UpdateVirtualStick)
  end
  ChoredMovement_Start("env_cornfield2_moveNorth.chore", nil, gChapter4B_Cornfield_ChoredMovesStartTime)
  mChoredMovementTime_last = gChapter4B_Cornfield_ChoredMovesStartTime
  mChoredMovementTime_current = gChapter4B_Cornfield_ChoredMovesStartTime
  InputMapperActivate(kCornfieldInputMap)
  CameraActivate("cam_cornfield")
  if kSpawnPursuers then
    PanicMeter_AttachItem("ui_panicmeter_overlay", kPursuerPanicMeterTimer)
    Yield()
    AgentSetProperty(kPursuerPanicMeterTimer, "Timer Progress", 0)
    Dialog_Play("ambient_bonnieLost")
    Chapter4B_Cornfield_StartPursuerBanter(14.5)
  end
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "Cornfield - bPursueRight", "badGuysMoveRight")
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "Cornfield - bPursueLeft", "badGuysMoveLeft")
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "Cornfield - bSceneTimer", "Chapter4B_Cornfield_TimerCallback")
  Yield()
  Logic["Cornfield - bSceneTimer"] = true
end

function Chapter4B_Cornfield_StartPursuerBanter(initDelay)
  if initDelay == nil then
    initDelay = 0
  end
  local bUsePaddedDelay = false
  while DlgIsRunning(Dialog_GetAmbientLoopID()) do
    bUsePaddedDelay = true
    Yield()
  end
  if bUsePaddedDelay then
    initDelay = initDelay + kPursuerBanterMinDelay
  end
  mPursuerBanterActive = true
  Dialog_StartAmbientLoop("ambient_PursuerBanter", kPursuerBanterMinDelay, kPursuerBanterMaxDelay, initDelay)
end

function Chapter4B_Cornfield_StopPursuerBanter(bStopCurrent)
  if bStopCurrent == nil then
    bStopCurrent = false
  end
  Dialog_StopAmbientLoop(bStopCurrent)
  mPursuerBanterActive = false
end

function Chapter4B_Cornfield_DeeCallsOut()
  local bDeeNotLeland = true
  local totalLinesToPlay = 4
  local currentLine = 1
  local fixedDelayBetweenLines = 7
  local delayMin = 1
  local delayMax = 3
  repeat
    Sleep(math.random(delayMin, delayMax))
    if not Logic["4 - Chose Dees Fate"] then
      if bDeeNotLeland then
        Dialog_Play("ambient_deeCallsOut")
      else
        Dialog_Play("ambient_lelandCallsOut")
      end
      bDeeNotLeland = not bDeeNotLeland
    end
    Sleep(fixedDelayBetweenLines)
    currentLine = currentLine + 1
  until Logic["4 - Chose Dees Fate"] or totalLinesToPlay < currentLine
end

function Chapter4B_Cornfield_WaitForCampPeopleEvents()
  local progressDelay = function(eventTime)
    local progressToNextEvent = eventTime / kStealthSeqTime
    while progressToNextEvent > AgentGetProperty(kStealthSeqTimerAgent, "Timer Progress") do
      Yield()
    end
    Chapter4B_Cornfield_StopPursuerBanter()
    while mStealthPositionChangeActive do
      Yield()
    end
    local isAmbPlaying = false
    local wasAmbEverPlaying = false
    repeat
      isAmbPlaying = DlgIsRunning(Dialog_GetAmbientLoopID())
      if isAmbPlaying then
        wasAmbEverPlaying = true
      end
      Yield()
    until not isAmbPlaying
    if wasAmbEverPlaying then
      Sleep(1.5)
    end
    return true
  end
  mbOKForCampPeopleReaction1 = progressDelay(kCampPeopleReaction1Time)
  consolePrint("mbOKForCampPeopleReaction1 is GO***")
  AgentSetProperty(kStealthSeqTimerAgent, "Timer Enabled", false)
  if not mPursuerHeadOnBeforeRomanArrives then
    mPursuerHeadOnBeforeRomanArrives = mPursuerLastHeadOn
    mPursuerTriggerHeadOnBeforeRomanArrives = mPursuerTriggerLastHeadOn
  end
  mbOKForCampPeopleConfab = progressDelay(kCampPeopleConfabTime)
  consolePrint("mbOKForCampPeopleConfab is GO***")
  AgentSetProperty(kStealthSeqTimerAgent, "Timer Enabled", false)
  if kCampPeopleReaction2Enabled then
    mbOKForCampPeopleReaction2 = progressDelay(kCampPeopleReaction2Time)
    consolePrint("mbOKForCampPeopleReaction2 is GO***")
    AgentSetProperty(kStealthSeqTimerAgent, "Timer Enabled", false)
  end
end

function Chapter4B_Cornfield_WaitForMysteryShots()
  local progressToSilence = kMysteryShotsTime / kStealthSeqTime
  local progressToShots = (kMysteryShotsTime + kSequenceDelayBeforeShots) / kStealthSeqTime
  while progressToSilence > AgentGetProperty(kStealthSeqTimerAgent, "Timer Progress") do
    Yield()
  end
  Chapter4B_Cornfield_StopPursuerBanter()
  while progressToShots > AgentGetProperty(kStealthSeqTimerAgent, "Timer Progress") do
    Yield()
  end
  if kSpawnPursuers then
    if ThreadIsRunning(mPursuerTimerThread) then
      ThreadKill(mPursuerTimerThread)
    end
    while mStealthPositionChangeActive do
      Yield()
    end
    StealthSeqInactivityTimerEnable(false)
    mbMysteryShotsFiring = true
    Yield()
    Dialog_PlayAndWait("cs_mysteryShots")
    mPursuerForceNextToBeCloseCall = true
    Yield()
    mPursuerTimerThread = ThreadStart(pursuerTimer)
    Chapter4B_Cornfield_StartPursuerBanter(5.5)
  end
  mbMysteryShotsFired = true
  ChoredMovement_AllowMovement(true)
  mbOkayToUpdateDirection = true
  HideCornForMysteryShots(false)
  Sleep(5.5)
  mScriptedEventsThread = ThreadStart(Chapter4B_Cornfield_WaitForCampPeopleEvents)
  if kRepeatMysteryShots then
    AgentSetProperty(kStealthSeqTimerAgent, "Timer Progress", 0)
    Chapter4B_Cornfield_WaitForMysteryShots()
  end
end

function Chapter4B_Cornfield_SequenceTimer()
  while not mStealthPositionChange_ShiftActive do
    Yield()
  end
  mScriptedEventsThread = ThreadStart(Chapter4B_Cornfield_WaitForMysteryShots)
  TimedDelay(kStealthSeqTimerAgent, kStealthSeqTime)
  consolePrint("Sequence time's up!")
  Logic["Cornfield - bSceneTimer"] = false
end

function Chapter4B_Cornfield_Die_Delay()
  if not mSequenceActive or mbPlayerIsDying then
    return
  end
  while mStealthPositionChangeActive do
    Yield()
  end
  Dialog_Play("cs_cornfieldDie")
end

function Cornfield_Die()
  if not mSequenceActive or mbPlayerIsDying or kPreventPursuerKills then
    return
  end
  print("****Cornfield Death****")
  mbPlayerIsDying = true
  Chapter4B_Cornfield_StopPursuerBanter(true)
  StealthSeqInactivityTimerEnable(false)
  if ThreadIsRunning(mScriptedEventsThread) then
    ThreadKill(mScriptedEventsThread)
  end
  if ThreadIsRunning(mPursuerTimerThread) then
    ThreadKill(mPursuerTimerThread)
  end
  if ThreadIsRunning(mCornfieldSeqTimerThread) then
    ThreadKill(mCornfieldSeqTimerThread)
  end
  Chapter4B_Cornfield_PeekUI_HideArrowsShowNextArrow()
  if ThreadIsRunning(mPursuerPanicMeterThread) then
    ThreadKill(mPursuerPanicMeterThread)
    mPursuerPanicMeterThread = nil
  end
  AgentSetProperty(kPursuerPanicMeterTimer, "Timer Progress", 1)
  AgentHide(kPlayerInactivityFlashlightAgent, true, true)
  SetupEnvironment("normal")
  for i = 1, numGuys do
    local agent = "Pursuer" .. i
    AgentHide(agent, true, true)
    ControllerKill(mActivePursuersControllers[i])
  end
  AgentHide("PursuerCloseCall", true, true)
  AgentDetach("Pursuer1")
  AgentHide("Pursuer1", false)
  AgentHide("flashlight1", false, true)
  AgentHide("obj_gunGlock_pursuer1", false)
  InputMapperDeactivate(kCornfieldInputMap)
  Mode_Pop(mode_Chored_Movement)
  AgentDetach(playerAgent)
end

function Cornfield_OnButtonDown(event)
  if not (not mStealthPositionChangeActive and Mode_IsActive(mode_Main)) or not mSequenceActive then
    return
  end
  UpdateDirection(eDown)
end

function Cornfield_OnButtonLeft(event)
  if not (not mStealthPositionChangeActive and Mode_IsActive(mode_Main)) or not mSequenceActive then
    return
  end
  UpdateDirection(eLeft)
end

function Cornfield_OnButtonRight(event)
  if not (not mStealthPositionChangeActive and Mode_IsActive(mode_Main)) or not mSequenceActive then
    return
  end
  UpdateDirection(eRight)
end

function Cornfield_OnLeftStick(event)
  if not (not mStealthPositionChangeActive and Mode_IsActive(mode_Main)) or not mSequenceActive then
    return
  end
  local dot = VectorDot(event, event)
  if dot < 0.95 then
    return
  end
  UpdateDirection(Input_GetJoystickDir(event))
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  Game_EnableMovement(false)
  local agent = ""
  for i = 1, numGuys do
    agent = "Pursuer" .. i
    ShaderOverrideTexture(agent, "sk54_banditA_body.d3dtx", "sk54_banditAnoLogo_body.d3dtx")
  end
  Rain("fx_rainSphereWD")
  mRainScale = AgentGetProperty("fx_rainSphereWD", "Render Global Scale")
  Chapter4B_Cornfield_PursuerTriggersEnable(false)
  if not Input_IsUsingTouch() then
    Callback_OnItemFocus:Add(Chapter4B_Cornfield_ActivateRebarTut)
  end
  SceneAddOnCameraChangeCallback(kScene, "Chapter4B_Cornfield_CamChangeCallback")
  AgentSetProperty(kPursuerDeeTrigger, "Trigger Enabled", kEnablePursuerDeeTrigger)
  AgentHide("ui_overlayCornfield", true, true)
  if SaveLoad_IsFromLoad() then
    return
  end
  SetupEnvironment("normal")
  mOutsideCornfieldFogColor = AgentGetProperty(kSceneAgent, "Fog Color")
  mOutsideCornfieldFogFarPlane = AgentGetProperty(kSceneAgent, "Fog Far Plane")
  mOutsideCornfieldFogNearPlane = AgentGetProperty(kSceneAgent, "Fog Near Plane")
  if Logic["4 - Attacked Dee"] then
    Chapter4B_Cornfield_SetPlayerWalkAnims("Clearing")
    SetupEnvironment("clearing")
    Dialog_Play("cs_revealDee")
  elseif Logic["4 - Cornfield Pursuit Ended"] then
    Chapter4B_Cornfield_SetPlayerWalkAnims("Normal")
    SetupEnvironment("clearing")
    Dialog_Play("cs_findClearing")
  elseif Logic["4 - Cornfield Pursuit Begun"] then
    SetupEnvironment("stealth")
    Dialog_Play("cs_cornfieldStart")
  elseif AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function Chapter4B()
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
