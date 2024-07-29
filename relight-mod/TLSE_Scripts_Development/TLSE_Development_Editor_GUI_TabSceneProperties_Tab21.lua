--[SPECULAR] 21
local tab21_boolProperty1 = nil; --(boolean) Specular Multiplier Enabled
local tab21_numberProperty2 = nil; --(number) Specular Color Multiplier
local tab21_numberProperty3 = nil; --(number) Specular Intensity Multiplier
local tab21_numberProperty4 = nil; --(number) Specular Exponent Multiplier

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

--[SPECULAR] 21
TLSE_TabSceneProperties_OnToggle_Tab21Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Specular Multiplier Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Color Multiplier", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Color Multiplier", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Intensity Multiplier", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Intensity Multiplier", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Exponent Multiplier", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Exponent Multiplier", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab21Initalize = function()
    --[SPECULAR] 21
    tab21_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Specular Multiplier Enabled", "Specular Multiplier Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab21Property1);
    tab21_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Color Multiplier", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property2, TLSE_TabSceneProperties_OnDecrease_Tab21Property2);
    tab21_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Intensity Multiplier", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property3, TLSE_TabSceneProperties_OnDecrease_Tab21Property3);
    tab21_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Exponent Multiplier", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property4, TLSE_TabSceneProperties_OnDecrease_Tab21Property4);
end

TLSE_Development_GUI_TabSceneProperties_Tab21Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab21";

    --[SPECULAR] 21
    tab21_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab21_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab21_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab21_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[SPECULAR] 21
    tab21_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end