-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead205_data\SnowyPowerStation_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")

local kScript = "SnowyPowerStation"
local kScene = "adv_snowyPowerStation"
local kPreLoadList = {"env_snowyPowerStation_CS_Enter_1.chore", "359067760.lang", "359067760.wav", "359067763.lang", "359067763.wav", "sk54_idle_kennyHoldBaby.chore", "kenny200_face_blink.chore", "sk54_kenny200_toAngryB.chore", "kenny200_headGesture_lookUpQuick_add.chore", "kenny200_headGesture_lookRightQuick_add.chore", "sk54_move_kennyWalkHoldBabyPointGunRelaxed.chore", "359067765.lang", "359067765.wav", "arvo_headGesture_lookLeft_add.chore", "arvo_face_blink.chore", "sk54_arvo_toSadA.chore", "arvo_headGesture_lookDown_add.chore", "clementine200_headGesture_lookUpRight_add.chore", "bonnie_face_blink.chore", "bonnie_eyes_dartR.chore", "bonnie_eyes_dartDownR.chore", "bonnie_eyes_dartDownL.chore", "bonnie_eyes_dartL.chore", "bonnie_eyes_dartDown.chore", "bonnie_headGesture_lookUpQuick_add.chore", "bonnie_headgesture_lookDownQuickLeft_add.chore", "bonnie_headgesture_lookDownQuick_add.chore", "bonnie_headgesture_lookUpRight_add.chore", "bonnie_headGesture_lookUp_add.chore", "bonnie_headgesture_lookUpLeft_add.chore", "bonnie_headgesture_lookRight_add.chore", "bonnie_headGesture_lookRightQuick_add.chore", "bonnie_headgesture_lookLeft_add.chore", "bonnie_headgesture_lookLeftQuick_add.chore", "bonnie_headgesture_lookDown_add.chore", "bonnie_headgesture_lookDownQuickRight_add.chore", "sk54_mike_walkHelpLukeWithAK47.chore", "fs_tiny_tim_1.wav", "fs_tiny_tim_2.wav", "fs_tiny_tim_3.wav", "fs_tiny_tim_4.wav", "fs_tiny_tim_5.wav", "fs_tiny_tim_6.wav", "sk56_idle_clementine200SadA.chore", "sk56_idle_clementine200.chore", "sk55_idle_bonnieNormalA.chore", "sk54_idle_kenny200NormalA.chore", "kenny200_eyes_default.chore", "sk54_idle_arvoNormalA.chore", "amb_winter_night_owl_lp.wav", "amb_winter_wind_forest_creaky.wav", "sk56_clementine200SadA.ptable", "sk55_lillyNormalA.ptable", "fs_snow_fast_dull_06.wav", "fs_snow_fast_dull_07.wav", "fs_snow_fast_dull_08.wav", "fs_snow_fast_dull_10.wav", "fs_snow_slow_01.wav", "fs_snow_slow_02.wav", "fs_snow_slow_03.wav", "fs_snow_slow_04.wav", "fs_snow_slow_05.wav", "fs_snow_fast_dull_11.wav", "fs_snow_fast_dull_12.wav", "fs_snow_fast_dull_13.wav", "fs_snow_fast_dull_14.wav", "fs_snow_fast_dull_15.wav", "fs_snow_slow_06.wav", "fs_snow_slow_07.wav", "fs_snow_slow_08.wav", "fs_snow_slow_09.wav", "fs_snow_slow_10.wav", "sk54_idle_kenny200AngryB.chore", "sk54_kenny202FearA.ptable", "fs_snow_fast_06.wav", "fs_snow_fast_07.wav", "fs_snow_fast_08.wav", "fs_snow_fast_09.wav", "fs_snow_fast_10.wav", "fs_snow_fast_01.wav", "fs_snow_fast_02.wav", "fs_snow_fast_03.wav", "fs_snow_fast_04.wav", "fs_snow_fast_05.wav", "sk54_idle_arvoSadA.chore", "sk54_matthewSadA.ptable", "fs_snow_fast_dull_01.wav", "fs_snow_fast_dull_02.wav", "fs_snow_fast_dull_03.wav", "fs_snow_fast_dull_04.wav", "fs_snow_fast_dull_05.wav"}
local PreloadAssets = function()
  -- function num : 0_0 , upvalues : _ENV, kPreLoadList
  for _,item in ipairs(kPreLoadList) do
    PreLoad(item)
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
  end
end










