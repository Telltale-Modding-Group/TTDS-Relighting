local kScript = "CrawfordSchoolHallways"
local kScene = "adv_crawfordSchoolHallways"
local mZombieControllers = {}
local mZombieApproachThreads = {}
local panicThread
local mbSoundConstrainedPlatform = IsEngineVita()
local mValidZombieSoundIndices = {}
local mZombieOneApproachSoundActiveSoundIndex = 0
local mZombieOneApproachSoundActiveSoundController
local function OnZombieDeath()
  AgentFind("ui_panicmeter_combat").mProps["PanicMeter - Enabled"] = false
  DlgSetExchangeChoreAgentRemap()
  Callback_OnDeath:Remove(OnZombieDeath)
end
local ZombieApproach = function(index)
  ControllerWait(mZombieControllers[index])
  if mZombieControllers[index] then
    CrawfordSchoolHallways_StopZombieApproach()
    Callback_OnDeath:Add(OnZombieDeath)
    DlgSetExchangeChoreAgentRemap("default", "ShootoutZombie" .. index)
    ThreadKill(panicThread)
    AgentFind("ui_panicmeter_combat").mProps["PanicMeter - Enabled"] = false
    Mode_Pop(mode_sniper)
    Dialog_Play("cs_zombiesReachLee")
  end
end
function CrawfordSchoolHallways_PeekLeftUp()
  Dialog_Play("logic_enableZombieGroup")
end
function CrawfordSchoolHallways_PeekCenter()
  Dialog_Play("logic_disableZombieGroup")
end
function CrawfordSchoolHallways_PreLoadShootZombieInDoor()
end
function CrawfordSchoolHallways_PreLoadOfficeDoorZombieShootout()
end
function CrawfordSchoolHallways_PreLoadShootZombieOrMolly()
end
function CrawfordSchoolHallways()
  if Platform_IsIOS() or Platform_IsAndroid() then
    AgentHide("light_beams", true)
    for i = 1, 5 do
      AgentHide("light_beams0" .. i, true)
    end
  end
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_peek", "Reticle - Sticks to World", true)
    AgentSetProperty("cam_peek", "Pan Cam - Speed Vertical", 0.4)
  end
  local logicReady = function()
    return SceneIsActive("module_logic.scene") and ResourceIsLoaded("logic_game.prop") and ResourceIsLoaded("logic_game_act3_104.prop")
  end
  if not logicReady() then
    print("### LOGIC NOT READY -- waiting")
    Yield()
    while not logicReady() do
      Yield()
    end
  end
  print("### Logic ready")
  Mode(mode_Main)
  if Logic["3Battery - Entered Auto Shop"] then
    ShaderOverrideTexture("Molly", "sk55_molly_backpack", "sk55_molly_backpackDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_face", "sk55_molly_faceDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_bodyhoodup", "sk55_molly_bodyHoodUpDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_masks", "sk55_molly_masksDocsBloodHitB.d3dtx")
  end
  if Logic["3Battery - Finished"] and Logic["3Fuel - Finished"] and Logic["3Medicine - Finished"] then
    ShaderOverrideTexture("obj_doorCrawfordSchoolHallwaysGlassLeft", "env_crawfordschoolhallwayswindowglassA_alpha", "env_crawfordschoolhallwayswindowglassD_alpha.d3dtx")
    ShaderOverrideTexture("obj_doorCrawfordSchoolHallwaysGlassRight", "env_crawfordschoolhallwayswindowglassA_alpha", "env_crawfordschoolhallwayswindowglassD_alpha.d3dtx")
    ShaderOverrideTexture("adv_crawfordSchoolHallways_meshesB", "env_crawfordschoolhallwayswindowglassA_alpha", "env_crawfordschoolhallwayswindowglassD_alpha.d3dtx")
    AgentHide("group_zombies", true)
    AgentHide("zombie_group2_busting", true)
  elseif Logic["3Fuel - Finished"] then
    ShaderOverrideTexture("obj_doorCrawfordSchoolHallwaysGlassLeft", "env_crawfordschoolhallwayswindowglassA_alpha", "env_crawfordschoolhallwayswindowglassC_alpha.d3dtx")
    ShaderOverrideTexture("obj_doorCrawfordSchoolHallwaysGlassRight", "env_crawfordschoolhallwayswindowglassA_alpha", "env_crawfordschoolhallwayswindowglassC_alpha.d3dtx")
    ShaderOverrideTexture("adv_crawfordSchoolHallways_meshesB", "env_crawfordschoolhallwayswindowglassA_alpha", "env_crawfordschoolhallwayswindowglassC_alpha.d3dtx")
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  if AgentGetProperty("logic_debug", "Debug - EnterHallwayFromAlley") and AgentGetProperty("logic_module_script", "Script - Previous Scene File") == "" then
    AgentSetProperty("logic_module_script", "Script - Previous Scene File", "adv_crawfordExterior")
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function CrawfordSchoolHallways_SniperSceneAddCallback()
  AgentHide("ui_scopeRifle_scope", true, true)
