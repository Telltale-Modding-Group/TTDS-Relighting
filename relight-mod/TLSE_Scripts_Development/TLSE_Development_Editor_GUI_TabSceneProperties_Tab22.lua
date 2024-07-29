--[MISC] 22
local tab22_boolProperty1 = nil; --(boolean) After Effects Enabled
local tab22_boolProperty2 = nil; --(boolean) HDR lightmaps Enabled
local tab22_numberProperty3 = nil; --(number) HDR lightmaps Intensity
local tab22_numberProperty4 = nil; --(number) FX Noise Scale
local tab22_colorProperty5 = nil; --(Color) Ambient Color
local tab22_colorProperty6 = nil; --(Color) Shadow Color
local tab22_numberProperty7 = nil; --(number) FX Force Linear Depth Offset
local tab22_numberProperty8 = nil; --(number) HDR - Paper White Nits
local tab22_boolProperty9 = nil; --(boolean) LightEnv Bake Enabled
local tab22_boolProperty10 = nil; --(boolean) LightEnv Enabled
local tab22_numberProperty11 = nil; --(number) LightEnv Intensity
local tab22_numberProperty12 = nil; --(number) LightEnv Saturation
local tab22_colorProperty13 = nil; --(Color) LightEnv Tint
local tab22_colorProperty14 = nil; --(Color) LightEnv Background Color
local tab22_numberProperty15 = nil; --(number) LightEnv Probe Resolution XZ
local tab22_numberProperty16 = nil; --(number) LightEnv Probe Resolution Y

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

--[MISC] 22
TLSE_TabSceneProperties_OnToggle_Tab22Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("After Effects Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("HDR lightmaps Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property9 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("LightEnv Bake Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property10 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("LightEnv Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HDR lightmaps Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HDR lightmaps Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Noise Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Noise Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Force Linear Depth Offset", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Force Linear Depth Offset", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HDR - Paper White Nits", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HDR - Paper White Nits", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Saturation", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Saturation", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution XZ", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution XZ", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution Y", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution Y", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 3, -numberPropertyFieldAdjustmentValue, true); end

TLSE_Development_GUI_TabSceneProperties_Tab22Initalize = function()
    --[MISC] 22
    tab22_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "After Effects Enabled", "After Effects Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property1);
    tab22_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HDR lightmaps Enabled", "HDR lightmaps Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property2);
    tab22_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HDR lightmaps Intensity", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property3, TLSE_TabSceneProperties_OnDecrease_Tab22Property3);
    tab22_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Noise Scale", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property4, TLSE_TabSceneProperties_OnDecrease_Tab22Property4);
    tab22_colorProperty5 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Ambient Color", "Ambient Color", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_A);
    tab22_colorProperty6 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Shadow Color", "Shadow Color", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_A);
    tab22_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Force Linear Depth Offset", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property7, TLSE_TabSceneProperties_OnDecrease_Tab22Property7);
    tab22_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HDR - Paper White Nits", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property8, TLSE_TabSceneProperties_OnDecrease_Tab22Property8);
    tab22_boolProperty9 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Bake Enabled", "LightEnv Bake Enabled", Vector(0.685, 0.725, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property9);
    tab22_boolProperty10 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Enabled", "LightEnv Enabled", Vector(0.685, 0.735, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property10);
    tab22_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Intensity", Vector(0.685, 0.745, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property11, TLSE_TabSceneProperties_OnDecrease_Tab22Property11);
    tab22_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Saturation", Vector(0.685, 0.755, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property12, TLSE_TabSceneProperties_OnDecrease_Tab22Property12);
    tab22_colorProperty13 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Tint", "LightEnv Tint", Vector(0.685, 0.765, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_A);
    tab22_colorProperty14 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Background Color", "LightEnv Background Color", Vector(0.685, 0.805, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_A);
    tab22_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Probe Resolution XZ", Vector(0.685, 0.845, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property15, TLSE_TabSceneProperties_OnDecrease_Tab22Property15);
    tab22_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Probe Resolution Y", Vector(0.685, 0.855, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property16, TLSE_TabSceneProperties_OnDecrease_Tab22Property16);
end

TLSE_Development_GUI_TabSceneProperties_Tab22Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab22";

    --[MISC] 22
    tab22_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_boolProperty2["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_colorProperty5["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_colorProperty6["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_numberProperty7["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_numberProperty8["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_boolProperty9["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_boolProperty10["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_numberProperty11["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_numberProperty12["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_colorProperty13["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_colorProperty14["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_numberProperty15["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab22_numberProperty16["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[MISC] 22
    tab22_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty5["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty6["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty9["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty10["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty13["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty14["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty15["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty16["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end