local kScript = "ShorelineApproachWoods"
local kScene = "adv_shorelineApproachWoods"
local OnLogicReady = function()
  if LogicGet("1ShorelineApproachWoods - Skip to Ferry") then
    Game_SetSceneDialog("env_shorelineApproachWoods.dlog")
    RenderDelay(1)
    WaitForNextFrame()
  end
end
function isZombie(agent)
  return AgentIsParentProperty(agent, "sk54_zombieAverageMini.prop") or AgentIsParentProperty(agent, "sk55_zombieAverageMini.prop") or AgentIsParentProperty(agent, "sk54_zombieAverageMiniLow.prop") or AgentIsParentProperty(agent, "sk55_zombieAverageMiniLow.prop")
end
function ShorelineApproachWoods_ZombieBumpFemale(agent, trigger)
  if isZombie(agent) then
    PlayAnimation("ZombiePetFemale", "sk54_zombieStandA_leftShoulderBump_add.anm")
    PlayAnimation(agent, "sk54_zombieStandA_rightShoulderBump_add.anm")
  end
end
function ShorelineApproachWoods_ZombieBumpMale(agent, trigger)
  if isZombie(agent) then
    PlayAnimation("ZombiePetFemale", "sk54_zombieStandA_rightShoulderBump_add.anm")
    PlayAnimation(agent, "sk54_zombieStandA_leftShoulderBump_add.anm")
  end
end
function ShorelineApproachWoods()
  Game_NewScene(kScene, kScript)
  SceneAdd("ui_struggle.scene")
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
