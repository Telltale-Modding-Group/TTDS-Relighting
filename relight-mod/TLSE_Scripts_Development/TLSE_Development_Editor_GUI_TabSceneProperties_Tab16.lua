--[WIND] 16
local tab16_numberProperty1 = nil; --(number) Wind Speed
local tab16_numberProperty2 = nil; --(number) Wind Idle Strength
local tab16_numberProperty3 = nil; --(number) Wind Idle Spacial Frequency
local tab16_numberProperty4 = nil; --(number) Wind Gust Speed
local tab16_numberProperty5 = nil; --(number) Wind Gust Strength
local tab16_numberProperty6 = nil; --(number) Wind Gust Spacial Frequency
local tab16_numberProperty7 = nil; --(number) Wind Gust Idle Strength Multiplier
local tab16_numberProperty8 = nil; --(number) Wind Gust Separation Exponent
local tab16_vector3Property9 = nil; --(Vector3) Wind Direction

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

--[WIND] 16
TLSE_TabSceneProperties_OnIncrease_Tab16Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Speed", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Speed", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Idle Strength", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Idle Strength", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Idle Spacial Frequency", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Idle Spacial Frequency", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Speed", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Speed", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Strength", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Strength", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Spacial Frequency", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Spacial Frequency", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Idle Strength Multiplier", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Idle Strength Multiplier", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Separation Exponent", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Separation Exponent", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 2, -numberPropertyFieldAdjustmentValue); end

TLSE_Development_GUI_TabSceneProperties_Tab16Initalize = function()
    --[WIND] 16
    tab16_numberProperty1 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Speed", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property1, TLSE_TabSceneProperties_OnDecrease_Tab16Property1);
    tab16_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Idle Strength", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property2, TLSE_TabSceneProperties_OnDecrease_Tab16Property2);
    tab16_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Idle Spacial Frequency", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property3, TLSE_TabSceneProperties_OnDecrease_Tab16Property3);
    tab16_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Speed", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property4, TLSE_TabSceneProperties_OnDecrease_Tab16Property4);
    tab16_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Strength", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property5, TLSE_TabSceneProperties_OnDecrease_Tab16Property5);
    tab16_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Spacial Frequency", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property6, TLSE_TabSceneProperties_OnDecrease_Tab16Property6);
    tab16_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Idle Strength Multiplier", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property7, TLSE_TabSceneProperties_OnDecrease_Tab16Property7);
    tab16_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Separation Exponent", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property8, TLSE_TabSceneProperties_OnDecrease_Tab16Property8);
    tab16_vector3Property9 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Wind Direction", "Wind Direction", Vector(0.685, 0.665, 0.0), TLSE_TabSceneProperties_OnIncrease_Tab16Property9_X, TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Y, TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Z, TLSE_TabSceneProperties_OnDecrease_Tab16Property9_X, TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Y, TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Z);
end

TLSE_Development_GUI_TabSceneProperties_Tab16Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab16";

    --[WIND] 16
    tab16_numberProperty1["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab16_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab16_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab16_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab16_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab16_numberProperty6["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab16_numberProperty7["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab16_numberProperty8["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab16_vector3Property9["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[WIND] 16
    tab16_numberProperty1["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_vector3Property9["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
end