local kScript = "MarshHouseInterior"
local kScene = "adv_marshHouseInteriorRoom"
local kLeeStrangleStruggle_lastValue = 0
local kLeeStrangleStruggle_fail_lastValueMin = 0.2
local kLeeStrangleStruggle_fail_curValueMax = 0.16
local kLeeForcedSitDialogID
local HideStruggleUI = function()
  AgentSetProperty("struggle_fight2", "Button Mash - Rate of Decay", 0.2)
  ChorePlay("ui_struggle_fadeout")
  Yield()
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3Room - Hide Struggle UI", MarshHouseInterior_OnHideStruggleUI)
end
local LeeStrangleStruggle_InstantFail = function()
end
function MarshHouseInterior_PreLoadCampmanShot()
end
function MarshHouseInterior_PreLoadZombieToFloor()
end
function MarshHouseInterior()
  Mode(mode_Main)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Room - Hide Struggle UI", MarshHouseInterior_OnHideStruggleUI)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Room - Clem Fired Gun", MarshHouseInterior_OnClemFireGun)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Room - Campman Advantage Struggle End", MarshHouseInterior_EndCampmanAdvantageStruggle)
  PropertyAddKeyCallback(AgentGetProperties("struggle_fight2"), "Button Mash - Current Percentage", MarshHouseInterior_LeeStrangleStruggle_CheckProgress)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Room - OK to Pick Clem Weapon", MarshHouseInterior_OnEndWeaponSelection)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState(true, false, true, "A")
  if Logic["3Room - Clem Ready To Sneak"] then
    AgentSetProperty("obj_doorMarshHouseInteriorRoomFront", kGameSelectable, false)
    AgentSetProperty("obj_doorMarshHouseInteriorRoomBathroom", kGameSelectable, false)
    AgentSetProperty("obj_bagBowlingCampman", "Runtime: Visible", true)
    AgentSetProperty("obj_bagBowlingCampman", kGameSelectable, false)
    AgentSetProperty("trigger_campmanAppears", kTriggerEnabled, false)
    Logic["3Room - Entered Room"] = true
    AgentSetProperty("Lee", kIdleAnim, "adv_marshhouseinteriorroom_leesitting.chore")
    AgentHide("Campman", false)
    AgentSetProperty("Campman", kIdleAnim, "adv_marshhouseinteriorroom_campmansitting.chore")
    if not WDInventory_ItemExists("Inventory - Cleaver") then
      AgentHide("obj_cleaver", false)
      AgentSetProperty("obj_cleaver", kGameSelectable, true)
    end
    Dialog_Play("cs_clemEscapes")
    return
  end
  if Logic["3Room - Campman Dead"] then
    AgentSetProperty("obj_doorMarshHouseInteriorRoomFront", kGameSelectable, true)
    AgentSetProperty("obj_doorMarshHouseInteriorRoomBathroom", kGameSelectable, true)
    AgentHide("obj_bagBowlingCampman", false)
    AgentHide("obj_marshHouseInteriorRope", true)
    PlayAnimation("obj_marshHouseInteriorDoubleDoor_L", "obj_marshHouseInteriorDoubleDoor_L_sk54_action_leeCampmanClosetTackle.anm")
    PlayAnimation("obj_marshHouseInteriorDoubleDoor_R", "obj_marshHouseInteriorDoubleDoor_R_sk54_action_leeCampmanClosetTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomTableA", "obj_marshHouseInteriorRoomTableA_sk54_action_leeChairCampmanTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomCreamer", "obj_marshHouseInteriorRoomCreamer_sk54_action_leeChairCampmanTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomNapkinHolder", "obj_marshHouseInteriorRoomNapkinHolder_sk54_action_leeChairCampmanTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomChairB", "obj_marshHouseInteriorRoomChairB_sk54_action_leeChairCampmanTackle.anm")
    PlayAnimation("obj_marshHouseInteriorRoomChairA", "obj_marshHouseInteriorRoomChairA_sk54_action_leeChairCampmanTackle.anm")
    AgentSetProperty("trigger_campmanAppears", kTriggerEnabled, false)
    Logic["3Room - Entered Room"] = true
    Logic["3Room - Clem Ready to Sneak"] = true
    AgentHide("Clementine", false)
    AgentSetProperty("Clementine", kGameSelectable, true)
    AgentSetProperty("Clementine", "Mesh sk56_clementine105_haircutHat - Visible", false)
    AgentSetProperty("Clementine", "Mesh sk56_clementine105_haircut - Visible", true)
    AgentHide("Campman", false)
    AgentSetProperty("Campman", kGameSelectable, true)
    if Logic["3Room - Killed Campman"] then
      AgentSetProperty("Campman", kIdleAnim, "adv_marshhouseinteriorroom_campmanstrangled.chore")
    else
      AgentSetProperty("Campman", kIdleAnim, "adv_marshhouseinteriorroom_campmanshot.chore")
    end
    Dialog_Play("cs_whatNow")
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function MarshHouseInterior_OnHideStruggleUI(key, value)
  if value then
    ThreadStart(HideStruggleUI)
  end
end
function MarshHouseInterior_OnEndWeaponSelection(key, value)
  print("Clem Weapon Pick End callback!")
  print("logic key is " .. tostring(value))
  if value == false then
    AgentSetProperty("obj_bottleGlass", kGameSelectable, false)
    AgentSetProperty("obj_cleaver", kGameSelectable, false)
    AgentSetProperty("obj_MarshHouseInteriorCarafe", kGameSelectable, false)
    AgentSetProperty("obj_MarshHouseInteriorLamp", kGameSelectable, false)
    Yield()
    PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3Room - OK to Pick Clem Weapon", MarshHouseInterior_OnEndWeaponSelection)
  end
end
function MarshHouseInterior_OnClemFireGun(key, value)
  if value then
    AgentSetProperty("struggle_fight3", "Button Mash - Rate of Decay", 0.001)
    AgentSetProperty("struggle_fight3", "Button Mash - Rate of Increase", 10)
    Yield()
    PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3Room - Clem Fired Gun", MarshHouseInterior_OnClemFireGun)
  end
end
function MarshHouseInterior_EndCampmanAdvantageStruggle(key, value)
  if value then
    Struggle_End()
    Yield()
    PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3Room - Campman Advantage Struggle End", MarshHouseInterior_EndCampmanAdvantageStruggle)
  end
end
function MarshHouseInterior_LeeStrangleStruggle_CheckProgress(key, value)
  local curValue = 0
  if value then
    curValue = value
  end
  if kLeeStrangleStruggle_lastValue > kLeeStrangleStruggle_fail_lastValueMin and curValue < kLeeStrangleStruggle_fail_curValueMax then
    AgentSetProperty("struggle_fight2", "Struggle Finished", true)
  else
    kLeeStrangleStruggle_lastValue = curValue
  end
end
function MarshHouseInterior_CampmanCorpseChoiceExit()
  Dialog_Play("cs_CampmanCorpseChoiceExit")
end
function MarshHouseInterior_forceLeeSittingIdleStart()
  if not kLeeForcedSitDialogID then
    kLeeForcedSitDialogID = Dialog_Play("logic_LeeForcedSittingIdle")
  end
end
function MarshHouseInterior_forceLeeSittingIdleStop()
  if kLeeForcedSitDialogID then
    DlgStop(kLeeForcedSitDialogID)
    kLeeForcedSitDialogID = nil
  end
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
