local label_infoText = nil;
local booleanPropertyField_lightEnabled = nil;
local booleanPropertyField_lightEnvGroupEnabled = nil;
local numberPropertyField_lightType = nil;
local numberPropertyField_lightIntensity = nil;
local numberPropertyField_lightIntensityDimmer = nil;
local numberPropertyField_lightIntensitySpecular = nil;
local numberPropertyField_lightIntensityDiffuse = nil;
local numberPropertyField_lightEnlightenIntensity = nil;
local numberPropertyField_lightRadius = nil;
local numberPropertyField_lightDistanceFalloff = nil;
local numberPropertyField_lightSpotAngleInner = nil;
local numberPropertyField_lightSpotAngleOuter = nil;
local numberPropertyField_lightShadowType = nil;
local numberPropertyField_lightShadowQuality = nil;
local numberPropertyField_lightShadowSoftness = nil;
local numberPropertyField_lightShadowNearClip = nil;
local numberPropertyField_lightShadowDepthBias = nil;
local numberPropertyField_lightShadowModulatedIntensity = nil;
local numberPropertyField_lightShadowMapQualityDistanceScale = nil;
local numberPropertyField_lightWrap = nil;
local numberPropertyField_lightOpacity = nil;
local numberPropertyField_lightMobility = nil;
local numberPropertyField_lightPriority = nil;
local numberPropertyField_lightHBAOParticipationType = nil;
local numberPropertyField_lightBakeAllowedOnStatic = nil;
local numberPropertyField_lightVisibleThresholdScale = nil;
local numberPropertyField_lightLODBehavior = nil;
local numberPropertyField_lightNPRBanding = nil;
local colorPropertyField_lightColor = nil;

local textButton_lightForceShadowType0 = nil; --eLightEnvShadowType_None
local textButton_lightForceShadowType1 = nil; --eLightEnvShadowType_Static_Depreceated
local textButton_lightForceShadowType2 = nil; --eLightEnvShadowType_PerLight
local textButton_lightForceShadowType3 = nil; --eLightEnvShadowType_Modulated
local textButton_lightSetDiffuseSpecularTo1 = nil;
local textButton_lightSetDiffuseTo0 = nil;
local textButton_lightSetSpecularTo0 = nil;

local OnPress_SetDiffuseSpecularTo1 = function(textButton_button)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, "EnvLight - Intensity Diffuse")) then
            AgentSetProperty(agent_currentSelectedAgent, "EnvLight - Intensity Diffuse", 1);
        end

        if(AgentHasProperty(agent_currentSelectedAgent, "EnvLight - Intensity Specular")) then
            AgentSetProperty(agent_currentSelectedAgent, "EnvLight - Intensity Specular", 1);
        end
    end
end

local OnPress_SetDiffuseTo0 = function(textButton_button)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, "EnvLight - Intensity Diffuse")) then
            AgentSetProperty(agent_currentSelectedAgent, "EnvLight - Intensity Diffuse", 0);
        end
    end
end

local OnPress_SetSpecularTo0 = function(textButton_button)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, "EnvLight - Intensity Specular")) then
            AgentSetProperty(agent_currentSelectedAgent, "EnvLight - Intensity Specular", 0);
        end
    end
end

local OnPress_ForceShadowCastingType0 = function(textButton_button)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, "EnvLight - Shadow Type")) then
            AgentSetProperty(agent_currentSelectedAgent, "EnvLight - Shadow Type", 0);
        end
    end
end

local OnPress_ForceShadowCastingType1 = function(textButton_button)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, "EnvLight - Shadow Type")) then
            AgentSetProperty(agent_currentSelectedAgent, "EnvLight - Shadow Type", 1);
        end
    end
end

local OnPress_ForceShadowCastingType2 = function(textButton_button)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, "EnvLight - Shadow Type")) then
            AgentSetProperty(agent_currentSelectedAgent, "EnvLight - Shadow Type", 2);
        end
    end
end

local OnPress_ForceShadowCastingType3 = function(textButton_button)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, "EnvLight - Shadow Type")) then
            AgentSetProperty(agent_currentSelectedAgent, "EnvLight - Shadow Type", 3);
        end
    end
