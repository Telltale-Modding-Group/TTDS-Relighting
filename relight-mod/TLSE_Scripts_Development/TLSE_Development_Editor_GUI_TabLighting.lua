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

local numberPropertyFieldAdjustmentValue = 1;

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

local ModifiyNumberPropertyValueOnAgent = function(agent_main, string_property, number_adjustment, bool_multiplyByFrameTime)
    if(agent_main ~= nil) then
        if(AgentHasProperty(agent_main, string_property)) then
            local number_originalValue = AgentGetProperty(agent_main, string_property);

            if(bool_multiplyByFrameTime) then
                number_originalValue = number_originalValue + (number_adjustment * GetFrameTime());
            else
                number_originalValue = number_originalValue + number_adjustment;
            end

            AgentSetProperty(agent_main, string_property, number_originalValue);
        end
    end
end

local ModifiyBooleanPropertyValueOnAgent = function(agent_main, string_property)
    if(agent_main ~= nil) then
        if(AgentHasProperty(agent_main, string_property)) then
            local number_originalValue = AgentGetProperty(agent_main, string_property);

            number_originalValue = not number_originalValue;

            AgentSetProperty(agent_main, string_property, number_originalValue);
        end
    end
end

local ModifiyColorChannelPropertyValueOnAgent = function(agent_main, string_property, number_channel, number_adjustment, bool_clamp01)
    if(agent_main ~= nil) then
        if(AgentHasProperty(agent_main, string_property)) then
            local color_originalValue = AgentGetProperty(agent_main, string_property);

            if(number_channel == 0) then
                color_originalValue.r = color_originalValue.r + number_adjustment;
            elseif(number_channel == 1) then
                color_originalValue.g = color_originalValue.g + number_adjustment;
            elseif(number_channel == 2) then
                color_originalValue.b = color_originalValue.b + number_adjustment;
            elseif(number_channel == 3) then
                color_originalValue.a = color_originalValue.a + number_adjustment;
            end

            if(bool_clamp01) then
                color_originalValue = TLSE_ColorClamp01(color_originalValue);
            end

            AgentSetProperty(agent_main, string_property, color_originalValue);
        end
    end
end

local OnIncrease_EnvLightType = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Type", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_EnvLightType = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Type", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_EnvLightIntensity = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Intensity", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightIntensity = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Intensity", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightIntensityDimmer = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Intensity Dimmer", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightIntensityDimmer = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Intensity Dimmer", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightIntensitySpecular = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Intensity Specular", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightIntensitySpecular = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Intensity Specular", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightIntensityDiffuse = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Intensity Diffuse", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightIntensityDiffuse = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Intensity Diffuse", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightEnlightenIntensity = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Enlighten Intensity", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightEnlightenIntensity = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Enlighten Intensity", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightRadius = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Radius", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightRadius = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Radius", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightDistanceFalloff = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Distance Falloff", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightDistanceFalloff = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Distance Falloff", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightSpotAngleInner = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Spot Angle Inner", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightSpotAngleInner = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Spot Angle Inner", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightSpotAngleOuter = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Spot Angle Outer", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightSpotAngleOuter = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Spot Angle Outer", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightShadowType = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Type", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_EnvLightShadowType = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Type", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_EnvLightShadowQuality = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Quality", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_EnvLightShadowQuality = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Quality", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_EnvLightShadowSoftness = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Softness", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightShadowSoftness = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Softness", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightShadowNearClip = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Near Clip", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightShadowNearClip = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Near Clip", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightShadowDepthBias = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Depth Bias", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightShadowDepthBias = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Depth Bias", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightShadowModulatedIntensity = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Modulated Intensity", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightShadowModulatedIntensity = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Modulated Intensity", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightShadowMapQualityDistanceScale = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Map Quality Distance Scale", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightShadowMapQualityDistanceScale = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Shadow Map Quality Distance Scale", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightWrap = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Wrap", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightWrap = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Wrap", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightOpacity = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Opacity", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightOpacity = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Opacity", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightMobility = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Mobility", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_EnvLightMobility = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Mobility", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_EnvLightPriority = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Priority", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_EnvLightPriority = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Priority", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_EnvLightHBAOParticipationType = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - HBAO Participation Type", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_EnvLightHBAOParticipationType = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - HBAO Participation Type", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_EnvLightBakeAllowedOnStatic = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Bake Allowed on Static", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_EnvLightBakeAllowedOnStatic = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Bake Allowed on Static", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_EnvLightVisibleThresholdScale = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Visible Threshold Scale", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightVisibleThresholdScale = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Visible Threshold Scale", -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightLODBehavior = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - LOD Behavior", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_EnvLightLODBehavior = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - LOD Behavior", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_EnvLightNPRBanding = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - NPR Banding", numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightNPRBanding = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - NPR Banding", -numberPropertyFieldAdjustmentValue, true);
end

local OnToggle_EnvLightEnabled = function(textButton_button)
    ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Enabled");
end

local OnToggle_EnvLightEnabledGroup = function(textButton_button)
    ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Enabled Group");
