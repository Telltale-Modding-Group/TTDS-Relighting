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

local kScript = "HardwareStoreExteriorYardAfternoon"
local kScene = "adv_hardwareStoreExteriorYardAfternoon"

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
RelightConfigLevel = RelightConfigData_Season2.Level_203_HardwareStoreExteriorYardAfternoon;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kStruggleAgents = {
  "struggle_sarita"
}

local kStruggleConsoleDecayMulti = 2.75
local kSaritaStruggleWin = 0.8
local kSaritaStruggleWinConsoles = 0.75
local mbIsConsole = IsPlatformPS3() or IsPlatformXbox360()
local mSaritaStruggleControllerIdle
local mSaritaStruggleWin = kSaritaStruggleWin

local PreloadAssets = function()
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_groupRoundedUp_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_kennyBeaten_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_kennyBeaten_2.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_kennyBeaten_3.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_kennyBeaten_7.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_scrubChore_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_chores_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_chores_2.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_chores_3.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_2.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_3.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_4.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_5.chore")
  if Platform_NeedShaderPreload() then
    print(">>>>>>>>> PRELOADING SHADERS: " .. kScene)
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_QLo.t3fxb", "263")
  end
end

local ConsoleStruggleBoost = function()
  if mbIsConsole then
    print(">>> Adjusting struggle values for console <<<")
    local decay = 0
    for key, value in pairs(kStruggleAgents) do
      decay = AgentGetProperty(value, "Button Mash - Rate of Decay")
      decay = decay * kStruggleConsoleDecayMulti
      AgentSetProperty(value, "Button Mash - Rate of Decay", decay)
    end
  end
end

function HardwareStoreExteriorYardAfternoon_SaritaStruggleStart()
  print("Sarita struggle >>> STARTED <<<")
  mSaritaStruggleControllerIdle = ChorePlay("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_chores_1.chore")
  ControllerSetLooping(mSaritaStruggleControllerIdle, true)
  Struggle_Enter("struggle_sarita")
end

function HardwareStoreExteriorYardAfternoon_SaritaStruggleWinCheck()
  if not AgentGetProperty("struggle_sarita", "Struggle - Complete") then
    local curStrugValue = AgentGetProperty("struggle_sarita", "Button Mash - Current Percentage")
    if curStrugValue > mSaritaStruggleWin then
      LogicSet("3 - Stopped Sarita", true)
    end
    Yield()
    Struggle_Exit()
  end
  ControllerKill(mSaritaStruggleControllerIdle)
end

function HardwareStoreExteriorYardAfternoon_SaritaStruggleLoseBreakout()
  print("Sarita struggle LOST!!!")
  while Subtitle_GetCurrentID() ~= -1 do
    Yield()
  end
  Dialog_StopAll()
  Game_RunDialog("cs_bonnieIntervenes", true)
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  if IsPlatformAndroid() then
    AgentSetProperty("cam_cutsceneChore", "Clip Plane - Near", 0.2)
  end
  Game_StartScene()
  if mbIsConsole then
    mSaritaStruggleWin = kSaritaStruggleWinConsoles
  end
  if not Game_GetLoaded() then
    ConsoleStruggleBoost()
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function HardwareStoreExteriorYardAfternoon()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "203_";
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
