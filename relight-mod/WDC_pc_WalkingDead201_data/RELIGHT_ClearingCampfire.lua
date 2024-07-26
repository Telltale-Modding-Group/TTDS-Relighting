Apply_Scene_MotionBlur = function(relightConfigGlobal, relightConfigLevel)
    RenderSetFeatureEnabled("motionblur", relightConfigLevel.EnableMotionBlur);

    if (relightConfigLevel.EnableMotionBlur == false) then do return end  end

    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "adv_", "Motion Blur Enabled", true)
    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "obj_", "Motion Blur Enabled", true)
    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Enabled", true)
    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Intensity", relightConfigGlobal.MotionBlurIntensity)
    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Movement Threshold Enabled", false)
    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Movement Threshold", 0.0)
    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Rotation Threshold Enabled", false)
    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Rotation Threshold", 0.0)
end

Apply_Scene_ForceBloomOff = function(relightConfigLevel)
    RenderSetFeatureEnabled("glow", not relightConfigLevel.ForceBloomOff);

    if (relightConfigLevel.ForceBloomOff == false) then do return end  end
    
    local sceneString = RELIGHT_kScene .. ".scene";
    RELIGHT_AgentSetProperty(sceneString, "FX Bloom Threshold", 0.0, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "FX Bloom Intensity", 0.0, RELIGHT_kScene);
end

Apply_Scene_ApplyExposureAdjustment = function(relightConfigLevel)
    local mySceneExposure = 0.75; --my custom exposure offset for this specific scene
    local config_scene_ExposureOffset = relightConfigLevel.ExposureOffset; --user defined exposure offset that will be added ontop
    local finalExposureValue = mySceneExposure + config_scene_ExposureOffset; --combine both values
    
    RELIGHT_SetPropertyOnAgentsWithPrefix(RELIGHT_kScene, "cam_", "Exposure", finalExposureValue);
end

Apply_Scene_ReplaceRain = function(relightConfigLevel)
    if (relightConfigLevel.EnableReplaceRain == false) then do return end end
    
    --remove the original rain
    RELIGHT_RemoveAgent("fx_rainSphereWD200Close", RELIGHT_kScene)
    RELIGHT_RemoveAgent("fx_rainSphereWD200Far", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_rain", RELIGHT_kScene)

    --NOTE TO SELF: WE MANUALLY INCLUDE THE NEEDED ASSET FILES FOR THE PARTICLE EFFECTS
    --AND INCLUDE THEM IN THE RELIGHT FOLDER ITSELF.
    --THE REASON BEING THAT ENABLING THESE NEWER ARCHIVES BREAKS SOME THINGS IN THE EPISODES]

    local fx_camRain_prop = "fx_camRain.prop"
    local fx_camRainSplashes_prop = "fx_camRainSplashes.prop"
    local fx_camRainSplashSpawn_prop = "fx_camRainSplashSpawn.prop"

    local newPosition = Vector(0,0,0)
    
    local fx_camRain = AgentCreate("fx_camRain", fx_camRain_prop, newPosition, Vector(0,0,0), RELIGHT_kScene, false, false)
    local fx_camRainSplashes = AgentCreate("fx_camRainSplashes", fx_camRainSplashes_prop, newPosition, Vector(0,0,0), RELIGHT_kScene, false, false)
    local fx_camRainSplashSpawn = AgentCreate("fx_camRainSplashSpawn", fx_camRainSplashSpawn_prop, newPosition, Vector(0,0,0), RELIGHT_kScene, false, false)
    
    local fx_rain1_props = AgentGetRuntimeProperties(fx_camRain)
    RELIGHT_SetPropertyBySymbol(fx_rain1_props, "689599953923669477", true) --enable emitter
    RELIGHT_SetPropertyBySymbol(fx_rain1_props, "4180975590232535326", 0.0014) --particle size
    RELIGHT_SetPropertyBySymbol(fx_rain1_props, "2137029241144994061", 0.005) --particle count
    RELIGHT_SetPropertyBySymbol(fx_rain1_props, "907461805036530086", 1.0) --particle speed
    RELIGHT_SetPropertyBySymbol(fx_rain1_props, "459837671211266514", -0.1) --rain random size
    RELIGHT_SetPropertyBySymbol(fx_rain1_props, "2293817456966484758", -1.25) --rain diffuse intensity
    --RELIGHT_SetPropertyBySymbol(fx_rain1_props, "11241842475777915683", Color(0.2, 0.5, 0.8, 1.0)) --particle-color