end

local textButton_lightAddGroup0 = nil; --Group0
local textButton_lightAddGroup1 = nil; --Group1
local textButton_lightAddGroup2 = nil; --Group2
local textButton_lightAddGroup3 = nil; --Group3
local textButton_lightAddGroup4 = nil; --Group4
local textButton_lightAddGroup5 = nil; --Group5
local textButton_lightAddGroup6 = nil; --Group6
local textButton_lightAddGroup7 = nil; --Group7
local textButton_lightAddAmbientGroup0 = nil; --Ambient Group0
local textButton_lightAddAmbientGroup1 = nil; --Ambient Group1
local textButton_lightAddAmbientGroup2 = nil; --Ambient Group2
local textButton_lightAddAmbientGroup3 = nil; --Ambient Group3

local OnPress_AddGroup0 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Group0"); end end
local OnPress_AddGroup1 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Group1"); end end
local OnPress_AddGroup2 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Group2"); end end
local OnPress_AddGroup3 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Group3"); end end
local OnPress_AddGroup4 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Group4"); end end
local OnPress_AddGroup5 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Group5"); end end
local OnPress_AddGroup6 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Group6"); end end
local OnPress_AddGroup7 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Group7"); end end
local OnPress_AddAmbientGroup0 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Ambient Group0"); end end
local OnPress_AddAmbientGroup1 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Ambient Group1"); end end
local OnPress_AddAmbientGroup2 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Ambient Group2"); end end
local OnPress_AddAmbientGroup3 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightAddGroup(agent_currentSelectedAgent, "Ambient Group3"); end end

local textButton_lightRemoveGroup0 = nil; --Group0
local textButton_lightRemoveGroup1 = nil; --Group1
local textButton_lightRemoveGroup2 = nil; --Group2
local textButton_lightRemoveGroup3 = nil; --Group3
local textButton_lightRemoveGroup4 = nil; --Group4
local textButton_lightRemoveGroup5 = nil; --Group5
local textButton_lightRemoveGroup6 = nil; --Group6
local textButton_lightRemoveGroup7 = nil; --Group7
local textButton_lightRemoveAmbientGroup0 = nil; --Ambient Group0
local textButton_lightRemoveAmbientGroup1 = nil; --Ambient Group1
local textButton_lightRemoveAmbientGroup2 = nil; --Ambient Group2
local textButton_lightRemoveAmbientGroup3 = nil; --Ambient Group3

local OnPress_RemoveGroup0 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Group0"); end end
local OnPress_RemoveGroup1 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Group1"); end end
local OnPress_RemoveGroup2 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Group2"); end end
local OnPress_RemoveGroup3 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Group3"); end end
local OnPress_RemoveGroup4 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Group4"); end end
local OnPress_RemoveGroup5 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Group5"); end end
local OnPress_RemoveGroup6 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Group6"); end end
local OnPress_RemoveGroup7 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Group7"); end end
local OnPress_RemoveAmbientGroup0 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Ambient Group0"); end end
local OnPress_RemoveAmbientGroup1 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Ambient Group1"); end end
local OnPress_RemoveAmbientGroup2 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Ambient Group2"); end end
local OnPress_RemoveAmbientGroup3 = function(textButton_button) if(agent_currentSelectedAgent ~= nil) then LightRemoveGroup(agent_currentSelectedAgent, "Ambient Group3"); end end

