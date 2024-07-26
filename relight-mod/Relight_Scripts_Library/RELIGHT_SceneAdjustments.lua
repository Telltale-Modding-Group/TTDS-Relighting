RELIGHT_Apply_Scene_MotionBlur = function(relightConfigGlobal, relightConfigLevel)
    RenderSetFeatureEnabled("motionblur", relightConfigLevel.EnableMotionBlur);

    if (relightConfigLevel.EnableMotionBlur == false) then do return end  end

    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "adv_", "Motion Blur Enabled", true)
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "obj_", "Motion Blur Enabled", true)
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Enabled", true)
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Intensity", relightConfigGlobal.MotionBlurIntensity)
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Movement Threshold Enabled", false)
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Movement Threshold", 0.0)
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Rotation Threshold Enabled", false)
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Rotation Threshold", 0.0)
end

RELIGHT_Apply_Scene_ForceBloomOff = function(relightConfigLevel)
    RenderSetFeatureEnabled("glow", not relightConfigLevel.ForceBloomOff);

    if (relightConfigLevel.ForceBloomOff == false) then do return end  end
    
    local sceneString = RELIGHT_kScene .. ".scene";
    TLSE_AgentNameSetProperty(sceneString, "FX Bloom Threshold", 0.0, RELIGHT_kScene);
    TLSE_AgentNameSetProperty(sceneString, "FX Bloom Intensity", 0.0, RELIGHT_kScene);
end

RELIGHT_Apply_Scene_ApplyExposureAdjustment = function(relightConfigLevel, mySceneExposure)
    local config_scene_ExposureOffset = relightConfigLevel.ExposureOffset; --user defined exposure offset that will be added ontop
    local finalExposureValue = mySceneExposure + config_scene_ExposureOffset; --combine both values
    
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "Exposure", finalExposureValue);
end