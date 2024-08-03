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

local kScript = "MarshHouseInterior"
local kScene = "adv_marshHouseInteriorRoom"

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

local kLeeStrangleStruggle_lastValue = 0
local kLeeStrangleStruggle_fail_lastValueMin = 0.2
local kLeeStrangleStruggle_fail_curValueMax = 0.16
local kLeeForcedSitDialogID

local HideStruggleUI = function()
  AgentSetProperty("struggle_fight2", "Button Mash - Rate of Decay", 0.2)
  ChorePlay("ui_struggle_fadeout")
  Yield()
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3Room - Hide Struggle UI", MarshHouseInterior_OnHideStruggleUI)
end

local LeeStrangleStruggle_InstantFail = function()

end

function MarshHouseInterior_PreLoadCampmanShot()

end

function MarshHouseInterior_PreLoadZombieToFloor()

end

function MarshHouseInterior_OnHideStruggleUI(key, value)
  if value then
    ThreadStart(HideStruggleUI)
  end
end

function MarshHouseInterior_OnEndWeaponSelection(key, value)
  print("Clem Weapon Pick End callback!")
  print("logic key is " .. tostring(value))
  if value == false then
    AgentSetProperty("obj_bottleGlass", kGameSelectable, false)
    AgentSetProperty("obj_cleaver", kGameSelectable, false)
    AgentSetProperty("obj_MarshHouseInteriorCarafe", kGameSelectable, false)
    AgentSetProperty("obj_MarshHouseInteriorLamp", kGameSelectable, false)
    Yield()
    PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3Room - OK to Pick Clem Weapon", MarshHouseInterior_OnEndWeaponSelection)
  end
end

function MarshHouseInterior_OnClemFireGun(key, value)
  if value then
    AgentSetProperty("struggle_fight3", "Button Mash - Rate of Decay", 0.001)
    AgentSetProperty("struggle_fight3", "Button Mash - Rate of Increase", 10)
    Yield()
    PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3Room - Clem Fired Gun", MarshHouseInterior_OnClemFireGun)
  end
end

function MarshHouseInterior_EndCampmanAdvantageStruggle(key, value)
  if value then
    Struggle_End()
    Yield()
    PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3Room - Campman Advantage Struggle End", MarshHouseInterior_EndCampmanAdvantageStruggle)
  end
end

function MarshHouseInterior_LeeStrangleStruggle_CheckProgress(key, value)
  local curValue = 0
  if value then
    curValue = value
  end
  if kLeeStrangleStruggle_lastValue > kLeeStrangleStruggle_fail_lastValueMin and curValue < kLeeStrangleStruggle_fail_curValueMax then
    AgentSetProperty("struggle_fight2", "Struggle Finished", true)
  else
    kLeeStrangleStruggle_lastValue = curValue
  end
end

function MarshHouseInterior_CampmanCorpseChoiceExit()
  Dialog_Play("cs_CampmanCorpseChoiceExit")
end

function MarshHouseInterior_forceLeeSittingIdleStart()
  if not kLeeForcedSitDialogID then
    kLeeForcedSitDialogID = Dialog_Play("logic_LeeForcedSittingIdle")
  end
end

function MarshHouseInterior_forceLeeSittingIdleStop()
  if kLeeForcedSitDialogID then
    DlgStop(kLeeForcedSitDialogID)
    kLeeForcedSitDialogID = nil
  end
end

function PreloadShaders()

end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Room - Hide Struggle UI", MarshHouseInterior_OnHideStruggleUI)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Room - Clem Fired Gun", MarshHouseInterior_OnClemFireGun)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Room - Campman Advantage Struggle End", MarshHouseInterior_EndCampmanAdvantageStruggle)
  PropertyAddKeyCallback(AgentGetProperties("struggle_fight2"), "Button Mash - Current Percentage", MarshHouseInterior_LeeStrangleStruggle_CheckProgress)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Room - OK to Pick Clem Weapon", MarshHouseInterior_OnEndWeaponSelection)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState(true, false, true, "A")
  if Logic["3Room - Clem Ready To Sneak"] then
    AgentSetProperty("obj_doorMarshHouseInteriorRoomFront", kGameSelectable, false)
    AgentSetProperty("obj_doorMarshHouseInteriorRoomBathroom", kGameSelectable, false)
    AgentSetProperty("obj_bagBowlingCampman", "Runtime: Visible", true)
    AgentSetProperty("obj_bagBowlingCampman", kGameSelectable, false)
    AgentSetProperty("trigger_campmanAppears", kTriggerEnabled, false)
    Logic["3Room - Entered Room"] = true
    AgentSetProperty("Lee", kIdleAnim, "adv_marshhouseinteriorroom_leesitting.chore")
    AgentHide("Campman", false)
    AgentSetProperty("Campman", kIdleAnim, "adv_marshhouseinteriorroom_campmansitting.chore")
    if not WDInventory_ItemExists("Inventory - Cleaver") then
      AgentHide("obj_cleaver", false)
      AgentSetProperty("obj_cleaver", kGameSelectable, true)
    end
    Dialog_Play("cs_clemEscapes")
    return
  end
  if Logic["3Room - Campman Dead"] then
    AgentSetProperty("obj_doorMarshHouseInteriorRoomFront", kGameSelectable, true)
    AgentSetProperty("obj_doorMarshHouseInteriorRoomBathroom", kGameSelectable, true)
    AgentHide("obj_bagBowlingCampman", false)
    AgentHide("obj_marshHouseInteriorRope", true)
    PlayAnimation("obj_marshHouseInteriorDoubleDoor_L", "obj_marshHouseInteriorDoubleDoor_L_sk54_action_leeCampmanClosetTackle.anm")
    PlayAnimation("obj_marshHouseInteriorDoubleDoor_R", "obj_marshHouseInteriorDoubleDoor_R_sk54_action_leeCampmanClosetTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomTableA", "obj_marshHouseInteriorRoomTableA_sk54_action_leeChairCampmanTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomCreamer", "obj_marshHouseInteriorRoomCreamer_sk54_action_leeChairCampmanTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomNapkinHolder", "obj_marshHouseInteriorRoomNapkinHolder_sk54_action_leeChairCampmanTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomChairB", "obj_marshHouseInteriorRoomChairB_sk54_action_leeChairCampmanTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomChairA", "obj_marshHouseInteriorRoomChairA_sk54_action_leeChairCampmanTackle.anm")
    AgentSetProperty("trigger_campmanAppears", kTriggerEnabled, false)
    Logic["3Room - Entered Room"] = true
    Logic["3Room - Clem Ready to Sneak"] = true
    AgentHide("Clementine", false)
    AgentSetProperty("Clementine", kGameSelectable, true)
    AgentSetProperty("Clementine", "Mesh sk56_clementine105_haircutHat - Visible", false)
    AgentSetProperty("Clementine", "Mesh sk56_clementine105_haircut - Visible", true)
    AgentHide("Campman", false)
    AgentSetProperty("Campman", kGameSelectable, true)
    if Logic["3Room - Killed Campman"] then
      AgentSetProperty("Campman", kIdleAnim, "adv_marshhouseinteriorroom_campmanstrangled.chore")
    else
      AgentSetProperty("Campman", kIdleAnim, "adv_marshhouseinteriorroom_campmanshot.chore")
    end
    Dialog_Play("cs_whatNow")
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

function MarshHouseInterior()
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
