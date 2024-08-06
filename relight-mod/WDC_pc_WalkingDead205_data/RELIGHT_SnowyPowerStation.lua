RELIGHT_SkydomeReplacement_Initalize = function()
    local agent_originalSky = AgentFindInScene("obj_skySnowyPowerStation", RELIGHT_SceneObject);
    local container_originalLightingGroups = AgentGetProperty(agent_originalSky, "Render Lighting Groups");

    AgentSetProperty(agent_originalSky, "D3D Mesh", "obj_matteSkydomeOvercastSkyGrad.d3dmesh");
    AgentSetProperty(agent_originalSky, "Render Lighting Groups", container_originalLightingGroups);

    ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkyTwilight1.d3dtx");
end

RELIGHT_FixBotchedMaterialColors = function()
    --This will fix some botched up material colors in the original level that are red/pink
    TLSE_AgentNameSetPropertyWithSymbol("adv_snowyPowerStation_meshesB", "17912793833711450066", Color(1, 1, 1, 1), RELIGHT_SceneObject);
    TLSE_AgentNameSetPropertyWithSymbol("adv_snowyPowerStation_distGround", "17912793833711450066", Color(1, 1, 1, 1), RELIGHT_SceneObject);
    TLSE_AgentNameSetPropertyWithSymbol("obj_fenceAPowerStation", "17912793833711450066", Color(1, 1, 1, 1), RELIGHT_SceneObject);
    TLSE_AgentNameSetPropertyWithSymbol("obj_gateFrontBPowerStation", "17912793833711450066", Color(1, 1, 1, 1), RELIGHT_SceneObject);
    TLSE_AgentNameSetPropertyWithSymbol("obj_gateFrontAPowerStation", "17912793833711450066", Color(1, 1, 1, 1), RELIGHT_SceneObject);
    TLSE_AgentNameSetPropertyWithSymbol("obj_fenceBPowerStation", "17912793833711450066", Color(1, 1, 1, 1), RELIGHT_SceneObject);
end