modifyScene = function(sceneObj)
    local master_fill_intensity = 0.3
    local master_fill_color     = RGBColor(38,87,217, 255)

    RemovingAllLightingRigs(sceneObj)

    local fxLight1  = AgentFindInScene("light_fx_fireCampfirePowerStation", sceneObj) 
    local fxLight2  = AgentFindInScene("light_fx_fireCampfirePowerStationPoint", sceneObj) 
    local fxLight3  = AgentFindInScene("light_fx_muzzleFlashShotgun", sceneObj) 
    local fxLight4  = AgentFindInScene("light_fx_muzzleFlashPistol", sceneObj) 
    local fxLight5  = AgentFindInScene("light_fx_muzzleFlashPistolFlash", sceneObj) 
    local fxLight6  = AgentFindInScene("light_fx_muzzleFlashShotgunFlash", sceneObj) 
    local fxLight7  = AgentFindInScene("light_fx_muzzleFlashPistolFlash2", sceneObj) 
    local fxLight8  = AgentFindInScene("light_fx_muzzleFlashPistolFlash3", sceneObj) 
    local fxLight9  = AgentFindInScene("light_fx_muzzleFlashShotgunFlash2", sceneObj) 
    local fxLight10 = AgentFindInScene("light_fx_muzzleFlashShotgunFlash3", sceneObj) 
    local fxLight11 = AgentFindInScene("light_fx_smoke", sceneObj)
    local fxLight12 = AgentFindInScene("light_fx_bloodSplats", sceneObj)
    local fxLight13 = AgentFindInScene("light_fx_bloodSpurtRadEmitter", sceneObj)
    local fxLight14 = AgentFindInScene("light_fx_bloodSpurts", sceneObj)
    local fxLight15 = AgentFindInScene("light_amb_vfx", sceneObj)
    --destroyMe(fxLight1)
    --destroyMe(fxLight2)
    destroyMe(fxLight3)
    destroyMe(fxLight4)
    destroyMe(fxLight5)
    destroyMe(fxLight6)
    destroyMe(fxLight7)
    destroyMe(fxLight8)
    destroyMe(fxLight9)
    destroyMe(fxLight10)
    --destroyMe(fxLight11)
    destroyMe(fxLight12)
    destroyMe(fxLight13)
    destroyMe(fxLight14)
    destroyMe(fxLight15)
    
    local light1  = AgentFindInScene("light_P", sceneObj)
    local light2  = AgentFindInScene("light_P01", sceneObj)
    local light3  = AgentFindInScene("light_P02", sceneObj)
    local light4  = AgentFindInScene("light_P03", sceneObj)
    local light5  = AgentFindInScene("light_P03", sceneObj)
    local light6  = AgentFindInScene("light_P04", sceneObj)
    local light7  = AgentFindInScene("light_P05", sceneObj)
    local light8  = AgentFindInScene("light_P06", sceneObj)
    local light9  = AgentFindInScene("light_P07", sceneObj)
    local light10 = AgentFindInScene("light_P08", sceneObj)
    local light11 = AgentFindInScene("light_P09", sceneObj)
    local light12 = AgentFindInScene("light_P10", sceneObj)
    local light13 = AgentFindInScene("light_P11", sceneObj)
    local light14 = AgentFindInScene("light_P12", sceneObj)
    local light15 = AgentFindInScene("light_P13", sceneObj)
    local light16 = AgentFindInScene("light_P14", sceneObj)
    local light17 = AgentFindInScene("light_P15", sceneObj)
    local light18 = AgentFindInScene("light_P16", sceneObj)
    local light19 = AgentFindInScene("light_P17", sceneObj)
    local light20 = AgentFindInScene("light_P18", sceneObj)
    local light21 = AgentFindInScene("light_P19", sceneObj)
    local light22 = AgentFindInScene("light_P20", sceneObj)
    local light23 = AgentFindInScene("light_P21", sceneObj)
    local light24 = AgentFindInScene("light_P22", sceneObj)
    local light25 = AgentFindInScene("light_P23", sceneObj)
    local light26 = AgentFindInScene("light_P24", sceneObj)
    local light27 = AgentFindInScene("light_P25", sceneObj)
    local light28 = AgentFindInScene("light_P26", sceneObj)
    local light29 = AgentFindInScene("light_P27", sceneObj)
    local light30 = AgentFindInScene("light_P28", sceneObj)
    local light31 = AgentFindInScene("light_P29", sceneObj)
    local light32 = AgentFindInScene("light_P30", sceneObj)
    local light33 = AgentFindInScene("light_P31", sceneObj)
    local light34 = AgentFindInScene("light_P32", sceneObj)
    local light35 = AgentFindInScene("light_P33", sceneObj)
    local light36 = AgentFindInScene("light_P34", sceneObj)
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
    destroyMe(light25)
    destroyMe(light26)
    destroyMe(light27)
    destroyMe(light28)
    destroyMe(light29)
    destroyMe(light30)
    destroyMe(light31)
    destroyMe(light32)
    destroyMe(light33)
    destroyMe(light34)
    destroyMe(light35)
    destroyMe(light36)
    
    local scene_light1 = AgentFindInScene("light_point", sceneObj)
    local scene_light2 = AgentFindInScene("light_point01", sceneObj)
    local scene_light3 = AgentFindInScene("light_dots", sceneObj)
    local scene_light4 = AgentFindInScene("light_amb_grass", sceneObj)
    local scene_light5 = AgentFindInScene("light_point02", sceneObj)
    local scene_light6 = AgentFindInScene("light_amb_sky", sceneObj)
    local scene_light7 = AgentFindInScene("light_amb", sceneObj)
    local scene_light8 = AgentFindInScene("light_d", sceneObj)
    local scene_light9 = AgentFindInScene("light_point03NX", sceneObj)
    --destroyMe(scene_light1)
    destroyMe(scene_light2)
    destroyMe(scene_light3)
    destroyMe(scene_light4)
    destroyMe(scene_light5)
    destroyMe(scene_light6)
    --destroyMe(scene_light7)
    --destroyMe(scene_light8)
    destroyMe(scene_light9)
    
    local envModule = AgentFindInScene("module_environment", sceneObj)
    local enlModule = AgentFindInScene("module_enlightensystem", sceneObj)

    local sun_rot      = AgentGetRot(scene_light8)
    local sun_worldRot = AgentGetWorldRot(scene_light8)
        
    sun_rot.x = 0
    sun_rot.y = 0
    sun_rot.z = 0
    
    sun_worldRot.x = 40
    sun_worldRot.y = 60
    sun_worldRot.z = 0

    AgentSetRot(scene_light8, sun_rot)
    AgentSetWorldRot(scene_light8, sun_worldRot)
    
    
    local sunColor     = RGBColor(48, 115, 248, 255)
    --sunColor = RGBColor(114, 166, 255, 255) -- old color
    local ambientColor = RGBColor(48, 115, 248, 255)
    --ambientColor = RGBColor(15, 29, 52, 255) -- old color
    local fireColor    = RGBColor(255, 113, 1, 255)
    local fogColor     = Desaturate_RGBColor(RGBColor(24, 99, 205, 255), 0.45)
    sunColor           = Desaturate_RGBColor(sunColor, 0.0)
    fireColor = Desaturate_RGBColor(fireColor, 0.1)
    
    --light_d
    ModifyLightSettings(scene_light8, 0.3, sunColor)
    Custom_PropertySet(scene_light8, "EnvLight - Shadow Type", 3)
    Custom_PropertySet(scene_light8, "EnvLight - Wrap", 0.1)
    
    --light_amb
    ModifyLightSettings(scene_light7, 0.25, ambientColor)
    
    --light_point
    --ModifyLightSettings(scene_light1, 9.25, RGBColor(15, 29, 52, 255))
    
    --light_fx_fireCampfirePowerStationPoint
    ModifyLightSettings(fxLight2, 5.0, fireColor)
    Custom_PropertySet(fxLight2, "EnvLight - Shadow Type", 3)
    Custom_PropertySet(fxLight2, "EnvLight - Wrap", 0.15)
    
    local envProps  = AgentGetRuntimeProperties(envModule);
    fogColor = RGBColor(19, 20, 48, 255) --old color
    customSetPropertyColor(envProps, "5416356241638078242", fogColor)
    
    local enlProps = AgentGetRuntimeProperties(enlModule);
    customSetProperty(enlProps, "3072262554258597020", false)
    customSetProperty(enlProps, "11257975001315178766", false)
    
    
    local sceneAgent = AgentFindInScene("adv_snowyPowerStation.scene", sceneObj)
    Custom_PropertySet(sceneAgent, "HBAO Enabled", true)
    Custom_PropertySet(sceneAgent, "HBAO Intensity", 2.5)
    
    Custom_PropertySet(sceneAgent, "FX Bloom Intensity", 1.0)
    Custom_PropertySet(sceneAgent, "FX Bloom Threshold", 0.0)
end







SnowyPowerStation = function()
  -- function num : 0_1 , upvalues : _ENV, kScene, kScript, PreloadAssets
  Game_NewScene(kScene, kScript)
  modifyScene(kScene)

  PreloadAssets()
  Game_StartScene()
end

SceneOpen(kScene, kScript)