end

local OnIncrease_EnvLightColorR = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Color", 0, numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightColorR = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Color", 0, -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightColorG = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Color", 1, numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightColorG = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Color", 1, -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightColorB = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Color", 2, numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightColorB = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Color", 2, -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_EnvLightColorA = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Color", 3, numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_EnvLightColorA = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "EnvLight - Color", 3, -numberPropertyFieldAdjustmentValue, true);
end

TLSE_Development_GUI_TabLightingInitalize = function()
    booleanPropertyField_lightEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "EnvLight - Enabled", "EnvLight - Enabled", Vector(0.685, 0.515, 0.0), OnToggle_EnvLightEnabled);
    booleanPropertyField_lightEnvGroupEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "EnvLight - Enabled Group", "EnvLight - Enabled Group", Vector(0.685, 0.525, 0.0), OnToggle_EnvLightEnabledGroup);
    numberPropertyField_lightType = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Type", Vector(0.685, 0.535, 0.0), false, OnIncrease_EnvLightType, OnDecrease_EnvLightType);
    numberPropertyField_lightIntensity = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Intensity", Vector(0.685, 0.545, 0.0), true, OnIncrease_EnvLightIntensity, OnDecrease_EnvLightIntensity);
    numberPropertyField_lightIntensityDimmer = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Intensity Dimmer", Vector(0.685, 0.555, 0.0), true, OnIncrease_EnvLightIntensityDimmer, OnDecrease_EnvLightIntensityDimmer);
    numberPropertyField_lightIntensitySpecular = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Intensity Specular", Vector(0.685, 0.565, 0.0), true, OnIncrease_EnvLightIntensitySpecular, OnDecrease_EnvLightIntensitySpecular);
    numberPropertyField_lightIntensityDiffuse = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Intensity Diffuse", Vector(0.685, 0.575, 0.0), true, OnIncrease_EnvLightIntensityDiffuse, OnDecrease_EnvLightIntensityDiffuse);
    numberPropertyField_lightEnlightenIntensity = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Enlighten Intensity", Vector(0.685, 0.585, 0.0), true, OnIncrease_EnvLightEnlightenIntensity, OnDecrease_EnvLightEnlightenIntensity);
    colorPropertyField_lightColor = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "EnvLight - Color", "EnvLight - Color", Vector(0.685, 0.595, 0.0), true, OnIncrease_EnvLightColorR, OnIncrease_EnvLightColorG, OnIncrease_EnvLightColorB, OnIncrease_EnvLightColorA, OnDecrease_EnvLightColorR, OnDecrease_EnvLightColorG, OnDecrease_EnvLightColorB, OnDecrease_EnvLightColorA);
    numberPropertyField_lightRadius = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Radius", Vector(0.685, 0.635, 0.0), true, OnIncrease_EnvLightRadius, OnDecrease_EnvLightRadius);
    numberPropertyField_lightDistanceFalloff = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Distance Falloff", Vector(0.685, 0.645, 0.0), true, OnIncrease_EnvLightDistanceFalloff, OnDecrease_EnvLightDistanceFalloff);
    numberPropertyField_lightSpotAngleInner = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Spot Angle Inner", Vector(0.685, 0.655, 0.0), true, OnIncrease_EnvLightSpotAngleInner, OnDecrease_EnvLightSpotAngleInner);
    numberPropertyField_lightSpotAngleOuter = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Spot Angle Outer", Vector(0.685, 0.665, 0.0), true, OnIncrease_EnvLightSpotAngleOuter, OnDecrease_EnvLightSpotAngleOuter);
    numberPropertyField_lightShadowType = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Type", Vector(0.685, 0.675, 0.0), false, OnIncrease_EnvLightShadowType, OnDecrease_EnvLightShadowType);
    numberPropertyField_lightShadowQuality = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Quality", Vector(0.685, 0.685, 0.0), false, OnIncrease_EnvLightShadowQuality, OnDecrease_EnvLightShadowQuality);
    numberPropertyField_lightShadowSoftness = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Softness", Vector(0.685, 0.695, 0.0), true, OnIncrease_EnvLightShadowSoftness, OnDecrease_EnvLightShadowSoftness);
    numberPropertyField_lightShadowNearClip = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Near Clip", Vector(0.685, 0.705, 0.0), true, OnIncrease_EnvLightShadowNearClip, OnDecrease_EnvLightShadowNearClip);
    numberPropertyField_lightShadowDepthBias = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Depth Bias", Vector(0.685, 0.715, 0.0), true, OnIncrease_EnvLightShadowDepthBias, OnDecrease_EnvLightShadowDepthBias);
    numberPropertyField_lightShadowModulatedIntensity = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Modulated Intensity", Vector(0.685, 0.725, 0.0), true, OnIncrease_EnvLightShadowModulatedIntensity, OnDecrease_EnvLightShadowModulatedIntensity);
    numberPropertyField_lightShadowMapQualityDistanceScale = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Shadow Map Quality Distance Scale", Vector(0.685, 0.735, 0.0), true, OnIncrease_EnvLightShadowMapQualityDistanceScale, OnDecrease_EnvLightShadowMapQualityDistanceScale);
    numberPropertyField_lightWrap = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Wrap", Vector(0.685, 0.745, 0.0), true, OnIncrease_EnvLightWrap, OnDecrease_EnvLightWrap);
    numberPropertyField_lightOpacity = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Opacity", Vector(0.685, 0.755, 0.0), true, OnIncrease_EnvLightOpacity, OnDecrease_EnvLightOpacity);
    numberPropertyField_lightMobility = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Mobility", Vector(0.685, 0.765, 0.0), false, OnIncrease_EnvLightMobility, OnDecrease_EnvLightMobility);
    numberPropertyField_lightPriority = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Priority", Vector(0.685, 0.775, 0.0), false, OnIncrease_EnvLightPriority, OnDecrease_EnvLightPriority);
    numberPropertyField_lightHBAOParticipationType = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - HBAO Participation Type", Vector(0.685, 0.785, 0.0), false, OnIncrease_EnvLightHBAOParticipationType, OnDecrease_EnvLightHBAOParticipationType);
    numberPropertyField_lightBakeAllowedOnStatic = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Bake Allowed on Static", Vector(0.685, 0.795, 0.0), false, OnIncrease_EnvLightBakeAllowedOnStatic, OnDecrease_EnvLightBakeAllowedOnStatic);
    numberPropertyField_lightVisibleThresholdScale = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - Visible Threshold Scale", Vector(0.685, 0.805, 0.0), true, OnIncrease_EnvLightVisibleThresholdScale, OnDecrease_EnvLightVisibleThresholdScale);
    numberPropertyField_lightLODBehavior = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - LOD Behavior", Vector(0.685, 0.815, 0.0), false, OnIncrease_EnvLightLODBehavior, OnDecrease_EnvLightLODBehavior);
    numberPropertyField_lightNPRBanding = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "EnvLight - NPR Banding", Vector(0.685, 0.825, 0.0), true, OnIncrease_EnvLightNPRBanding, OnDecrease_EnvLightNPRBanding);

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

