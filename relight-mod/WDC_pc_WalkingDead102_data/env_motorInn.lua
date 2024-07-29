local kScript = "MotorInn"
local kScene = "adv_motorInn102"
local kPreloadableAssets = {
  "ui_helptext_background.d3dtx",
  "sk55_katjaa_faceDavidBlood.d3dtx",
  "sk55_katjaaJacket_bodyDavidBlood.d3dtx",
  "sk54_david_bodyZombie.d3dtx",
  "ui_inventory_background.d3dtx",
  "ui_useIcon_jerky.d3dtx",
  "fx_bloodSplatDirNrwB2.d3dtx",
  "fx_bloodSpurtDirAvgA2.d3dtx",
  "ui_useIcon_kickWindow.d3dtx",
  "fx_bloodspurtrada2.d3dtx",
  "sk54_lee_head.d3dtx",
  "ui_inventory_background.d3dtx",
  "fx_bloodspurtrada2high.d3dtx",
  "fx_bloodSpurtDirNrwA2.d3dtx",
  "fx_bloodspurtradb2.d3dtx",
  "fx_bloodSpurtDirWdeE2.d3dtx",
  "fx_bloodSpurtDirWdeD2.d3dtx",
  "fx_bloodspurtradb2high.d3dtx",
  "obj_logWoodsClementineFront_nm.d3dtx",
  "obj_logWoodsClementineFront_spec.d3dtx",
  "obj_logWoodsClementineFront.d3dtx",
  "fx_bloodspurtradc2.d3dtx",
  "fx_bloodspurtdiravgd2.d3dtx",
  "fx_bloodSpurtDirWdeA2.d3dtx",
  "fx_bloodSpurtDirNrwB2.d3dtx",
  "fx_bloodspurtradahigh.d3dtx",
  "fx_bloodSpurtDirWdeC2.d3dtx",
  "fx_bloodspurtdirwdeb2.d3dtx",
  "fx_bloodSpurtDirAvgE2.d3dtx",
  "sk54_travisZombieOverLeeTruck_kickedBackToHoldLeeLegTruck.chore",
  "sk54_lee_sk54_davidZombieOverLeeTruck_kickedBackToHoldLeeLegTruck.anm",
  "sk54_lee_sk54_idle_davidZombieHoldLeeLegTruck.anm"
}
local mDavid, mTravis
local mLeftDamage = 0
local mRightDamage = 0
local mDavidHeadMeshes = {
  {
    "Mesh sk54_david_headZombieEyeLeft - Visible",
    "Mesh sk54_david_headZombieEyeLeftDamageA - Visible",
    "Mesh sk54_david_headZombieEyeLeftDamageB - Visible"
  },
  {
    "Mesh sk54_david_headZombieEyeRight - Visible",
    "Mesh sk54_david_headZombieEyeRightDamageA - Visible",
    "Mesh sk54_david_headZombieEyeRightDamageB - Visible"
  }
}
local mTravisHeadMeshes = {
  {
    "Mesh sk54_travis_headZombieEyeLeft - Visible",
    "Mesh sk54_travis_headZombieEyeLeftDamageA - Visible",
    "Mesh sk54_travis_headZombieEyeLeftDamageB - Visible"
  },
  {
    "Mesh sk54_travis_headZombieEyeRight - Visible",
    "Mesh sk54_travis_headZombieEyeRightDamageA - Visible",
    "Mesh sk54_travis_headZombieEyeRightDamageB - Visible"
  }
}
function MotorInn_KatjaaCameraTriggerEnter(entering_agent, camera_trigger)
  Dialog_Play("logic_nearKatjaa")
  triggerCamera_EnterBox(entering_agent, camera_trigger)
end
function MotorInn_KatjaaCameraTriggerExit(entering_agent, camera_trigger)
  Dialog_Play("logic_AwayKatjaa")
  triggerCamera_ExitBox(entering_agent, camera_trigger)
