

TLSE_DeleteAgentsInScene = function(string_scene)

    --remove the following agents from the scene
   TLSE_AgentNameDestroy("lightrig_CC_clementine", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_duck", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_hershel", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_katjaa", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_kenny", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_lee", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_shawn", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_zombie1", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_zombie2", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_zombie3", string_scene); 
   TLSE_AgentNameDestroy("templateRig_charLightComposer", string_scene); 
   TLSE_AgentNameDestroy("lightrig_CC_saw", string_scene); 
   TLSE_AgentNameDestroy("1_light_ENV_D_1", string_scene); 
   TLSE_AgentNameDestroy("15_14_amb cer", string_scene); 

end

TLSE_DuplicateAgentsInScene = function(string_scene)

    --duplicate the following agents in the scene
    AgentDuplicate("1_light_ENV_D_1", AgentFindInScene("light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("2_light_ENV_D_1", AgentFindInScene("light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("3_2_light_ENV_D_1", AgentFindInScene("2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("4_3_2_light_ENV_D_1", AgentFindInScene("3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("5_4_3_2_light_ENV_D_1", AgentFindInScene("4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("6_5_4_3_2_light_ENV_D_1", AgentFindInScene("5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("8_7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("7_6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("9_8_7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("8_7_6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("10_9_8_7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("14_amb cer", AgentFindInScene("amb cer", string_scene), false, true, true);
    --AgentDuplicate("15_14_amb cer", AgentFindInScene("14_amb cer", string_scene), false, true, true);
    AgentDuplicate("16_amb cer", AgentFindInScene("amb cer", string_scene), false, true, true);
    AgentDuplicate("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);
    AgentDuplicate("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", AgentFindInScene("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene), false, true, true);

end

TLSE_ApplySceneSettings = function(agent_sceneAgent)

    --apply anti aliasing settings 
    AgentSetProperty(agent_sceneAgent, "FX anti-aliasing", false);
    AgentSetProperty(agent_sceneAgent, "FX TAA Weight", 0.10000000149012);

    --apply fx levels settings 
    AgentSetProperty(agent_sceneAgent, "FX Levels Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX Levels Intensity", 1);
    AgentSetProperty(agent_sceneAgent, "FX Levels Intensity HDR", 1);
    AgentSetProperty(agent_sceneAgent, "FX Levels White Point", 0.87000012397766);
    AgentSetProperty(agent_sceneAgent, "FX Levels White Point HDR", 1);
    AgentSetProperty(agent_sceneAgent, "FX Levels Black Point", 0);
    AgentSetProperty(agent_sceneAgent, "FX Levels Black Point HDR", 0);

    --apply scene fog settings 
    AgentSetProperty(agent_sceneAgent, "Fog Enabled", true);
    AgentSetProperty(agent_sceneAgent, "Fog Color", Color(0.88627499341965, 0.72548997402191, 0.58431398868561, 1));
    AgentSetProperty(agent_sceneAgent, "Fog Far Plane", 80);
    AgentSetProperty(agent_sceneAgent, "Fog Near Plane", 0);
    AgentSetProperty(agent_sceneAgent, "Fog Alpha", 0.10000000149012);

    --apply npr lines settings 
    AgentSetProperty(agent_sceneAgent, "Generate NPR Lines", false);
    AgentSetProperty(agent_sceneAgent, "NPR Lines Alpha Bias", 4);
    AgentSetProperty(agent_sceneAgent, "NPR Lines Alpha Falloff", 8);
    AgentSetProperty(agent_sceneAgent, "NPR Lines Bias", 0.60000002384186);
    AgentSetProperty(agent_sceneAgent, "NPR Lines Falloff", 1);

    --apply bloom settings 
    AgentSetProperty(agent_sceneAgent, "FX Bloom Threshold", -0.11999014765024);
    AgentSetProperty(agent_sceneAgent, "FX Bloom Intensity", 0.15000090003014);

    --apply glow settings 
    AgentSetProperty(agent_sceneAgent, "Glow Clear Color", Color(0, 0, 0, 1));
    AgentSetProperty(agent_sceneAgent, "Glow Sigma Scale", 1);

    --apply fx color settings 
    AgentSetProperty(agent_sceneAgent, "FX Color Enabled", true);
    AgentSetProperty(agent_sceneAgent, "FX Color Tint", Color(1, 1, 0.88000011444092, 1));
    AgentSetProperty(agent_sceneAgent, "FX Color Opacity", -0.46999981999397);

    --apply fx tonemap settings 
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Enabled", true);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap DOF Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Intensity", 0);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Type", 2);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap White Point", 77.360000610352);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Black Point", 0);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Filmic Pivot", 0.10000000149012);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Filmic Sign", 1);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Filmic Shoulder Intensity", 5.9199995994568);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Filmic Toe Intensity", 0.7399999499321);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Pivot", 0.10000000149012);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Sign", 1);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Shoulder Intensity", 0);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Toe Intensity", 1);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Far White Point", 1);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap Far Black Point", 0);

    --apply fx tonemap rgb settings 
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB DOF Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Pivots", Vector(0.10000000149012, 0.10000000149012, 0.10000000149012));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Signs", Vector(1, -1, 1));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Shoulder Intensities", Vector(0, 0, 0));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Toe Intensities", Vector(1, 1, 1));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Black Points", Vector(0, 0, 0));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB White Points", Vector(1, 1, 1));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Far Pivots", Vector(0.10000000149012, 0.10000000149012, 0.10000000149012));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Far Signs", Vector(1, -1, 1));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Far Shoulder Intensities", Vector(0, 0, 0));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Far Toe Intensities", Vector(1, 1, 1));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Far Black Points", Vector(0, 0, 0));
    AgentSetProperty(agent_sceneAgent, "FX Tonemap RGB Far White Points", Vector(1, 1, 1));

    --apply fx ambient occlusion settings 
    AgentSetProperty(agent_sceneAgent, "FX Ambient Occlusion Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX Ambient Occlusion Intensity", 1.3999999761581);
    AgentSetProperty(agent_sceneAgent, "FX Ambient Occlusion Falloff", 1);
    AgentSetProperty(agent_sceneAgent, "FX Ambient Occlusion Radius", 3);
    AgentSetProperty(agent_sceneAgent, "FX Ambient Occlusion Lightmap", 2);

    --apply fx dof settings 
    AgentSetProperty(agent_sceneAgent, "FX DOF Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX DOF FOV Adjust Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX DOF Auto Focus Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX Vignette DOF Enabled", false);
    AgentSetProperty(agent_sceneAgent, "FX DOF Near", 2);
    AgentSetProperty(agent_sceneAgent, "FX DOF Far", 8);
    AgentSetProperty(agent_sceneAgent, "FX DOF Near Falloff", 1);
    AgentSetProperty(agent_sceneAgent, "FX DOF Far Falloff", 10);
    AgentSetProperty(agent_sceneAgent, "FX DOF Near Max", 1);
    AgentSetProperty(agent_sceneAgent, "FX DOF Far Max", 1);
    AgentSetProperty(agent_sceneAgent, "FX DOF Vignette Max", 1);
    AgentSetProperty(agent_sceneAgent, "FX DOF Coverage Boost", 1.5);
    AgentSetProperty(agent_sceneAgent, "FX DOF Debug", 0);

    --apply fx vignette settings 
    AgentSetProperty(agent_sceneAgent, "FX Vignette Tint Enabled", true);
    AgentSetProperty(agent_sceneAgent, "FX Vignette Tint", Color(0, 0, 0, 1));
    AgentSetProperty(agent_sceneAgent, "FX Vignette Falloff", 1.2999999523163);
    AgentSetProperty(agent_sceneAgent, "FX Vignette Center", -0.27000001072884);
    AgentSetProperty(agent_sceneAgent, "FX Vignette Corners", 0.78000009059906);

    --apply hbao settings 
    AgentSetProperty(agent_sceneAgent, "HBAO Enabled", true);
    AgentSetProperty(agent_sceneAgent, "HBAO Debug", false);
    AgentSetProperty(agent_sceneAgent, "HBAO Intensity", 1.9799993038177);
    AgentSetProperty(agent_sceneAgent, "HBAO Radius", 1.2099947929382);
    AgentSetProperty(agent_sceneAgent, "HBAO Max Radius Percent", 0.059999980032444);
    AgentSetProperty(agent_sceneAgent, "HBAO Hemisphere Bias", 0.20000003278255);
    AgentSetProperty(agent_sceneAgent, "HBAO Occlusion Scale", 0);
    AgentSetProperty(agent_sceneAgent, "HBAO Luminance Scale", 0);
    AgentSetProperty(agent_sceneAgent, "HBAO Max Distance", 150);
    AgentSetProperty(agent_sceneAgent, "HBAO Distance Falloff", 50);
    AgentSetProperty(agent_sceneAgent, "HBAO Blur Sharpness", 7.879997253418);

    --apply screen space lines settings 
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Enabled", false);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Color", Color(0, 0, 0, 1));
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Thickness", 2);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Depth Fade Near", 0);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Depth Fade Far", 15);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Depth Magnitude", 5000);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Depth Exponent", 1);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Debug", 0);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Light Magnitude", 1);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Light Exponent", 1);
    AgentSetProperty(agent_sceneAgent, "Screen Space Lines - Light Direction", Vector(0, -1, -1));

    --apply graphic black settings 
    AgentSetProperty(agent_sceneAgent, "Graphic Black Threshold", 0);
    AgentSetProperty(agent_sceneAgent, "Graphic Black Softness", 0);
    AgentSetProperty(agent_sceneAgent, "Graphic Black Alpha", 0);
    AgentSetProperty(agent_sceneAgent, "Graphic Black Near", 10000);
    AgentSetProperty(agent_sceneAgent, "Graphic Black Far", 10000);

    --apply wind settings 
    AgentSetProperty(agent_sceneAgent, "Wind Speed", 0);
    AgentSetProperty(agent_sceneAgent, "Wind Idle Strength", 1);
    AgentSetProperty(agent_sceneAgent, "Wind Idle Spacial Frequency", 1);
    AgentSetProperty(agent_sceneAgent, "Wind Gust Speed", 0);
    AgentSetProperty(agent_sceneAgent, "Wind Gust Strength", 1);
    AgentSetProperty(agent_sceneAgent, "Wind Gust Spacial Frequency", 1);
    AgentSetProperty(agent_sceneAgent, "Wind Gust Idle Strength Multiplier", 1);
    AgentSetProperty(agent_sceneAgent, "Wind Gust Separation Exponent", 1);
    AgentSetProperty(agent_sceneAgent, "Wind Direction", Vector(0, 0, 1));

    --apply reflection settings 
    AgentSetProperty(agent_sceneAgent, "LightEnv Reflection Enabled", false);
    AgentSetProperty(agent_sceneAgent, "LightEnv Reflection Intensity", 1);
    AgentSetProperty(agent_sceneAgent, "LightEnv Reflection Intensity Shadow", -0.64999961853027);
    AgentSetProperty(agent_sceneAgent, "LightEnv Reflection Tint", Color(1, 1, 1, 1));
    --LightEnv Reflection Texture (string) 

    --apply shadows settings 
    AgentSetProperty(agent_sceneAgent, "FX Sharp Shadows Enabled", true);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Auto Depth Bounds", false);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Moment Bias", 0.049999997019768);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Depth Bias", 0.1300000846386);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Position Offset Bias", 0);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Light Bleed Reduction", 0.85999953746796);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Min Distance", 0);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Max Distance", 53);
    AgentSetProperty(agent_sceneAgent, "LightEnv Dynamic Shadow Max Distance", 10);
    AgentSetProperty(agent_sceneAgent, "Light Shadow Trace Max Distance", 11.219959259033);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Cascade Split Bias", 0.98999965190887);
    AgentSetProperty(agent_sceneAgent, "LightEnv Shadow Max Updates", 8);
    AgentSetProperty(agent_sceneAgent, "Light Static Shadow Bounds Min", Vector(-150, -20, -150));
    AgentSetProperty(agent_sceneAgent, "Light Static Shadow Bounds Max", Vector(150, 75, 150));

    --apply fx brush settings 
    AgentSetProperty(agent_sceneAgent, "FX Brush Outline Enable", false);
    AgentSetProperty(agent_sceneAgent, "FX Brush Outline Filter Enable", false);
    AgentSetProperty(agent_sceneAgent, "FX Brush DOF Enable", false);
    AgentSetProperty(agent_sceneAgent, "FX Brush Outline Size", 1);
    AgentSetProperty(agent_sceneAgent, "FX Brush Outline Threshold", 0.20000000298023);
    AgentSetProperty(agent_sceneAgent, "FX Brush Outline Color Threshold", 1);
    AgentSetProperty(agent_sceneAgent, "FX Brush Outline Falloff", 0.20000000298023);
    AgentSetProperty(agent_sceneAgent, "FX Brush Near Outline Scale", 1);
    AgentSetProperty(agent_sceneAgent, "FX Brush Near Scale", 1);
    AgentSetProperty(agent_sceneAgent, "FX Brush Near Detail", 1);
    AgentSetProperty(agent_sceneAgent, "FX Brush Far Scale", 1);
    AgentSetProperty(agent_sceneAgent, "FX Brush Far Detail", 1);
    AgentSetProperty(agent_sceneAgent, "FX Brush Far Scale Boost", 0.40000000596046);
    AgentSetProperty(agent_sceneAgent, "FX Brush Far Plane", 20);
    AgentSetProperty(agent_sceneAgent, "FX Brush Far Plane Falloff", 100);
    AgentSetProperty(agent_sceneAgent, "FX Brush Far Plane Max Scale", 1);

    --apply frame buffer settings 
    AgentSetProperty(agent_sceneAgent, "Frame Buffer Scale Override", false);
    AgentSetProperty(agent_sceneAgent, "Frame Buffer Scale Factor", 1);

    --apply specular settings 
    AgentSetProperty(agent_sceneAgent, "Specular Multiplier Enabled", false);
    AgentSetProperty(agent_sceneAgent, "Specular Color Multiplier", 1);
    AgentSetProperty(agent_sceneAgent, "Specular Intensity Multiplier", 1);
    AgentSetProperty(agent_sceneAgent, "Specular Exponent Multiplier", 1);

    --apply misc settings 
    AgentSetProperty(agent_sceneAgent, "After Effects Enabled", true);
    AgentSetProperty(agent_sceneAgent, "HDR lightmaps Enabled", true);
    AgentSetProperty(agent_sceneAgent, "HDR lightmaps Intensity", 0);
    AgentSetProperty(agent_sceneAgent, "FX Noise Scale", 1);
    AgentSetProperty(agent_sceneAgent, "Ambient Color", Color(0.23000001907349, 0.28000000119209, 0.41999986767769, 1));
    AgentSetProperty(agent_sceneAgent, "Shadow Color", Color(0, 0, 0, 1));
    AgentSetProperty(agent_sceneAgent, "FX Force Linear Depth Offset", 0.5);
    AgentSetProperty(agent_sceneAgent, "HDR - Paper White Nits", 500);
    AgentSetProperty(agent_sceneAgent, "LightEnv Bake Enabled", false);
    AgentSetProperty(agent_sceneAgent, "LightEnv Enabled", true);
    AgentSetProperty(agent_sceneAgent, "LightEnv Intensity", 1);
    AgentSetProperty(agent_sceneAgent, "LightEnv Saturation", 1);
    AgentSetProperty(agent_sceneAgent, "LightEnv Tint", Color(1, 1, 1, 1));
    AgentSetProperty(agent_sceneAgent, "LightEnv Background Color", Color(0, 0, 0, 1));
    AgentSetProperty(agent_sceneAgent, "LightEnv Probe Resolution XZ", 1);
    AgentSetProperty(agent_sceneAgent, "LightEnv Probe Resolution Y", 1);


