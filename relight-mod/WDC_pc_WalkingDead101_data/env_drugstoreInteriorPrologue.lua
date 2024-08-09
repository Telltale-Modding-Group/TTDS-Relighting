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

local kScene = "adv_drugstoreInteriorPrologue.scene"

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
RelightConfigLevel = RelightConfigData_Season1.Level_101_env_drugstoreInteriorPrologue;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local mBoardsComingOut = {}
local mBoardsFailed = {}

local getAvailableBoards = function()
  local avail = {}
  for i = 0, 5 do
    if not mBoardsComingOut[i] and not mBoardsFailed[i] then
      table.insert(avail, i)
    end
  end
  return avail
end

function Prologue_PickABoard()
  local avail = getAvailableBoards()
  if #avail == 0 then
    Logic["Drugstore - PrologueBoardCurrentOut"] = -1
    return
  end
  local boardIdx = TableGetRandomElement(avail)
  mBoardsComingOut[boardIdx] = true
  Logic["Drugstore - PrologueBoardCurrentOut"] = boardIdx
end

function Prologue_ResetBoard(idx)
  mBoardsComingOut[idx] = false
end

function Prologue_BoardIsComingOut(idx)
  return mBoardsComingOut[idx]
end

function Prologue_FailBoard(idx)
  mBoardsFailed[idx] = true
end

function dlgIdle(dlgItem, logicKey)
  while Logic[logicKey] do
    Dialog_PlayAndWait(dlgItem)
    Yield()
  end
end

function Prologue_MoveToCarley()
  Mode_Pop(mode_choice)
  Dialog_Play("cs_MoveToCarley")
end

function Prologue_MoveToDoug()
  Mode_Pop(mode_choice)
  Dialog_Play("cs_MoveToDoug")
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - PrologueStartFromChoice") then
    Dialog_Play("cs_choiceSetup")
  elseif IsToolBuild() and AgentGetProperty("logic_debug", "Debug - PrologueStartFromSaveClem") then
    AgentHide("Glenn", true)
    Dialog_Play("cs_kennyReturns")
  elseif Platform_HasHeadTracking() then
    Dialog_Play("cs_getOnDoor")
  elseif not SaveLoad_IsFromLoad() then
    if not IsToolBuild() or not GetPreferences()["Skip Intro Cutscenes"] then
      if Platform_IsWiiU() then
        print("Dialog Preloading start1")
        DlgPreload("env_drugstorePrologue.dlog", "cs_prologueAtEnd", 0, 15, 0, false)
      end
      Dialog_Play("cs_prologueAtEnd")
    else
      if Platform_IsWiiU() then
        print("Dialog Preloading start2")
        DlgPreload("env_drugstorePrologue.dlog", "logic_StartScene", 0, 10, 0, false)
      end
      Dialog_Play("logic_StartScene")
    end
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function Prologue()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end

  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_PostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_PostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "101_";
    TLSE_Development_Editor_Start();
    Callback_PostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_PostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_PostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, "Prologue")
