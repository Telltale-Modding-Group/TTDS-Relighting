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

local kScript = "BackwoodsStream"
local kScene = "adv_backwoodsStream"

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

local envMeshes = {}
envMeshes.forest = {
  "obj_backwoodsStreamTileA",
  "obj_backwoodsStreamTileB",
  "obj_backwoodsStreamTileC",
  "obj_backwoodsStreamTileD",
  "obj_backwoodsStreamTileEnd",
  "ZombieWoodsA",
  "ZombieWoodsB",
  "ZombieWoodsC"
}

envMeshes.stream = {
  "adv_backwoodsStream_meshesA",
  "adv_backwoodsStream_meshesB",
  "adv_backwoodsStream_meshesC",
  "adv_backwoodsStream_meshesD",
  "adv_backwoodsStream_meshesE",
  "adv_backwoodsStream_meshesF",
  "adv_backwoodsStream_meshesG",
  "adv_backwoodsStream_meshesH",
  "adv_backwoodsStream_meshesI",
  "adv_backwoodsStream_meshesJ",
  "adv_backwoodsStream_meshesK",
  "adv_backwoodsStream_meshesL",
  "adv_backwoodsStream_meshesM",
  "obj_coolerFish",
  "obj_panelMetalBackwoodsStream",
  "obj_rockFormationBackwoodsStreamA",
  "obj_rockFormationBackwoodsStreamB",
  "obj_rockFormationBackwoodsStreamC",
  "obj_rockFormationBackwoodsStreamD",
  "obj_rockFormationBackwoodsStreamE",
  "obj_stonesStepping",
  "obj_coolerFish",
  "obj_treeFallen",
  "obj_treeRocksA",
  "obj_treeRocksB"
}

envMeshes.streamWithTraps = {
  "adv_backwoodsStream_meshesA",
  "adv_backwoodsStream_meshesB",
  "adv_backwoodsStream_meshesC",
  "adv_backwoodsStream_meshesD",
  "adv_backwoodsStream_meshesE",
  "adv_backwoodsStream_meshesF",
  "adv_backwoodsStream_meshesG",
  "adv_backwoodsStream_meshesH",
  "adv_backwoodsStream_meshesI",
  "adv_backwoodsStream_meshesJ",
  "adv_backwoodsStream_meshesK",
  "adv_backwoodsStream_meshesL",
  "adv_backwoodsStream_meshesM",
  "obj_coolerFish",
  "obj_panelMetalBackwoodsStream",
  "obj_rockFormationBackwoodsStreamA",
  "obj_rockFormationBackwoodsStreamB",
  "obj_rockFormationBackwoodsStreamC",
  "obj_rockFormationBackwoodsStreamD",
  "obj_rockFormationBackwoodsStreamE",
  "obj_stonesStepping",
  "obj_trapBase",
  "obj_trapFishBase",
  "obj_trapFishA",
  "obj_trapFishB",
  "obj_trapFishC",
  "obj_trapFishDraped",
  "obj_coolerFish",
  "obj_treeFallen",
  "obj_treeRocksA",
  "obj_treeRocksB"
}

local mBanterDialogID, mZombiesApproachPeteDeathTimerID, mFishEscapeDialogID

local PreloadAssets = function()
  PreLoad("env_backwoodsStream_cs_walkAndTalk_2_rails.chore")
  PreLoad("env_backwoodsStream_cs_walkerBite_1.chore")
  PreLoad("env_backwoodsStream_cs_walkerBite_10.chore")
  PreLoad("env_backwoodsStream_timer_choiceCam_1.chore")
  PreLoad("env_backwoodsStream_cs_peteOrNick_peek_C_to_L_1.chore")
  PreLoad("env_backwoodsStream_cs_peteOrNick_peek_C_to_R_1.chore")
  PreLoad("env_backwoodsStream_cs_peteOrNick_peek_L_to_R_1.chore")
  PreLoad("env_backwoodsStream_cs_peteOrNick_peek_R_to_L_1.chore")
  PreLoad("env_backwoodsStream_cs_goWithPete_1.chore")
  PreLoad("env_backwoodsStream_timer_PeteGrabbed_1.chore")
  PreLoad("env_backwoodsStream_timer_PeteGrabbed_2.chore")
  PreLoad("env_backwoodsStream_timer_PeteGrabbed_clemHasBoard_1.chore")
  PreLoad("env_backwoodsStream_timer_PeteGrabbed_2.chore")
  PreLoad("env_backwoodsStream_cs_clemFreesPete_2.chore")
  PreLoad("env_backwoodsStream_cs_goWithNick_1.chore")
  PreLoad("env_backwoodsStream_cs_goWithNick_2.chore")
  PreLoad("env_backwoodsStream_cs_goWithNick_6.chore")
  PreLoad("env_backwoodsStream_cs_goWithNick_5.chore")
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "132")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "140")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "76")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_QLo.t3fxb", "6")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "263")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "263")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "256")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "7")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "262")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "320")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "323")
  end
