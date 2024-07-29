--[NPR LINES] 4
local tab4_boolProperty1 = nil; --(boolean) Generate NPR Lines
local tab4_numberProperty2 = nil; --(number) NPR Lines Alpha Bias
local tab4_numberProperty3 = nil; --(number) NPR Lines Alpha Falloff
local tab4_numberProperty4 = nil; --(number) NPR Lines Bias
local tab4_numberProperty5 = nil; --(number) NPR Lines Falloff

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

--[NPR LINES] 4
TLSE_TabSceneProperties_OnToggle_Tab4Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Generate NPR Lines"); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Alpha Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Alpha Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Alpha Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Alpha Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Falloff", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab4Initalize = function()
    --[NPR LINES] 4
    tab4_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Generate NPR Lines", "Generate NPR Lines", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab4Property1);
    tab4_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Alpha Bias", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property2, TLSE_TabSceneProperties_OnDecrease_Tab4Property2);
    tab4_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Alpha Falloff", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property3, TLSE_TabSceneProperties_OnDecrease_Tab4Property3);
    tab4_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Bias", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property4, TLSE_TabSceneProperties_OnDecrease_Tab4Property4);
    tab4_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Falloff", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property5, TLSE_TabSceneProperties_OnDecrease_Tab4Property5);
end

TLSE_Development_GUI_TabSceneProperties_Tab4Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab4";

    --[NPR LINES] 4
    tab4_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab4_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab4_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab4_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab4_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[NPR LINES] 4
    tab4_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end