require("mode_drag.lua")
local kScript = "Chapter2B"
local kScene = "adv_ruralRoadTileCh2"
local mZombies
local mbLetGoTutorial = false
local function OnDragStart(bStart)
  if bStart ~= mbLetGoTutorial then
    Callback_OnDragStart:Remove(OnDragStart)
    HelpText_Clear()
  end
end
local OnPostUpdate = function()
  local worldPos = AgentGetWorldPos("Wyatt")
  for i, zombie in pairs(mZombies) do
    if not zombie.mbSelectable and not AgentIsHidden(zombie) then
      local distance = VectorDistance(AgentGetWorldPos(zombie), worldPos)
      if distance < 6 then
        AgentSetSelectable(zombie, true)
        zombie.mbSelectable = true
        if not mbLetGoTutorial and Mode_IsActive(mode_drag) then
          Callback_OnDragStart:Add(OnDragStart)
          HelpText_Show("tutorial_letGoToShoot")
          mbLetGoTutorial = true
        end
      end
    end
  end
end
function Chapter2B()
  Mode(mode_Main)
  Game_EnableMovement(false)
  PathAgentSetSpeedScale("Wyatt", 1.5)
  if SaveLoad_IsFromLoad() then
    return
  end
  local kHitClyde = "2 - Hit Clyde"
  local kInvestigationComplete = "2 - Investigation Complete"
  local kPlayedRoshambo = "2 - Played Roshambo"
  local kWonRoshambo = "2 - Won Roshambo"
  if Logic[kHitClyde] then
    Dialog_Play("cs_hitAGuyNew")
    return
  end
  if Logic[kInvestigationComplete] then
    Logic[kHitClyde] = true
    Dialog_Play("cs_roshamboIntro3")
    return
  end
  if Logic[kPlayedRoshambo] then
    Logic[kHitClyde] = true
    Logic[kInvestigationComplete] = true
    if Logic[kWonRoshambo] then
      Dialog_Play("cs_eddieGoes")
    else
      Dialog_Play("cs_wyattGoes")
    end
    return
  end
  if Logic["2 - Zombies Attacked"] then
    Logic[kHitClyde] = true
    Logic[kInvestigationComplete] = true
    Logic[kPlayedRoshambo] = true
    Logic[kWonRoshambo] = false
    Logic["2 - Approached Clyde"] = true
    Logic["2 - Revealed Clyde"] = true
    AgentSetProperty("dummy_attachmentWyatt", kIdleAnim, "attach_wyatt_nothing.chore")
    AgentSetProperty("Wyatt", kIdleAnim, "sk54_idle_wyattStandA.chore")
    AgentSetProperty("Wyatt", kWalkAnim, "sk54_move_wyattWalk.chore")
    AgentHide("Clyde", false)
    Dialog_Play("cs_zombiesAttack")
    return
  end
  if Logic["2 - Got Keys"] then
    Logic[kHitClyde] = true
    Logic[kInvestigationComplete] = true
    Logic[kPlayedRoshambo] = true
    Logic[kWonRoshambo] = true
    AgentHide("Eddie", true)
    Dialog_Play("cs_wyattAttacked")
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function Chapter2B_OnDragAgentFocus()
  Callback_OnDragAgentFocus:Remove(Chapter2B_OnDragAgentFocus)
  Callback_OnDragStart:Add(OnDragStart)
  HelpText_Show("tutorial_dragClyde")
end
function Chapter2B_StartShootingGallery()
  mZombies = {
    AgentFind("Zombie01"),
    AgentFind("Zombie02"),
    AgentFind("Zombie03"),
    AgentFind("Zombie04"),
    AgentFind("Zombie05"),
    AgentFind("Zombie06")
  }
  Callback_PostUpdate:Add(OnPostUpdate)
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_zombiesAttack", "Pan Cam - Enabled", false)
  end
end
function Chapter2B_StopShootingGallery()
  Callback_PostUpdate:Remove(OnPostUpdate)
  mZombies = nil
end
SceneOpen(kScene, kScript)
