local kScript = "MobileHome"
local kScene = "adv_mobileHome"
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
function MobileHome()
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
SceneOpen(kScene, kScript)
