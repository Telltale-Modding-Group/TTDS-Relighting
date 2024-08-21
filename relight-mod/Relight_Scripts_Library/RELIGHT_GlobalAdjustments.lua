--|||||||||||||||||||||||||||||||||||||||||||||||| LOCAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LOCAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LOCAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||

local EnableMotionBlur = function()
    RenderSetFeatureEnabled("motionblur", true);
    TLSE_SetPropertyOnAllMeshes(RELIGHT_SceneObject, "Motion Blur Enabled", true);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Enabled", true);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Intensity", RelightConfigGlobal["MotionBlurIntensity"]);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Movement Threshold Enabled", false);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Movement Threshold", 0.5);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Rotation Threshold Enabled", false);
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "FX Motion Blur Rotation Threshold", 0.5);
end

local ForceBloomOff = function()
    RenderSetFeatureEnabled("glow", false);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Bloom Threshold", 0.0, RELIGHT_SceneObject);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Bloom Intensity", 0.0, RELIGHT_SceneObject);
end

local ApplyFOVAdjustments = function()
    local agentTable_cameras = TLSE_GetAllCameraAgentsInScene(RELIGHT_SceneObject);

    for i, agent_sceneAgent in pairs(agentTable_cameras) do
        AgentSetProperty(agent_sceneAgent, "Field of View Scale", RelightConfigGlobal["FOVMultiplier"]);
    end
end

local DisablePostOutlines = function()
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "Generate NPR Lines", RelightConfigGlobal["DisableOutlines"]);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "Screen Space Lines - Enabled", RelightConfigGlobal["DisableOutlines"]);
    RenderSetFeatureEnabled("nprlines", RelightConfigGlobal["DisableOutlines"]);
end

local DisableFog = function()
    if (RelightConfigGlobal["DisableFog"] == false) then 
        return;
    end

	AgentSetProperty(RELIGHT_SceneObjectAgentName, "Fog Color", Color(0,0,0,0));
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "Fog Enabled", false);

    local agent_environmentFog = TLSE_FindEnvironmentFogModuleInScene(RELIGHT_SceneObject);

    if(agent_environmentFog ~= nil) then
        AgentSetProperty(agent_environmentFog, "Env - Fog Color", Color(0, 0, 0, 0));
        AgentSetProperty(agent_environmentFog, "Env - Fog Max Opacity", 0);
        AgentSetProperty(agent_environmentFog, "Env - Fog Start Distance", 100000.0);
        AgentSetProperty(agent_environmentFog, "Env - Fog Height", -100000.0);
        AgentSetProperty(agent_environmentFog, "Env - Fog Density", 0.0);
        AgentSetProperty(agent_environmentFog, "Env - Fog Height Falloff", 1);
        AgentSetProperty(agent_environmentFog, "Env - Fog Enabled", false);
        AgentSetProperty(agent_environmentFog, "Env - Enabled", false);
        AgentSetProperty(agent_environmentFog, "Env - Enabled on High", false);
        AgentSetProperty(agent_environmentFog, "Env - Enabled on Medium", false);
        AgentSetProperty(agent_environmentFog, "Env - Enabled on Low", false);
        AgentSetProperty(agent_environmentFog, "Runtime: Visible", false);
    end
end

local ForceGraphicBlackOffStart = function()
    local propertySet_preferences = GetPreferences();
    PropertySet(propertySet_preferences, "Enable Graphic Black", false);
    PropertySet(propertySet_preferences, "Render - Graphic Black Enabled", false);

    AgentSetProperty(RELIGHT_SceneObjectAgentName, "Graphic Black Threshold", 0.0);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "Graphic Black Softness", 0.0);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "Graphic Black Alpha", 0.0);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "Graphic Black Near", 10000);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "Graphic Black Far", 10000);
    
    TLSE_AgentNameDestroy("module_post_effect", RELIGHT_SceneObject); --this might break the scene
    --TLSE_AgentNameSetVisibillity("module_post_effect", false, RELIGHT_SceneObject);
end

local ForceGraphicBlackOffUpdate = function()
    local propertySet_preferences = GetPreferences();
	local graphicBlackOption1 = PropertyGet(propertySet_preferences, "Enable Graphic Black");
	local graphicBlackOption2 = PropertyGet(propertySet_preferences, "Render - Graphic Black Enabled");

	if (graphicBlackOption1 == true) then
		PropertySet(propertySet_preferences, "Enable Graphic Black", false);
	end

	if (graphicBlackOption2 == true) then
		PropertySet(propertySet_preferences, "Render - Graphic Black Enabled", false);
	end
