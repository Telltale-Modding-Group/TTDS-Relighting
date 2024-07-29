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

local kScript = "drugstoreOffice"
local kScene = "adv_drugstoreOffice.scene"

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
RELIGHT_kScene = kScene;
RelightConfigGlobal = RelightConfigData_Main.Global;
RelightConfigDevelopment = RelightConfigData_Development.DevelopmentTools;
RelightConfigLevel = RelightConfigData_Season2.Level_101_DrugstoreOffice;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local OriginalTelltaleLevelStartLogic = function()
  local bGotKeys = Logic["Drugstore - Got Keys"]

  if bGotKeys then
    Logic["Office - Pallet moved"] = true
    Logic["Office - found medikit"] = true
    AgentSetProperty("obj_doorDrugstoreOffice", "Game Selectable", false)
    AgentSetProperty("obj_doorDrugstoreAlley", "Game Selectable", false)
    AgentHide("Clementine", true)
  end

  Logic["Drugstore - ArrivalComplete"] = true

  if Logic["Office - got photo"] then
    AgentHide("obj_photoLeeFamily", true)
    AgentSetProperty("trigger_camPhoto", "Trigger Enabled", false)
  elseif Input_IsUsingTouch() then
    AgentSetProperty("trigger_camPhoto", "Trigger Enabled", true)
  end

  if bGotKeys or Logic["Office - Pallet moved"] then
    AgentSetPos("obj_drugStoreOfficeWoodenPalette", Vector(-2.217857, 0.649245, 0.729007))
    AgentSetRot("obj_drugStoreOfficeWoodenPalette", Vector(-58.130367, -90.984055, 0.282882))
    AgentSetSelectable("obj_drugStoreOfficeWoodenPaletteLogical", false)
  end

  if bGotKeys or Logic["Office - Desk moved"] then
    AgentSetPos("obj_deskDrugstoreOffice", Vector(-1.03863, 0.5799, -2.363176))
    AgentSetRot("obj_deskDrugstoreOffice", Vector(0, -7.310176, 0))
    AgentSetSelectable("obj_deskDrugstoreOffice", false)

    if bGotKeys then
      CameraActivate("cam_navPart3")
    else
      CameraActivate("cam_navPart2")
    end
  end

  if Logic["MotorInn - Have Remote"] then
    AgentHide("obj_Remote", true)
  end

  Mode(mode_Main)

  if not SaveLoad_IsFromLoad() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1")
      DlgPreload("env_office.dlog", "enter_office", 0, 10, 0, false)
    end

    Dialog_Play("enter_office")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

drugstoreOffice = function()
  --Apply freecamera settings from ini dev file
  RELIGHT_ApplyFreecameraSettingsFromINI();

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
