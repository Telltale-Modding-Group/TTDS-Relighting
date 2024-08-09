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

local kScript = "LakeBridgeApproach"
local kScene = "adv_lakeBridgeApproach"

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
RelightConfigLevel = RelightConfigData_Season2.Level_202_LakeBridgeApproach;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kBinocsOverlay = "fx_overlayTelescope.scene"
local kWalkerApproachCMoveChore = "env_lakeBridgeApproach_cs_approachZombies_1.chore"

local PreloadAssets = function()
  PreLoad("env_lakeBridgeApproach_CS_Enter_1.chore")
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_ENV_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
  end
end

function LakeBridgeApproach_SuppressBinocs()
  while SceneIsActive(kScene) do
    if not SceneIsHidden(kBinocsOverlay) then
      SceneHide(kBinocsOverlay, true)
    end
    if not AgentIsHidden(kBinocsOverlay) then
      AgentHide(kBinocsOverlay, true)
    end
    Yield()
  end
end

function LakeBridgeApproach_ApproachZombies()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", kWalkerApproachCMoveChore)
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "amb_timerChooseZombie")
  ChoredMovement_Start()
end

function LakeBridgeApproach_TooCloseToRun()
  LogicSet("2BridgeApproach - Run to Walkers", false)
  print("Clem's gonna sneak all the way up!")
end

function LakeBridgeApproach_FinishSneak(walkerPick)
  Navigate_Enable(false)
  Reticle_Enable(false)
  Yield()
  local timeChoredIn = ChoredMovement_GetTimePercent() * ChoreGetLength(kWalkerApproachCMoveChore)
  ChoredMovement_Stop()
  local controller = ChorePlayAndAdvance(kWalkerApproachCMoveChore, timeChoredIn)
  while ControllerIsPlaying(controller) do
    Yield()
  end
  RenderDelay(10)
  if walkerPick == "shorty" then
    Game_RunDialog("use_zombieShorty1", false)
  elseif walkerPick == "standingLeg" then
    Game_RunDialog("use_zombieStandingLeg1", false)
  elseif walkerPick == "standingHead" then
    Game_RunDialog("use_zombieStandingHead1", false)
  end
  Reticle_Enable(true)
  Yield()
end

function LakeBridgeApproach_SuppressVerbUI(hideTime)
  hideTime = hideTime or 0.25
  local nounScale = AgentGetProperty("ui_reticle_textNoun", "Text Scale")
  local verbScale = AgentGetProperty("ui_reticle_textVerb", "Text Scale")
  AgentSetProperty("ui_reticle_textNoun", "Text Scale", 0)
  AgentSetProperty("ui_reticle_textVerb", "Text Scale", 0)
  local curTime = GetTotalTime()
  local delay = curTime + hideTime
  local inc = 0
  while curTime < delay do
    print("no text dammit")
    inc = GetFrameTime() * SceneGetTimeScale(kScene)
    curTime = curTime + inc
    Yield()
  end
  AgentSetProperty("ui_reticle_textNoun", "Text Scale", nounScale)
  AgentSetProperty("ui_reticle_textVerb", "Text Scale", verbScale)
end

function LakeBridgeApproach_AmbientLineDelay(lookAt)
  if IsPlatformXbox360() or IsPlatformPS3() or IsPlatformVita() then
    ChorePlay("ui_reticle_textHide.chore")
  end
  while Subtitle_GetCurrentID() ~= -1 do
    Yield()
  end
  if lookAt == "bridge" then
    Game_RunDialog("cs_lookAtBridge", false)
  elseif lookAt == "lift" then
    Game_RunDialog("cs_lookAtLift", false)
  elseif lookAt == "stationHouse" then
    Game_RunDialog("cs_lookAtStationHouse", false)
  else
    Game_RunDialog("cs_lookAtLodge", false)
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene(true)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function LakeBridgeApproach()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "202_";
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
