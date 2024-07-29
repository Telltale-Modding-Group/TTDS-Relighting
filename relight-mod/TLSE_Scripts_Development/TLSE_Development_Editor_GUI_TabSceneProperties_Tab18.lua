--[SHADOWS] 18
local tab18_boolProperty1 = nil; --(boolean) FX Sharp Shadows Enabled
local tab18_boolProperty2 = nil; --(boolean) LightEnv Shadow Auto Depth Bounds
local tab18_numberProperty3 = nil; --(number) LightEnv Shadow Moment Bias
local tab18_numberProperty4 = nil; --(number) LightEnv Shadow Depth Bias
local tab18_numberProperty5 = nil; --(number) LightEnv Shadow Position Offset Bias
local tab18_numberProperty6 = nil; --(number) LightEnv Shadow Light Bleed Reduction
local tab18_numberProperty7 = nil; --(number) LightEnv Shadow Min Distance
local tab18_numberProperty8 = nil; --(number) LightEnv Shadow Max Distance
local tab18_numberProperty9 = nil; --(number) LightEnv Dynamic Shadow Max Distance
local tab18_numberProperty10 = nil; --(number) Light Shadow Trace Max Distance
local tab18_numberProperty11 = nil; --(number) LightEnv Shadow Cascade Split Bias
local tab18_numberProperty12 = nil; --(number) LightEnv Shadow Max Updates
local tab18_vector3Property13 = nil; --(Vector3) Light Static Shadow Bounds Min
local tab18_vector3Property14 = nil; --(Vector3) Light Static Shadow Bounds Max

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

--[SHADOWS] 18
TLSE_TabSceneProperties_OnToggle_Tab18Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Sharp Shadows Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab18Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("LightEnv Shadow Auto Depth Bounds"); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Moment Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Moment Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Depth Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Depth Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Position Offset Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Position Offset Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Light Bleed Reduction", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Light Bleed Reduction", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Min Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Min Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Max Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Max Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Dynamic Shadow Max Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Dynamic Shadow Max Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Light Shadow Trace Max Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Light Shadow Trace Max Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Cascade Split Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Cascade Split Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Max Updates", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Max Updates", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 2, -numberPropertyFieldAdjustmentValue); end

TLSE_Development_GUI_TabSceneProperties_Tab18Initalize = function()
    --[SHADOWS] 18
    tab18_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Sharp Shadows Enabled", "FX Sharp Shadows Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab18Property1);
    tab18_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Shadow Auto Depth Bounds", "LightEnv Shadow Auto Depth Bounds", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab18Property2);
    tab18_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Moment Bias", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property3, TLSE_TabSceneProperties_OnDecrease_Tab18Property3);
    tab18_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Depth Bias", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property4, TLSE_TabSceneProperties_OnDecrease_Tab18Property4);
    tab18_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Position Offset Bias", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property5, TLSE_TabSceneProperties_OnDecrease_Tab18Property5);
    tab18_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Light Bleed Reduction", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property6, TLSE_TabSceneProperties_OnDecrease_Tab18Property6);
    tab18_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Min Distance", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property7, TLSE_TabSceneProperties_OnDecrease_Tab18Property7);
    tab18_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Max Distance", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property8, TLSE_TabSceneProperties_OnDecrease_Tab18Property8);
    tab18_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Dynamic Shadow Max Distance", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property9, TLSE_TabSceneProperties_OnDecrease_Tab18Property9);
    tab18_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Light Shadow Trace Max Distance", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property10, TLSE_TabSceneProperties_OnDecrease_Tab18Property10);
    tab18_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Cascade Split Bias", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property11, TLSE_TabSceneProperties_OnDecrease_Tab18Property11);
    tab18_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Max Updates", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property12, TLSE_TabSceneProperties_OnDecrease_Tab18Property12);
    tab18_vector3Property13 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Light Static Shadow Bounds Min", "Light Static Shadow Bounds Min", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property13_X, TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Y, TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Z, TLSE_TabSceneProperties_OnDecrease_Tab18Property13_X, TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Y, TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Z);
    tab18_vector3Property14 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Light Static Shadow Bounds Max", "Light Static Shadow Bounds Max", Vector(0.685, 0.735, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property14_X, TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Y, TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Z, TLSE_TabSceneProperties_OnDecrease_Tab18Property14_X, TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Y, TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Z);
end

TLSE_Development_GUI_TabSceneProperties_Tab18Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab18";

    --[SHADOWS] 18
    tab18_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_boolProperty2["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty6["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty7["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty8["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty9["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty10["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty11["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_numberProperty12["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_vector3Property13["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab18_vector3Property14["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[SHADOWS] 18
    tab18_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_vector3Property13["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_vector3Property14["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
end