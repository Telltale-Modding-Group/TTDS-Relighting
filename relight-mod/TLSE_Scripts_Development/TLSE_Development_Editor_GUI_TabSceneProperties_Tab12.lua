--[FX VIGNETTE] 12
local tab12_boolProperty1 = nil; --(boolean) FX Vignette Tint Enabled
local tab12_colorProperty2 = nil; --(Color) FX Vignette Tint
local tab12_numberProperty3 = nil; --(number) FX Vignette Falloff
local tab12_numberProperty4 = nil; --(number) FX Vignette Center
local tab12_numberProperty5 = nil; --(number) FX Vignette Corners

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

--[FX VIGNETTE] 12
TLSE_TabSceneProperties_OnToggle_Tab12Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Vignette Tint Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Center", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Center", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Corners", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Corners", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab12Initalize = function()
    --[FX VIGNETTE] 12
    tab12_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Vignette Tint Enabled", "FX Vignette Tint Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab12Property1);
    tab12_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "FX Vignette Tint", "FX Vignette Tint", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_A);
    tab12_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Falloff", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property3, TLSE_TabSceneProperties_OnDecrease_Tab12Property3);
    tab12_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Center", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property4, TLSE_TabSceneProperties_OnDecrease_Tab12Property4);
    tab12_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Corners", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property5, TLSE_TabSceneProperties_OnDecrease_Tab12Property5);
end

TLSE_Development_GUI_TabSceneProperties_Tab12Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab12";

    --[FX VIGNETTE] 12
    tab12_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab12_colorProperty2["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab12_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab12_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab12_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[FX VIGNETTE] 12
    tab12_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab12_colorProperty2["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end