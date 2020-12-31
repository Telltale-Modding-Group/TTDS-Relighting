-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead102_data\env_dairyMeatLocker_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV

require("Relighting.lua")

local kScript = "DairyMeatLocker"
local kScene = "adv_dairyMeatLocker"
local kOverlay = "fx_overlayEyesBlink"







modifyScene = function(sceneObj)

    local master_light_color      = RGBColor(114, 228, 156, 255)
    local master_light_color_cold = RGBColor(122, 153, 234, 255)
    --master_light_color            =  master_light_color_cold
    local master_light_intensity  = 5.5
    
    local spot1  = AgentFindInScene("spotLightShape1", sceneObj) --main light by larry
    local spot2  = AgentFindInScene("spotLightShape2", sceneObj) --back wall light by kenny
    local spot3  = AgentFindInScene("spotLightShape3", sceneObj) --back wall fill light?
    local spot4  = AgentFindInScene("spotLightShape4", sceneObj) --back right corner?
    local spot5  = AgentFindInScene("spotLightShape5", sceneObj)
    local spot6  = AgentFindInScene("spotLightShape6", sceneObj) --light on shelf next to lee
    local spot7  = AgentFindInScene("spotLightShape11", sceneObj) --no idea
    local spot8  = AgentFindInScene("spotLightShape12", sceneObj)
    local spot9  = AgentFindInScene("spotLightShape13", sceneObj)
    local spot10 = AgentFindInScene("spotLightShape15", sceneObj)
    local spot11 = AgentFindInScene("spotLightShape20", sceneObj) --no clue
    --destroyMe(spot1) --turn back
    destroyMe(spot2) --turn back
    destroyMe(spot3)
    destroyMe(spot4)
    destroyMe(spot5)
    --destroyMe(spot6) --turn back
    destroyMe(spot7) --turn back
    destroyMe(spot8)
    destroyMe(spot9)
    destroyMe(spot10)
    destroyMe(spot11)
    
    local lightAO_type = 1
    ModifyLightSettings(spot1, 5.0, 0.025, master_light_color)
    Custom_PropertySet(spot1, "EnvLight - HBAO Participation Type", lightAO_type)
    
    --back wall light
    --ModifyLightSettings(spot2, 5.0, 0.025, master_light_color)
    --ModifyLightSettings_spotLight(spot2, 80, 120)
    
    --center light
    local dupedSpot1 = AgentCreate("spotLightShape1_duplicated", AgentGetProperties(spot1), AgentGetPos(spot1), AgentGetRot(spot1), sceneObj, false, false)
    ModifyLightSettings(dupedSpot1, 6.0, 0.025, master_light_color)
    ModifyLightSettings_spotLight(dupedSpot1, 80, 110)
    ModifyAgentTransformation_Rotation(dupedSpot1, Vector(90, 0, 0))
    ModifyAgentTransformation_OffsetPosition(dupedSpot1, Vector(0, 0.5, 0))
    Custom_PropertySet(dupedSpot1, "EnvLight - HBAO Participation Type", lightAO_type)
    
    --light for left corner of level
    local dupedSpot2 = AgentCreate("spotLightShape1_duplicated2", AgentGetProperties(spot1), AgentGetPos(spot1), AgentGetRot(spot1), sceneObj, false, false)
    ModifyLightSettings(dupedSpot2, 3.0, 0.025, master_light_color)
    ModifyLightSettings_spotLight(dupedSpot2, 30, 90)
    ModifyAgentTransformation_Rotation(dupedSpot2, Vector(45, 145, 0))
    ModifyAgentTransformation_OffsetPosition(dupedSpot2, Vector(0, 0.5, 0))
    Custom_PropertySet(dupedSpot2, "EnvLight - HBAO Participation Type", lightAO_type)
    --270 is right wall
    --360 is back wall
    
    local dupedSpot3 = AgentCreate("spotLightShape1_duplicated3", AgentGetProperties(spot1), AgentGetPos(spot1), AgentGetRot(spot1), sceneObj, false, false)
    ModifyLightSettings(dupedSpot3, 3.0, 0.025, master_light_color)
    ModifyLightSettings_spotLight(dupedSpot3, 30, 90)
    ModifyAgentTransformation_Rotation(dupedSpot3, Vector(45, 0, 0))
    ModifyAgentTransformation_OffsetPosition(dupedSpot3, Vector(0, 0.5, 0))
    Custom_PropertySet(dupedSpot3, "EnvLight - HBAO Participation Type", lightAO_type)

    ModifyLightSettings(spot6, 7.0, 0.1, master_light_color)
    ModifyLightSettings_spotLight(spot6, 80, 120)
    ModifyAgentTransformation_Rotation(spot6, Vector(90, 0, 0))
    ModifyAgentTransformation_OffsetPosition(spot6, Vector(0, 0.6, 0))
    Custom_PropertySet(spot6, "EnvLight - HBAO Participation Type", lightAO_type)

    local light1 = AgentFindInScene("light_dots", sceneObj)
    local light2 = AgentFindInScene("light_Emisive_Point", sceneObj)
    destroyMe(light1)
    destroyMe(light2)
    
    local lightShelf1 = AgentFindInScene("light_spot_Shelf", sceneObj)
    local lightShelf2 = AgentFindInScene("light_spot_Shelf_01", sceneObj)
    local lightShelf3 = AgentFindInScene("light_Shelf_Point01", sceneObj)
    local lightShelf4 = AgentFindInScene("light_Shelf_Point02", sceneObj)
    local lightShelf5 = AgentFindInScene("light_Shelf_Point03", sceneObj)
    destroyMe(lightShelf1)
    destroyMe(lightShelf2)
    destroyMe(lightShelf3)
    destroyMe(lightShelf4)
    destroyMe(lightShelf5)

    --ModifyLightSettings(lightShelf1, 4, 0.1, master_light_color)
    --ModifyLightSettings(lightShelf2, 4, 0.1, master_light_color)
    
    
    local charLight = AgentFindInScene("light_Character light", sceneObj)
    destroyMe(charLight)
    
    RemovingAllLightingRigs(sceneObj)
    
    local light_blood1 = AgentFindInScene("light_bloodfx", sceneObj)
    local light_blood2 = AgentFindInScene("light_fx_bloodSplats", sceneObj)
    local light_blood3 = AgentFindInScene("light_fx_bloodSpurts", sceneObj)
    local light_amb    = AgentFindInScene("light_ambEnlighten", sceneObj)
    --destroyMe(light_blood1)
    --destroyMe(light_blood2)
    --destroyMe(light_blood3)
    destroyMe(light_amb)
    --ModifyLightSettings(light_blood1, 0.3, 0.0, RGBColor(255, 0, 0, 255))
    --ModifyLightSettings(light_blood2, 0.3, 0.0, RGBColor(255, 0, 0, 255))
    --ModifyLightSettings(light_blood3, 0.3, 0.0, RGBColor(255, 0, 0, 255))
    
    local enlModule = AgentFindInScene("module_enlightensystem", sceneObj)
    
    local sceneAgent = AgentFindInScene("adv_dairyMeatLocker.scene", sceneObj)
    Custom_PropertySet(sceneAgent, "HBAO Enabled", true)
    Custom_PropertySet(sceneAgent, "HBAO Intensity", 2.5)
end







DairyMeatLocker = function()
  -- function num : 0_0 , upvalues : _ENV, kOverlay
  Mode(mode_Main)
  Main_AllowMovement(true)
  
  
  --PrintSceneListToTXT(kScene, "sceneoutput_102-meatlocker.txt")
  modifyScene(kScene)
  
  
  if SaveLoad_IsFromLoad() then
    return 
  end
  if IsToolBuild() and Logic["3MeatLocker - DebugToChoice"] then
    SceneHide(kOverlay, true)
    -- DECOMPILER ERROR at PC24: Confused about usage of register: R0 in 'UnsetPending'

    Logic["3MeatLocker - LarryHadHeartAttack"] = true
    Dialog_Play("cs_KennyDecidesToKillLarry")
    return 
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Meat Locker")
      DlgPreload("env_dairyMeatLocker.dlog", "cs_enter", 0, 15, 0, false)
    end
    Checkpoint("cs_enter", "meatLocker_intro")
    Dialog_Play("cs_enter")
  end
end

SceneOpen(kScene, kScript)
SceneAdd(kOverlay)

