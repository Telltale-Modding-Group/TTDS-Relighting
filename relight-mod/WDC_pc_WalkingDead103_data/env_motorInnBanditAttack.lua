local kScript = "BanditAttack"
local kScene = "adv_motorInn103_banditRaid"
local mBanditApproachDialogs = {}
local mZombieApproachControllers = {}
local mZombieApproachThreads = {}
local function OnZombieDeath()
  DlgSetExchangeChoreAgentRemap()
  Callback_OnDeath:Remove(OnZombieDeath)
end
function BanditAttack_RVLeftPeekLeft()
  if not Logic.Dying then
    Dialog_Play("sniper_RVLeft_enter")
  end
end
function BanditAttack_RVLeftPeekCenter()
  Dialog_Play("sniper_RVLeft_exit")
end
function BanditAttack_RVLeftPeekRight()
  Dialog_PlayAndWait("sniper_RVLeft_exit")
  Dialog_Play("cs_moveToRVRight")
end
function BanditAttack_RVRightPeekLeft()
  Dialog_PlayAndWait("sniper_RVRight_exit")
  Dialog_Play("cs_moveToRVLeft")
end
function BanditAttack_RVRightPeekCenter()
  Dialog_Play("sniper_RVRight_exit")
end
function BanditAttack_RVRightPeekRight()
  if not Logic.Dying then
    Dialog_Play("sniper_RVRight_enter")
  end
end
function BanditAttackPrototype_RVLeftPeekLeft()
  Dialog_Play("peek_callback_RVLeft_Left")
end
function BanditAttackPrototype_RVLeftPeekCenter()
  Dialog_Play("peek_callback_RVLeft_Center")
end
function BanditAttackPrototype_RVLeftPeekRight()
  Dialog_Play("use_RVRight")
end
function BanditAttackPrototype_RVRightPeekLeft()
  Dialog_Play("use_RVLeft")
end
function BanditAttackPrototype_RVRightPeekCenter()
end
function BanditAttackPrototype_RVRightPeekRight()
end
function BanditAttack_GrabRiflePreLoad()
end
function BanditAttack_LillyShootsPreLoad()
end
function BanditAttack_DougCarleyShootsPreLoad()
end
function BanditAttack_OverTheFencePreLoad()
end
function BanditAttack_FromTheWoodsPreLoad()
end
function BanditAttack_RunToVanPreLoad()
end
function BanditAttack_ZombieMunchPreLoad()
end
function BanditAttack_VanThroughBarricadePreLoad()
end
function BanditAttack_SniperSceneAddCallback()
  Yield()
  SceneHide("ui_sniper.scene", true)
end
local bSniperSceneWasVisible = false
function BanditRaid_HideSniperScenePropCallback(key, val)
  if val ~= nil and val == true then
    SceneHide("ui_sniper.scene", val)
  end
