-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead201_data\ClearingCampfire_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")
require("PropertyMenuTool.lua")
local kScript = "ClearingCampfire"
local kScene = "adv_clearingCampfire"
local kDragHintDelay = 0.5
local mbIsKindlingBurning = false
local mBanterDialogID = nil
local multiAgents = {}
multiAgents.kindling = {}
-- DECOMPILER ERROR at PC13: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.kindling).agents = {"obj_kindlingClearingCampfire", "obj_kindlingClearingCampfire_clementineWristL", "newFireLight"}
-- DECOMPILER ERROR at PC15: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.kindling).lastUpdateTime = -1
multiAgents.lighter = {}
-- DECOMPILER ERROR at PC24: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.lighter).agents = {"obj_lighterWD", "obj_lighterWD_clementine", "obj_lighterWD_christa"}
-- DECOMPILER ERROR at PC26: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.lighter).lastUpdateTime = -1
multiAgents.backpack = {}
-- DECOMPILER ERROR at PC34: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.backpack).agents = {"obj_backpackClearingCampfire", "obj_backpackClearingCampfire_clementine"}
-- DECOMPILER ERROR at PC36: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.backpack).lastUpdateTime = -1
multiAgents.drawings = {}
-- DECOMPILER ERROR at PC45: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.drawings).agents = {"obj_drawingClementineClearingCampfireA", "obj_drawingClementineClearingCampfireA_clementine", "obj_drawingClementineClearingCampfireA_backpack"}
-- DECOMPILER ERROR at PC47: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.drawings).lastUpdateTime = -1
multiAgents.photo = {}
-- DECOMPILER ERROR at PC56: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.photo).agents = {"obj_photoTornLeeClearingCampfire", "obj_photoTornLeeClearingCampfire_clementine", "obj_photoTornLeeClearingCampfire_backpack"}
-- DECOMPILER ERROR at PC58: Confused about usage of register: R6 in 'UnsetPending'

;
(multiAgents.photo).lastUpdateTime = -1
local UpdateContextSensitiveComment = function()
  -- function num : 0_0 , upvalues : _ENV
  local choice = DlgEvaluateToNode(Game_GetSceneDialog(), "use_winston_contextual", "exchange", false)
  local text = DlgGetExchangeNodeText(Game_GetSceneDialog(), choice.NodeID, false)
  if text[1] then
    text = text[1]
  else
    text = nil
  end
  if text and AgentExists("ui_dialog_choice3") then
    AgentSetProperty("ui_dialog_choice3", "Text String", text)
  end
end

local ShowDragTut = function()
  -- function num : 0_1 , upvalues : _ENV
  Notification_ShowTutorial("tut_campfireClearing_holdAndDrag")
end

ClearingCampfire_DragHintDelay = function()
  -- function num : 0_2 , upvalues : _ENV, kDragHintDelay
  Sleep(kDragHintDelay)
  LogicSet("1Campfire - Okay for Drag Hint", true)
end

ClearingCampfire_MultiAgents_Init = function()
  -- function num : 0_3 , upvalues : _ENV, multiAgents
  print("Clearing Campfire: multi agents INIT")
  local multiAgentKey, multiAgentValue = nil, nil
  local actionTime = 0
  for multiAgentKey,multiAgentValue in pairs(multiAgents) do
    do
      for key,value in pairs(multiAgentValue.agents) do
        local agent = value
        do
          local MultiAgentsVisCheck = function(propKey, bVisible)
    -- function num : 0_3_0 , upvalues : multiAgentValue, _ENV, multiAgents, multiAgentKey, agent
    if bVisible then
      if multiAgentValue.lastUpdateTime == GetTotalTime() then
        return 
      end
      for key,value in pairs((multiAgents[multiAgentKey]).agents) do
        if value ~= agent then
          AgentHide(value, true)
        end
      end
      multiAgentValue.lastUpdateTime = GetTotalTime()
    end
  end

          PropertyAddKeyCallback(AgentGetProperties(agent), "Runtime: Visible", MultiAgentsVisCheck)
        end
      end
    end
  end
end

ClearingCampfire_MultiAgents_Off = function()
  -- function num : 0_4 , upvalues : _ENV, multiAgents
  for multiAgentKey,multiAgentValue in pairs(multiAgents) do
    for key,value in pairs(multiAgentValue.agents) do
      PropertyClearKeyCallbacks(AgentGetProperties(value), "Runtime: Visible")
    end
  end
  print("Clearing Campfire: multi agents OFF")
