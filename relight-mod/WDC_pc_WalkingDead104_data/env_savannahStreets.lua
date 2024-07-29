local kScript = "SavannahStreets"
local kScene = "adv_savannahStreets"
local mClemZombieControllers
local mbTriggerUsed = false
local onTriggerFire = function()
  ChoiceTracker_SetCustomData(SubProject_GetEpisodeNumber(), "Player Fired With Trigger When Saving Kenny in Prologue", true)
  mbTriggerUsed = true
end
function SavannahStreets_PreLoadShootKennyLegZombie()
end
function SavannahStreets_PreLoadTurnToClementine()
end
function SavannahStreets()
  Mode(mode_Main)
  Main_AllowMovement(false)
  Navigate_Enable(false)
  SceneHide("ui_openingcredits", true)
  RenderDelay(1)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Platform_IsVita() then
    if LangGetCurLanguage() == "german" then
      AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
    end
    if LangGetCurLanguage() == "spanish" and Platform_IsVita() then
      AgentSetProperty("ui_openingcredits_episodename", "Text Scale", 0.95)
    end
  end
  Yield()
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
  Callack_OnReticleTrigger:Add(onTriggerFire)
end
function Tutorial_MessageTriggers()
  if not mbTriggerUsed then
    local bVitaDeviceMode = not Input_IsUsingTouch()
    if not Logic.bUsingJoystick and not bVitaDeviceMode and not IsEnginePS3() and not IsEngineXbox360() then
      return
    end
    HelpText_Show("tutorial_trigger")
    Sleep(4)
    HelpText_Clear()
  end
end
function SavannahStreets_StartClemZombieApproach()
  mClemZombieControllers = {}
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_1.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_2.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_3.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_4.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_5.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_6.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_7.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_8.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_9.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_10.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_11.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_12.chore"))
  table.insert(mClemZombieControllers, ChorePlay("env_savannahstreets_prologue_clemzombieapproach_13.chore"))
  AgentSetProperty("obj_shootClemZombie1", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie2", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie3", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie4", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie5", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie6", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie7", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie8", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie9", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie10", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie11", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie12", "Game Selectable", true)
  AgentSetProperty("obj_shootClemZombie13", "Game Selectable", true)
  AgentHide("obj_shootClemZombie1", false)
  AgentHide("obj_shootClemZombie2", false)
  AgentHide("obj_shootClemZombie3", false)
  AgentHide("obj_shootClemZombie4", false)
  AgentHide("obj_shootClemZombie5", false)
  AgentHide("obj_shootClemZombie6", false)
  AgentHide("obj_shootClemZombie7", false)
  AgentHide("obj_shootClemZombie8", false)
  AgentHide("obj_shootClemZombie9", false)
  AgentHide("obj_shootClemZombie10", false)
  AgentHide("obj_shootClemZombie11", false)
  AgentHide("obj_shootClemZombie12", false)
  AgentHide("obj_shootClemZombie13", false)
  AgentSetProperty("trigger_dialog_ClemZombie1", "Trigger Enabled", true)
  AgentSetProperty("trigger_dialog_ClemZombie2", "Trigger Enabled", true)
  AgentSetProperty("trigger_dialog_ClemZombie3", "Trigger Enabled", true)
  Logic["1Prologue - Clem Zombies Killed"] = 0
end
function SavannahStreets_ShootClemZombie(index)
  Logic["1Prologue - Clem Zombies Killed"] = Logic["1Prologue - Clem Zombies Killed"] + 1
  AgentSetProperty("obj_shootClemZombie" .. index, "Game Selectable", false)
  if index < 4 then
    AgentSetProperty("trigger_dialog_ClemZombie" .. index, "Trigger Enabled", false)
  end
  if mClemZombieControllers[index] then
    ControllerKill(mClemZombieControllers[index])
    mClemZombieControllers[index] = nil
  end
end
function SavannahStreets_SniperSceneAddCallback()
  AgentHide("ui_scopeRifle_scope", true, true)
end
function SavannahStreets_StartSniperMode(hChore, vChore)
  if not SceneIsActive("ui_sniper.scene") then
    SceneAdd("ui_sniper.scene", "SavannahStreets_SniperSceneAddCallback")
  end
  AgentSetProperty("logic_mode_sniper", "Sniper - Fire Dialog Node", "action_fireGun")
  AgentSetProperty("logic_mode_sniper", "Sniper - Hide Back Button", true)
  Sniper_Start(hChore, vChore)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingcredits")