end
function BanditAttack()
  if Input_IsUsingTouch() or Platform_HasTVRemote() then
    AgentSetProperty("timer_sniperScope", "Timer Length", 15)
    local banditMax = Vector(0.5, 2.1, 0.5)
    local banditMin = Vector(-0.5, 0.55, -0.5)
    for k = 1, 5 do
      local bandit = AgentFind("ShootoutBandit" .. k)
      AgentSetProperty(bandit, "Extents Max", banditMax)
      AgentSetProperty(bandit, "Extents Min", banditMin)
    end
    local zombieMax = Vector(0.35, 0.35, 0.35)
    local zombieMin = Vector(-0.35, -0.35, -0.35)
    for k = 1, 8 do
      local head = AgentFind("obj_ZombieHead" .. k)
      AgentSetProperty(head, "Extents Min", zombieMin)
      AgentSetProperty(head, "Extents Max", zombieMax)
    end
  end
  Mode(mode_Main)
  Main_AllowMovement(false)
  Navigate_Enable(false)
  if not Platform_HasTVRemote() then
    PropertyAddKeyCallback(AgentGetProperties("logic_game"), "1BanditRaid - Hide Sniper Scene", "BanditRaid_HideSniperScenePropCallback")
  end
  AgentSetProperty("logic_mode_sniper", "Sniper - Hide Back Button", true)
  SceneAdd("ui_sniper.scene", "BanditAttack_SniperSceneAddCallback")
  if SaveLoad_IsFromLoad() then
    Yield()
    PanicMeter_AttachItem("ui_panicmeter_overlay", "timer_sniperScope")
    return
  end
  AgentHide(Logic["DougCarley Saved"], false)
  if Logic["Gave Irene Gun"] == "true" then
    AgentHide("obj_balconyFull103", false)
    AgentHide("obj_balconyFallen103", true)
  else
    AgentHide("obj_balconyFull103", true)
    AgentHide("obj_balconyFallen103", false)
  end
  AgentHide("obj_securityWarningSystemBellAMotorInn103", Logic["DougCarley Saved"] == "carley")
  AgentHide("obj_securityWarningSystemBellBMotorInn103", Logic["DougCarley Saved"] == "carley")
  AgentHide("obj_securityWarningSystemBellCMotorInn103", Logic["DougCarley Saved"] == "carley")
  AgentHide("obj_securityWarningSystemMotorInn103", Logic["DougCarley Saved"] == "carley")
  if Logic["BanditAttack - LoadPrototype"] then
    Dialog_Play("cs_BanditAttackPrototype")
  elseif AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Motor Inn Bandit Attack")
      DlgPreload("env_motorInnBanditRaid.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
  Yield()
  PanicMeter_AttachItem("ui_panicmeter_overlay", "timer_sniperScope")
end
function BanditAttack_StartPhase2()
  mBanditApproachDialogs = {}
  mBanditApproachDialogs.ShootoutBandit1 = Dialog_Play("phase2_bandit1")
  mBanditApproachDialogs.ShootoutBandit2 = Dialog_Play("phase2_bandit2")
end
function BanditAttack_StartPhase3()
  mBanditApproachDialogs = {}
  mBanditApproachDialogs.ShootoutBandit3 = Dialog_Play("phase3_bandit3")
  mBanditApproachDialogs.ShootoutBandit4 = Dialog_Play("phase3_bandit4")
  mBanditApproachDialogs.ShootoutBandit5 = Dialog_Play("phase3_bandit5")
end
function BanditAttack_ShootBandit(banditName)
  Mode_Push(mode_NoMovement)
  DlgStop(mBanditApproachDialogs[banditName])
  mBanditApproachDialogs[banditName] = nil
  AgentSetProperty(banditName, "Game Selectable", false)
  local timerProgress = AgentGetProperty("timer_sniperScope", "Timer Progress")
  AgentSetProperty("timer_sniperScope", "Timer Progress", math.max(timerProgress - 0.33333334, 0))
end
function BanditAttack_StartZombieApproach(zombieName, headAgentName, approachChoreName, whichSide)
  if not zombieName or not AgentExists(zombieName) then
    return
  end
  AgentHide(zombieName, false)
  AgentHide(headAgentName, false)
  if not approachChoreName then
    return
  end
  local zombieAgent = AgentFind(zombieName)
  if AgentHasProperty(zombieAgent, "Zombie - Die") and (Logic["DougCarley Saved"] == "carley" or Platform_HasTVRemote()) then
    local OnSetZombieProp = function(key, value)
      if key == "Zombie - Die" and value then
        BanditAttack_ShootZombie(zombieName, true)
      end
    end
    PropertyAddKeyCallback(zombieAgent.mProps, "Zombie - Die", OnSetZombieProp)
  end
  mZombieApproachControllers[zombieName] = ChorePlayOnAgent(approachChoreName, zombieName)
  if whichSide == "right" and Logic["1BanditRaid - RV Station"] == "left" or whichSide == "left" and Logic["1BanditRaid - RV Station"] == "right" then
    ControllerSetTimePercent(mZombieApproachControllers[zombieName], 0.3)
  else
  end
  local approachCompletion = function()
    ControllerWait(mZombieApproachControllers[zombieName])
    if mZombieApproachControllers[zombieName] then
      Callback_OnDeath:Add(OnZombieDeath)
      DlgSetExchangeChoreAgentRemap("default", zombieName)
      local zombieParent = AgentGetParent(zombieAgent)
      if zombieParent then
        if AgentGetName(zombieParent) == "group_RVLeft" then
          Dialog_Play("cs_zombieReachesLeeRVLeft")
        elseif AgentGetName(zombieParent) == "group_RVRight" then
          Dialog_Play("cs_zombieReachesLeeRVRight")
        end
      end
      mZombieApproachControllers[zombieName] = nil
    end
  end
  mZombieApproachThreads[zombieName] = ThreadStart(approachCompletion)
end
function BanditAttack_ShootZombie(zombieName, headShot)
  if mZombieApproachControllers[zombieName] then
    if headShot then
      if mZombieApproachThreads[zombieName] then
        ThreadKill(mZombieApproachThreads[zombieName])
        mZombieApproachThreads[zombieName] = nil
      end
      local fallDownCtl = ChorePlayOnAgent("env_motorinnbanditraid_zombie_head_shot_1.chore", zombieName)
      ControllerKill(mZombieApproachControllers[zombieName])
      mZombieApproachControllers[zombieName] = nil
      AgentSetProperty(zombieName, "Game Selectable", false)
      local zombieNumber = string.sub(zombieName, -1)
      local zombieHeadName = "obj_ZombieHead" .. zombieNumber
      AgentSetProperty(zombieHeadName, "Game Selectable", false)
      ControllerWait(fallDownCtl)
      Dialog_Play("logic_phase4End")
    else
      ChorePlayOnAgent("env_motorinnbanditraid_zombie_body_hit_1.chore", zombieName, nil, true)
    end
  end
end
SceneOpen(kScene, kScript)
