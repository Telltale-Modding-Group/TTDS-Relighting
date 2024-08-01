RELIGHT_WaterReplacement_Initalize = function()
    local agent_water = AgentCreate("RELIGHT_WaterReplacement", "obj_puddlePoolClemHouse400.prop", Vector(2.189613, -3.99447, -50.811702), Vector(0, -70.895, 0), RELIGHT_SceneObject, false, false);
    
    AgentSetProperty(agent_water, "Runtime: Visible", true);
    AgentSetProperty(agent_water, "Render Global Scale", 50);
    AgentSetProperty(agent_water, "Render Cull", false); --disable culling since when the object is super large it gets culled out of the screen noticably
    AgentSetProperty(agent_water, "Render Layer", 6);
    AgentSetProperty(agent_water, "Render Constant Alpha", 2.379);
    AgentSetProperty(agent_water, "Render Constant Alpha Multiply", 1.52);

    TLSE_AgentSetPropertyWithSymbol(agent_water, "1504390651565685996", 64); --wave-scale1
    TLSE_AgentSetPropertyWithSymbol(agent_water, "15272138922562676569", 64); --wave-scale2
    TLSE_AgentSetPropertyWithSymbol(agent_water, "4273370320593893048", 0.05); --wave-speed
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "4279570706014850606", 1); --wave-strength

    TLSE_AgentSetPropertyWithSymbol(agent_water, "4857578369356927332", 0.5); --wave-strength2
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "4857578369356927332", 0.1); --wave-strength2


    --TLSE_AgentSetPropertyWithSymbol(agent_water, "5950422962495852891", 0.1); --water-speed2?
    TLSE_AgentSetPropertyWithSymbol(agent_water, "5138029077440829486", 0.99); --water-roughness
    TLSE_AgentSetPropertyWithSymbol(agent_water, "29917189130296323", true); --enable reflection map
    TLSE_AgentSetPropertyWithSymbol(agent_water, "9318400394721951400", 0); --WATER-LIGHT-GROUP
    TLSE_AgentSetPropertyWithSymbol(agent_water, "4524265211594962055", Color(1, 1, 1, 1)); --reflection-color
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "5066756895947174386", 2); --reflection-strength  
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "15065044257655169889", RGBColor(40, 40, 0, 255)); --refraction-color
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "9181020696151788533", -6); --refraction-water-fog-amount1
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "4847108626039527005", -5); --refraction-brightness
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "12012789014150368376", 5); --refraction-brightness2
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "13524572792830703280", 5); --refraction-brightness3
    TLSE_AgentSetPropertyWithSymbol(agent_water, "13985881739645500197", 0.1); --refraction-strength
    TLSE_AgentSetPropertyWithSymbol(agent_water, "9887842711884399492", false); --false - high quality, true - low quality? (on RiverShore201 seems to fix grass)
    TLSE_AgentSetPropertyWithSymbol(agent_water, "12146612972960654343", false); --disable-refraction (on RiverShore201 seems to fix grass)
    TLSE_AgentSetPropertyWithSymbol(agent_water, "13551425408333398071", false); --refraction-disable2
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "1964881308567356031", RGBColor(255, 255, 255, 255)); --foam-color
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "869772803424442523", 0.10102); --foam-stretch1
    TLSE_AgentSetPropertyWithSymbol(agent_water, "6759651374164386688", 32); --foam-scale
    TLSE_AgentSetPropertyWithSymbol(agent_water, "11159419739102705717", 32); --foam-scale2
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "14260522637935869462", 0); --foam-fade1
    TLSE_AgentSetPropertyWithSymbol(agent_water, "14326746451085487896", -0.025); --foam-scroll-speed
    TLSE_AgentSetPropertyWithSymbol(agent_water, "17818319915486731111", 0.1); --foam-coverage
    --TLSE_AgentSetPropertyWithSymbol(agent_water, "17178421325407310363", 0.0001); --SHORE-FADE
    TLSE_AgentSetPropertyWithSymbol(agent_water, "17178421325407310363", 0.001); --SHORE-FADE
    TLSE_AgentSetPropertyWithSymbol(agent_water, "17888434372283380553", 1.9); --water-clear-fade

    --cant delete these, but we can hide this atrocity
    TLSE_AgentNameSetProperty("fx_riverRiverShore", "Runtime: Visible", false, RELIGHT_SceneObject);
    TLSE_AgentNameSetProperty("fx_riverRiverShoreBase", "Runtime: Visible", false, RELIGHT_SceneObject);
    TLSE_AgentNameSetProperty("fx_riverRiverShore01", "Runtime: Visible", false, RELIGHT_SceneObject);
    TLSE_AgentNameSetProperty("fx_riverRiverShoreBaseDeep", "Runtime: Visible", false, RELIGHT_SceneObject);

    --remove the river specific lights
    TLSE_AgentNameDestroy("light_fx_river1", RELIGHT_SceneObject);
    TLSE_AgentNameDestroy("light_fx_river2", RELIGHT_SceneObject);
    TLSE_AgentNameDestroy("light_fx_river3", RELIGHT_SceneObject);
    TLSE_AgentNameDestroy("light_fx_riverBase1", RELIGHT_SceneObject);
    TLSE_AgentNameDestroy("light_fx_riverBase2", RELIGHT_SceneObject);
    TLSE_AgentNameDestroy("light_fx_riverBase3", RELIGHT_SceneObject);
    TLSE_AgentNameDestroy("light_fx_river_amb", RELIGHT_SceneObject);
    TLSE_AgentNameDestroy("light_fx_river_dir", RELIGHT_SceneObject);
end

RELIGHT_SkydomeReplacement_Initalize = function()
    local agent_originalSky = AgentFindInScene("obj_skyCloudyRiverShore", RELIGHT_SceneObject);
    local container_originalLightingGroups = AgentGetProperty(agent_originalSky, "Render Lighting Groups");

    AgentSetProperty(agent_originalSky, "D3D Mesh", "obj_matteSkydomeOvercastSkyGrad.d3dmesh");
    AgentSetProperty(agent_originalSky, "Render Lighting Groups", container_originalLightingGroups);

    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "KTBM_Texture_SkyDay1.d3dtx");
    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "KTBM_Texture_SkyDay1_CloudsTest1.d3dtx");
    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "KTBM_Texture_SkyDay1_CloudsTest2.d3dtx");
    --ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "KTBM_Texture_SkySunset2_Clouds1.d3dtx");
    ShaderOverrideTexture(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad.d3dtx", "RELIGHT_Texture_SkyDay2_CloudsTest1.d3dtx");

    --ShaderSetMoveU(agent_originalSky, "obj_matteSkydomeOvercastSkyGrad", 0.1);
    ShaderSetMoveU(agent_originalSky, "module_legacy_material", 0.1);
end