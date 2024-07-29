--[HBAO] 13
local tab13_boolProperty1 = nil; --(boolean) HBAO Enabled
local tab13_boolProperty2 = nil; --(boolean) HBAO Debug
local tab13_numberProperty3 = nil; --(number) HBAO Intensity
local tab13_numberProperty4 = nil; --(number) HBAO Radius
local tab13_numberProperty5 = nil; --(number) HBAO Max Radius Percent
local tab13_numberProperty6 = nil; --(number) HBAO Hemisphere Bias
local tab13_numberProperty7 = nil; --(number) HBAO Occlusion Scale
local tab13_numberProperty8 = nil; --(number) HBAO Luminance Scale
local tab13_numberProperty9 = nil; --(number) HBAO Max Distance
local tab13_numberProperty10 = nil; --(number) HBAO Distance Falloff
local tab13_numberProperty11 = nil; --(number) HBAO Blur Sharpness

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

--[HBAO] 13
TLSE_TabSceneProperties_OnToggle_Tab13Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("HBAO Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab13Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("HBAO Debug"); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Radius", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Radius", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Max Radius Percent", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Max Radius Percent", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Hemisphere Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Hemisphere Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Occlusion Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Occlusion Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Luminance Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Luminance Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Max Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Max Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Distance Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Distance Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Blur Sharpness", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Blur Sharpness", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab13Initalize = function()
    --[HBAO] 13
    tab13_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HBAO Enabled", "HBAO Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab13Property1);
    tab13_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HBAO Debug", "HBAO Debug", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab13Property2);
    tab13_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Intensity", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property3, TLSE_TabSceneProperties_OnDecrease_Tab13Property3);
    tab13_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Radius", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property4, TLSE_TabSceneProperties_OnDecrease_Tab13Property4);
    tab13_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Max Radius Percent", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property5, TLSE_TabSceneProperties_OnDecrease_Tab13Property5);
    tab13_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Hemisphere Bias", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property6, TLSE_TabSceneProperties_OnDecrease_Tab13Property6);
    tab13_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Occlusion Scale", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property7, TLSE_TabSceneProperties_OnDecrease_Tab13Property7);
    tab13_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Luminance Scale", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property8, TLSE_TabSceneProperties_OnDecrease_Tab13Property8);
    tab13_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Max Distance", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property9, TLSE_TabSceneProperties_OnDecrease_Tab13Property9);
    tab13_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Distance Falloff", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property10, TLSE_TabSceneProperties_OnDecrease_Tab13Property10);
    tab13_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Blur Sharpness", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property11, TLSE_TabSceneProperties_OnDecrease_Tab13Property11);
end

TLSE_Development_GUI_TabSceneProperties_Tab13Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab13";

    --[HBAO] 13
    tab13_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_boolProperty2["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty6["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty7["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty8["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty9["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty10["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab13_numberProperty11["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[HBAO] 13
    tab13_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end