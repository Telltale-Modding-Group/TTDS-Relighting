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

local kScript = "CrawfordBellTower"
local kScene = "adv_crawfordSchoolBellTower"

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
RelightConfigLevel = RelightConfigData_Season1.Level_104_env_crawfordSchoolBellTower;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local mZombieControllers, mFrameNum, mTriggerFrameNum, mActionDialogID, mPanicThread

local function OnStairsDeath()
  DlgSetExchangeChoreAgentRemap()
  Callback_OnDeath:Remove(OnStairsDeath)
end

local ActivateGun = function(bActivate)
  if bActivate then
    InputMapperActivate("Belltower.imap")
  else
    InputMapperDeactivate("Belltower.imap")
  end
end

if Platform_IsIOS() then
  function ActivateGun(bActivate)
    if bActivate then
      Callback_iOSReticleTap:Add(CrawfordBellTower_OnShotgunFire)
    else
      Callback_iOSReticleTap:Remove(CrawfordBellTower_OnShotgunFire)
    end
  end
end

function CrawfordBellTower_OnShotgunFire()
  if mFrameNum and GetFrameNumber() == mFrameNum then
    return
  end
  if Dialog_CutsceneIsRunning() then
    return
  end
  if Platform_IsIOS() then
    local pos = ScreenToViewport(CursorGetPos())
    local agent = AgentAtScreenPos(pos)
    if agent and SceneGetSceneAgent(AgentGetScene(agent)) ~= SceneGetSceneAgent(SceneGetBottomScene()) then
      return
    end
  end
  mFrameNum = GetFrameNumber()
  if not Logic["3BellTower - Stair Broke"] then
    Dialog_Play("action_shootZombiePhase1")
  else
    Dialog_Play("action_shootZombiePhase2")
  end
end

function CrawfordBellTower_PeekUp()
  Logic["3BellTower - Looked Up On Stairs"] = true
  ActivateGun(true)
end

function CrawfordBellTower_PeekCenter()
  ActivateGun(false)
end

function CrawfordBellTower_PreLoadFreeLeg()

end

function CrawfordBellTower_PreLoadShootCrawfordLeaderZombie()

end

function CrawfordBellTower_BackUpStairs()
  local prefs = GetPreferences()
  if PropertyExists(prefs, "Belltower - Show Step Tutorial") then
    prefs["Belltower - Show Step Tutorial"] = false
  end
  ChoredMovement_Start("env_crawfordschoolbelltower_move_leebacksupstairs_1.chore")
  ChoredMovement_ReverseControls(true)
  ChoredMovement_AllowReverse(false)
  mZombieControllers = {}
  for i = 1, 20 do
    table.insert(mZombieControllers, ChorePlay(string.format("adv_crawfordSchoolBellTower_ZombieLow%02d_Stairs", i)))
    AgentHide(string.format("ZombieLow_%02d", i), false)
    AgentSetProperty("obj_shootStairZombie" .. i, "Game Selectable", true)
  end
  if Platform_IsIOS() then
    for _, controller in ipairs(mZombieControllers) do
      ControllerSetTimeScale(controller, 1.1)
    end
  end
  ActivateGun(true)
end

function CrawfordBellTower_TutorialGettingAway()
  if Platform_IsIOS() then
    return
  end
  HelpText_Show("tutorial_getAway")
  Sleep(6)
  HelpText_Clear()
end

function CrawfordBellTower_ShootZombie(index)
  if mZombieControllers[index] and mZombieControllers[index] ~= 0 then
    ControllerKill(mZombieControllers[index])
    mZombieControllers[index] = 0
  end
  local zombieName = string.format("ZombieLow_%02d", index)
  local choreName = "env_crawfordschoolbelltower_action_zombieshotstairswalk_1.chore"
  if not AgentGetProperty(zombieName, "Zombie - On Stairs") then
    if AgentGetProperty(zombieName, "Zombie - Crawling") then
      choreName = "env_crawfordschoolbelltower_action_zombieshotgroundcrawl_1.chore"
    else
      choreName = "env_crawfordschoolbelltower_action_zombieshotgroundwalk_1.chore"
    end
  elseif AgentGetProperty(zombieName, "Zombie - Crawling") then
    choreName = "env_crawfordschoolbelltower_action_zombieshotstairscrawl_1.chore"
  end
  local chore = ChorePlayOnAgent(choreName, zombieName)
  AgentSetProperty("obj_shootStairZombie" .. index, "Game Selectable", false)
  AgentSetProperty("trigger_dialog_stairZombie" .. index, "Trigger Enabled", false)
end

function CrawfordBellTower_StopBackUp()
  Mode_Pop(mode_Chored_Movement)
  CrawfordBellTower_StopZombieApproach()
  for i = 11, 20 do
    AgentHide(string.format("ZombieLow_%02d", i), true)
  end
end

