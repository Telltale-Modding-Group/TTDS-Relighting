-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead102_data\env_motorInn_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")

local kScript = "MotorInn"
local kScene = "adv_motorInn102"
local kPreloadableAssets = {"ui_helptext_background.d3dtx", "sk55_katjaa_faceDavidBlood.d3dtx", "sk55_katjaaJacket_bodyDavidBlood.d3dtx", "sk54_david_bodyZombie.d3dtx", "ui_inventory_background.d3dtx", "ui_useIcon_jerky.d3dtx", "fx_bloodSplatDirNrwB2.d3dtx", "fx_bloodSpurtDirAvgA2.d3dtx", "ui_useIcon_kickWindow.d3dtx", "fx_bloodspurtrada2.d3dtx", "sk54_lee_head.d3dtx", "ui_inventory_background.d3dtx", "fx_bloodspurtrada2high.d3dtx", "fx_bloodSpurtDirNrwA2.d3dtx", "fx_bloodspurtradb2.d3dtx", "fx_bloodSpurtDirWdeE2.d3dtx", "fx_bloodSpurtDirWdeD2.d3dtx", "fx_bloodspurtradb2high.d3dtx", "obj_logWoodsClementineFront_nm.d3dtx", "obj_logWoodsClementineFront_spec.d3dtx", "obj_logWoodsClementineFront.d3dtx", "fx_bloodspurtradc2.d3dtx", "fx_bloodspurtdiravgd2.d3dtx", "fx_bloodSpurtDirWdeA2.d3dtx", "fx_bloodSpurtDirNrwB2.d3dtx", "fx_bloodspurtradahigh.d3dtx", "fx_bloodSpurtDirWdeC2.d3dtx", "fx_bloodspurtdirwdeb2.d3dtx", "fx_bloodSpurtDirAvgE2.d3dtx", "sk54_travisZombieOverLeeTruck_kickedBackToHoldLeeLegTruck.chore", "sk54_lee_sk54_davidZombieOverLeeTruck_kickedBackToHoldLeeLegTruck.anm", "sk54_lee_sk54_idle_davidZombieHoldLeeLegTruck.anm"}
local mDavid, mTravis = nil, nil
local mLeftDamage = 0
local mRightDamage = 0
local mDavidHeadMeshes = {
{"Mesh sk54_david_headZombieEyeLeft - Visible", "Mesh sk54_david_headZombieEyeLeftDamageA - Visible", "Mesh sk54_david_headZombieEyeLeftDamageB - Visible"}
, 
{"Mesh sk54_david_headZombieEyeRight - Visible", "Mesh sk54_david_headZombieEyeRightDamageA - Visible", "Mesh sk54_david_headZombieEyeRightDamageB - Visible"}
}
local mTravisHeadMeshes = {
{"Mesh sk54_travis_headZombieEyeLeft - Visible", "Mesh sk54_travis_headZombieEyeLeftDamageA - Visible", "Mesh sk54_travis_headZombieEyeLeftDamageB - Visible"}
, 
{"Mesh sk54_travis_headZombieEyeRight - Visible", "Mesh sk54_travis_headZombieEyeRightDamageA - Visible", "Mesh sk54_travis_headZombieEyeRightDamageB - Visible"}
}
MotorInn_KatjaaCameraTriggerEnter = function(entering_agent, camera_trigger)
  -- function num : 0_0 , upvalues : _ENV
  Dialog_Play("logic_nearKatjaa")
  triggerCamera_EnterBox(entering_agent, camera_trigger)
end

MotorInn_KatjaaCameraTriggerExit = function(entering_agent, camera_trigger)
  -- function num : 0_1 , upvalues : _ENV
  Dialog_Play("logic_AwayKatjaa")
  triggerCamera_ExitBox(entering_agent, camera_trigger)
end

PreloadStruggle3 = function()
  -- function num : 0_2
end

PreloadStruggle2 = function()
  -- function num : 0_3
end

PreloadStruggle1 = function()
  -- function num : 0_4
end

HideTrees = function(bHide)
  -- function num : 0_5 , upvalues : _ENV
  if Platform_IsIOS() then
    AgentHide("adv_motorInn102_meshesE", bHide)
    AgentHide("adv_motorInn102_meshesF", bHide)
    AgentHide("adv_motorInn102_meshesG", bHide)
    AgentHide("adv_motorInn102_meshesH", bHide)
    AgentHide("adv_motorInn102_meshesI", bHide)
    AgentHide("adv_motorInn102_meshesJ", bHide)
  end
end