end
function PreloadStruggle3()
end
function PreloadStruggle2()
end
function PreloadStruggle1()
end
function HideTrees(bHide)
  if Platform_IsIOS() then
    AgentHide("adv_motorInn102_meshesE", bHide)
    AgentHide("adv_motorInn102_meshesF", bHide)
    AgentHide("adv_motorInn102_meshesG", bHide)
    AgentHide("adv_motorInn102_meshesH", bHide)
    AgentHide("adv_motorInn102_meshesI", bHide)
    AgentHide("adv_motorInn102_meshesJ", bHide)
  end
end
function MotorInn()
  for i, asset in ipairs(kPreloadableAssets) do
    LoadAsync(asset)
  end
  Mode(mode_Main)
  mDavid = AgentFind("David")
  mTravis = AgentFind("Travis")
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide(Logic["DougCarley Saved"], false)
  if Logic["DougCarley Saved"] ~= "doug" then
    AgentHide("obj_securityWarningSystemMotorInn", true)
    AgentHide("obj_securityWarningSystemBellA", true)
    AgentHide("obj_securityWarningSystemBellB", true)
    AgentHide("obj_securityWarningSystemBellC", true)
    AgentHide("obj_canSecuritySystem", true)
  end
  if Logic["Gave Irene Gun"] == "true" then
    AgentHide("obj_balconyFull102", false)
  else
    AgentHide("obj_balconyFallen102", false)
  end
  if IsToolBuild() then
    if Logic["1MotorInn - Debug To Attack"] then
      Logic["1MotorInn - Debug To Attack"] = false
      Dialog_Play("cs_katjaaAttacked")
      return
    end
    if Logic["1MotorInn - Debug To Brothers"] then
      Logic["1MotorInn - Debug To Brothers"] = false
      Dialog_Play("cs_brothersArrive")
      return
    end
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Motor Inn Intro")
      DlgPreload("env_motorInn_BackAtTheMotel.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  else
    if Platform_IsWiiU() then
      print("Dialog Preloading start2: Motor Inn Intro")
      DlgPreload("env_motorInn_BackAtTheMotel.dlog", "debug_start", 0, 15, 0, false)
    end
    Dialog_Play("debug_start")
  end
end
function MotorInn_IncrementHeadDamage(side)
  if side ~= 0 and side ~= 1 then
    return
  end
  if side == 0 and mLeftDamage == 2 then
    return
  end
  if side == 1 and mRightDamage == 2 then
    return
  end
  if side == 0 then
    mLeftDamage = mLeftDamage + 1
  else
    mRightDamage = mRightDamage + 1
  end
  Print("Damage dealt: side " .. side .. "   Left Damage: " .. mLeftDamage .. "  Right Damage: " .. mRightDamage)
  if Logic["1BearTrap - Chopped Leg"] then
    AgentSetProperty(mDavid, mDavidHeadMeshes[side][mLeftDamage - 1], false)
    AgentSetProperty(mDavid, mDavidHeadMeshes[side][mLeftDamage], true)
  else
    AgentSetProperty(mTravis, mTravisHeadMeshes[side][mLeftDamage - 1], false)
    AgentSetProperty(mTravis, mTravisHeadMeshes[side][mLeftDamage], true)
  end
end
function MotorInn_WhereIsLee()
  local LeePos = AgentGetPos("Lee")
  local LillyPos = AgentGetPos("Lilly")
  LillyPos.y = LeePos.y
  local dLilly = VectorDistanceSq(LeePos, AgentGetPos("Lilly"))
  local dKenny = VectorDistanceSq(LeePos, AgentGetPos("Kenny"))
  local dLarry = VectorDistanceSq(LeePos, AgentGetPos("Larry"))
  local dClem = VectorDistanceSq(LeePos, AgentGetPos("Clementine"))
  local dDoug = VectorDistanceSq(LeePos, AgentGetPos("Doug"))
  if dLilly <= dKenny and dLilly <= dLarry and dLilly <= dClem and dLilly <= dDoug then
    Logic["1MotorInn - Lee Closest Character"] = "lilly"
  elseif dLilly >= dKenny and dKenny <= dLarry and dKenny <= dClem and dKenny <= dDoug then
    Logic["1MotorInn - Lee Closest Character"] = "kenny"
  elseif dLilly >= dLarry and dKenny >= dLarry and dLarry <= dClem and dLarry <= dDoug then
    Logic["1MotorInn - Lee Closest Character"] = "larry"
  elseif dLilly >= dClem and dKenny >= dClem and dLarry >= dClem and dClem <= dDoug then
    Logic["1MotorInn - Lee Closest Character"] = "clem"
  else
    Logic["1MotorInn - Lee Closest Character"] = "doug"
  end
end
function MotorInn_DoKatjaaFakeout(bSet)
  local onSelect = function()
    Print("Dialog selected")
    Logic["1MotorInn - Helped Save Katjaa"] = true
  end
  if bSet then
    Callback_OnChoiceSelected:Add(onSelect)
  else
    Callback_OnChoiceSelected:Remove(onSelect)
  end
end
local mApproachThread
function MotorInn_DoZombieApproach(bSet)
  if bSet and not ThreadIsRunning(mApproachThread) then
    local thread = function()
      local dist, camPos, zombiePos
      local zombie = AgentFind("Travis")
      local deathDist = 0.45
      local bDead = false
      if Logic["1BearTrap - Chopped Leg"] then
        zombie = AgentFind("David")
      end
      while not bDead do
        Sleep(0.1)
        camPos = AgentGetWorldPos(AgentGetCamera("Lee"))
        zombiePos = AgentGetWorldPos(zombie, "head")
        dist = VectorDistance(camPos, zombiePos)
        if deathDist >= dist and not Logic["1MotorInn - Zombie Backed Away"] and not bDead then
          bDead = true
          Dialog_StopAll()
          Dialog_Interruption()
          while Dialog_CutsceneIsRunning() do
            RenderDelay(1)
            Yield()
          end
          Dialog_Play("cs_deathDuringZombieCrawl")
        end
      end
    end
    mApproachThread = ThreadStart(thread)
  else
    ThreadKill(mApproachThread)
    mApproachThread = nil
  end
end
function MotorInn_PlayEyeFX()
  Print("Play eye FX")
  local zombie, oozeChore, struggleAgent
  if Logic["1BearTrap - Chopped Leg"] then
    zombie = "David"
    oozeChore = "fx_oozeEyesDavid"
    struggleAgent = "struggle_ZombieDavid2"
  else
    zombie = "Travis"
    oozeChore = "fx_oozeEyesTravis"
    struggleAgent = "struggle_ZombieTravis2"
  end
  while AgentGetProperty(struggleAgent, "Chore Scrubber - Percentage Current") < 0.15 do
    Sleep(0.5)
  end
  Print("Play oozing fx")
  ChorePlay(oozeChore)
  Sleep(1)
  Print("Play spurt fx")
  AgentAttachToNode("fx_spurtEyesCtrl", zombie, "head", false)
  AgentHide("fx_spurtEyesCtrl", false)
end
local tutorialThread
function Tutorial_MessageGettingAway(bShow)
  if Platform_IsIOS() then
    return
  end
  if bShow then
    local thread = function()
      HelpText_Show("tutorial_getAway")
      local perc = ChoredMovement_GetTimePercent()
      while perc < 0.75 do
        Yield()
        if ChoredMovement_GetTimePercent() then
          perc = ChoredMovement_GetTimePercent()
        end
      end
      HelpText_Clear()
      tutorialThread = nil
    end
    tutorialThread = ThreadStart(thread)
  else
    HelpText_Clear()
    ThreadKill(tutorialThread)
    tutorialThread = nil
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingcredits102")