TLSE_Enum_TonemapType_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 1) then
        stringValue = stringValue .. "eTonemapType_Default";
    elseif (valueType == 2) then
        stringValue = stringValue .. "eTonemapType_Filmic";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

TLSE_Enum_T3LightEnvType_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 0) then
        stringValue = stringValue .. "eLightEnvType_Point";
    elseif (valueType == 1) then
        stringValue = stringValue .. "eLightEnvType_Spot";
    elseif (valueType == 2) then
        stringValue = stringValue .. "eLightEnvType_DirectionalKey";
    elseif (valueType == 3) then
        stringValue = stringValue .. "eLightEnvType_Ambient";
    elseif (valueType == 4) then
        stringValue = stringValue .. "eLightEnvType_DirectionalAmbient";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

TLSE_Enum_T3LightEnvShadowType_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 0) then
        stringValue = stringValue .. "eLightEnvShadowType_None";
    elseif (valueType == 1) then
        stringValue = stringValue .. "eLightEnvShadowType_Static_Depreceated";
    elseif (valueType == 2) then
        stringValue = stringValue .. "eLightEnvShadowType_PerLight";
    elseif (valueType == 3) then
        stringValue = stringValue .. "eLightEnvShadowType_Modulated";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

TLSE_Enum_T3LightEnvShadowQuality_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 0) then
        stringValue = stringValue .. "eLightEnvShadowQuality_Low";
    elseif (valueType == 1) then
        stringValue = stringValue .. "eLightEnvShadowQuality_Medium";
    elseif (valueType == 2) then
        stringValue = stringValue .. "eLightEnvShadowQuality_High";
    elseif (valueType == 3) then
        stringValue = stringValue .. "eLightEnvShadowQuality_MAX";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

TLSE_Enum_T3LightEnvLODBehavior_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 0) then
        stringValue = stringValue .. "eLightEnvLOD_Disable";
    elseif (valueType == 1) then
        stringValue = stringValue .. "eLightEnvLOD_BakeOnly";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

TLSE_Enum_HBAOParticipationType_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 0) then
        stringValue = stringValue .. "eHBAOParticipationTypeAuto";
    elseif (valueType == 1) then
        stringValue = stringValue .. "eHBAOParticipationTypeForceOn";
    elseif (valueType == 2) then
        stringValue = stringValue .. "eHBAOParticipationTypeForceOff";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

TLSE_Enum_T3LightEnvEnlightenBakeBehavior_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 0) then
        stringValue = stringValue .. "eLightEnvEnlightenBake_Auto";
    elseif (valueType == 1) then
        stringValue = stringValue .. "eLightEnvEnlightenBake_Enable";
    elseif (valueType == 2) then
        stringValue = stringValue .. "eLightEnvEnlightenBake_Disable";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

TLSE_Enum_T3LightEnvMobility_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 0) then
        stringValue = stringValue .. "eLightEnvMobility_Static";
    elseif (valueType == 1) then
        stringValue = stringValue .. "eLightEnvMobility_Stationary";
    elseif (valueType == 2) then
        stringValue = stringValue .. "eLightEnvMobility_Moveable";
    elseif (valueType == 3) then
        stringValue = stringValue .. "eLightEnvMobility_Count";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

TLSE_Enum_T3LightEnvGroup_ToString = function(valueType)
    local stringValue = "";

    if (valueType == 0) then
        stringValue = stringValue .. "eLightEnvGroup_Group0";
    elseif (valueType == 1) then
        stringValue = stringValue .. "eLightEnvGroup_Group1";
    elseif (valueType == 2) then
        stringValue = stringValue .. "eLightEnvGroup_Group2";
    elseif (valueType == 3) then
        stringValue = stringValue .. "eLightEnvGroup_Group3";
    elseif (valueType == 4) then
        stringValue = stringValue .. "eLightEnvGroup_Group4";
    elseif (valueType == 5) then
        stringValue = stringValue .. "eLightEnvGroup_Group5";
    elseif (valueType == 6) then
        stringValue = stringValue .. "eLightEnvGroup_Group6";
    elseif (valueType == 7) then
        stringValue = stringValue .. "eLightEnvGroup_Group7";
    elseif (valueType == 8) then
        stringValue = stringValue .. "eLightEnvGroup_CountWithNoAmbient";
    elseif (valueType == 8) then
        stringValue = stringValue .. "eLightEnvGroup_Group8_Unused";
    elseif (valueType == 9) then
        stringValue = stringValue .. "eLightEnvGroup_Group9_Unused";
    elseif (valueType == 10) then
        stringValue = stringValue .. "eLightEnvGroup_Group10_Unused";
    elseif (valueType == 11) then
        stringValue = stringValue .. "eLightEnvGroup_Group11_Unused";
    elseif (valueType == 12) then
        stringValue = stringValue .. "eLightEnvGroup_Group12_Unused";
    elseif (valueType == 13) then
        stringValue = stringValue .. "eLightEnvGroup_Group13_Unused";
    elseif (valueType == 14) then
        stringValue = stringValue .. "eLightEnvGroup_Group14_Unused";
    elseif (valueType == 15) then
        stringValue = stringValue .. "eLightEnvGroup_Group15_Unused";
    elseif (valueType == 16) then
        stringValue = stringValue .. "eLightEnvGroup_AmbientGroup0";
    elseif (valueType == 17) then
        stringValue = stringValue .. "eLightEnvGroup_AmbientGroup1";
    elseif (valueType == 18) then
        stringValue = stringValue .. "eLightEnvGroup_AmbientGroup2";
    elseif (valueType == 19) then
        stringValue = stringValue .. "eLightEnvGroup_AmbientGroup3";
    elseif (valueType == 20) then
        stringValue = stringValue .. "eLightEnvGroup_Count";
    elseif (valueType == 4294967294) then
        stringValue = stringValue .. "eLightEnvGroup_None";
    elseif (valueType == 4294967295) then
        stringValue = stringValue .. "eLightEnvGroup_Default";
    end

    stringValue = stringValue .. " ( " .. tostring(valueType) .. " )";
    
    return stringValue;
end

--prints a number to a string
--now with the way this telltale lua is...
--some of these numbers also obviously represent enums, this function encapsulates those different enums
--if and only if the property name matches, if not then its just a regular number value
TLSE_Number_ToString = function(propertyName, propertyValue)
    local stringValue = "";

    if (propertyName == "EnvLight - Type") then
        stringValue = stringValue .. TLSE_Enum_T3LightEnvType_ToString(propertyValue);
    elseif (propertyName == "EnvLight - HBAO Participation Type") then
        stringValue = stringValue .. TLSE_Enum_HBAOParticipationType_ToString(propertyValue);
    elseif (propertyName == "EnvLight - Mobility") then
        stringValue = stringValue .. TLSE_Enum_T3LightEnvMobility_ToString(propertyValue);
    elseif (propertyName == "EnvLight - Shadow Type") then
        stringValue = stringValue .. TLSE_Enum_T3LightEnvShadowType_ToString(propertyValue);
    elseif (propertyName == "EnvLight - Shadow Quality") then
        stringValue = stringValue .. TLSE_Enum_T3LightEnvShadowQuality_ToString(propertyValue);
    else
        stringValue = stringValue .. tostring(propertyValue);
    end

    return stringValue;
end