TLSE_Development_GUI_TabLightingUpdate = function()
    local bool_lightingTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Lighting";
    
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    colorPropertyField_lightColor["ColorPropertyFieldAgent"] = agent_currentSelectedAgent;

    booleanPropertyField_lightEnabled["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    booleanPropertyField_lightEnvGroupEnabled["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;

    numberPropertyField_lightType["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightIntensity["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightIntensityDimmer["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightIntensitySpecular["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightIntensityDiffuse["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightEnlightenIntensity["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightRadius["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightDistanceFalloff["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightSpotAngleInner["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightSpotAngleOuter["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowType["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowQuality["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowSoftness["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowNearClip["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowDepthBias["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowModulatedIntensity["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightShadowMapQualityDistanceScale["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightWrap["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightOpacity["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightMobility["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightPriority["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightHBAOParticipationType["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightBakeAllowedOnStatic["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightVisibleThresholdScale["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightLODBehavior["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberPropertyField_lightNPRBanding["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;

    colorPropertyField_lightColor["ColorFieldVisible"] = bool_lightingTabActive;

    booleanPropertyField_lightEnabled["BooleanPropertyFieldVisible"] = bool_lightingTabActive;
    booleanPropertyField_lightEnvGroupEnabled["BooleanPropertyFieldVisible"] = bool_lightingTabActive;

    numberPropertyField_lightType["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightIntensity["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightIntensityDimmer["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightIntensitySpecular["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightIntensityDiffuse["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightEnlightenIntensity["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightRadius["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightDistanceFalloff["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightSpotAngleInner["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightSpotAngleOuter["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightShadowType["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightShadowQuality["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightShadowSoftness["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightShadowNearClip["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightShadowDepthBias["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightShadowModulatedIntensity["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightShadowMapQualityDistanceScale["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightWrap["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightOpacity["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightMobility["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightPriority["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightHBAOParticipationType["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightBakeAllowedOnStatic["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightVisibleThresholdScale["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightLODBehavior["NumberPropertyFieldVisible"] = bool_lightingTabActive;
    numberPropertyField_lightNPRBanding["NumberPropertyFieldVisible"] = bool_lightingTabActive;

    textButton_lightForceShadowType0["TextButtonVisible"] = bool_lightingTabActive;
    textButton_lightForceShadowType1["TextButtonVisible"] = bool_lightingTabActive;
    textButton_lightForceShadowType2["TextButtonVisible"] = bool_lightingTabActive;
    textButton_lightForceShadowType3["TextButtonVisible"] = bool_lightingTabActive;
    textButton_lightSetDiffuseSpecularTo1["TextButtonVisible"] = bool_lightingTabActive;
    textButton_lightSetDiffuseTo0["TextButtonVisible"] = bool_lightingTabActive;
    textButton_lightSetSpecularTo0["TextButtonVisible"] = bool_lightingTabActive;
end