modifyScene = function(sceneObj)
    local light1  = AgentFindInScene("shadowlight_character", sceneObj)
    local light2  = AgentFindInScene("light_ENV_D_1", sceneObj)
    local light3  = AgentFindInScene("light_ENV_A_1", sceneObj) --skydome light
    local light4  = AgentFindInScene("light_ENV_A_2", sceneObj)
    local light5  = AgentFindInScene("light_ENV_S_1", sceneObj)
    local light6  = AgentFindInScene("light_ENV_S_2", sceneObj)
    local light7  = AgentFindInScene("light_ENV_S_3", sceneObj)
    local light8  = AgentFindInScene("light_ENV_S_4", sceneObj)
    local light9  = AgentFindInScene("light_ENV_S_5", sceneObj)
    local light10 = AgentFindInScene("light_ENV_S_6", sceneObj)
    local light11 = AgentFindInScene("light_ENV_S_7", sceneObj)
    local light12 = AgentFindInScene("light_ENV_S_8", sceneObj)
    local light13 = AgentFindInScene("light_ENV_S_9", sceneObj)
    local light14 = AgentFindInScene("light_ENV_S_10", sceneObj)
    local light15 = AgentFindInScene("light_ENV_S_11", sceneObj)
    local light16 = AgentFindInScene("light_ENV_S_12", sceneObj)
    local light17 = AgentFindInScene("light_ENV_S_13", sceneObj)
    local light18 = AgentFindInScene("light_ENV_S_14", sceneObj)
    local light19 = AgentFindInScene("light_ENV_S_15", sceneObj)
    local light20 = AgentFindInScene("light_ENV_S_16", sceneObj)
    local light21 = AgentFindInScene("light_ENV_S_17", sceneObj)
    local light22 = AgentFindInScene("light_ENV_S_18", sceneObj)
    local light23 = AgentFindInScene("light_ENV_S_19", sceneObj)
    local light24 = AgentFindInScene("light_ENV_S_21", sceneObj)
    destroyMe(light1)
    --destroyMe(light2) --light_ENV_D_1
    --destroyMe(light3)
    --destroyMe(light4)
    destroyMe(light5)
    destroyMe(light6)
    destroyMe(light7)
    destroyMe(light8)
    destroyMe(light9)
    destroyMe(light10)
    destroyMe(light11)
    destroyMe(light12)
    destroyMe(light13)
    destroyMe(light14)
    destroyMe(light15)
    destroyMe(light16)
    destroyMe(light17)
    destroyMe(light18)
    destroyMe(light19)
    destroyMe(light20)
    destroyMe(light21)
    destroyMe(light22)
    destroyMe(light23)
    destroyMe(light24)
    
    local envModule    = AgentFindInScene("module_environment", sceneObj)
    local sunColor     = RGBColor(255, 245, 227, 255)
    local ambientColor = RGBColor(108, 170, 225, 255)
    local skyColor     = RGBColor(24, 99, 205, 255)
    local fogColor     = Desaturate_RGBColor(skyColor, 0.45)
    
    skyColor = Desaturate_RGBColor(skyColor, 0.3)
    
    --enviorment module (fog)
    local envModule_props = AgentGetRuntimeProperties(envModule)
    customSetPropertyColor(envModule_props, "5416356241638078242", fogColor)

    --sun
    local dupedLight2_sun = AgentCreate("light_ENV_D_1_duplicated_sun", AgentGetProperties(light2), AgentGetPos(light2), AgentGetRot(light2), sceneObj, false, false)
    ModifyLightSettings(dupedLight2_sun, 6.0, 0.9, sunColor)
    ModifyAgentTransformation_Rotation(dupedLight2_sun, Vector(100, -22, 40))
    Custom_PropertySet(dupedLight2_sun, "EnvLight - Wrap", 0.1)
    Custom_PropertySet(dupedLight2_sun, "EnvLight - Shadow Quality", 3)
    
    --remove original sun
    destroyMe(light2)
    
    --skydome light
    ModifyLightSettings(light3, 8.0, 1.0, skyColor)
    
    --flat ambient
    ModifyLightSettings(light4, 0.35, 1.0, ambientColor)
    
    
    local sceneAgent    = AgentFindInScene("adv_motorInn102.scene", sceneObj)
    Custom_PropertySet(sceneAgent, "HBAO Enabled", true)
    Custom_PropertySet(sceneAgent, "HBAO Intensity", 1.5)
    
    RemovingAllLightingRigs(sceneObj)
end




MotorInn = function()
  -- function num : 0_6 , upvalues : _ENV, kPreloadableAssets, mDavid, mTravis
  for i,asset in ipairs(kPreloadableAssets) do
    LoadAsync(asset)
  end
  Mode(mode_Main)
  
  
  modifyScene(kScene)
  --PrintSceneListToTXT(kScene, "sceneoutput_102-motorinn.txt")
  
  
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
  -- DECOMPILER ERROR at PC76: Confused about usage of register: R0 in 'UnsetPending'

  if IsToolBuild() then
    if Logic["1MotorInn - Debug To Attack"] then
      Logic["1MotorInn - Debug To Attack"] = false
      Dialog_Play("cs_katjaaAttacked")
      return 
    end
    -- DECOMPILER ERROR at PC86: Confused about usage of register: R0 in 'UnsetPending'

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

