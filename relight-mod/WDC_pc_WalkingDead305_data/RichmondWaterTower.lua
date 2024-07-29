local kScript = "RichmondWaterTower"
local kScene = "adv_richmondWaterTower"
local OnLogicReady = function()
  if Game_GetDebug() and LogicGet("1 - Roof Choice") == 1 then
    Game_SetSceneDialogNode("cs_brotherlyLove")
  end
end
function RichmondWaterTower()
  Game_NewScene(kScene, kScript)
  if Game_GetLoaded() then
    DlgClearExchangeChoreAgentRemap()
  end
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  Game_StartScene()
end
function RichmondWaterTower_OnEnterZombieTrigger(trigger)
  if not Game_IsPlayMode() then
    return
  end
  local zombie = AgentGetParent(trigger)
  if not zombie then
    return
  end
  local zombies = {
    "Zombie2",
    "Zombie3",
    "Zombie4",
    "Zombie5",
    "Zombie6",
    "Zombie7",
    "Zombie8",
    "ZombieLow1",
    "ZombieLow4",
    "ZombieLow3",
    "ZombieLow2"
  }
  AgentSetProperty(trigger, kTriggerEnabled, false)
  DlgSetExchangeChoreAgentRemap("Zombie3", AgentGetName(zombie), "obj_lookAtZombie3", "obj_lookAt" .. AgentGetName(zombie))
  local zombieStayOff
  for _, zombo in ipairs(zombies) do
    if AgentExists(zombo) then
      if not AgentIsHidden(zombo) then
        AgentHide(zombo, true)
      else
        zombieStayOff = zombo
      end
    end
  end
  Game_RunSceneDialog("cs_tooClose", true)
  for _, zombo in ipairs(zombies) do
    if AgentExists(zombo) and zombo ~= zombieStayOff then
      AgentHide(zombo, false)
    end
  end
  AgentHide(zombie, true)
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
SceneOpen(kScene, kScript)