TLSE_Development_GUI_TabEnvLightInitalize = function()
    label_infoText = TLSE_Development_Editor_GUI_CreateLabel("No Agent selected...", Vector(0.685, 0.515, 0.0));

    booleanPropertyField_lightEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "EnvLight - Enabled", "EnvLight - Enabled", Vector(0.685, 0.515, 0.0), nil);
    booleanPropertyField_lightEnvGroupEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "EnvLight - Enabled Group", "EnvLight - Enabled Group", Vector(0.685, 0.525, 0.0), nil);
    numberPropertyField_lightType = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Type", Vector(0.685, 0.535, 0.0), false, nil, nil);
    numberPropertyField_lightIntensity = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Intensity", Vector(0.685, 0.545, 0.0), true, nil, nil);
    numberPropertyField_lightIntensityDimmer = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Intensity Dimmer", Vector(0.685, 0.555, 0.0), true, nil, nil);
    numberPropertyField_lightIntensitySpecular = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Intensity Specular", Vector(0.685, 0.565, 0.0), true, nil, nil);
    numberPropertyField_lightIntensityDiffuse = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Intensity Diffuse", Vector(0.685, 0.575, 0.0), true, nil, nil);
    numberPropertyField_lightEnlightenIntensity = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Enlighten Intensity", Vector(0.685, 0.585, 0.0), true, nil, nil);
    colorPropertyField_lightColor = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "EnvLight - Color", "EnvLight - Color", Vector(0.685, 0.595, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    numberPropertyField_lightRadius = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Radius", Vector(0.685, 0.635, 0.0), true, nil, nil);
    numberPropertyField_lightDistanceFalloff = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Distance Falloff", Vector(0.685, 0.645, 0.0), true, nil, nil);
    numberPropertyField_lightSpotAngleInner = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Spot Angle Inner", Vector(0.685, 0.655, 0.0), true, nil, nil);
    numberPropertyField_lightSpotAngleOuter = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Spot Angle Outer", Vector(0.685, 0.665, 0.0), true, nil, nil);
    numberPropertyField_lightShadowType = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Type", Vector(0.685, 0.675, 0.0), false, nil, nil);
    numberPropertyField_lightShadowQuality = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Quality", Vector(0.685, 0.685, 0.0), false, nil, nil);
    numberPropertyField_lightShadowSoftness = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Softness", Vector(0.685, 0.695, 0.0), true, nil, nil);
    numberPropertyField_lightShadowNearClip = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Near Clip", Vector(0.685, 0.705, 0.0), true, nil, nil);
    numberPropertyField_lightShadowDepthBias = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Depth Bias", Vector(0.685, 0.715, 0.0), true, nil, nil);
    numberPropertyField_lightShadowModulatedIntensity = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Modulated Intensity", Vector(0.685, 0.725, 0.0), true, nil, nil);
    numberPropertyField_lightShadowMapQualityDistanceScale = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Map Quality Distance Scale", Vector(0.685, 0.735, 0.0), true, nil, nil);
    numberPropertyField_lightWrap = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Wrap", Vector(0.685, 0.745, 0.0), true, nil, nil);
    numberPropertyField_lightOpacity = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Opacity", Vector(0.685, 0.755, 0.0), true, nil, nil);
    numberPropertyField_lightMobility = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Mobility", Vector(0.685, 0.765, 0.0), false, nil, nil);
    numberPropertyField_lightPriority = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Priority", Vector(0.685, 0.775, 0.0), false, nil, nil);
    numberPropertyField_lightHBAOParticipationType = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - HBAO Participation Type", Vector(0.685, 0.785, 0.0), false, nil, nil);
    numberPropertyField_lightBakeAllowedOnStatic = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Bake Allowed on Static", Vector(0.685, 0.795, 0.0), false, nil, nil);
    numberPropertyField_lightVisibleThresholdScale = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Visible Threshold Scale", Vector(0.685, 0.805, 0.0), true, nil, nil);
    numberPropertyField_lightLODBehavior = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - LOD Behavior", Vector(0.685, 0.815, 0.0), false, nil, nil);
    numberPropertyField_lightNPRBanding = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - NPR Banding", Vector(0.685, 0.825, 0.0), true, nil, nil);

    textButton_lightForceShadowType0 = TLSE_Development_Editor_GUI_CreateTextButton("[FORCE SHADOW OFF]", false, Vector(0.685, 0.845, 0.0), OnPress_ForceShadowCastingType0, nil);
    textButton_lightForceShadowType1 = TLSE_Development_Editor_GUI_CreateTextButton("[FORCE SHADOW ON (STATIC)]", false, Vector(0.685, 0.855, 0.0), OnPress_ForceShadowCastingType1, nil);
    textButton_lightForceShadowType2 = TLSE_Development_Editor_GUI_CreateTextButton("[FORCE SHADOW ON (PER LIGHT)]", false, Vector(0.685, 0.865, 0.0), OnPress_ForceShadowCastingType2, nil);
    textButton_lightForceShadowType3 = TLSE_Development_Editor_GUI_CreateTextButton("[FORCE SHADOW ON (MODULATED)]", false, Vector(0.685, 0.875, 0.0), OnPress_ForceShadowCastingType3, nil);

    textButton_lightSetDiffuseSpecularTo1 = TLSE_Development_Editor_GUI_CreateTextButton("[SET DIFFUSE/SPECULAR TO 1]", false, Vector(0.685, 0.885, 0.0), OnPress_SetDiffuseSpecularTo1, nil);
    textButton_lightSetDiffuseTo0 = TLSE_Development_Editor_GUI_CreateTextButton("[SET DIFFUSE TO 0]", false, Vector(0.685, 0.895, 0.0), OnPress_SetDiffuseTo0, nil);
    textButton_lightSetSpecularTo0 = TLSE_Development_Editor_GUI_CreateTextButton("[SET SPECULAR TO 0]", false, Vector(0.685, 0.905, 0.0), OnPress_SetSpecularTo0, nil);
    
    --textButton_lightAddGroup0 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD GROUP0]", false, Vector(0.685, 0.865, 0.0), OnPress_AddGroup0, nil);
    --textButton_lightAddGroup1 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD GROUP1]", false, Vector(0.685, 0.875, 0.0), OnPress_AddGroup1, nil);
    --textButton_lightAddGroup2 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD GROUP2]", false, Vector(0.685, 0.885, 0.0), OnPress_AddGroup2, nil);
    --textButton_lightAddGroup3 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD GROUP3]", false, Vector(0.685, 0.895, 0.0), OnPress_AddGroup3, nil);
    --textButton_lightAddGroup4 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD GROUP4]", false, Vector(0.685, 0.905, 0.0), OnPress_AddGroup4, nil);
    --textButton_lightAddGroup5 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD GROUP5]", false, Vector(0.685, 0.915, 0.0), OnPress_AddGroup5, nil);
    --textButton_lightAddGroup6 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD GROUP6]", false, Vector(0.685, 0.925, 0.0), OnPress_AddGroup6, nil);
    --textButton_lightAddGroup7 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD GROUP7]", false, Vector(0.685, 0.935, 0.0), OnPress_AddGroup7, nil);
    --textButton_lightAddAmbientGroup0 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD AMBIENT GROUP0]", false, Vector(0.685, 0.945, 0.0), OnPress_AddAmbientGroup0, nil);
    --textButton_lightAddAmbientGroup1 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD AMBIENT GROUP0]", false, Vector(0.685, 0.955, 0.0), OnPress_AddAmbientGroup1, nil);
    --textButton_lightAddAmbientGroup2 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD AMBIENT GROUP0]", false, Vector(0.685, 0.965, 0.0), OnPress_AddAmbientGroup2, nil);
    --textButton_lightAddAmbientGroup3 = TLSE_Development_Editor_GUI_CreateTextButton("[ADD AMBIENT GROUP0]", false, Vector(0.685, 0.975, 0.0), OnPress_AddAmbientGroup3, nil);

    --label_groupInfo = TLSE_Development_Editor_GUI_CreateLabel("Groups", Vector(0.685, 0.885, 0.0));