MotorInn_IncrementHeadDamage = function(side)
  -- function num : 0_7 , upvalues : mLeftDamage, mRightDamage, _ENV, mDavid, mDavidHeadMeshes, mTravis, mTravisHeadMeshes
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
    AgentSetProperty(mDavid, (mDavidHeadMeshes[side])[mLeftDamage - 1], false)
    AgentSetProperty(mDavid, (mDavidHeadMeshes[side])[mLeftDamage], true)
  else
    AgentSetProperty(mTravis, (mTravisHeadMeshes[side])[mLeftDamage - 1], false)
    AgentSetProperty(mTravis, (mTravisHeadMeshes[side])[mLeftDamage], true)
  end
end

MotorInn_WhereIsLee = function()
  -- function num : 0_8 , upvalues : _ENV
  local LeePos = AgentGetPos("Lee")
  local LillyPos = AgentGetPos("Lilly")
  LillyPos.y = LeePos.y
  local dLilly = VectorDistanceSq(LeePos, AgentGetPos("Lilly"))
  local dKenny = VectorDistanceSq(LeePos, AgentGetPos("Kenny"))
  local dLarry = VectorDistanceSq(LeePos, AgentGetPos("Larry"))
  local dClem = VectorDistanceSq(LeePos, AgentGetPos("Clementine"))
  local dDoug = VectorDistanceSq(LeePos, AgentGetPos("Doug"))
  -- DECOMPILER ERROR at PC47: Confused about usage of register: R7 in 'UnsetPending'

  if dLilly <= dKenny and dLilly <= dLarry and dLilly <= dClem and dLilly <= dDoug then
    Logic["1MotorInn - Lee Closest Character"] = "lilly"
  else
    -- DECOMPILER ERROR at PC58: Confused about usage of register: R7 in 'UnsetPending'

    if dKenny <= dLilly and dKenny <= dLarry and dKenny <= dClem and dKenny <= dDoug then
      Logic["1MotorInn - Lee Closest Character"] = "kenny"
    else
      -- DECOMPILER ERROR at PC69: Confused about usage of register: R7 in 'UnsetPending'

      if dLarry <= dLilly and dLarry <= dKenny and dLarry <= dClem and dLarry <= dDoug then
        Logic["1MotorInn - Lee Closest Character"] = "larry"
      else
        -- DECOMPILER ERROR at PC80: Confused about usage of register: R7 in 'UnsetPending'

        if dClem <= dLilly and dClem <= dKenny and dClem <= dLarry and dClem <= dDoug then
          Logic["1MotorInn - Lee Closest Character"] = "clem"
        else
          -- DECOMPILER ERROR at PC83: Confused about usage of register: R7 in 'UnsetPending'

          Logic["1MotorInn - Lee Closest Character"] = "doug"
        end
      end
    end
  end
end

MotorInn_DoKatjaaFakeout = function(bSet)
  -- function num : 0_9 , upvalues : _ENV
  local onSelect = function()
    -- function num : 0_9_0 , upvalues : _ENV
    Print("Dialog selected")
    -- DECOMPILER ERROR at PC4: Confused about usage of register: R0 in 'UnsetPending'

    Logic["1MotorInn - Helped Save Katjaa"] = true
  end

  if bSet then
    Callback_OnChoiceSelected:Add(onSelect)
  else
    Callback_OnChoiceSelected:Remove(onSelect)
  end
end

local mApproachThread = nil
MotorInn_DoZombieApproach = function(bSet)
  -- function num : 0_10 , upvalues : _ENV, mApproachThread
  if bSet and not ThreadIsRunning(mApproachThread) then
    local thread = function()
    -- function num : 0_10_0 , upvalues : _ENV
    local dist, camPos, zombiePos = nil, nil, nil
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
      if dist > deathDist or Logic["1MotorInn - Zombie Backed Away"] or not bDead then
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
    do
      ThreadKill(mApproachThread)
      mApproachThread = nil
    end
  end
end

MotorInn_PlayEyeFX = function()
  -- function num : 0_11 , upvalues : _ENV
  Print("Play eye FX")
  local zombie, oozeChore, struggleAgent = nil, nil, nil
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

local tutorialThread = nil
Tutorial_MessageGettingAway = function(bShow)
  -- function num : 0_12 , upvalues : _ENV, tutorialThread
  if Platform_IsIOS() then
    return 
  end
  if bShow then
    local thread = function()
    -- function num : 0_12_0 , upvalues : _ENV, tutorialThread
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
    do
      HelpText_Clear()
      ThreadKill(tutorialThread)
      tutorialThread = nil
    end
  end
end

SceneOpen(kScene, kScript)
SceneAdd("ui_openingcredits102")