end

function BackwoodsStream_GreatFishEscape()
  mFishEscapeDialogID = Game_RunDialog("amb_escapingFish", false)
end

function BackwoodsStream_GreatFishEscape_Pause(bPause)
  if mFishEscapeDialogID then
    if bPause then
      DlgPause(mFishEscapeDialogID)
    else
      DlgResume(mFishEscapeDialogID)
    end
  end
end

function BackwoodsStream_EscapingFishCheck()
  print("*** escaping fish check! ***")
  if LogicGet("3BackwoodsStream - Escaping Fish") <= 1 then
    if mFishEscapeDialogID then
      DlgStop(mFishEscapeDialogID)
    end
    Game_RunDialog("cs_lastFishGetsAway")
  end
end

function BackwoodsStream_EscapingFish_KillCallback()
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3BackwoodsStream - Escaping Fish", BackwoodsStream_EscapingFishCheck)
end

function BackwoodsStream_ZombiesApproachPeteTimer_Start()
  print("Zombies approaching Pete -- timer started!")
  mZombiesApproachPeteDeathTimerID = Game_RunDialog("timer_zombiesApproachPete", false)
end

function BackwoodsStream_ZombiesApproachPeteTimer_Stop()
  print("Zombies approaching Pete -- stop timer?")
  print("mZombiesApproachPeteDeathTimerID is " .. tostring(mZombiesApproachPeteDeathTimerID))
  if mZombiesApproachPeteDeathTimerID then
    print("Timer STOPPED!")
    DlgStop(mZombiesApproachPeteDeathTimerID)
  end
end

function BackwoodsStream_MakeAllObjsUnselectable()
  for key, value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end

function BackwoodsStream_ConnectiveTissuePause()
  while Game_ModeIsOnStack(eModeCutscene) do
    Yield()
  end
  if not LogicGet("3BackwoodsStream - Started Fishing") then
    Dialog_Run(Game_GetSceneDialog(), "cs_connectiveTissue")
  end
end

function BackwoodsStream_StartWalkAcrossLog()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_backwoodsStream_cs_walkAndTalk_2_rails.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_walkerBite")
  ChoredMovement_Start()
end

function BackwoodsStream_SetEnvironment(state)
  local meshesToShow
  for key, value in pairs(envMeshes) do
    if state == key then
      meshesToShow = envMeshes[state]
      break
    end
  end
  if not meshesToShow then
    print("BackwoodsStream_SetEnvironment() didn't get a valid state!")
    return
  end
  for key, value in pairs(envMeshes) do
    for key, value in pairs(value) do
      AgentHide(value, true)
    end
  end
  for key, value in pairs(meshesToShow) do
    AgentHide(value, false)
  end
end

function BackwoodsStream_BanterStart()
  mBanterDialogID = Dialog_Run(Game_GetSceneDialog(), "amb_fishingBanter", false)
  print("^^STARTING^^ fishing banter!  Dialog ID: " .. tostring(mBanterDialogID))
end

function BackwoodsStream_BanterPause(bPause)
  if not bPause then
    print("** RESUMING ** fishing banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgResume(mBanterDialogID)
  else
    print(">> PAUSING << fishing banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgPause(mBanterDialogID)
  end
end

function BackwoodsStream_BanterEnd()
  print("-> STOPPING <- fishing banter!  Dialog ID: " .. tostring(mBanterDialogID))
  if DlgIsRunning(mBanterDialogID) then
    DlgStop(mBanterDialogID)
  else
    print("...but the banter wasn't running!")
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  Game_StartScene(true)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function BackwoodsStream()
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
