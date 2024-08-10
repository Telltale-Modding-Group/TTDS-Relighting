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

local kScript = "ForestTile"
local kScene = "adv_forestTile"

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
RelightConfigLevel = RelightConfigData_Season4.Level_402_ForestTile;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local mbDebugText = false

local DebugPrint = function(mesg, verbosity, bError)
  if not mbDebugText then
    return
  end
  Print(mesg, verbosity, bError)
end

local OnKeyChange = function(key, value)
  if key == "AI Player - Interaction Enable" and AgentGetProperty("James", "AI Agent - AI Agent Enable") then
    DebugPrint("setting James pathing to " .. tostring(value))
    AgentSetProperty("James", "AI Agent - Pathing Enable", value)
  end
end

local OnLogicReady = function()
  PropertyAddKeyCallback(AgentGetProperties("Clementine"), "AI Player - Interaction Enable", OnKeyChange)
  if Game_GetLoaded() then
    return
  end
  Episode_SetAbelArm()
  AgentSetProperty("James", "Current State", "headMask")
  local debugID = LogicGet("Debug ID")
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_postKick")
  elseif debugID == 2 then
    Game_SetSceneDialogNode("cs_lost")
  end
end

function ForestTile_SpawnJames()
  local PositionIsValid = function()
    if AgentIsOnScreen("James") then
      DebugPrint("invalid: James is on-screen")
      return false
    elseif AgentDistanceToAgent("Clementine", "James") < 6 or AgentDistanceToAgent("Clementine", "James") > 10 then
      DebugPrint("invalid: James is too close to Clem")
      return false
    end
    DebugPrint("position OK")
    return true
  end
  local i = 0
  while not PositionIsValid() do
    local multipliers = {1, -1}
    local requestedPos = Vector(0, 0, 0)
    requestedPos.x = RandomInt(6, 15) * multipliers[RandomInt(1, 2)]
    requestedPos.z = RandomInt(6, 15) * multipliers[RandomInt(1, 2)]
    local pos = WalkBoxesPosOnWalkBoxes(AgentLocalToWorld("Clementine", requestedPos), 0, "adv_forestTile.wbox")
    DebugPrint("trying to spawn James at " .. tostring(pos))
    AgentSetWorldPos("James", pos)
    i = i + 1
    if i >= 30 then
      DebugPrint("couldn't find a good position after " .. i .. " tries; giving up :(")
      break
    end
  end
  AgentFacePos("James", AgentGetWorldPos("Clementine"))
  AgentSetProperty("James", "AI Agent - AI Agent Enable", true)
  AgentHide("James", false)
end

local OriginalTelltaleLevelStartLogic = function()
  DlgPreloadAll(Game_GetPlayerDialog(), false)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function ForestTile()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "402_";
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

Callback_OnLogicReady:Add(OnLogicReady)

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  Game_SceneOpen(kScene, kScript)
else
  SceneOpen(kScene, kScript)
end