end

Apply_Scene_RelightScene = function(relightConfigLevel)
    if (relightConfigLevel.EnableRelighting == false) then do return end end

    --clean up the scene
    RELIGHT_RemoveAgent("light_D01", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_p", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_p01", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_p02", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_p03", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_p04", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_ENV_P_wideShot03", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_ENV_P_wideShot02", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_pot01", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_pot", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_amb3pack", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_ENV_P_wideShot01", RELIGHT_kScene)
    RELIGHT_RemoveAgent("light_rain", RELIGHT_kScene)
    RELIGHT_RemoveAgent("module_lightprobe", RELIGHT_kScene)
    
    --remove rig lights
    RELIGHT_RemovingAgentsWithPrefix(RELIGHT_kScene, "light_CHAR_CC")

    local sunColor     = RGBColor(48, 115, 248, 255)
    local ambientColor = RGBColor(48, 115, 255, 255)
    local skyColor     = RGBColor(24, 99, 205, 255)
    local fireColor    = RGBColor(255, 130, 0, 255)
    local fogColor     = Desaturate_RGBColor(skyColor, 0.45)
    skyColor           = Desaturate_RGBColor(skyColor, 0.2)
    sunColor           = Desaturate_RGBColor(sunColor, 0.35)
    skyColor           = Multiplier_RGBColor(skyColor, 0.2)

    local envlight_groupEnabled = RELIGHT_AgentGetProperty("light_D", "EnvLight - Enabled Group", RELIGHT_kScene)
    local envlight_groups = RELIGHT_AgentGetProperty("light_D", "EnvLight - Groups", RELIGHT_kScene)
    --local envlight_shadowtype = 2
    --local envlight_shadowquality = 2
    --local envlight_hbaoParticipation = 1 --0 being ambient, 1 being direct
    local envlight_prop = "module_env_light.prop"

    --fog
    RELIGHT_AgentSetProperty("module_environment", "Env - Fog Color", Color(skyColor.r, skyColor.g, skyColor.b, 1), RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Fog Max Opacity", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Fog Start Distance", -1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Fog Height", 0.2, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Fog Density", 15.65, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Fog Height Falloff", 25, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Fog Enabled", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Enabled", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Enabled on High", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Enabled on Medium", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("module_environment", "Env - Enabled on Low", true, RELIGHT_kScene)
    
    --sun
    RELIGHT_SetAgentRotation("light_D", Vector(85, 0, 60), RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_D", "EnvLight - Color", sunColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_D", "EnvLight - Intensity", 2.45, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_D", "EnvLight - Intensity Specular", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_D", "EnvLight - Intensity Diffuse", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_D", "EnvLight - Enlighten Intensity", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_D", "EnvLight - Shadow Modulated Intensity", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_D", "EnvLight - HBAO Participation Type", 1, RELIGHT_kScene)
    
    --directional ambient (facing down)
    RELIGHT_SetAgentRotation("light_amb01", Vector(90, 0, 0), RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Color", ambientColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Intensity", 0.375, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Intensity Specular", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Enlighten Intensity", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Type", 4, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Wrap", 1.0, RELIGHT_kScene)

    --regular ambient
    local myAmbAgent = AgentCreate("myLight_ENV_AMB", envlight_prop, Vector(0,0,0), Vector(90, 0, 0), RELIGHT_kScene, false, false)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Type", 3, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Intensity", 0.35, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Intensity Specular", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Enlighten Intensity", 0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Radius", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Distance Falloff", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Spot Angle Inner", 5, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Spot Angle Outer", 45, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Color", ambientColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Enabled Group", envlight_groupEnabled, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Groups", envlight_groups, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Shadow Type", 2, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Wrap", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Shadow Quality", envlight_shadowquality, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - HBAO Participation Type", 1, RELIGHT_kScene)

    --fire light
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Color", fireColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Intensity Specular", 3.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Intensity Diffuse", 3.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Enlighten Intensity", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Shadow Modulated Intensity", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Shadow Quality", 3, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Shadow Type", 2, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Wrap", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - HBAO Participation Type", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Radius", 5.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Intensity Dimmer", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Shadow Near Clip", 0.001, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Shadow Depth Bias", 0.001, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Distance Falloff", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Color", fireColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Intensity Specular", 3.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Intensity Diffuse", 3.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Enlighten Intensity", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Shadow Modulated Intensity", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Shadow Quality", 3, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Shadow Type", 2, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Wrap", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - HBAO Participation Type", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Radius", 5.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Intensity Dimmer", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Shadow Near Clip", 0.001, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fire", "EnvLight - Shadow Depth Bias", 0.001, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fx_flameLighter", "EnvLight - Color", fireColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_fx_flameLighterIlluminate", "EnvLight - Color", fireColor, RELIGHT_kScene)

    --ember light
    RELIGHT_AgentSetProperty("light_FireEmbers", "EnvLight - Color", fireColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_FireEmbers", "EnvLight - Intensity", 7.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_FireEmbers", "EnvLight - Intensity Specular", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_FireEmbers", "EnvLight - Intensity Diffuse", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("light_FireEmbers", "EnvLight - Enlighten Intensity", 0.0, RELIGHT_kScene)

    --RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Intensity", 0, RELIGHT_kScene)
    --RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Intensity", 0.0, RELIGHT_kScene)
    --RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Intensity", 0.0, RELIGHT_kScene)
    --RELIGHT_AgentSetProperty("light_fire", "EnvLight - Intensity", 0.0, RELIGHT_kScene)
    --RELIGHT_AgentSetProperty("light_fx_flameLighter", "EnvLight - Intensity", 0.0, RELIGHT_kScene)
    --RELIGHT_AgentSetProperty("light_fx_flameLighterIlluminate", "EnvLight - Intensity", 0.0, RELIGHT_kScene)
    --RELIGHT_AgentSetProperty("light_FireEmbers", "EnvLight - Intensity", 0.0, RELIGHT_kScene)
    
    --set scene post processing
    local sceneString = RELIGHT_kScene .. ".scene";
    RELIGHT_AgentSetProperty(sceneString, "FX anti-aliasing", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX TAA Weight", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Sharp Shadows Enabled", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Ambient Occlusion Enabled", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Tonemap Intensity", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Tonemap White Point", 4.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Tonemap Black Point", -0.001, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Tonemap Filmic Toe Intensity", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Tonemap Filmic Shoulder Intensity", 0.75, RELIGHT_kScene)

    RELIGHT_AgentSetProperty(sceneString, "HBAO Enabled", true, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Intensity", 2.0, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Radius", 0.15, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Max Radius Percent", 0.175, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Max Distance", 40, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Distance Falloff", 0.05, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Hemisphere Bias", 0.05, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Occlusion Scale", 1.0, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Luminance Scale", 1.0, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "HBAO Blur Sharpness", 7.0, RELIGHT_kScene);
    
    RELIGHT_AgentSetProperty(sceneString, "FX Bloom Threshold", -0.1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Bloom Intensity", 0.75, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "Ambient Color", RGBColor(0, 0, 0, 0), RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "Shadow Color", RGBColor(0, 0, 0, 0), RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Vignette Tint Enabled", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Vignette Tint", RGBColor(0, 0, 0, 255), RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Vignette Falloff", 0.5, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Vignette Center", 0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "FX Vignette Corners", 1.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Saturation", 1.0, RELIGHT_kScene)

    RELIGHT_AgentSetProperty(sceneString, "LightEnv Reflection Enabled", true, RELIGHT_kScene);
    --RELIGHT_AgentSetProperty(sceneString, "LightEnv Reflection Texture", "adv_backwoodsStream_module_lightprobe.d3dtx", RELIGHT_kScene);
    --RELIGHT_AgentSetProperty(sceneString, "LightEnv Reflection Texture", "adv_richmondFactoryExteriorBack_module_lightprobe.d3dtx", RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Reflection Intensity Shadow", 1.0, RELIGHT_kScene);
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Reflection Intensity", 1.0, RELIGHT_kScene);

    RELIGHT_AgentSetProperty(sceneString, "Specular Multiplier Enabled", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "Specular Color Multiplier", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "Specular Intensity Multiplier", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "Specular Exponent Multiplier", 2, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Shadow Auto Depth Bounds", true, kScene);
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Shadow Light Bleed Reduction", 0.2, RELIGHT_kScene)--0.20000000298023
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Shadow Moment Bias", 0.01, RELIGHT_kScene)--0.029999999329448
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Shadow Depth Bias", 0.1, RELIGHT_kScene)--0.40000000596046
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Dynamic Shadow Max Distance", 60, RELIGHT_kScene)--10
    RELIGHT_AgentSetProperty(sceneString, "LightEnv Shadow Max Distance", 40, RELIGHT_kScene)--60
    RELIGHT_AgentSetProperty(sceneString, "Light Shadow Trace Max Distance", 15, RELIGHT_kScene)--60
    RELIGHT_AgentSetProperty(sceneString, "Fog Color", Multiplier_RGBColor(skyColor, 1.3), RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "Fog Enabled", true, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "Fog Far Plane", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty(sceneString, "Fog Near Plane", 5, RELIGHT_kScene)

    --enable shadow casting on these objects
    RELIGHT_SetAgentShadowCasting("adv_clearingCampfire_foliageBrushMeshesI", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("adv_clearingCampfire_meshesG_decals", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("adv_clearingCampfire_distGround", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_grassHIClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_treeCarvingCampfireClearing", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_spearClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_grassWadeHIClearingCampfireA", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_grassWadeHIClearingCampfireB", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_potFallenClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_rabbitRoastingClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_logChoppedClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_logHollowClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_logChoppedClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_plateLicenseNCClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_backpackClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_branchHIClearingCampfire", true, RELIGHT_kScene)
    
    --disable shadow casting on these objects
    RELIGHT_SetAgentShadowCasting("obj_campfireClearingCampfire", true, RELIGHT_kScene)
    RELIGHT_SetAgentShadowCasting("obj_kindlingClearingCampfire", true, RELIGHT_kScene)

    if (relightConfigLevel.EnableVolumetricLighting == true) then
        --RELIGHT_AgentSetProperty("light_D", "EnvLight - Wrap", RELIGHT_AgentGetProperty("light_D", "EnvLight - Intensity", RELIGHT_kScene), RELIGHT_kScene)
        RELIGHT_AgentSetProperty("light_D", "EnvLight - Wrap", 1000, RELIGHT_kScene)

        RELIGHT_AgentSetProperty("module_environment", "Env - Fog Enabled", false, RELIGHT_kScene)
        RELIGHT_AgentSetProperty("module_environment", "Env - Enabled", false, RELIGHT_kScene)
        RELIGHT_AgentSetProperty("module_environment", "Env - Enabled on High", false, RELIGHT_kScene)
        RELIGHT_AgentSetProperty("module_environment", "Env - Enabled on Medium", false, RELIGHT_kScene)
        RELIGHT_AgentSetProperty("module_environment", "Env - Enabled on Low", false, RELIGHT_kScene)

        RELIGHT_AgentSetProperty(sceneString, "Fog Enabled", false, RELIGHT_kScene)

        RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Intensity", 0.1, RELIGHT_kScene)

        --RELIGHT_AgentSetProperty(sceneString, "Specular Intensity Multiplier", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty(sceneString, "Specular Exponent Multiplier", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("light_D", "EnvLight - Intensity Specular", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("light_FireEmbers", "EnvLight - Intensity Specular", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("light_fx_flameLighter", "EnvLight - Intensity Specular", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("light_fx_flameLighterIlluminate", "EnvLight - Intensity Specular", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("light_fire", "EnvLight - Intensity Specular", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("light_env_p_kindlingFire01", "EnvLight - Intensity Specular", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("myLight_ENV_AMB", "EnvLight - Intensity Specular", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Intensity Specular", 0, RELIGHT_kScene)
        --RELIGHT_AgentSetProperty("light_amb01", "EnvLight - Intensity", 0, RELIGHT_kScene)
    end
end

Apply_Scene_AddProcedualGrass = function(relightConfigLevel)
    if (relightConfigLevel.EnableProcedualGrass == false) then do return end end

    local xCount = 35
    local zCount = 35
    local bulkPositionIncrement = 0.30
    
    local bulkPositionStart = Vector(-(xCount / 2) * bulkPositionIncrement, -0.05, -(zCount / 2) * bulkPositionIncrement)
    local bulkAgentName = "myObject_grass"
    --local bulkProp = "obj_grassHI.prop" --has wierd blue reflective sheen
    --local bulkProp = "obj_grassClumpA.prop" --from S4 (looks great but needs a material that breaks everything else)
    --local bulkProp = "obj_grassHighRiverCamp.prop" 
    --local bulkProp = "obj_grassHighRiverShore.prop"
    --local bulkProp = "obj_grassHIRiverCamp.prop"
    --local bulkProp = "obj_grassWadeHIClearingCampfireA.prop"
    --local bulkProp = "obj_grassWadeHIClearingCampfireB.prop"
    --local bulkProp = "obj_grassFieldGrassRiverShoreTileA.prop"
    --local bulkProp = "obj_grassFieldGrassRiverShoreTileB.prop"
    --local bulkProp = "obj_grassFieldGrassRiverShoreTileC.prop"
    --local bulkProp = "obj_grassFieldGrassRiverShoreTileD.prop"
    --local bulkProp = "obj_grassHIBackwoodsStream.prop"
    --local bulkProp = "obj_grassHIClearingCampfire.prop"
    --local bulkProp = "obj_grassHIRiverCampWalk.prop"
    local bulkProp = "obj_grassHIRiverWoods.prop"
    
    local newGroup = AgentCreate("procedualGrassGroup", "group.prop", Vector(0,0,0), Vector(0,0,0), RELIGHT_kScene, false, false)
    
    for x = 1, xCount, 1 do 
        local newXPos = bulkPositionStart.x + (x * bulkPositionIncrement)
        
        for z = 1, zCount, 1 do 
            local xIndexString = tostring(x)
            local zIndexString = tostring(z)
            local newAgentName = bulkAgentName .. "_x_" .. xIndexString .. "_z_" .. zIndexString

            local newZPos = bulkPositionStart.z + (z * bulkPositionIncrement)
            local newYRot = math.random(0, 180)
            
            local newPosition = Vector(newXPos, bulkPositionStart.y, newZPos)
            local newRotation = Vector(0, newYRot, 0)
 
            --avoid placing grass on the following objects
            local object1_distance = VectorDistance(newPosition, Vector(-0.05, 0, 5.41)) --license plate
            local object2_distance = VectorDistance(newPosition, Vector(0, 0, 2.3)) --campfire
            local object3_distance = VectorDistance(newPosition, Vector(4.3, 0, 4.4)) --clem backpack
            local case1 = object1_distance > 0.6
            local case2 = object2_distance > 1.1
            local case3 = object3_distance > 0.6

            --if these cases are met, we can place grass
            if case1 and case2 and case3 then
                --place grass
                local newBulkAgent = AgentCreate(newAgentName, bulkProp, newPosition, newRotation, RELIGHT_kScene, false, false)
                RELIGHT_AgentSetProperty(newAgentName, "Render Global Scale", 0.45, RELIGHT_kScene)
                RELIGHT_AgentSetProperty(newAgentName, "Render Cull", true, RELIGHT_kScene)

                AgentAttach(newBulkAgent, newGroup)
            end
        end
    end
    
    RELIGHT_SetAgentPosition("procedualGrassGroup", Vector(0, 0, 0), RELIGHT_kScene)
end

Apply_Scene_CreateFlashlights = function()
    local flashlightColor = RGBColor(255, 200, 0, 255)

    local envlight_groupEnabled = RELIGHT_AgentGetProperty("light_D", "EnvLight - Enabled Group", RELIGHT_kScene)
    local envlight_groups = RELIGHT_AgentGetProperty("light_D", "EnvLight - Groups", RELIGHT_kScene)
    local envlight_prop = "module_env_light.prop"

    local flashlightTestLight_point = AgentCreate("flashlightTestLight_point", envlight_prop, Vector(0,3,0), Vector(90, 0, 0), RELIGHT_kScene, false, false)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Type", 0, RELIGHT_kScene) --0 point light, 1 spot light
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Intensity", 2.30, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Enlighten Intensity", 0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Radius", 10, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Distance Falloff", 3, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Spot Angle Inner", 25, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Spot Angle Outer", 45, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Color", flashlightColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Enabled Group", envlight_groupEnabled, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Groups", envlight_groups, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Shadow Type", 2, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Wrap", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - Shadow Quality", 3, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "EnvLight - HBAO Participation Type", 2, RELIGHT_kScene)
    
    local flashlightTestLight_spot = AgentCreate("flashlightTestLight_spot", envlight_prop, Vector(0,3,0), Vector(90, 0, 0), RELIGHT_kScene, false, false)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Type", 1, RELIGHT_kScene) --0 point light, 1 spot light
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Intensity", 45, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Enlighten Intensity", 0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Radius", 45, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Distance Falloff", 1, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Spot Angle Inner", 10, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Spot Angle Outer", 40, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Color", flashlightColor, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Enabled Group", envlight_groupEnabled, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Groups", envlight_groups, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Shadow Type", 2, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Wrap", 0.0, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - Shadow Quality", 3, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "EnvLight - HBAO Participation Type", 2, RELIGHT_kScene)
    
    local flashlightTest_beam = AgentCreate("myRELIGHT_lightbeam1", "fx_lightBeamFlashlight.prop", Vector(0,0,0), Vector(0, 0, 0), RELIGHT_kScene, false, false) --looks great
    local flashlightTest_beam_props = AgentGetRuntimeProperties(flashlightTest_beam)
    local flashlightColor_beamColor = Multiplier_RGBColor(flashlightColor, 0.31);
    RELIGHT_SetPropertyBySymbol(flashlightTest_beam_props, "2911356150214956261", flashlightColor_beamColor) --flashlight flare
    RELIGHT_SetPropertyBySymbol(flashlightTest_beam_props, "13322114906091202280", flashlightColor_beamColor) --flashlight beam
    RELIGHT_AgentSetProperty("myRELIGHT_lightbeam1", "Render Cull", false, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myRELIGHT_lightbeam1", "Render Global Scale", 0.75, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myRELIGHT_lightbeam1", "Render Diffuse Color", Color(0,0,0,0), RELIGHT_kScene)
    local flashlightModel = AgentCreate("myRELIGHT_flashlightModel", "obj_flashlightMaglite.prop", Vector(0,0,0), Vector(0, 90, 0), RELIGHT_kScene, false, false) --looks great

    local agent_winston = AgentFindInScene("Winston", RELIGHT_kScene)

    --spine3
    --wrist_L
    --wrist_R
    local nodeName = "wrist_L";
    if AgentHasNode(agent_winston, nodeName) then
        --AgentAttachToNode(flashlightTestLight_point, agent_winston, nodeName);
        AgentAttachToNode(flashlightTest_beam, agent_winston, nodeName);
        --AgentAttachToNode(flashlightTestLight_spot, agent_winston, nodeName);
        AgentAttachToNode(flashlightModel, agent_winston, nodeName);
        
        --wrist_R placement
        --AgentSetPos(flashlightTest_beam, Vector(0.155, -0.035, 0.079)); --z = height
        --AgentSetPos(flashlightModel, Vector(0.015, -0.035, 0.079));
        --AgentSetRot(flashlightTest_beam, Vector(-15, 89, 65));
        --AgentSetRot(flashlightModel, Vector(-15, 89, 65));
        
        --wrist_L placement
        AgentSetPos(flashlightTest_beam, Vector(-0.175, -0.045, 0.111)); --z = height
        AgentSetPos(flashlightModel, Vector(0.015, -0.045, 0.079));
        AgentSetRot(flashlightTest_beam, Vector(-15, -49, 65));
        AgentSetRot(flashlightModel, Vector(-15, -49, 65));
    end
    
    --debugging
    --RELIGHT_AgentSetProperty("Winston", "Runtime: Visible", true, RELIGHT_kScene)
    
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "Runtime: Visible", false, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "Runtime: Visible", false, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myRELIGHT_lightbeam1", "Runtime: Visible", false, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myRELIGHT_flashlightModel", "Runtime: Visible", false, RELIGHT_kScene)
    
    --RELIGHT_PrintValidPropertyNames(agent_winston);
end

Apply_Scene_UpdateFlashlights = function()
    --note: normally I would just attach the light at first to the flashlight and call it a day...
    --however do to the nature of it being attached to an animation it will move/rotate wayyy to much.
    --so by roughly matching the rotation/position of the flashlight this way we can stabilize the light and make it not so annoying.

    --Winston
    local agent_winston = AgentFindInScene("Winston", RELIGHT_kScene)
    local agent_winston_pos = AgentGetWorldPos(agent_winston);
    local agent_winston_rot = AgentGetWorldRot(agent_winston);
    local agent_winston_forward_vector = AgentGetForwardVec(agent_winston)
    
    --spine3
    --wrist_L
    --wrist_R
    local nodeName = "wrist_L";
    if AgentHasNode(agent_winston, nodeName) then
        agent_winston_pos = AgentGetWorldPos(agent_winston, nodeName);
        agent_winston_rot = AgentGetWorldRot(agent_winston, nodeName);
        agent_winston_forward_vector = AgentGetForwardVec(agent_winston, nodeName);
    end

    --local agent_winston_visibilty = RELIGHT_AgentGetProperty("Winston", "Runtime: Visible", RELIGHT_kScene)
    local agent_winston_visibilty = RELIGHT_AgentGetProperty("Winston", "Mesh sk54_winston - Visible", RELIGHT_kScene)

    local newFlashlightPosition = agent_winston_pos;
    local newFlashlightRotation = agent_winston_rot;
    local offsetPosition = Vector(0, -0.15, 0);
    newFlashlightPosition.x = newFlashlightPosition.x + offsetPosition.x;
    newFlashlightPosition.y = newFlashlightPosition.y + offsetPosition.y;
    newFlashlightPosition.z = newFlashlightPosition.z + offsetPosition.z;
    
    local scale = 0.45
    newFlashlightPosition.x = newFlashlightPosition.x + agent_winston_forward_vector.x * scale;
    newFlashlightPosition.y = newFlashlightPosition.y + agent_winston_forward_vector.y * scale;
    newFlashlightPosition.z = newFlashlightPosition.z + agent_winston_forward_vector.z * scale;
    
    newFlashlightRotation.x = newFlashlightRotation.x + 0;
    newFlashlightRotation.y = newFlashlightRotation.y - 7.5;
    newFlashlightRotation.z = newFlashlightRotation.z + 0;
    
    RELIGHT_SetAgentWorldPosition("flashlightTestLight_point", newFlashlightPosition, RELIGHT_kScene)
    RELIGHT_SetAgentWorldRotation("flashlightTestLight_point", agent_winston_rot, RELIGHT_kScene)
    RELIGHT_SetAgentWorldPosition("flashlightTestLight_spot", newFlashlightPosition, RELIGHT_kScene)
    RELIGHT_SetAgentWorldRotation("flashlightTestLight_spot", agent_winston_rot, RELIGHT_kScene)
    
    RELIGHT_AgentSetProperty("flashlightTestLight_point", "Runtime: Visible", agent_winston_visibilty, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("flashlightTestLight_spot", "Runtime: Visible", agent_winston_visibilty, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myRELIGHT_lightbeam1", "Runtime: Visible", agent_winston_visibilty, RELIGHT_kScene)
    RELIGHT_AgentSetProperty("myRELIGHT_flashlightModel", "Runtime: Visible", agent_winston_visibilty, RELIGHT_kScene)
end