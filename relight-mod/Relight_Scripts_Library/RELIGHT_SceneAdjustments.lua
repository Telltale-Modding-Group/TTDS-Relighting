RELIGHT_Apply_Scene_MotionBlur = function(relightConfigGlobal, relightConfigLevel)
    RenderSetFeatureEnabled("motionblur", relightConfigLevel.EnableMotionBlur);

    if (relightConfigLevel.EnableMotionBlur == false) then 
        return  
    end

    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "adv_", "Motion Blur Enabled", true);
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "obj_", "Motion Blur Enabled", true);
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Enabled", true);
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Intensity", relightConfigGlobal.MotionBlurIntensity);
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Movement Threshold Enabled", false);
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Movement Threshold", 0.0);
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Rotation Threshold Enabled", false);
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "FX Motion Blur Rotation Threshold", 0.0);
end

RELIGHT_Apply_Scene_ForceBloomOff = function(relightConfigLevel)
    RenderSetFeatureEnabled("glow", not relightConfigLevel.ForceBloomOff);

    if (relightConfigLevel.ForceBloomOff == false) then 
        return 
    end
    
    TLSE_AgentNameSetProperty(RELIGHT_SceneObjectAgentName, "FX Bloom Threshold", 0.0, RELIGHT_kScene);
    TLSE_AgentNameSetProperty(RELIGHT_SceneObjectAgentName, "FX Bloom Intensity", 0.0, RELIGHT_kScene);
end

RELIGHT_Apply_Scene_ApplyExposureAdjustment = function(relightConfigLevel, number_customSetExposure)
    local number_sceneExposureOffset = relightConfigLevel.ExposureOffset; --user defined exposure offset that will be added ontop
    local number_finalExposureValue = number_customSetExposure + number_sceneExposureOffset; --combine both values
    local agentTable_cameras = TLSE_GetAllCameraAgentsInScene(RELIGHT_SceneObject);

    for i, agent_sceneAgent in pairs(agentTable_cameras) do
        AgentSetProperty(agent_sceneAgent, "Exposure", number_finalExposureValue);
    end
end