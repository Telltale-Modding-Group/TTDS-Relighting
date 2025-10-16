--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.
-- But also Telltale's original INCLUDES.

require("RELIGHT_Include.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "JohnsHouseInteriorMainFire103"
local kScene = "adv_johnsHouseInteriorMainFire103"
local mDeathNode = ""
local mbStartedTimer = false
local mbMoving = false
local mDeadStickWatchThread, mDeadStickChoreTimer
local kDeadStickChore = "env_johnsHouseInteriorMain103_molotov_script_doBackgroundTimer_1.chore"
local mClockSoundThread, mClockSoundController

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
RelightConfigLevel = RelightConfigData_SeasonM.Level_M103_JohnsHouseInteriorMainFire103;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local JohnHouse_ClockSoundThread = function()
	  while true do
		local theDir = ChoredMovement_GetMoveDir()
		if theDir == 0 then
		  if mClockSoundController and not ControllerIsPaused(mClockSoundController) then
			ControllerPause(mClockSoundController)
		  end
		elseif not mClockSoundController then
		  mClockSoundController = SoundPlayEventByName("/103/103 SFX/09_johnsHouseInteriorMain103_molotov/SFX_Clock_Move_long")
		elseif ControllerIsPaused(mClockSoundController) then
		  ControllerPlay(mClockSoundController)
		end
		WaitForNextFrame()
	  end
end
	
local JohnHouse_DeadStickWatch = function()
	local bRunWatch = true
	while bRunWatch do
	local theDir = ChoredMovement_GetMoveDir()
	if theDir == 0 then
		mbMoving = false
		if not mbStartedTimer then
			ControllerKill(mDeadStickChoreTimer)
			WaitForNextFrame()
			mbStartedTimer = true
			mDeadStickChoreTimer = ChorePlay(kDeadStickChore)
		end
	else

		if mDeadStickChoreTimer then
			mbStartedTimer = false
			ControllerKill(mDeadStickChoreTimer)
			mDeadStickChoreTimer = nil
		end

		if 0 < AgentGetProperty("logic_panicMeter", "Panic Meter - Timer") then
			local pMeter = AgentGetProperty("logic_panicMeter", "Panic Meter - Timer")
			pMeter = pMeter - 0.1
			AgentSetProperty("logic_panicMeter", "Panic Meter - Timer", pMeter)
		end
	end
	WaitForNextFrame()
	if not mbMoving and mbStartedTimer and not ControllerIsPaused(mDeadStickChoreTimer) and not ControllerIsPlaying(mDeadStickChoreTimer) then
		DlgRun("env_johnsHouseInteriorMain103_molotov.dlog", mDeathNode)
		bRunWatch = false
	end
	WaitForNextFrame()
	end
end

function JohnsHouseInteriorMainFire103_PauseDeadStickWatch()
	ControllerPause(mDeadStickChoreTimer)
end

function JohnsHouseInteriorMainFire103_UnpauseDeadStickWatch()
	ControllerPlay(mDeadStickChoreTimer)
end

function JohnsHouseInteriorMainFire103_ChoredMovement_DeadStickWatch(theDeathNode)
	AgentSetProperty("logic_panicMeter", "Panic Meter - Enabled", true)
	mDeadStickWatchThread = ThreadStart(JohnHouse_DeadStickWatch)
	mDeathNode = theDeathNode
	SceneAdd("ui_panicMeter.scene")
	WaitForNextFrame()
	AgentHide("ui_panicMeter_vignette", false)
end

function JohnsHouseInteriorMainFire103_ChoredMovement_End_DeadStickWatch()
	AgentSetProperty("logic_panicMeter", "Panic Meter - Enabled", false)
	AgentSetProperty("logic_panicMeter", "Panic Meter - Timer", 0)
	mbStartedTimer = false
	mbMoving = false
	ThreadKill(mDeadStickWatchThread)
	ControllerKill(mDeadStickChoreTimer)
end

function JohnsHouseInteriorMainFire103_ClockSoundPush()
	mClockSoundThread = ThreadStart(JohnHouse_ClockSoundThread)
end

function JohnsHouseInteriorMainFire103_KillClockSoundThread()
	ThreadKill(mClockSoundThread)
end

local OriginalTelltaleLevelStartLogic = function()
	
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function JohnsHouseInteriorMainFire103()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "M103_";
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