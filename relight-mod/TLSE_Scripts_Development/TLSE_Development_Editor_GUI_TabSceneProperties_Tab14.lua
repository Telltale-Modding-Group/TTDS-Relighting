--[SCREEN SPACE LINES] 14
local tab14_boolProperty1 = nil; --(boolean) Screen Space Lines - Enabled
local tab14_colorProperty2 = nil; --(Color) Screen Space Lines - Color
local tab14_numberProperty3 = nil; --(number) Screen Space Lines - Thickness
local tab14_numberProperty4 = nil; --(number) Screen Space Lines - Depth Fade Near
local tab14_numberProperty5 = nil; --(number) Screen Space Lines - Depth Fade Far
local tab14_numberProperty6 = nil; --(number) Screen Space Lines - Depth Magnitude
local tab14_numberProperty7 = nil; --(number) Screen Space Lines - Depth Exponent
local tab14_numberProperty8 = nil; --(number) Screen Space Lines - Debug
local tab14_numberProperty9 = nil; --(number) Screen Space Lines - Light Magnitude
local tab14_numberProperty10 = nil; --(number) Screen Space Lines - Light Exponent
local tab14_vector3Property11 = nil; --(Vector3) Screen Space Lines - Light Direction

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

local ModifiyVector3PropertyValueOnAgent = function(string_property, number_component, number_adjustment)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local vector_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            if(number_component == 0) then
                vector_originalValue.x = vector_originalValue.x + number_adjustment;
            elseif(number_component == 1) then
                vector_originalValue.y = vector_originalValue.y + number_adjustment;
            elseif(number_component == 2) then
                vector_originalValue.z = vector_originalValue.z + number_adjustment;
            end

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, vector_originalValue);
        end
    end
end

--[SCREEN SPACE LINES] 14
TLSE_TabSceneProperties_OnToggle_Tab14Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Screen Space Lines - Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Thickness", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Thickness", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Fade Near", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Fade Near", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Fade Far", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Fade Far", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Magnitude", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Magnitude", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Exponent", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Exponent", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Debug", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Debug", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Light Magnitude", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Light Magnitude", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Light Exponent", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Light Exponent", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 2, -numberPropertyFieldAdjustmentValue); end

TLSE_Development_GUI_TabSceneProperties_Tab14Initalize = function()
    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Screen Space Lines - Enabled", "Screen Space Lines - Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab14Property1);
    tab14_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Screen Space Lines - Color", "Screen Space Lines - Color", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_A);
    tab14_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Thickness", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property3, TLSE_TabSceneProperties_OnDecrease_Tab14Property3);
    tab14_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Fade Near", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property4, TLSE_TabSceneProperties_OnDecrease_Tab14Property4);
    tab14_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Fade Far", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property5, TLSE_TabSceneProperties_OnDecrease_Tab14Property5);
    tab14_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Magnitude", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property6, TLSE_TabSceneProperties_OnDecrease_Tab14Property6);
    tab14_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Exponent", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property7, TLSE_TabSceneProperties_OnDecrease_Tab14Property7);
    tab14_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Debug", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property8, TLSE_TabSceneProperties_OnDecrease_Tab14Property8);
    tab14_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Light Magnitude", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property9, TLSE_TabSceneProperties_OnDecrease_Tab14Property9);
    tab14_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Light Exponent", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property10, TLSE_TabSceneProperties_OnDecrease_Tab14Property10);
    tab14_vector3Property11 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Screen Space Lines - Light Direction", "Screen Space Lines - Light Direction", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_X, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Y, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Z, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_X, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Y, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Z);
end

TLSE_Development_GUI_TabSceneProperties_Tab14Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab14";

    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_colorProperty2["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_numberProperty6["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_numberProperty7["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_numberProperty8["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_numberProperty9["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_numberProperty10["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab14_vector3Property11["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_colorProperty2["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_vector3Property11["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
end