end

local DisablePostProcessing = function()
    if(RelightConfigGlobal["DisablePostProcessing"] == false) then
        return;
    end

    TLSE_AgentNameSetProperty(RELIGHT_SceneObjectAgentName, "After Effects Enabled", not RelightConfigGlobal["DisablePostProcessing"], RELIGHT_SceneObject);

    RenderSetFeatureEnabled("dof", false);
    RenderSetFeatureEnabled("glow", false);
    RenderSetFeatureEnabled("motionblur", false);
    RenderSetFeatureEnabled("brush", false);
    RenderSetFeatureEnabled("lowresalpha", false);
    RenderSetFeatureEnabled("finalresolve", false);
    RenderSetFeatureEnabled("nprlines", false);
    RenderSetFeatureEnabled("bokeh", false);
end

local ApplyBlackAndWhiteMode = function()
    if(RelightConfigGlobal["BlackAndWhiteMode"] == false) then
        return;
    end

    --apply fx color settings 
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Color Enabled", true);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Color Tint", Color(1, 1, 1, 1));
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Color Opacity", 1);
end

local ForceVignetteOff = function()
    if(RelightConfigGlobal["ForceVignetteOff"] == false) then
        return;
    end

    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Vignette Tint Enabled", false);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Vignette Tint", Color(0, 0, 0, 1));
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Vignette Falloff", 0);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Vignette Center", 0);
    AgentSetProperty(RELIGHT_SceneObjectAgentName, "FX Vignette Corners", 0);
end

--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||

RELIGHT_Global_Start = function()
    RenderSetScale(RelightConfigGlobal["RenderScale"]);

    ApplyFOVAdjustments();
    DisablePostOutlines();
    DisablePostProcessing();
    DisableFog();
    ApplyBlackAndWhiteMode();
    ForceVignetteOff();

    if(RelightConfigGlobal["ForceGraphicBlackOff"] == true) then
        ForceGraphicBlackOffStart();
    end

    if(RelightConfigGlobal["OverrideTimeScale"]) then
        SetTimeScale(RelightConfigGlobal["TimeScaleValue"]);
    end

    if(RelightConfigGlobal["CinematicMode"] == true) then
        RELIGHT_Letterboxing_Initalize();
    end

    if(RelightConfigGlobal["ForceBloomOff"] == true) then
        ForceBloomOff();
    end

    if(RelightConfigGlobal["EnableMotionBlur"] == true) then
        EnableMotionBlur();
    end
end

RELIGHT_Global_Update = function()
    if(RelightConfigGlobal["ForceGraphicBlackOff"] == true) then
        ForceGraphicBlackOffUpdate();
    end

    if(RelightConfigGlobal["CinematicMode"] == true) then
        RELIGHT_Letterboxing_Update();
    end
end






--RenderSetFeatureEnabled("dof", false);
--RenderSetFeatureEnabled("glow", false);
--RenderSetFeatureEnabled("motionblur", false);
--RenderSetFeatureEnabled("brush", false);
--RenderSetFeatureEnabled("lowresalpha", false);
--RenderSetFeatureEnabled("finalresolve", false);
--RenderSetFeatureEnabled("bakelit", false);
--RenderSetFeatureEnabled("nprlines", false);
--RenderSetFeatureEnabled("computecullshadows", false);
--RenderSetFeatureEnabled("depthcullshadows", false);
--RenderSetFeatureEnabled("optimizesdsm", false);
--RenderSetFeatureEnabled("bokeh", false);
--RenderSetFeatureEnabled("enlighten", false);
--RenderSetFeatureEnabled("invertz", false);
--RenderSetFeatureEnabled("forwardkeyshadow", false);
--RenderSetFeatureEnabled("histencilshadow", false);
--RenderSetFeatureEnabled("lod", false);
--RenderSetFeatureEnabled("occlusion", false);
--RenderSetFeatureEnabled("lowreslight", false);
--RenderSetFeatureEnabled("computelightcluster", false);
--RenderSetFeatureEnabled("computeskinning", false);
--RenderSetFeatureEnabled("forcedepth", true);