--[ANTI ALIASING] 1
local tab1_boolProperty1 = nil; --(boolean) FX anti-aliasing
local tab1_numberProperty2 = nil; --(number) FX TAA Weight

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

--[ANTI ALIASING] 1
TLSE_TabSceneProperties_OnToggle_Tab1Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX anti-aliasing"); end
TLSE_TabSceneProperties_OnIncrease_Tab1Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX TAA Weight", numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab1Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX TAA Weight", -numberPropertyFieldAdjustmentValue, true); end

TLSE_Development_GUI_TabSceneProperties_Tab1Initalize = function()
    --[ANTI ALIASING] 1
    tab1_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX anti-aliasing", "FX anti-aliasing", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab1Property1);
    tab1_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX TAA Weight", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab1Property2, TLSE_TabSceneProperties_OnDecrease_Tab1Property2);
end

TLSE_Development_GUI_TabSceneProperties_Tab1Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab1";

    --[ANTI ALIASING] 1
    tab1_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab1_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[ANTI ALIASING] 1
    tab1_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab1_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end