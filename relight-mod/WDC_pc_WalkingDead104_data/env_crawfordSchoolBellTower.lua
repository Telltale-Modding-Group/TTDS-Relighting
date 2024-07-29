local kScript = "CrawfordBellTower"
local kScene = "adv_crawfordSchoolBellTower"
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
function CrawfordBellTower()
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
SceneOpen(kScene, kScript)