end

TLSE_ApplyLightingSettings = function(string_scene)


    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Type", 2, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Intensity", 3.210000038147, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Enlighten Intensity", 0.65150082111359, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Radius", 25, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Shadow Type", 2, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Type", 3, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Intensity", 0.15000000596046, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Color", Color(0.20392200350761, 0.28627499938011, 0.47843098640442, 1), string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Radius", 5, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("amb scena", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Type", 3, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Intensity", 0.47283038496971, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Intensity Specular", 0, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Radius", 5, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("amb cer", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Intensity", 10, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Color", Color(1, 0.88235300779343, 0.69019597768784, 1), string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Spot Angle Outer", 37, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_01", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Intensity", 15, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Radius", 16.5, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Spot Angle Inner", 20, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Spot Angle Outer", 37, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Shadow Type", 2, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_01", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_02", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Intensity", 15, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Enlighten Intensity", 2, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Radius", 14, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Spot Angle Inner", 18, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Spot Angle Outer", 37, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_02", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_03", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Intensity", 0.69999998807907, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Radius", 17, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Spot Angle Inner", 15, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Shadow Softness", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_03", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_04", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Intensity", 0.80000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Enlighten Intensity", 2, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Radius", 16, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Spot Angle Inner", 15, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_04", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_05", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Intensity", 2.5, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Enlighten Intensity", 2, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_05", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_06", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Intensity", 20, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Enlighten Intensity", 2, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Radius", 16, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_06", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_07", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Intensity", 15, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Enlighten Intensity", 2, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Radius", 16, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_07", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_08", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Intensity", 20, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Color", Color(1, 0.88235300779343, 0.69019597768784, 1), string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Spot Angle Inner", 12, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Spot Angle Outer", 30, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_08", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_10", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Radius", 21, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Spot Angle Inner", 15, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Spot Angle Outer", 80, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Shadow Softness", 5, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_10", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_11", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Intensity", 30, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Enlighten Intensity", 2, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Radius", 16, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_11", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_12", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Radius", 21, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Spot Angle Inner", 25, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Shadow Softness", 5, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_12", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_13", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Intensity", 1.25, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Enlighten Intensity", 0, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Color", Color(1, 0.88235300779343, 0.69019597768784, 1), string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Spot Angle Inner", 16, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Spot Angle Outer", 40, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Shadow Type", 2, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_13", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_14", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Intensity", 3, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Enlighten Intensity", 0, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Color", Color(1, 0.88235300779343, 0.69019597768784, 1), string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Spot Angle Inner", 16, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Spot Angle Outer", 40, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Shadow Type", 2, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_14", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_15", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Intensity", 4, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Enlighten Intensity", 0.10000000149012, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Color", Color(1, 0.88235300779343, 0.69019597768784, 1), string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Spot Angle Inner", 16, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Spot Angle Outer", 40, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Shadow Type", 2, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_15", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_16", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Intensity", 10, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Radius", 10, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Spot Angle Inner", 20, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Spot Angle Outer", 37, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_16", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_17", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Intensity", 2, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Enlighten Intensity", 0, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Radius", 10, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_17", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_18", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Intensity", 15, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Enlighten Intensity", 2, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Radius", 16, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Spot Angle Outer", 70, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_18", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_19", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Intensity", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Enlighten Intensity", 0.10000000149012, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Color", Color(1, 0.88235300779343, 0.69019597768784, 1), string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Spot Angle Inner", 16, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Spot Angle Outer", 40, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_19", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Type", 3, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Intensity", 0.050000000745058, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Color", Color(0.96862798929214, 0.9019610285759, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Radius", 5, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_ambEnlighten", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Type", 3, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Intensity", 0.25, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Radius", 5, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_dots", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_20", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Intensity", 1.3999999761581, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Enlighten Intensity", 0.10000000149012, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Color", Color(1, 0.82745099067688, 0.54901999235153, 1), string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Spot Angle Inner", 16, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Spot Angle Outer", 40, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_20", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_21", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Intensity", 1.25, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Enlighten Intensity", 0, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Color", Color(1, 0.88235300779343, 0.69019597768784, 1), string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Radius", 11.949999809265, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Spot Angle Inner", 16, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Spot Angle Outer", 40, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_21", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Radius", 12, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Wrap", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Intensity", 0.5, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Radius", 12, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Distance Falloff", 1.2999999523163, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Wrap", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks01", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Radius", 8, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Wrap", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks02", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_09", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Type", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Intensity", 1.6000000238419, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Enlighten Intensity", 0, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Color", Color(1, 0.82745099067688, 0.65490198135376, 1), string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Radius", 16, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Spot Angle Inner", 15, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Spot Angle Outer", 73, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Wrap", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_09", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Type", 3, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Intensity", 0.40000000596046, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Color", Color(1, 0.87843102216721, 0.75686299800873, 1), string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Radius", 5, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("amb_lettuce", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Type", 3, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Intensity", 0.11999999731779, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Color", Color(1, 0, 0, 1), string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Radius", 5, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_bloodfx", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Intensity", 0.10000000149012, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Radius", 8, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Distance Falloff", 1.5, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Wrap", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks03", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Intensity", 0.10000000149012, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Radius", 4.6500000953674, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Distance Falloff", 0.60000002384186, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Wrap", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks04", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Enabled", false, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Intensity", 0.039000000804663, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Radius", 4.6500000953674, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Distance Falloff", 0.60000002384186, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Wrap", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("light_poinFillBlacks05", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Intensity", 1.1160001754761, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Radius", 12.170001029968, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Wrap", 1.1140002012253, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Intensity", 1.1160001754761, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Radius", 12.170001029968, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Wrap", 1.1140002012253, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Intensity", 1.1160001754761, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Wrap", 1.1140002012253, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 1.1160001754761, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", 1.1140002012253, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 1.1160001754761, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", 1.1140002012253, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 0.58300018310547, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 0.58300018310547, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 0.58300018310547, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 0.58300018310547, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 0.58300018310547, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 0.58300018310547, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 7.9900012016296, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", 0.58300018310547, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 1, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.95000004768372, 0.95000004768372, 1), string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 3.4900014400482, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Intensity", 3.2348310947418, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Intensity Specular", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Enlighten Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Radius", 456.03851318359, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("14_amb cer", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Type", 4, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Intensity", -0.45820942521095, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Intensity Specular", 0, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Enlighten Intensity", -6.6600003242493, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Color", Color(1, 1, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Radius", 5, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Distance Falloff", 2, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Shadow Quality", 0, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Wrap", 0, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Mobility", 1, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("16_amb cer", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", -0.22921971976757, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 0, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(0.96000003814697, 0.97000002861023, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 4.4762344360352, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled", true, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enabled Group", true, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Type", 0, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity", -0.46696949005127, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Dimmer", 1, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Specular", 0, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Intensity Diffuse", 1, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Enlighten Intensity", -0.6729993224144, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Color", Color(1, 0.97000002861023, 1, 1), string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Radius", 4.4762344360352, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Distance Falloff", 2.4179995059967, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Inner", 5, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Spot Angle Outer", 45, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Type", 0, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Quality", 2, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Softness", 0.30000001192093, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Near Clip", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Depth Bias", 0.20000000298023, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Modulated Intensity", 1, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Shadow Map Quality Distance Scale", 10, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Wrap", -2.8750016689301, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Opacity", 1, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Mobility", 2, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Priority", 0, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - HBAO Participation Type", 0, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Bake Allowed on Static", 0, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - Visible Threshold Scale", 1, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - LOD Behavior", 0, string_scene);
    TLSE_AgentNameSetProperty("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", "EnvLight - NPR Banding", 1, string_scene);


end

TLSE_ApplyMeshSettings = function(string_scene)


end

TLSE_TransformAgentsInScene = function(string_scene)

    --apply transformations to the following agents in the scene
    TLSE_AgentNameSetWorldPositionAndRotation("light_ENV_D_1", Vector(9.4747982025146, 9.6536483764648, 17.175521850586), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("amb scena", Vector(19.052555084229, 5.678804397583, 0.39396387338638), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("amb cer", Vector(19.052555084229, 5.678804397583, 0.39396387338638), Vector(120.93675994873, 33.562381744385, 1.7075470850614e-06), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_", Vector(7.9518756866455, 12.761913299561, 10.241644859314), Vector(31.102556228638, -99.447143554688, 7.6382761001587), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_01", Vector(-0.20109081268311, 9.4863586425781, 2.8346147537231), Vector(32.267768859863, -178.03820800781, -2.1726949214935), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_02", Vector(11.235870361328, 7.1249656677246, -5.7439260482788), Vector(31.532041549683, -162.51208496094, 7.5519766807556), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_03", Vector(-12.067267417908, 4.004020690918, 18.140335083008), Vector(28.732378005981, -114.17687225342, -11.368067741394), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_04", Vector(-10.11581993103, 2.9366455078125, 12.705513000488), Vector(8.5555849075317, -98.871971130371, 10.353343963623), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_05", Vector(-12.354192733765, -2.0949196815491, 17.296543121338), Vector(-55.350402832031, -14.337265014648, -2.9518003463745), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_06", Vector(-14.666034698486, 13.656608581543, -0.37893581390381), Vector(143.61280822754, 37.911491394043, -29.969556808472), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_07", Vector(-27.471336364746, 13.677848815918, 7.0775156021118), Vector(135.01609802246, 36.809349060059, -21.535810470581), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_08", Vector(8.2468204498291, 5.9463539123535, 17.22080039978), Vector(25.012512207031, -131.59329223633, 9.9134492874146), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_10", Vector(-22.227582931519, 4.0475687980652, -5.0671920776367), Vector(31.350687026978, 50.677185058594, -4.8164086341858), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_11", Vector(9.1555671691895, 13.149101257324, 22.580352783203), Vector(143.61280822754, 37.911491394043, -29.969556808472), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_12", Vector(-12.330717086792, 13.528786659241, 0.54921722412109), Vector(94.630378723145, 50.433597564697, -1.8176470994949), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_13", Vector(2.3213367462158, 4.0402641296387, -16.484680175781), Vector(34.565044403076, -125.24409484863, -7.6062707901001), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_14", Vector(2.2772083282471, 4.0783042907715, -8.9223031997681), Vector(34.355888366699, -133.81475830078, -13.258985519409), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_15", Vector(-0.39161491394043, 2.0593528747559, -17.246294021606), Vector(34.229202270508, -127.54638671875, -9.1659240722656), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_16", Vector(-13.483139038086, 9.2450752258301, -18.387939453125), Vector(36.925506591797, -135.88320922852, -6.5347261428833), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_17", Vector(6.6840019226074, -1.7233352661133, 7.3792419433594), Vector(-159.58094787598, 118.08985137939, -37.998344421387), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_18", Vector(-89.160484313965, 12.163627624512, 7.6877450942993), Vector(135.01609802246, 36.809349060059, -21.535810470581), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_19", Vector(0.47905158996582, 4.3753776550293, -12.075927734375), Vector(60.076427459717, -119.56269836426, -25.856798171997), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_ambEnlighten", Vector(0, 0, 0), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_dots", Vector(0, 0, 0), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_20", Vector(0.39359441399574, 2.6943778991699, -14.149355888367), Vector(61.005290985107, -127.54638671875, -9.1659355163574), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_21", Vector(2.7657337188721, 4.0322523117065, -16.17236328125), Vector(-11.849315643311, -130.97203063965, -5.4108409881592), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_poinFillBlacks", Vector(6.9571228027344, 5.3232560157776, 21.283096313477), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_poinFillBlacks01", Vector(-20.013153076172, 8.9359874725342, 21.283096313477), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_poinFillBlacks02", Vector(19.206550598145, 4.9432702064514, 2.1390438079834), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_09", Vector(-14.994675636292, 9.5844316482544, 5.7497639656067), Vector(88.810173034668, -98.871971130371, 10.353379249573), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("amb_lettuce", Vector(19.052555084229, 5.678804397583, 0.39396387338638), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_bloodfx", Vector(2.9757556915283, 0.93307226896286, 1.6662659645081), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_poinFillBlacks03", Vector(-20.208221435547, 1.1753063201904, 7.0928497314453), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_poinFillBlacks04", Vector(-5.4926452636719, 1.7907848358154, 0.52992248535156), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("light_poinFillBlacks05", Vector(-11.160614013672, 1.8041515350342, 8.4528350830078), Vector(0, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("2_light_ENV_D_1", Vector(3.2841901779175, 0.25702142715454, 2.8392834663391), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("3_2_light_ENV_D_1", Vector(-11.155473709106, 0.32229995727539, 15.963582992554), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("4_3_2_light_ENV_D_1", Vector(1.4869375228882, 0.287757396698, 13.542659759521), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("5_4_3_2_light_ENV_D_1", Vector(-2.3677458763123, -0.15084266662598, 17.955738067627), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("6_5_4_3_2_light_ENV_D_1", Vector(-20.327735900879, 1.1395978927612, 1.5628237724304), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("7_6_5_4_3_2_light_ENV_D_1", Vector(-20.09839630127, 0.42547345161438, 15.192210197449), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("8_7_6_5_4_3_2_light_ENV_D_1", Vector(-23.100238800049, 1.3295483589172, 21.306558609009), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("9_8_7_6_5_4_3_2_light_ENV_D_1", Vector(9.2985153198242, 0.088994264602661, 17.346788406372), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("10_9_8_7_6_5_4_3_2_light_ENV_D_1", Vector(8.4355850219727, 0.40763759613037, 11.355695724487), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", Vector(-6.7594909667969, 0.33713412284851, -6.5416812896729), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", Vector(-1.0892528295517, 0.15260672569275, -7.5748658180237), Vector(147.62657165527, 47.848571777344, 11.342945098877), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", Vector(-4.687352180481, -0.25752067565918, -3.1638164520264), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("14_amb cer", Vector(340.1589050293, 357.59689331055, 409.58648681641), Vector(132.5615234375, 0, 0), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("16_amb cer", Vector(19.052555084229, 5.678804397583, 0.39396387338638), Vector(-38.812480926514, 34.687313079834, 1.7075470850614e-06), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", Vector(1.8789699077606, 0.73678541183472, -8.5164680480957), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);
    TLSE_AgentNameSetWorldPositionAndRotation("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", Vector(-2.9023430347443, 0.34809529781342, -9.0796613693237), Vector(147.62657165527, 47.848575592041, 11.342942237854), string_scene);

end

TLSE_DeleteAllAgentsInScene = function(string_scene)

    --adv agents 

    --obj agents 

    --cam agents 

    --ui agents 

    --fx agents 

    --fxGroup agents 

    --module agents 

    --group agents 

    --light agents 

    --light_CHAR_CC agents 

    --lightrig_CC agents 

    --lightrotation_CC agents 

    --charLightComposer agents 

    --unsorted agents 
    TLSE_AgentNameDestroy("amb scena", string_scene); 
    TLSE_AgentNameDestroy("amb cer", string_scene); 
    TLSE_AgentNameDestroy("amb_lettuce", string_scene); 
    TLSE_AgentNameDestroy("2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("7_6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("8_7_6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("13_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("14_amb cer", string_scene); 
    TLSE_AgentNameDestroy("16_amb cer", string_scene); 
    TLSE_AgentNameDestroy("17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene); 
    TLSE_AgentNameDestroy("18_17_12_11_10_9_8_7_6_5_4_3_2_light_ENV_D_1", string_scene); 

end 


TLSE_SceneRelight = function(string_scene) 

    TLSE_DeleteAgentsInScene(string_scene); 
    TLSE_DuplicateAgentsInScene(string_scene); 
    TLSE_ApplyLightingSettings(string_scene); 
    TLSE_ApplyMeshSettings(string_scene); 
    TLSE_TransformAgentsInScene(string_scene); 
    --TLSE_DeleteAllAgentsInScene(string_scene); 

end 

