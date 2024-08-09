--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");
require("RELIGHT_env_savannahRiverStreet.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "SavannahRiverStreet"
local kScene = "adv_savannahRiverStreet"

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
RelightConfigLevel = RelightConfigData_Season1.Level_104_env_savannahRiverStreet;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

function RiverStreet_ForceIceAxeSelectable()
  while SceneIsActive(kScene) and not Logic.Dying and not AgentIsHidden("obj_toolIceClimber_World") and not AgentGetProperty("struggle_ManholeCover", "Struggle Finished") do
    print("Grab the ice axe, Lee!")
    AgentSetProperty("obj_toolIceClimber_World", "Game Selectable", true)
    Yield()
  end
end

function RiverStreet_HideTelescopeScene()
  Yield()
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end

function SavannahRiverStreet_PreLoadLeeHit()

end

function SavannahRiverStreet_PreLoadYouHaveToHelpUs()

end

function SavannahRiverStreet_EnterTelescope()
  Game_EnterCloseUp("cam_panningTelescope")
  local closeUpCam = AgentFind("cam_panningTelescope")
  local reticleCamH = AgentFind("reticleCamH")
  if not reticleCamH then
    return
  end
  local function OnAnimTime(key, value)
    if SceneGetCamera(kScene) ~= closeUpCam or closeUpCam.mProps["Pan Cam - Percentage Desired Horizontal"] >= 0 then
      return
    end
    local timePercent = value / reticleCamH.mProps["NavCam - Animation Max Time"]
    if timePercent < 0.1 then
      Dialog_Play("cs_telescopeLooksFarLeft")
      PropertyRemoveKeyCallback(reticleCamH.mProps, "NavCam - Animation Time", OnAnimTime)
      Game_ExitCloseUp("cam_panningTelescope")
    end
  end
  PropertyAddKeyCallback(reticleCamH.mProps, "NavCam - Animation Time", OnAnimTime)
end

function SavannahRiverStreet_OnSneakEnd()
  Dialog_Play("cs_leeApprochesNewsstand")
end

function SavannahRiverStreet_PeekUp()
  Dialog_Play("cs_newsstandEmpty")
end

local OriginalTelltaleLevelStartLogic = function()
  Mode(mode_Main)
  if not Logic["2StreetFight - Begun"] then
    if SaveLoad_IsFromLoad() then
      SceneAdd("ui_overlay_telescope.scene")
      if not Logic["2RiverStreet- Successfully Operated Telescope"] then
        Yield()
        Print("hide the scene")
        SceneHide("ui_overlay_telescope.scene", true)
      end
      return
    else
      SceneAdd("ui_overlay_telescope.scene", "RiverStreet_HideTelescopeScene")
    end
  end
  if Logic["2RiverStreet - Spotted Molly"] then
    local sceneAgent = SceneGetSceneAgent(kScene)
    if sceneAgent then
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_savannahRiverStreet_act2Fight.dlog"
    end
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function SavannahRiverStreet()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "104_";
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

SceneOpen(kScene, kScript)
