--[REFLECTION] 17
local tab17_boolProperty1 = nil; --(boolean) LightEnv Reflection Enabled
local tab17_numberProperty2 = nil; --(number) LightEnv Reflection Intensity
local tab17_numberProperty3 = nil; --(number) LightEnv Reflection Intensity Shadow
local tab17_colorProperty4 = nil; --(Color) LightEnv Reflection Tint
local tab17_labelProperty5 = nil; --(String) LightEnv Reflection Texture

local numberPropertyFieldAdjustmentValue = 1;

local ModifiyNumberPropertyValueOnAgent = function(string_property, number_adjustment, bool_multiplyByFrameTime)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local number_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            if(bool_multiplyByFrameTime) then
                number_originalValue = number_originalValue + (number_adjustment * GetFrameTime());
            else
                number_originalValue = number_originalValue + number_adjustment;
            end

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, number_originalValue);
        end
    end
end

local ModifiyBooleanPropertyValueOnAgent = function(string_property)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local number_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            number_originalValue = not number_originalValue;

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, number_originalValue);
        end
    end
end

local ModifiyColorPropertyValueOnAgent = function(string_property, number_channel, number_adjustment, bool_clamp01)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local color_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

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

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, color_originalValue);
        end
    end
end

--[REFLECTION] 17
TLSE_TabSceneProperties_OnToggle_Tab17Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("LightEnv Reflection Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Reflection Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Reflection Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Reflection Intensity Shadow", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Reflection Intensity Shadow", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 3, -numberPropertyFieldAdjustmentValue, true); end

TLSE_Development_GUI_TabSceneProperties_Tab17Initalize = function()
    --[REFLECTION] 17
    tab17_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Reflection Enabled", "LightEnv Reflection Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab17Property1);
    tab17_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Reflection Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property2, TLSE_TabSceneProperties_OnDecrease_Tab17Property2);
    tab17_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Reflection Intensity Shadow", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property3, TLSE_TabSceneProperties_OnDecrease_Tab17Property3);
    tab17_colorProperty4 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Reflection Tint", "LightEnv Reflection Tint", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_R, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_G, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_B, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_A, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_R, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_G, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_B, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_A);
    tab17_labelProperty5 = TLSE_Development_Editor_GUI_CreateLabel("LightEnv Reflection Texture", Vector(0.685, 0.655, 0.0));
end

TLSE_Development_GUI_TabSceneProperties_Tab17Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab17";

    --[REFLECTION] 17
    tab17_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab17_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab17_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab17_colorProperty4["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab17_labelProperty5["LabelVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[REFLECTION] 17
    tab17_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab17_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab17_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab17_colorProperty4["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, "LightEnv Reflection Texture")) then
            local string_reflectionTexture = AgentGetProperty(TLSE_Development_SceneAgent, "LightEnv Reflection Texture");
            tab17_labelProperty5["LabelText"] = "LightEnv Reflection Texture: " .. tostring(string_reflectionTexture);
        else
            tab17_labelProperty5["LabelText"] = "LightEnv Reflection Texture: nil";
        end
    else
        tab17_labelProperty5["LabelText"] = "LightEnv Reflection Texture: nil";
    end
end