end
function Tutorial_MessageTriggers()
  local bVitaDeviceMode = not Input_IsUsingTouch()
  if not Logic.bUsingJoystick and not bVitaDeviceMode and not IsEnginePS3() and not IsEngineXbox360() then
    return
  end
  if Platform_IsIOS() or Input_IsUsingTouch() then
    return
  end
  HelpText_Show("tutorial_trigger")
  Sleep(4)
  HelpText_Clear()
end
function CrawfordSchoolHallways_StartSniperMode(hChore, vChore)
  if not SceneIsActive("ui_sniper.scene") then
    SceneAdd("ui_sniper.scene", "CrawfordSchoolHallways_SniperSceneAddCallback")
  end
  AgentSetProperty("logic_mode_sniper", "Sniper - Fire Dialog Node", "action_fireGun")
  AgentSetProperty("logic_mode_sniper", "Sniper - Hide Back Button", true)
  ThreadStart(Tutorial_MessageTriggers)
  Sniper_Start(hChore, vChore)
end
function CrawfordSchoolHallways_StartZombieApproach()
  for i = 1, 6 do
    if i ~= Logic["3Medicine - First Zombie Shot"] then
      mZombieControllers[i] = ChorePlay("env_crawfordschoolhallways_act3exploring_zombieapproach_" .. i .. ".chore")
      if mbSoundConstrainedPlatform then
        ControllerSetSoundVolume(mZombieControllers[i], 0)
        table.insert(mValidZombieSoundIndices, i)
      end
      ControllerSetTimeScale(mZombieControllers[i], 0.9)
      mZombieApproachThreads[i] = ThreadStart(ZombieApproach, i)
    end
  end
  if mbSoundConstrainedPlatform then
    local noisyZombieIndex = math.random(1, #mValidZombieSoundIndices)
    mZombieOneApproachSoundActiveSoundIndex = mValidZombieSoundIndices[noisyZombieIndex]
    mZombieOneApproachSoundActiveSoundController = ChorePlay("env_crawfordschoolhallways_act3exploring_zombieapproach_" .. mZombieOneApproachSoundActiveSoundIndex .. "_sfxOnly.chore")
  end
  AgentSetProperty("group_shootoutZombies", "Group - Selectable", true)
  local thread = function()
    Yield()
    while true do
      Yield()
      local controller
      local nearestTime = 1000
      local timeUntilEnd
      local panicPercentCur = 0
      local panicPercentDesired = 0
      local delta = 0
      for i = 1, 6 do
        controller = mZombieControllers[i]
        if controller then
          timeUntilEnd = ControllerGetLength(controller) - ControllerGetTime(controller)
          if nearestTime > timeUntilEnd then
            nearestTime = timeUntilEnd
          end
        end
      end
      panicPercentDesired = nearestTime / 7
      if nearestTime >= 7 then
        panicPercentDesired = 1
      end
      AgentFind("ui_panicmeter_combat").mProps["PanicMeter - Enabled"] = true
      delta = panicPercentDesired - panicPercentCur
      panicPercentCur = panicPercentDesired + delta * (GetFrameTime() * 8)
      if panicPercentCur > 0.9 then
        panicPercentCur = 0.9
      elseif panicPercentCur < 0.01 then
        panicPercentCur = 0.01
      end
      AgentFind("ui_panicmeter_combat").mProps["PanicMeter - Progress"] = 1 - panicPercentCur
    end
  end
  if not ThreadIsRunning(panicThread) then
    panicThread = ThreadStart(thread)
  end
end
function CrawfordSchoolHallways_ShootZombie(index)
  if Logic["3Medicine - First Zombie Shot"] == 0 then
    Dialog_Play("action_fireGun")
    AgentSetProperty("timer_peekVendingMachine", "Timer Enabled", false)
    Logic["3Medicine - First Zombie Shot"] = index
    AgentSetProperty("group_shootoutZombies", "Group - Selectable", false)
  end
  if mZombieApproachThreads[index] then
    ThreadKill(mZombieApproachThreads[index])
    mZombieApproachThreads[index] = nil
  end
  if mZombieControllers[index] then
    ControllerKill(mZombieControllers[index])
    mZombieControllers[index] = nil
  end
  if mbSoundConstrainedPlatform then
    for i = 1, #mValidZombieSoundIndices do
      if index == mValidZombieSoundIndices[i] then
        table.remove(mValidZombieSoundIndices, i)
        break
      end
    end
    if #mValidZombieSoundIndices <= 0 then
      ControllerKill(mZombieOneApproachSoundActiveSoundController)
    end
  end
  AgentSetProperty("obj_shootoutZombie" .. index, "Game Selectable", false)
end
function CrawfordSchoolHallways_StopZombieApproach()
  for i = 1, 6 do
    if mZombieApproachThreads[i] then
      ThreadKill(mZombieApproachThreads[i])
      mZombieApproachThreads[i] = nil
    end
    if mZombieControllers[i] then
      ControllerKill(mZombieControllers[i])
      mZombieControllers[i] = nil
    end
  end
  if mbSoundConstrainedPlatform and mZombieOneApproachSoundActiveSoundController then
    ControllerKill(mZombieOneApproachSoundActiveSoundController)
  end
end
function CrawfordSchoolHallways_EndShootout()
  OnZombieDeath()
  Mode_Pop(mode_sniper)
end
SceneOpen(kScene, kScript)
