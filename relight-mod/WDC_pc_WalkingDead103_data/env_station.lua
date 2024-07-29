local kScript = "Station"
local kScene = "adv_trainTileStation"
local mZombieApproachController, mZombieApproachThread
local mbZombieApproachPaused = false
local DestroyUnusedWeapons = function()
  if AgentGetProperty("logic_inventory_items", "Inventory - Monkey Wrench") == 1 then
    AgentDestroy("obj_spikeRemoverWD")
    AgentDestroy("obj_spikeRemoverWD_lee")
    AgentDestroy("obj_spikeRemoverWD_world")
    AgentDestroy("obj_spannerOversizedWD")
    AgentDestroy("obj_spannerOversizedWD_lee")
    AgentDestroy("obj_spannerOversizedWD_world")
  elseif AgentGetProperty("logic_inventory_items", "Inventory - Spanner") == 1 then
    AgentDestroy("obj_spikeRemoverWD")
    AgentDestroy("obj_spikeRemoverWD_lee")
    AgentDestroy("obj_spikeRemoverWD_world")
    AgentDestroy("obj_wrenchMonkeyRustedWD")
    AgentDestroy("obj_wrenchMonkeyRustedWD_lee")
    AgentDestroy("obj_wrenchMonkeyRustedWD_world")
  elseif AgentGetProperty("logic_inventory_items", "Inventory - Spike Remover") == 1 then
    AgentDestroy("obj_wrenchMonkeyRustedWD")
    AgentDestroy("obj_wrenchMonkeyRustedWD_lee")
    AgentDestroy("obj_wrenchMonkeyRustedWD_world")
    AgentDestroy("obj_spannerOversizedWD")
    AgentDestroy("obj_spannerOversizedWD_lee")
    AgentDestroy("obj_spannerOversizedWD_world")
  end
end
local OnCloseToDoor = function(key, value)
  if value then
    Reticle_Update(true)
  end
end
local ZombieApproach = function()
  local dist
  local bClearedHelpText = false
  while ControllerIsPlaying(mZombieApproachController) do
    Yield()
    if bClearedHelpText or ChoredMovement_GetMoveDir() == -1 then
    end
    dist = VectorDistance(AgentGetWorldPos("SurpriseZombie1"), AgentGetWorldPos("Lee"))
    if dist <= 0.75 and not DebugHalted() then
      ControllerKill(mZombieApproachController)
    end
  end
  mZombieApproachController = nil
  mZombieApproachController = nil
  if not bClearedHelpText then
    HelpText_Clear()
    bClearedHelpText = true
  end
  Mode_Pop(mode_Chored_Movement)
  Dialog_Play("cs_killedWhileTwoZombiesApproach")
end
function Station_FirstSwipePreLoad()
end
function Station_SecondSwipePreLoad()
end
function Station()
  Mode(mode_Main)
  if IsEngineVita() then
    DestroyUnusedWeapons()
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetFightTextures(true)
  if IsToolBuild() then
    local weapon
    local weapons = {
      "Inventory - Monkey Wrench",
      "Inventory - Spanner",
      "Inventory - Spike Remover"
    }
    for i, curWeapon in pairs(weapons) do
      if WDInventory_ItemExists(curWeapon) then
        weapon = curWeapon
        break
      end
    end
    if not weapon then
      weapon = TableGetRandomElement(weapons)
      WDInventory_AddItem(weapon)
    end
    local kDebugToFight = "3Station - Debug to Fight"
    if Logic[kDebugToFight] then
      Logic[kDebugToFight] = false
      Logic["3Station - Propped Door"] = true
      Logic["3Station - Unlocked Door"] = true
      if weapon == weapons[1] then
        AgentHide("obj_wrenchMonkeyRustedWD", false)
      elseif weapon == weapons[2] then
        AgentHide("obj_spannerOversizedWD", false)
      else
        AgentHide("obj_spikeRemoverWD", false)
      end
      WDInventory_RemoveItem(weapon)
      Dialog_Play("logic_enterStation")
      Dialog_Play("cs_zombieAttack")
      return
    end
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Station")
      DlgPreload("env_station.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function Station_TwoZombiesApproach()
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Station - Close to Door", OnCloseToDoor)
  ChoredMovement_Start("env_station_move_LeeMoveBackwardsToDoor_1")
  ChoredMovement_ReverseControls(true)
  ChoredMovement_AllowReverse(false)
  ChoredMovement_EndOnChoreFinish(false)
  CameraActivate("cam_nav_twoZombiesApproach")
  mZombieApproachController = ChorePlay("env_station_ambient_twoZombiesApproach_1")
  mZombieApproachThread = ThreadStart(ZombieApproach)
end
function Station_OnGetWeapon()
  Mode_Pop(mode_Chored_Movement)
  Mode_Push(mode_NoMovement)
  CameraActivate("cam_nav_KillZombieOne")
  mZombieApproachController = ChorePlay("env_station_ambient_twoZombiesApproach_2")
  mZombieApproachThread = ThreadStart(ZombieApproach)
end
function Station_StopApproach()
  ThreadKill(mZombieApproachThread)
  mZombieApproachThread = nil
  ControllerKill(mZombieApproachController)
  mZombieApproachController = nil
end
function Station_PauseApproach(bPause)
  if bPause == mbZombieApproachPaused then
    return
  end
  mbZombieApproachPaused = bPause
  if mbZombieApproachPaused then
    ChoredMovement_AllowMovement(false)
    ControllerPause(mZombieApproachController)
    ControllerSetContribution(mZombieApproachController, 0)
    ThreadSleep(mZombieApproachThread)
  else
    ChoredMovement_AllowMovement(true)
    ControllerPlay(mZombieApproachController)
    ControllerSetContribution(mZombieApproachController, 1)
    ThreadWake(mZombieApproachThread)
  end
end
SceneOpen(kScene, kScript)