end

TLSE_Development_GUI_TabEnvLightUpdate = function()
    local bool_propertiesActive = TLSE_Development_GUI_EnvLightTabActive;

    label_infoText["Visible"] = TLSE_Development_GUI_EnvLightTabActive;

    if(agent_currentSelectedAgent == nil) then
        label_infoText["Text"] = "No Agent selected...";
        bool_propertiesActive = false;
    elseif(agent_currentSelectedAgent ~= nil) and (TLSE_AgentIsLight(agent_currentSelectedAgent) == false) then
        label_infoText["Text"] = "Agent Selected, but no EnvLight properties were found...";
        bool_propertiesActive = false;
    else
        label_infoText["Text"] = "";
        label_infoText["Visible"] = false;
    end

    colorPropertyField_lightColor["Visible"] = bool_propertiesActive;
    booleanPropertyField_lightEnabled["Visible"] = bool_propertiesActive;
    booleanPropertyField_lightEnvGroupEnabled["Visible"] = bool_propertiesActive;
    numberPropertyField_lightType["Visible"] = bool_propertiesActive;
    numberPropertyField_lightIntensity["Visible"] = bool_propertiesActive;
    numberPropertyField_lightIntensityDimmer["Visible"] = bool_propertiesActive;
    numberPropertyField_lightIntensitySpecular["Visible"] = bool_propertiesActive;
    numberPropertyField_lightIntensityDiffuse["Visible"] = bool_propertiesActive;
    numberPropertyField_lightEnlightenIntensity["Visible"] = bool_propertiesActive;
    numberPropertyField_lightRadius["Visible"] = bool_propertiesActive;
    numberPropertyField_lightDistanceFalloff["Visible"] = bool_propertiesActive;
    numberPropertyField_lightSpotAngleInner["Visible"] = bool_propertiesActive;
    numberPropertyField_lightSpotAngleOuter["Visible"] = bool_propertiesActive;
    numberPropertyField_lightShadowType["Visible"] = bool_propertiesActive;
    numberPropertyField_lightShadowQuality["Visible"] = bool_propertiesActive;
    numberPropertyField_lightShadowSoftness["Visible"] = bool_propertiesActive;
    numberPropertyField_lightShadowNearClip["Visible"] = bool_propertiesActive;
    numberPropertyField_lightShadowDepthBias["Visible"] = bool_propertiesActive;
    numberPropertyField_lightShadowModulatedIntensity["Visible"] = bool_propertiesActive;
    numberPropertyField_lightShadowMapQualityDistanceScale["Visible"] = bool_propertiesActive;
    numberPropertyField_lightWrap["Visible"] = bool_propertiesActive;
    numberPropertyField_lightOpacity["Visible"] = bool_propertiesActive;
    numberPropertyField_lightMobility["Visible"] = bool_propertiesActive;
    numberPropertyField_lightPriority["Visible"] = bool_propertiesActive;
    numberPropertyField_lightHBAOParticipationType["Visible"] = bool_propertiesActive;
    numberPropertyField_lightBakeAllowedOnStatic["Visible"] = bool_propertiesActive;
    numberPropertyField_lightVisibleThresholdScale["Visible"] = bool_propertiesActive;
    numberPropertyField_lightLODBehavior["Visible"] = bool_propertiesActive;
    numberPropertyField_lightNPRBanding["Visible"] = bool_propertiesActive;
    textButton_lightForceShadowType0["Visible"] = bool_propertiesActive;
    textButton_lightForceShadowType1["Visible"] = bool_propertiesActive;
    textButton_lightForceShadowType2["Visible"] = bool_propertiesActive;
    textButton_lightForceShadowType3["Visible"] = bool_propertiesActive;
    textButton_lightSetDiffuseSpecularTo1["Visible"] = bool_propertiesActive;
    textButton_lightSetDiffuseTo0["Visible"] = bool_propertiesActive;
    textButton_lightSetSpecularTo0["Visible"] = bool_propertiesActive;

    if(bool_propertiesActive == false) then return end

    colorPropertyField_lightColor["ReferenceAgent"] = agent_currentSelectedAgent;
    booleanPropertyField_lightEnabled["ReferenceAgent"] = agent_currentSelectedAgent;
    booleanPropertyField_lightEnvGroupEnabled["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightType["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightIntensity["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightIntensityDimmer["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightIntensitySpecular["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightIntensityDiffuse["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightEnlightenIntensity["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightRadius["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightDistanceFalloff["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightSpotAngleInner["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightSpotAngleOuter["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowType["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowQuality["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowSoftness["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowNearClip["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowDepthBias["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowModulatedIntensity["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowMapQualityDistanceScale["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightWrap["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightOpacity["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightMobility["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightPriority["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightHBAOParticipationType["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightBakeAllowedOnStatic["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightVisibleThresholdScale["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightLODBehavior["ReferenceAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightNPRBanding["ReferenceAgent"] = agent_currentSelectedAgent;
end