end

ClearingCampfire_BanterStart = function()
  -- function num : 0_5 , upvalues : mBanterDialogID, _ENV, UpdateContextSensitiveComment
  mBanterDialogID = Dialog_Run(Game_GetSceneDialog(), "cs_banter", false)
  print("^^STARTING^^ scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "1Campfire - Clem Context Comment Group to Winston", UpdateContextSensitiveComment)
end

ClearingCampfire_BanterPause = function(bPause)
  -- function num : 0_6 , upvalues : _ENV, mBanterDialogID
  if not bPause then
    print("** RESUMING ** scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgResume(mBanterDialogID)
  else
    print(">> PAUSING << scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgPause(mBanterDialogID)
  end
end

ClearingCampfire_BanterEnd = function()
  -- function num : 0_7 , upvalues : _ENV, UpdateContextSensitiveComment
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "1Campfire - Clem Context Comment Group to Winston", UpdateContextSensitiveComment)
end

ClearingCampfire_IsKindlingBurning = function()
  -- function num : 0_8 , upvalues : mbIsKindlingBurning
  return mbIsKindlingBurning
end

ClearingCampfire_SetKindlingBurning = function(bool)
  -- function num : 0_9 , upvalues : mbIsKindlingBurning
  if not bool then
    mbIsKindlingBurning = false
  else
    mbIsKindlingBurning = true
  end
end

ClearingCampfire_StartWalkToFire = function()
  -- function num : 0_10 , upvalues : _ENV
  AgentSetPos(Game_GetPlayer(), Vector(6.962573, 1e-006, 14.51492))
  AgentSetRot(Game_GetPlayer(), Vector(-180, -7.4572, -180))
  Navigate_Enable(true)
  TargetedWalk_Start("tgtWalk_ClemToCampfire")
  CameraActivate("cam_nav_Clementine_chaseToCampfire")
end

ClearingCampfire_MakeAllObjsUnselectable = function()
  -- function num : 0_11 , upvalues : _ENV, kScene
  for key,value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end

ClearingCampfire_SpecialAgentFocus = function()
  -- function num : 0_12 , upvalues : _ENV, kScene, ShowDragTut
  if AgentGetName(SceneGetCamera(kScene)) == "cam_closeUp_burnYourMemories" then
    if AgentGetName(Reticle_GetSelectedAgent()) == "obj_drawingClementineClearingCampfireA_clementine" then
      print("Clem\'s looking at the drawings!")
    else
      if AgentGetName(Reticle_GetSelectedAgent()) == "obj_photoTornLeeClearingCampfire_clementine" then
        print("Clem\'s looking at the photo!")
      else
        print("Clem\'s looking at NEITHER burnable object!")
      end
    end
  else
    if AgentGetName(Reticle_GetSelectedAgent()) == "obj_lighterUsePoint" and LogicGet("1Campfire - Okay for Drag Hint") then
      LogicSet("1Campfire - Okay for Drag Hint", false)
      ShowDragTut()
    end
  end
end





ModifyScene = function(sceneObj)
    local light1  = AgentFindInScene("light_D01", sceneObj)
    local light2  = AgentFindInScene("light_p", sceneObj)
    local light3  = AgentFindInScene("light_p02", sceneObj)
    local light4  = AgentFindInScene("light_p01", sceneObj)
    local light5  = AgentFindInScene("light_ENV_P_wideShot03", sceneObj)
    local light6  = AgentFindInScene("light_ENV_P_wideShot02", sceneObj)
    local light7  = AgentFindInScene("light_pot01", sceneObj)
    local light8  = AgentFindInScene("light_pot", sceneObj)
    local light9  = AgentFindInScene("light_amb3pack", sceneObj)
    local light10 = AgentFindInScene("light_p03", sceneObj)
    local light11 = AgentFindInScene("light_p04", sceneObj)
    local light12 = AgentFindInScene("light_ENV_P_wideShot01", sceneObj)
    destroyMe(light1)
    destroyMe(light2)
    destroyMe(light3)
    destroyMe(light4)
    destroyMe(light5)
    destroyMe(light6)
    destroyMe(light7)
    destroyMe(light8)
    destroyMe(light9)
    destroyMe(light10)
    destroyMe(light11)
    destroyMe(light12)
    

    local fx1 = AgentFindInScene("light_FireEmbers", sceneObj)
    local fx2 = AgentFindInScene("light_SmokeCampfire", sceneObj)
    local fx3 = AgentFindInScene("light_rain", sceneObj)
    local fx4 = AgentFindInScene("light_fire", sceneObj)
    --destroyMe(fx1)
    --destroyMe(fx2)
    destroyMe(fx3)
    --destroyMe(fx4)
    
    local light13 = AgentFindInScene("light_env_p_kindlingFire01", sceneObj)
    local light14 = AgentFindInScene("light_sky", sceneObj)
    local light15 = AgentFindInScene("light_amb01", sceneObj)
    local light16 = AgentFindInScene("light_D", sceneObj)
    
    --destroyMe(light13)
    --destroyMe(light14)
    --destroyMe(light15)
    --destroyMe(light16)
    --destroyMe(light17)

    local sunColor     = RGBColor(48, 115, 248, 255)
    local ambientColor = RGBColor(48, 115, 248, 255)
    local skyColor     = RGBColor(24, 99, 205, 255)
    local fireColor    = RGBColor(255, 113, 1, 255)
    local fogColor     = Desaturate_RGBColor(skyColor, 0.45)
    skyColor           = Desaturate_RGBColor(skyColor, 0.2)
    sunColor           = Desaturate_RGBColor(sunColor, 0.2)
    skyColor           = Multiplier_RGBColor(skyColor, 0.3)
    
    --enviorment module (fog)
    local envModule       = AgentFindInScene("module_environment", sceneObj)
    local envModule_props = AgentGetRuntimeProperties(envModule)
    customSetPropertyColor(envModule_props, "5416356241638078242", skyColor)
    PropertySet(envModule_props, "Env - Fog Start Distance", 0.05)
    
    --DevTools_AgentMenuTool_GetValidPropertyNames(envModule)

    --sun
    ModifyLightSettings(light16, 0.7, 0.0, sunColor)
    ModifyAgentTransformation_Rotation(light16, Vector(70, 0, 60))
    local sunProps = AgentGetRuntimeProperties(light16)
    --customSetProperty(sunProps, "1930888535905678774", 3) --sets shadow thingy for reverse lighting
    --customSetProperty(sunProps, "17514946436635221562", 0.1) --sets reverse lighting for sun
    --customSetProperty(sunProps, "17681688128104012802", 0.5) --sets shadow intensity
    customSetProperty(sunProps, "12886873986940172262", 1.0) --sets specular intensity
    
    --flat ambient
    ModifyLightSettings(light15, 0.045, 0.0, ambientColor)
    
    --fire light
    local light13_props = AgentGetRuntimeProperties(light13)
    ModifyLightSettings(light13, 25.0, 0.0, fireColor)
    customSetProperty(light13_props, "1733657658237399986", 1) --light ao (1 = ao in direct, 0 = no ao in direct)
    customSetProperty(light13_props, "1930888535905678774", 2) --backlighting
    customSetProperty(light13_props, "17681688128104012802", 0.0) --backlighting intensity
    customSetProperty(light13_props, "11837162388573913540", 3) --shadow res
    customSetProperty(light13_props, "12240037695649491852", 2) --spec intensity
    customSetProperty(light13_props, "15795194095140368487", 1) --light fallof
    customSetProperty(light13_props, "7339671952917344989", 8) --light range
    customSetProperty(light13_props, "6895516104914333780", 13) --intensity
    customSetProperty(light13_props, "7069310311067719984", 2) --multiplier
    
    local newFire_propfile = "module_env_light.prop"
    local newFirePos = Vector(-1.5,0.05,1.25)
    newFirePos = Vector(0.169051,0.493146,2.379635)
    local newFire = AgentCreate("newFireLight", light13_props, newFirePos, Vector(0,0,0), sceneObj, false, false)
    
    
    --AgentSetPos(newFirePos, AgentGetPos(light13))
    --AgentSetWorldPos(newFirePos, AgentGetWorldPos(light13))
    
    
    local newFireProps = AgentGetRuntimeProperties(newFire)
    --local newFireProps = light13_props
    ModifyLightSettings(newFire, 0.65, 0.0, fireColor)
    PropertySet(newFireProps, "EnvLight - Enabled", true)
    PropertySet(newFireProps, "EnvLight - Enabled Group", true)
    PropertySet(newFireProps, "EnvLight - Radius", 8)
    PropertySet(newFireProps, "EnvLight - Type", 0)
    PropertySet(newFireProps, "EnvLight - HBAO Participation Type", 1)
    PropertySet(newFireProps, "EnvLight - Groups", 0)
    PropertySet(newFireProps, "EnvLight - Priority", 1)
    PropertySet(newFireProps, "EnvLight - Opacity", 1)
    PropertySet(newFireProps, "EnvLight - Shadow Type", 1)
    PropertySet(newFireProps, "EnvLight - Shadow Quality", 1)
    PropertySet(newFireProps, "EnvLight - Shadow Near Clip", 0.01)
    PropertySet(newFireProps, "EnvLight - Shadow Depth Bias", 0.01)
    PropertySet(newFireProps, "EnvLight - Shadow Softness", 0.05)
    PropertySet(newFireProps, "EnvLight - Shadow Map Quality Distance Scale", 1.0)
    
    --ember light
    ModifyLightSettings(fx1, 4.0, 0.0, fireColor)
    
    local sceneAgent      = AgentFindInScene("adv_clearingCampfire.scene", sceneObj)
    local sceneAgent_props = AgentGetRuntimeProperties(sceneAgent)
    customSetProperty(sceneAgent_props, "12144243618429851605", 2.0) --bloom intensity
    customSetProperty(sceneAgent_props, "18049689073467266258", 0.0) --bloom threshold
    customSetProperty(sceneAgent_props, "7391351126530590744", false) --npr effect
    customSetProperty(sceneAgent_props, "14597386597950219641", 4.0) --tonemap white point
    
    PropertySet(sceneAgent_props, "After Effects Enabled", true)
    
    PropertySet(sceneAgent_props, "HBAO Enabled", true)
    PropertySet(sceneAgent_props, "HBAO Intensity", 3.0)
    PropertySet(sceneAgent_props, "HBAO Max Radius Percent", 25.0)
    PropertySet(sceneAgent_props, "HBAO Max Distance", 100.0)
    
    PropertySet(sceneAgent_props, "FX anti-aliasing", true)
    PropertySet(sceneAgent_props, "FX TAA Weight", true)
    
    PropertySet(sceneAgent_props, "FX Sharp Shadows Enabled", true)
    
    
    --PropertySet(sceneAgent_props, "FX DOF Enabled", true)
    --PropertySet(sceneAgent_props, "FX DOF Auto Focus Enabled", true)
    --PropertySet(sceneAgent_props, "FX DOF FOV Adjust Enabled", true)
    --PropertySet(sceneAgent_props, "FX DOF Far Falloff", 0.25)
    --PropertySet(sceneAgent_props, "FX DOF Near", 0)
    
    
    PropertySet(sceneAgent_props, "FX Ambient Occlusion Enabled", true)
    PropertySet(sceneAgent_props, "FX Ambient Occlusion Intensity", 5)
    
    PropertySet(sceneAgent_props, "FX Tonemap Type", 0)
    PropertySet(sceneAgent_props, "FX Tonemap Enabled", true)
    PropertySet(sceneAgent_props, "FX Tonemap Intensity", 1)
    
    
    
    DevTools_AgentMenuTool_GetValidPropertyNames(sceneAgent)
    local clemAgent      = AgentFindInScene("Clementine", sceneObj)
    DevTools_AgentMenuTool_GetValidPropertyNames(clemAgent)
    --local christaAgent      = AgentFindInScene("Christa", sceneObj)
    --local clemAgent_props = AgentGetRuntimeProperties(clemAgent)
    --local christaAgent_props = AgentGetRuntimeProperties(christaAgent)
    --PropertySet(clemAgent_props, "Render Lighting Groups", 1)
    --PropertySet(christaAgent_props, "Render Lighting Groups", 1)
    --PropertySet(clemAgent_props, "Render Layer", 1)
    --PropertySet(christaAgent_props, "Render Layer", 1)
    
    

    RemovingAllLightingRigs(sceneObj)
    --BrightenAllCameras(sceneObj, 4.25)
    
    SetPropertyOnAllCameras(sceneObj, "Lens - Auto Focus Enabled", true)
    
    --SetPropertyOnAllCameras(sceneObj, "Use High Quality DOF", true)
    --SetPropertyOnAllCameras(sceneObj, "Use Bokeh", true)
    --SetPropertyOnAllCameras(sceneObj, "Depth Of Field Enabled", true)
    --SetPropertyOnAllCameras(sceneObj, "Depth Of Field - Near", 0)
    --SetPropertyOnAllCameras(sceneObj, "Depth Of Field - Far", true)
    
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesA", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesA", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesB", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesB", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesC", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesC", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesE", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesE", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesF", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesF", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesG", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesG", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesI", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesI", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesJFoliageTrees", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesJFoliageTrees", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesIFoliageTrees", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesIFoliageTrees", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_foliageBrushMeshesI", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_foliageBrushMeshesI", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_foliageTreeMeshesI", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_foliageTreeMeshesI", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_foliageTreeMeshesJ", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_foliageTreeMeshesJ", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_meshesG_decals", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_meshesG_decals", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("adv_clearingCampfire_distGround", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("adv_clearingCampfire_distGround", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_grassHIClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_grassHIClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_kindlingClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_kindlingClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_treeCarvingCampfireClearing", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_treeCarvingCampfireClearing", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_spearClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_spearClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_grassWadeHIClearingCampfireA", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_grassWadeHIClearingCampfireA", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_grassWadeHIClearingCampfireB", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_grassWadeHIClearingCampfireB", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_potFallenClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_potFallenClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_rabbitRoastingClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_rabbitRoastingClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_logChoppedClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_logChoppedClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_logHollowClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_logHollowClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_logChoppedClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_logChoppedClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_plateLicenseNCClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_plateLicenseNCClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_backpackClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_backpackClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_branchHIClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_branchHIClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    Custom_AgentSetProperty("obj_campfireClearingCampfire", "Render EnvLight Shadow Cast Enable", true, sceneObj)
    Custom_AgentSetProperty("obj_campfireClearingCampfire", "Render Shadow Force Visible", true, sceneObj)
    
    --RemoveNPR_OutlineOnAllAgents(sceneObj)
end


ReplacerRain = function(sceneObj)
    local originalRain  = AgentFindInScene("fx_rainSphereWD200Close", sceneObj)
    local originalRain2  = AgentFindInScene("fx_rainSphereWD200Far", sceneObj)
    local rainLight  = AgentFindInScene("light_rain", sceneObj)
    destroyMe(originalRain)
    destroyMe(originalRain2)
    destroyMe(rainLight)
    
    
    ResourceSetEnable("ProjectSeason4")
    ResourceSetEnable("WalkingDead401")
    local fx_camRain_prop = "fx_camRain.prop"
    local fx_camRainSplashes_prop = "fx_camRainSplashes.prop"
    local fx_camRainSplashSpawn_prop = "fx_camRainSplashSpawn.prop"

    local newPosition = Vector(0,0,0)
    
    local fx_camRain      = AgentCreate("fx_camRain", fx_camRain_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    local fx_camRainSplashes      = AgentCreate("fx_camRainSplashes", fx_camRainSplashes_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    local fx_camRainSplashSpawn      = AgentCreate("fx_camRainSplashSpawn", fx_camRainSplashSpawn_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local fx_rain1_props = AgentGetRuntimeProperties(fx_camRain)
    
    customSetProperty(fx_rain1_props, "689599953923669477", true) --enable emitter
    customSetProperty(fx_rain1_props, "4180975590232535326", 0.005) --particle size
    customSetProperty(fx_rain1_props, "2137029241144994061", 0.8) --particle count
    customSetProperty(fx_rain1_props, "907461805036530086", 1.0) --particle speed
    customSetProperty(fx_rain1_props, "459837671211266514", -0.1) --rain random size
    customSetProperty(fx_rain1_props, "2293817456966484758", -0.1) --rain diffuse intensity
    
end


ClearingCampfire = function()
  -- function num : 0_13 , upvalues : _ENV, kScene, kScript
  Game_NewScene(kScene, kScript)
  
  
  --PrintSceneListToTXT(kScene, "sceneobject_201-clearingcampfire.txt")
  ModifyScene(kScene)
  ReplacerRain(kScene)
  --DevTools_AgentMenuTool_Initalize(kScene)
  --Callback_OnPostUpdate:Add(DevTools_AgentMenuTool_InputHandler)
  
  
  
  
  
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "138")
  end
  Game_StartScene(true)
  Callback_OnSetReticleAgent:Add(ClearingCampfire_SpecialAgentFocus)
end

SceneOpen(kScene, kScript)
--SceneAdd("ui_openingCredits")
