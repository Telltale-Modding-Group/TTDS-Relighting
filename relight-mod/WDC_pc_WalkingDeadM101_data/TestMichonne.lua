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
local kScript = "TestMichonne"
local kScene = "adv_michonneZombiePets"

local controllerWalk1, controllerWalk2, controllerIdle1, controllerIdle2

local mbMichonneFreeWalk = true
local mbStartedThread = false
local mbMovePlaying = false
local mbIdlePlaying = false
local mbPathingZ1 = false
local mbPathingZ2 = false
local mbIsPathing = false
local mbMoving = false

local mMoveTime = 0

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
RelightConfigLevel = RelightConfigData_SeasonM.Level_M101_TestMichonne;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local TestMichonne_SetPosition = function()
  AgentSetPos("ZombiePetMale", AgentGetWorldPos("dummy_target1"))
  AgentSetPos("ZombiePetFemale", AgentGetWorldPos("dummy_target2"))
  AgentSetPosY("ZombiePetMale", 0)
  AgentSetPosY("ZombiePetFemale", 0)
end

function TestMichonne_UpdateLoop()
  TestMichonne_SetPosition()
  while mbMichonneFreeWalk do
    TestMichonne_SetPosition()
    Yield()
  end
end

function TestMichonne_ZombiesFollowThread()
  mbStartedThread = true

  while mbStartedThread do
    local michonnePos = AgentGetPos("Michonne")
    local zom1Pos = AgentGetPos("ZombiePetMale")
    local zom2Pos = AgentGetPos("ZombiePetFemale")
    local distance1 = VectorDistance(michonnePos, zom1Pos)
    local distance2 = VectorDistance(michonnePos, zom2Pos)

    if distance1 > 3 then
      AgentSetProperty("ZombiePetMale", "Walk Speed Scale", 0.7)
    else
      AgentSetProperty("ZombiePetMale", "Walk Speed Scale", 0.25)
    end

    if distance2 > 3 then
      AgentSetProperty("ZombiePetFemale", "Walk Speed Scale", 0.7)
    else
      AgentSetProperty("ZombiePetFemale", "Walk Speed Scale", 0.25)
    end

    if distance1 > 2 then
      mbPathingZ1 = true
      AgentPathToAgent("ZombiePetMale", "dummy_target1", false)
      Yield()
    else
      if mbPathingZ1 then
        PathAgentStop("ZombiePetMale")
        mbPathingZ1 = false
      end
      local michonneWorldPos = AgentGetWorldPos("Michonne")
      AgentTurnTowards("ZombiePetMale", 95, michonneWorldPos)
      AgentTurnTowards("ZombiePetFemale", 95, michonneWorldPos)
    end

    if distance2 > 2 then
      mbPathingZ2 = true
      AgentPathToAgent("ZombiePetFemale", "dummy_target2", false)
      Yield()
    else
      if mbPathingZ2 then
        PathAgentStop("ZombiePetFemale")
        mbIsPathing = false
      end
      local michonneWorldPos = AgentGetWorldPos("Michonne")
      AgentTurnTowards("ZombiePetMale", 95, michonneWorldPos)
      AgentTurnTowards("ZombiePetFemale", 95, michonneWorldPos)
    end
    
    Yield()
  end
end


local OriginalTelltaleLevelStartLogic = function()
  Navigate_Enable(true)
  DirectControl_SetConstrained(true, "left")
  ThreadStart(TestMichonne_ZombiesFollowThread)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function TestMichonne()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "M101_";
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

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
else
  SceneOpen(kScene, kScript)
end