RELIGHT_SkydomeReplacement_Initalize = function()
    local agent_originalSky = AgentFindInScene("obj_skyCloudyWellington", RELIGHT_SceneObject);
    local container_originalLightingGroups = AgentGetProperty(agent_originalSky, "Render Lighting Groups");

    AgentSetProperty(agent_originalSky, "D3D Mesh", "obj_matteSkydomeOvercastSkyGrad.d3dmesh");
    AgentSetProperty(agent_originalSky, "Render Lighting Groups", container_originalLightingGroups);

    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkyDay1.d3dtx");
    ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkyDay2_CloudsTest3.d3dtx");
    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkyDay1_CloudsTest1.d3dtx");
    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkyDay1_CloudsTest2.d3dtx");
    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkySunset2_Clouds1.d3dtx");
    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkyDay2.d3dtx");
    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkyDay2_CloudsTest1.d3dtx");

end