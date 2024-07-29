local kScript = "DrugstoreInterior"
local kScene = "adv_drugstoreInteriorCrashed"
function DrugstoreInterior_PreLoadCounterHop()
end
function DrugstoreInterior_PreLoadGottaMove()
end
function DrugstoreInterior_PreLoadPilotDeath()
end
local OnSupplyCountChange = function(key, value)
  WDNotifyChoice("CollectedIItem" .. value, 0, 0.01)
end
function DrugstoreInterior()
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_POV", "Pan Cam - Dampening", 4)
  end
  Mode(mode_Main)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "1Drugstore - Supplies Total", OnSupplyCountChange)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic["Debug - DrugInt Start over Counter"] then
    Dialog_Play("debug_StartAtCounter")
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Drugstore Interior")
      DlgPreload("env_drugstoreInteriorCrashed.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function DrugstoreInt_ClampStruggle()
  local doorStruggleAgent = AgentFind("struggle_ZombieDoor")
  while doorStruggleAgent.mProps["Struggle Finished"] == false do
    if doorStruggleAgent.mProps["Button Mash - Current Percentage"] > 0.8 then
      doorStruggleAgent.mProps["Button Mash - Current Percentage"] = 0.8
    end
    Yield()
  end
end
function DrugstoreExt_Station1_to_2()
  if not Logic["1Drugstore - Interacting"] then
    Dialog_Play("move_Station1_to_2")
  end
end
function DrugstoreExt_Station1_to_3()
  if not Logic["1Drugstore - Interacting"] then
    Dialog_Play("move_Station1_to_3")
  end
end
function DrugstoreExt_Station2_to_1()
  if not Logic["1Drugstore - Interacting"] then
    Dialog_Play("move_Station2_to_1")
  end
end
function DrugstoreExt_Station2_to_3()
  if not Logic["1Drugstore - Interacting"] then
    Dialog_Play("move_Station2_to_3")
  end
end
function DrugstoreExt_Station3_to_1()
  if not Logic["1Drugstore - Interacting"] then
    Dialog_Play("move_Station3_to_1")
  end
end
function DrugstoreExt_Station3_to_2()
  if not Logic["1Drugstore - Interacting"] then
    Dialog_Play("move_Station3_to_2")
  end
end
SceneOpen(kScene, kScript)
