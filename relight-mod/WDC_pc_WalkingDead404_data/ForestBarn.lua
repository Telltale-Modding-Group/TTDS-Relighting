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

local kScript = "ForestBarn"
local kScene = "adv_forestBarn"

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
RelightConfigLevel = RelightConfigData_Season4.Level_404_ForestBarn;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kWalkbox = "adv_forestBarn.wbox"
local mDisableTriZombies = {}

local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  local debugID = LogicGet("Debug ID")
  if debugID == 0 then
    return
  end
  if debugID > 1 then
    Dialog_Run("env_forestBarn_act2", "logic_setPlayer", false)
  end
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_shutIn")
  elseif debugID == 2 then
    Game_SetSceneDialogNode("cs_slowEmDown")
  else
    Game_SetSceneDialogNode("cs_endOfTheLine")
  end
end

function ForestBarn_DisableZombieTri(zombie)
  if table.contains(mDisableTriZombies, zombie) then
    TableRemove(mDisableTriZombies, zombie)
    WaitForNextFrame()
    Print([[
Zombie was already in table

]])
  end
  WalkBoxesDisableAreaAroundAgent(kWalkbox, zombie)
  table.insert(mDisableTriZombies, zombie)
end

function ForestBarn_EnableZombieTri(zombie)
  if #mDisableTriZombies == 0 then
    Print([[
The table is empty!

]])
    return
  end
  if zombie then
    if table.contains(mDisableTriZombies, zombie) then
      Print([[
Stunning an already stunned zombie.

]])
      WalkBoxesEnableAreaAroundAgent(kWalkbox, zombie)
    else
      Print(zombie .. [[
 isn't in the table yet!

]])
      return
    end
  else
    WalkBoxesEnableAreaAroundAgent(kWalkbox, mDisableTriZombies[1])
    table.remove(mDisableTriZombies, 1)
    Print([[
Index 1 has been removed from the table!

]])
  end
end

function ForestBarn_EnableDeadZombieTri(zombie)
  if zombie then
    WalkBoxesEnableAreaAroundAgent(kWalkbox, zombie)
    TableRemove(mDisableTriZombies, zombie)
    Print(zombie .. [[
 has been removed from the table!

]])
  end
end

function ForestBarn_KillZombieBG(agent)
  if not agent then
    return
  end
  WaitForNextFrame()
  for _, controller in ipairs(AgentGetControllers(agent)) do
    local chore = ControllerGetChore(controller)
    if chore and StringStartsWith(ResourceGetName(chore), "zombat_bgSweepedAJZombie") then
      ControllerFadeOut(controller, 0.5, true)
      while ControllerGetContribution(controller) > 0 do
        WaitForNextFrame()
      end
      ControllerKill(controller)
    end
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Episode_SetClemState()
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function ForestBarn()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "404_";
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

if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  Game_SceneOpen(kScene, kScript)
else
  SceneOpen(kScene, kScript)
end