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

local kScript = "HardwareStoreExteriorRear"
local kScene = "adv_hardwareStoreExteriorRear204"

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
RelightConfigLevel = RelightConfigData_Season2.Level_204_HardwareStoreExteriorRear;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local mChoredMoveThread, mDialogId, mTriggerChoreController, mChoredMoveController

local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
  end
end

function HardwareStoreExteriorRear204_GetTriggerController()
  local trigger = AgentFind("trigger_chorebox_hardwareStoreExteriorRear204_followJane_Jane")
  Yield()
  if not trigger then
    print([[
ERROR -- Trigger is not initialized!


]])
    return
  end
  mTriggerChoreController = trigger.mChoreController
end

function HardwareStoreRear204_ManageClemSpeed()
  print([[
FUNCTION START!

]])
  mChoredMoveController = ChoredMovement_GetForwardController()
  print([[
did it even get here?

]])
  HardwareStoreExteriorRear204_GetTriggerController()
  print([[
Controllers initialized!!

]])
  if not mChoredMoveController or not mTriggerChoreController then
    print([[
ERROR -- mTriggerChore or mChoredMove controller is NIL!!

]])
    return
  end
  print([[
Starting loop!

]])
  while ChoredMovement_IsActive() do
    local choreBoxPercentage = ControllerGetTime(mTriggerChoreController)
    Yield()
    print("ChBox == " .. tostring(choreBoxPercentage) .. [[
 

]])
    ControllerSetTimeScale(mChoredMoveController, choreBoxPercentage)
    Yield()
    print([[
Time scale set!

]])
  end
  print([[
Pre-Controller Kill!

]])
  ControllerKill(mChoredMoveController)
  ControllerKill(mTriggerChoreController)
  print([[
FUNCTION END!! WOOT!

]])
end

function HardwareStoreExteriorRear_DlgRun(dlgNode)
  if Game_DialogExists(dlgNode) then
    mDialogId = Game_RunSceneDialog(dlgNode, false)
  else
    Print("WARNING: -- " .. tostring(dlgNode) .. " -- does not Exist!!")
    return
  end
end

function HardwareStoreExteriorRear_DlgPause()
  if not mDialogId then
    Print("WARNING: mDialogId == " .. tostring(mDialogId) .. " for DlgPause.")
    return
  end
  DlgPause(mDialogId)
end

function HardwareStoreExteriorRear_DlgResume()
  if not mDialogId then
    Print("WARNING: mDialogId == " .. tostring(mDialogId) .. " for DlgResume.")
    return
  end
  DlgResume(mDialogId)
end

function HardwareStoreExteriorRear_DlgStop()
  if not mDialogId then
    Print("WARNING: mDialogId == " .. tostring(mDialogId) .. " for DlgStop.")
    return
  end
  DlgStop(mDialogId, false)
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene()
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function HardwareStoreExteriorRear()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end
  
  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_OnPostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_OnPostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "204_";
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  SceneAdd("ui_openingCredits")
end