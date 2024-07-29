local kScript = "BoardingSchoolDormNight"
local kScene = "adv_boardingSchoolDormNight"
local mWalkboxUpdateThread
local OnLogicReady = function()
  AgentSetWorldPos("obj_skullBoar", Vector(13.679837, 1.451824, -7.128535))
  AgentSetWorldRotFromQuat("obj_skullBoar", Quaternion(-0.008629, -0.710944, 0.01977, 0.702918))
  if Game_GetLoaded() then
    return
  end
  Episode_SetUpCollectibles()
  Episode_SetLouisDamage()
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_nightmare")
  end
  AgentSetState("AJ", "bodyBuckshotB")
  AgentSetState("Horse", "horseBlack")
end
local UpdateWalkboxTris = function()
  while true do
    WalkBoxesDisableAreaAroundAgent("adv_boardingSchoolDormNight_nightmare.wbox", "dummy_triDisabler", 0.01)
    WaitForNextFrame()
  end
end
function BoardingSchoolDormNight()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  Load("env_boardingSchoolDormNight_act3_use_candle_1.chore")
  Load("sk62_clementine400StandA_toCrouch.anm")
  Load("sk62_clementine400StandA_turnLeft90ToWalk.anm")
  Load("sk62_clementine400SupineLookUpBed_toSit.anm")
  Load("sk63_idle_ajSupineLayBackBed.anm")
  Load("sk63_tennysonWalk_turnRight90.anm")
  Load("obj_mapBattlePlansBlankBoardingSchool.d3dtx")
  Load("lightSettings_boardingSchoolDormNight_act3_timeLapse.chore")
  Load("sk62_action_clementine400TakeOffHat.chore")
  Load("sk62_action_clementine400TakeOffHat.anm")
  Load("sk62_action_clementine400GoToBed.anm")
  Load("sk62_clementine400SleepBed_toSupineLookUpBed.anm")
  Load("sk62_idle_clementine400SleepBed.chore")
  Load("sk62_idle_clementine400SleepBed.anm")
  Load("sk63_ajStandA_turnRight90ToWalk.anm")
end
function BoardingSchoolDormNight_ShowCollectibleSlots()
  AgentHide("obj_logicalSlotFlytrap", not Collectible_GetFound("Flytrap"))
  AgentHide("obj_logicalSlotMushroom", not Collectible_GetFound("Mushroom"))
  AgentHide("obj_logicalSlotSkullBoar", not Collectible_GetFound("Skull Boar"))
end
function BoardingSchoolDormNight_WalkboxUpdate(bEnable)
  bEnable = bEnable ~= false
  if bEnable == ThreadIsRunning(mWalkboxUpdateThread) then
    return
  end
  if bEnable then
    mWalkboxUpdateThread = ThreadStart(UpdateWalkboxTris)
  else
    mWalkboxUpdateThread = ThreadKill(mWalkboxUpdateThread)
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
