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

local kScript = "BoardingSchoolExteriorDamaged"
local kScene = "adv_boardingSchoolExteriorDamaged"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_FreecamUseFOVScale = true;

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

require("AI_PlayerProjectile.lua")

local mbAnimatingTextColors = false
local mbClementineWillBurn = false

local OnLogicReady = function()
  if IsPlatformNX() then
    for _, agentName in ipairs(SceneGetAgentNames(Game_GetScene())) do
      if StringStartsWith(agentName, "Zombie") then
        AgentSetProperty(agentName, "Render EnvLight Shadow Cast Enable", false)
      elseif StringStartsWith(agentName, "light_ENV_P_fire") or StringStartsWith(agentName, "light_ENV_P_torch") or StringStartsWith(agentName, "light_ENV_P_campfire") then
        AgentSetProperty(agentName, "EnvLight - Shadow Type", "eLightEnvShadowType_None")
      end
    end
  end
  if Game_GetLoaded() then
    return
  end
  Episode_SetAbelArm()
  Episode_SetAJShirt()
  Episode_SetLouisDamage()
  Episode_SetZombieGrave()
  AgentSetState("Abel", "noseBloody")
  AgentSetState("Abel", "footStab")
  if LogicGet("3 - Slashed Abel's Hand") then
    AgentSetState("Abel", "handSlash")
  end
  AgentSetState("Horse", "ReinsOff")
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_leftGateOpen")
  end
end

function BoardingSchoolExteriorDamaged_ClemLeaveTrigger(agent, trigger)
  if AgentGetName(agent) ~= "Clementine" then
    return
  else
    mbClementineWillBurn = false
  end
end

function BoardingSchoolExteriorDamaged_BurnThisZombie(agent, trigger)
  if not agent then
    return
  end
  if AgentGetName(agent) == "Clementine" then
    AgentSetProperty("ui_panicMeter_vignette", "Render Constant Alpha", 0)
    AgentHide("ui_panicMeter_vignette", false)
    mbClementineWillBurn = true
    local past = GetTotalTime()
    local present = past
    local future = present + 3
    while present < future and mbClementineWillBurn do
      present = present + GetFrameTime()
      AgentSetProperty("ui_panicMeter_vignette", "Render Constant Alpha", Clamp(present - past / future - past + 0.3, 0, 1))
      WaitForNextFrame()
    end
    while Game_GetMode() == eModeCutscene and mbClementineWillBurn do
      WaitForNextFrame()
      WaitForNextFrame()
    end
    if mbClementineWillBurn and AgentGetProperty("Clementine", "AI Player - AI Agents Active") then
      local incr = 1
      local kStr = "trigger_zombiesCatchFire0"
      mbClementineWillBurn = false
      while AgentExistsInScene(kStr .. incr, AgentGetScene(agent)) do
        AgentSetProperty(kStr .. incr, "Trigger Enabled", false)
        incr = incr + 1
        WaitForNextFrame()
      end
      local check = Game_RunSceneDialog("cs_clemDiesByFire")
      if not check then
        print("\"cs_clemDiesByFire\" does not exist! Fix it, fix it, fix it.")
        return
      end
    else
      local bsGarbage = AgentGetProperty("ui_panicMeter_vignette", "Render Constant Alpha")
      while bsGarbage > 0 do
        bsGarbage = bsGarbage - 0.04
        if bsGarbage < 0 then
          AgentHide("ui_panicMeter_vignette", true)
        end
        AgentSetProperty("ui_panicMeter_vignette", "Render Constant Alpha", bsGarbage)
        WaitForNextFrame()
      end
      AgentSetProperty("ui_panicMeter_vignette", "Render Constant Alpha", 0)
      WaitForNextFrame()
    end
  elseif StringStartsWith(AgentGetName(agent), "Zombie") then
    if not AgentGetProperty(agent, "AI Agent - Player Used Interaction Prompt 1 Enable") then
      return
    end
    local zombieController = ChorePlayOnAgent("adv_boardingSchoolExteriorDamaged_zombieCatchesFire.chore", agent)
    while AgentHasProperty(agent, "AI Agent - Dead") and not AgentGetProperty(agent, "AI Agent - Dead") do
      WaitForNextFrame()
    end
    ControllerKill(zombieController)
    WaitForNextFrame()
    local value = AgentGetProperty(agent, "Emitters - Global Intensity")
    while value and value > 0 do
      value = value - 0.02
      WaitForNextFrame()
      AgentSetProperty(agent, "Emitters - Global Intensity", value)
    end
    AgentSetProperty(agent, "Emitters - Global Intensity", 0)
    AgentSetProperty(agent, "Emitters - Enabled", false)
  else
    return
  end
end

function BoardingSchoolExteriorDamaged_EndEpisode()
  WDAchievements_Unlock("achievement_21")
  Menu_EndEpisode("402", false)
  Menu_EndEpisode_CheckUpsell("403")
end

function BoardingSchoolExteriorDamaged_AnimateTextColor(tokenAgent, textAgent)
  local thread = function()
    local kTokenAlpha = "material_ui_useable_token_actionActive_m - Alpha"
    local chore = ChorePlayOnAgent("ui_activeCrosshairText_fade.chore", textAgent)
    ControllerPause(chore)
    while mbAnimatingTextColors do
      local pct = 0
      if AgentGetProperty(tokenAgent, "material_ui_useable_token_actionActive_m - Visible") then
        pct = AgentGetProperty(tokenAgent, kTokenAlpha)
      end
      ControllerSetTime(chore, pct)
      WaitForNextFrame()
    end
    ControllerKill(chore)
  end
  ThreadStart(thread)
end

function BoardingSchoolExteriorDamaged_SetAnimatingTextColors(bEnable)
  if bEnable == mbAnimatingTextColors then
    return
  end
  mbAnimatingTextColors = bEnable
end

local OriginalTelltaleLevelStartLogic = function()
  DlgPreloadAll(Game_GetPlayerDialog(), false)
  SceneAdd("ui_panicMeter.scene")
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function BoardingSchoolExteriorDamaged()
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

Callback_OnLogicReady:Add(OnLogicReady)

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  Game_SceneOpen(kScene, kScript)
else
  SceneOpen(kScene, kScript)
end