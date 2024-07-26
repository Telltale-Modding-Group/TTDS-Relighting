----------------------------------- RELIGHT GLOBAL FUNCTIONS -----------------------------------
----------------------------------- RELIGHT GLOBAL FUNCTIONS -----------------------------------
----------------------------------- RELIGHT GLOBAL FUNCTIONS -----------------------------------

--applies an FOV scale adjustment to all cameras within the scene (to either widen the FOV of all cameras, or narrow them. Useful if one wants to do widescreen stuff)
RELIGHT_Global_FOVAdjustment = function(globalConfig)
    TLSE_SetPropertyOnSceneAgentsWithNamePrefix(RELIGHT_kScene, "cam_", "Field of View Scale", globalConfig.FOVMultiplier);
end

RELIGHT_Global_SetRenderScale = function(globalConfig)
    RenderSetScale(globalConfig.RenderScale);
end

--disables cel shaded outlines in a scene
RELIGHT_Global_DisablePostOutlines = function(globalConfig)
    local config_global_DisableOutlines = not globalConfig.DisableOutlines;

    --set the graphic black parameters to zero
    local sceneAgentName = RELIGHT_kScene .. ".scene";
    TLSE_AgentNameSetProperty(sceneAgentName, "Generate NPR Lines", config_global_DisableOutlines, RELIGHT_kScene)
    TLSE_AgentNameSetProperty(sceneAgentName, "Screen Space Lines - Enabled", config_global_DisableOutlines, RELIGHT_kScene)

    RenderSetFeatureEnabled("nprlines", config_global_DisableOutlines);
end

--disables post processing thats applied to a scene
RELIGHT_Global_DisablePostProcessing = function(globalConfig)
    local config_global_DisablePostProcessing = not globalConfig.DisablePostProcessing;

    --set the graphic black parameters to zero
    local sceneAgentName = RELIGHT_kScene .. ".scene";
    TLSE_AgentNameSetProperty(sceneAgentName, "After Effects Enabled", config_global_DisablePostProcessing, RELIGHT_kScene)
end

--disables fog effects applied to a scene
RELIGHT_Global_DisableFog = function(globalConfig)
    if (globalConfig.DisableFog == false) then do return end end

    local sceneAgentName = RELIGHT_kScene .. ".scene";
	TLSE_AgentNameSetProperty(sceneAgentName, "Fog Color", Color(0,0,0,0), RELIGHT_kScene)
    TLSE_AgentNameSetProperty(sceneAgentName, "Fog Enabled", false, RELIGHT_kScene)
	TLSE_AgentNameSetProperty("module_environment", "Env - Fog Color", Color(0, 0, 0, 0), RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Fog Max Opacity", 0, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Fog Start Distance", 100000.0, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Fog Height", -100000.0, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Fog Density", 0.0, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Fog Height Falloff", 1, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Fog Enabled", false, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Enabled", false, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Enabled on High", false, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Enabled on Medium", false, RELIGHT_kScene)
    TLSE_AgentNameSetProperty("module_environment", "Env - Enabled on Low", false, RELIGHT_kScene)
	TLSE_AgentNameSetVisibillity("module_environment", false, RELIGHT_kScene)
end

--tries to force graphic black off for a scene
RELIGHT_Global_ForceGraphicBlackOff = function()
    --force graphic black off in the settings
    local prefs = GetPreferences()
    PropertySet(prefs, "Enable Graphic Black", false)
    PropertySet(prefs, "Render - Graphic Black Enabled", false)

    --set the graphic black parameters to zero
    local sceneAgentName = RELIGHT_kScene .. ".scene";
    TLSE_AgentNameSetProperty(sceneAgentName, "Graphic Black Threshold", 0.0, RELIGHT_kScene)
    TLSE_AgentNameSetProperty(sceneAgentName, "Graphic Black Softness", 0.0, RELIGHT_kScene)
    TLSE_AgentNameSetProperty(sceneAgentName, "Graphic Black Alpha", 0.0, RELIGHT_kScene)
    TLSE_AgentNameSetProperty(sceneAgentName, "Graphic Black Near", 10000, RELIGHT_kScene)
    TLSE_AgentNameSetProperty(sceneAgentName, "Graphic Black Far", 10000, RELIGHT_kScene)
    
    TLSE_AgentNameDestroy("module_post_effect", RELIGHT_kScene) --this might break the scene
    --TLSE_AgentNameSetVisibillity("module_post_effect", false, RELIGHT_kScene)
end

----------------------------------- RELIGHT GLOBAL -----------------------------------
----------------------------------- RELIGHT GLOBAL -----------------------------------
----------------------------------- RELIGHT GLOBAL -----------------------------------

RELIGHT_ApplyGlobalAdjustments = function(globalConfig)
    RELIGHT_Global_SetRenderScale(globalConfig);
    RELIGHT_Global_FOVAdjustment(globalConfig);
    RELIGHT_Global_DisablePostOutlines(globalConfig);
    RELIGHT_Global_DisablePostProcessing(globalConfig);
    RELIGHT_Global_DisableFog(globalConfig);
    RELIGHT_Global_ForceGraphicBlackOff();
end

----------------------------------- RELIGHT GLOBAL UPDATE -----------------------------------
----------------------------------- RELIGHT GLOBAL UPDATE -----------------------------------
----------------------------------- RELIGHT GLOBAL UPDATE -----------------------------------

--should be run every frame, checks if the two main options for graphic black are enabled, if they are it forces it off
RELIGHT_Global_ForceGraphicBlackOffUpdate = function()
	--force graphic black off in the settings
    local prefs = GetPreferences();
	
	--get the two main options for enabling graphic black
	local graphicBlackOption1 = PropertyGet(prefs, "Enable Graphic Black");
	local graphicBlackOption2 = PropertyGet(prefs, "Render - Graphic Black Enabled");
	
	--if this option is enabled, then disable it please
	if (graphicBlackOption1 == true) then
		PropertySet(prefs, "Enable Graphic Black", false);
	end
	
	--if this option is enabled, then disable it please
	if (graphicBlackOption2 == true) then
		PropertySet(prefs, "Render - Graphic Black Enabled", false);
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