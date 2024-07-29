--[FX COLOR] 7
local tab7_boolProperty1 = nil; --(boolean) FX Color Enabled
local tab7_colorProperty2 = nil; --(Color) FX Color Tint
local tab7_numberProperty3 = nil; --(number) FX Color Opacity

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

--[FX COLOR] 7
TLSE_TabSceneProperties_OnToggle_Tab7Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Color Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Color Opacity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Color Opacity", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab7Initalize = function()
    --[FX COLOR] 7
    tab7_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Color Enabled", "FX Color Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab7Property1);
    tab7_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "FX Color Tint", "FX Color Tint", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_A);
    tab7_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Color Opacity", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab7Property3, TLSE_TabSceneProperties_OnDecrease_Tab7Property3);
end

TLSE_Development_GUI_TabSceneProperties_Tab7Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab7";

    --[FX COLOR] 7
    tab7_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab7_colorProperty2["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab7_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[FX COLOR] 7
    tab7_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab7_colorProperty2["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab7_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end