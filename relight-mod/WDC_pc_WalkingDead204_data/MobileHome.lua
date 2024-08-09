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

local kScript = "MobileHome"
local kScene = "adv_mobileHome"

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
RelightConfigLevel = RelightConfigData_Season2.Level_204_MobileHome;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kFirstSideboardPushWinPercentDefault = 0.666
local mMobileHomeSearchDialogTimerID
local mFirstSideboardPushWinPercent = kFirstSideboardPushWinPercentDefault

local PreloadAssets = function()
  PreLoad("env_mobileHome_bg_timerSearchRoom_2.chore")
end

local StruggleSetup = function(agent)
  local agentProps = agent.mProps
  local struggleChoreIdle, struggleChoreIdleFinal, DeadStickMonitorThread
  local interval = 0.5
  local deadstickUpdate = 0.75
  local timer
  local struggleChange = function(key, value)
    if not Game_GetPlayer() and IsToolBuild() then
      return
    end
    if key == "Button Mash - Enabled" and value then
      if ThreadIsRunning(DeadStickMonitorThread) then
        return
      end
      local struggleProgress, currentProgress
      local DeadStickIdleCheck = function()
        while agent and AgentGetProperty(agent, "Button Mash - Enabled") do
          currentProgress = AgentGetProperty(agent, "Button Mash - Current Percentage")
          if struggleProgress == currentProgress and currentProgress < 1 then
            if AgentGetName(agent) == "struggle_pushSideboard" then
              if not ControllerIsPlaying(struggleChoreIdle) then
                struggleChoreIdle = ChorePlay("env_mobileHome_struggle_pushSideboard_chores_idle.chore", 10000)
                ControllerFadeIn(struggleChoreIdle, interval)
                ControllerSetLooping(struggleChoreIdle, true)
              end
            elseif AgentGetName(agent) == "struggle_pushSideboardFinal" and not ControllerIsPlaying(struggleChoreIdleFinal) then
              struggleChoreIdleFinal = ChorePlay("env_mobileHome_struggle_pushSideboardFinal_chores_idle.chore", 10000)
              ControllerFadeIn(struggleChoreIdleFinal, interval)
              ControllerSetLooping(struggleChoreIdleFinal, true)
            end
            Yield()
          else
            if ControllerIsPlaying(struggleChoreIdle) then
              ControllerFadeOut(struggleChoreIdle, interval)
              timer = interval
              while timer > 0 do
                Yield()
                if not Game_IsPaused() then
                  timer = timer - GetFrameTime()
                end
              end
              ControllerKill(struggleChoreIdle)
            elseif ControllerIsPlaying(struggleChoreIdleFinal) then
              ControllerFadeOut(struggleChoreIdleFinal, interval)
              timer = interval
              while timer > 0 do
                Yield()
                if not Game_IsPaused() then
                  timer = timer - GetFrameTime()
                end
              end
              ControllerKill(struggleChoreIdleFinal)
            end
            struggleProgress = currentProgress
            timer = deadstickUpdate
            while timer > 0 do
              Yield()
              if not Game_IsPaused() then
                timer = timer - GetFrameTime()
              end
            end
          end
        end
        if AgentGetProperty(agent, "Button Mash - Enabled") == false then
          if ControllerIsPlaying(struggleChoreIdle) then
            ControllerKill(struggleChoreIdle)
          end
          if ControllerIsPlaying(struggleChoreIdleFinal) then
            ControllerKill(struggleChoreIdleFinal)
          end
        end
      end
      DeadStickMonitorThread = ThreadStart(DeadStickIdleCheck)
    end
  end
  PropertyAddKeyCallback(agentProps, "Button Mash - Enabled", struggleChange)
end

function MobileHome_FirstPushSideboardWait()
  local cur = AgentGetProperty("struggle_pushSideboard", "Chore Scrubber - Percentage Current")
  while cur < mFirstSideboardPushWinPercent do
    Yield()
    cur = AgentGetProperty("struggle_pushSideboard", "Chore Scrubber - Percentage Current")
  end
end

function MobileHome_ZombiesOvertakeClemDeath()
  Game_RunDialog("cs_zombiesOvertakeClem", false)
end

function MobileHome_SearchTimer(bPause, bStop)
  if bStop then
    if mMobileHomeSearchDialogTimerID then
      DlgStop(mMobileHomeSearchDialogTimerID)
      mMobileHomeSearchDialogTimerID = nil
    end
  elseif bPause then
    if mMobileHomeSearchDialogTimerID then
      DlgPause(mMobileHomeSearchDialogTimerID)
    end
  elseif mMobileHomeSearchDialogTimerID then
    DlgResume(mMobileHomeSearchDialogTimerID)
  else
    mMobileHomeSearchDialogTimerID = Game_RunDialog("bg_timerSearchRoom", false)
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  if Game_GetDebug() then
    if LogicGet("2 - Escaped Mobile Home") then
      Game_SetSceneDialogNode("cs_sarahChoice")
    elseif LogicGet("2 - Zombies at Mobile Home Door") then
      Game_SetSceneDialogNode("cs_zombiesAtDoor")
    end
  end
  AgentSetProperty("audio_buses", "Audio Bus: Luke Volume", 1)
  AgentSetProperty("audio_buses", "Audio Bus: Sarah Volume", 1)
  Game_StartScene()
  StruggleSetup(AgentFind("struggle_pushSideboard"), true)
  StruggleSetup(AgentFind("struggle_pushSideboardFinal"), true)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function MobileHome()
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
