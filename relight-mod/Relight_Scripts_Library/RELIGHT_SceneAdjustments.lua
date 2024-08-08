RELIGHT_Apply_Scene_MotionBlur = function(relightConfigGlobal, relightConfigLevel)
    RenderSetFeatureEnabled("motionblur", relightConfigLevel.EnableMotionBlur);

    if (relightConfigLevel.EnableMotionBlur == false) then 
        return  
    end

    TLSE_SetPropertyOnAllMeshes(RELIGHT_SceneObject, "Motion Blur Enabled", true);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Enabled", true);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Intensity", relightConfigGlobal.MotionBlurIntensity);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Movement Threshold Enabled", false);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Movement Threshold", 0.5);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Rotation Threshold Enabled", false);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Rotation Threshold", 0.5);
end

RELIGHT_Apply_Scene_ForceBloomOff = function(relightConfigLevel)
    RenderSetFeatureEnabled("glow", not relightConfigLevel.ForceBloomOff);

    if (relightConfigLevel.ForceBloomOff == false) then 
        return 
    end
    
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Bloom Threshold", 0.0, RELIGHT_SceneObject);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Bloom Intensity", 0.0, RELIGHT_SceneObject);
end

RELIGHT_Apply_Scene_ApplyExposureAdjustment = function(relightConfigLevel, number_customSetExposure)
    local number_sceneExposureOffset = relightConfigLevel.ExposureOffset; --user defined exposure offset that will be added ontop
    local number_finalExposureValue = number_customSetExposure + number_sceneExposureOffset; --combine both values
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "Exposure", number_finalExposureValue)
end