function CrawfordBellTower_Phase2Zombies()
  mZombieControllers = {}
  local prefs = GetPreferences()
  if PropertyExists(prefs, "Belltower - Show Step Tutorial") and prefs["Belltower - Show Step Tutorial"] then
    Print("SHOW TUTORIAL")
    ChoiceTracker_SetCustomData(SubProject_GetEpisodeNumber(), "Player Saw Belltower Stairs Tutorial", true)
    local thread = function()
      HelpText_Show("tutorial_stairs")
      Sleep(4)
      HelpText_Clear()
    end
    ThreadStart(thread)
  end
  for i = 1, 10 do
    table.insert(mZombieControllers, ChorePlay(string.format("adv_crawfordSchoolBellTower_ZombieLow%02d_Stairs2", i)))
    AgentHide(string.format("ZombieLow_%02d", i), false)
    AgentSetProperty("obj_shootStairZombie" .. i, "Game Selectable", true)
    AgentSetProperty("trigger_dialog_stairZombie" .. i, "Trigger Enabled", true)
  end
  if Input_IsUsingTouch() then
    for _, controller in ipairs(mZombieControllers) do
      ControllerSetTimeScale(controller, 0.9)
    end
  end
  AgentSetProperty("ui_panicmeter_combat", "PanicMeter - Enabled", true)
  local thread = function()
    while true do
      WaitForNextFrame()
      local nearestTime = 1000
      local timeUntilEnd
      local panicPercentCur = 0
      local panicPercentDesired = 0
      local delta = 0
      for i, controller in ipairs(mZombieControllers) do
        if controller ~= 0 and ControllerIsPlaying(controller) and AgentGetProperty("obj_shootStairZombie" .. i, "Game Selectable") then
          timeUntilEnd = ControllerGetLength(controller) - ControllerGetTime(controller)
          if nearestTime > timeUntilEnd then
            nearestTime = timeUntilEnd
          end
        end
      end
      panicPercentDesired = nearestTime / 13
      if nearestTime >= 13 or table.getn(mZombieControllers) < 1 then
        panicPercentDesired = 1
      end
      delta = panicPercentDesired - panicPercentCur
      panicPercentCur = panicPercentDesired + delta * (GetFrameTime() * 8)
      if panicPercentCur > 0.9 then
        panicPercentCur = 0.9
      elseif panicPercentCur < 0.1 then
        panicPercentCur = 0.1
      end
      AgentSetProperty("ui_panicmeter_combat", "PanicMeter - Progress", 1 - panicPercentCur)
    end
  end
  if not mPanicThread or not ThreadIsRunning(mPanicThread) then
    mPanicThread = ThreadStart(thread)
  end
  Dialog_Play("choice_legStuck_setup")
end

function CrawfordBellTower_StopZombieApproach()
  for i, val in ipairs(mZombieControllers) do
    if mZombieControllers[i] and mZombieControllers[i] ~= 0 then
      ControllerKill(mZombieControllers[i])
      mZombieControllers[i] = nil
    end
    AgentSetProperty("obj_shootStairZombie" .. i, "Game Selectable", false)
    AgentSetProperty("trigger_dialog_stairZombie" .. i, "Trigger Enabled", false)
  end
  ActivateGun(false)
end

function CrawfordBellTower_ZombieReachesLee(index)
  if mTriggerFrameNum and mTriggerFrameNum == GetFrameNumber() then
    return
  end
  mTriggerFrameNum = GetFrameNumber()
  Dialog_Interruption()
  AgentSetProperty("timer_backUpStairs", "Timer Enabled", false)
  AgentSetProperty("timer_legStuck", "Timer Enabled", false)
  if mPanicThread then
    ThreadKill(mPanicThread)
    mPanicThread = nil
  end
  Callback_OnDeath:Add(OnStairsDeath)
  DlgSetExchangeChoreAgentRemap("default", string.format("ZombieLow_%02d", index))
  CrawfordBellTower_StopZombieApproach()
  for i = 1, 20 do
    if i ~= index then
      AgentHide(string.format("ZombieLow_%02d", i), true)
    end
  end
  if not Logic["3BellTower - Stair Broke"] then
    Dialog_Play("cs_deathBackingUpStairs")
  else
    if not Logic["3BellTower - Looked Up On Stairs"] then
      local prefs = GetPreferences()
      if not PropertyExists(prefs, "Belltower - Show Step Tutorial") then
        PropertyCreate(prefs, "Belltower - Show Step Tutorial", "Bool")
        prefs["Belltower - Show Step Tutorial"] = true
      end
    end
    Dialog_Play("cs_deathWhileStuck")
  end
end

function CrawfordBellTower_HatchetSequence()
  local OnSetProgress = function(key, value)
    if value < 1 then
      return
    end
    if not Logic["3BellTower - Got Input"] then
      Dialog_Play("cs_deathWhileAscending")
    else
      Logic["3BellTower - Got Input"] = false
    end
  end
  PropertyAddKeyCallback(AgentFind("logic_game").mProps, "3BellTower - Stair Progress", OnSetProgress)
end

local OriginalTelltaleLevelStartLogic = function()
  if Platform_IsIOS() then
    AgentSetProperty("logic_mode_choice", "Choice - Allow Swipes", false)
  end
  Mode(mode_Main)
  Main_AllowMovement(false)
  Navigate_Enable(false)
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_nav_stairsShooting", "Pan Cam - Speed Vertical", "1.0")
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide("Clementine", not Logic["2CrawfordDiscussion - Bring Clementine"])
  AgentHide("Molly", Logic["3Hallway - Molly Dead"])
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function CrawfordBellTower()
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
