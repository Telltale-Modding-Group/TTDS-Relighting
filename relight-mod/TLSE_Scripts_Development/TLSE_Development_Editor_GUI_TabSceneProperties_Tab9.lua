--[FX TONEMAP RGB] 9
local tab9_boolProperty1 = nil; --(boolean) FX Tonemap RGB Enabled
local tab9_boolProperty2 = nil; --(boolean) FX Tonemap RGB DOF Enabled
local tab9_vector3Property3 = nil; --(Vector3) FX Tonemap RGB Pivots
local tab9_vector3Property4 = nil; --(Vector3) FX Tonemap RGB Signs
local tab9_vector3Property5 = nil; --(Vector3) FX Tonemap RGB Shoulder Intensities
local tab9_vector3Property6 = nil; --(Vector3) FX Tonemap RGB Toe Intensities
local tab9_vector3Property7 = nil; --(Vector3) FX Tonemap RGB Black Points
local tab9_vector3Property8 = nil; --(Vector3) FX Tonemap RGB White Points
local tab9_vector3Property9 = nil; --(Vector3) FX Tonemap RGB Far Pivots
local tab9_vector3Property10 = nil; --(Vector3) FX Tonemap RGB Far Signs
local tab9_vector3Property11 = nil; --(Vector3) FX Tonemap RGB Far Shoulder Intensities
local tab9_vector3Property12 = nil; --(Vector3) FX Tonemap RGB Far Toe Intensities
local tab9_vector3Property13 = nil; --(Vector3) FX Tonemap RGB Far Black Points
local tab9_vector3Property14 = nil; --(Vector3) FX Tonemap RGB Far White Points

local numberPropertyFieldAdjustmentValue = 1;

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

--[FX TONEMAP RGB] 9
TLSE_TabSceneProperties_OnToggle_Tab9Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Tonemap RGB Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab9Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Tonemap RGB DOF Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property3_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property3_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property3_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property3_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property3_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property3_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property4_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property4_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property4_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property4_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property4_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property4_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property5_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property5_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property5_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property5_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property5_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property5_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property6_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property6_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property6_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property6_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property6_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property6_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property7_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property7_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property7_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property7_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property7_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property7_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property8_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property8_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property8_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property8_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property8_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property8_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property9_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property9_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property9_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property9_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property9_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property9_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property10_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property10_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property10_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property10_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property10_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property10_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property11_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property11_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property11_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property11_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property11_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property11_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property12_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property12_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property12_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property12_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property12_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property12_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property13_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property13_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property13_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property13_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property13_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property13_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property14_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property14_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property14_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property14_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property14_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property14_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 2, -numberPropertyFieldAdjustmentValue); end

TLSE_Development_GUI_TabSceneProperties_Tab9Initalize = function()
    --[FX TONEMAP RGB] 9
    tab9_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap RGB Enabled", "FX Tonemap RGB Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab9Property1);
    tab9_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap RGB DOF Enabled", "FX Tonemap RGB DOF Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab9Property2);
    tab9_vector3Property3 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Pivots", "FX Tonemap RGB Pivots", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property3_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property3_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property3_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property3_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property3_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property3_Z);
    tab9_vector3Property4 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Signs", "FX Tonemap RGB Signs", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property4_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property4_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property4_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property4_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property4_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property4_Z);
    tab9_vector3Property5 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Shoulder Intensities", "FX Tonemap RGB Shoulder Intensities", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property5_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property5_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property5_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property5_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property5_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property5_Z);
    tab9_vector3Property6 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Toe Intensities", "FX Tonemap RGB Toe Intensities", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property6_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property6_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property6_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property6_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property6_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property6_Z);
    tab9_vector3Property7 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Black Points", "FX Tonemap RGB Black Points", Vector(0.685, 0.725, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property7_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property7_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property7_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property7_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property7_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property7_Z);
    tab9_vector3Property8 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB White Points", "FX Tonemap RGB White Points", Vector(0.685, 0.755, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property8_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property8_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property8_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property8_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property8_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property8_Z);
    tab9_vector3Property9 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Pivots", "FX Tonemap RGB Far Pivots", Vector(0.685, 0.785, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property9_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property9_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property9_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property9_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property9_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property9_Z);
    tab9_vector3Property10 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Signs", "FX Tonemap RGB Far Signs", Vector(0.685, 0.815, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property10_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property10_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property10_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property10_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property10_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property10_Z);
    tab9_vector3Property11 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Shoulder Intensities", "FX Tonemap RGB Far Shoulder Intensities", Vector(0.685, 0.845, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property11_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property11_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property11_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property11_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property11_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property11_Z);
    tab9_vector3Property12 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Toe Intensities", "FX Tonemap RGB Far Toe Intensities", Vector(0.685, 0.875, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property12_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property12_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property12_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property12_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property12_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property12_Z);
    tab9_vector3Property13 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Black Points", "FX Tonemap RGB Far Black Points", Vector(0.685, 0.905, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property13_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property13_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property13_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property13_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property13_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property13_Z);
    tab9_vector3Property14 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far White Points", "FX Tonemap RGB Far White Points", Vector(0.685, 0.935, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property14_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property14_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property14_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property14_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property14_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property14_Z);
end

TLSE_Development_GUI_TabSceneProperties_Tab9Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab9";

    --[FX TONEMAP RGB] 9
    tab9_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_boolProperty2["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property3["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property4["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property5["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property6["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property7["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property8["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property9["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property10["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property11["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property12["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property13["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab9_vector3Property14["Vector3FieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[FX TONEMAP RGB] 9
    tab9_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property3["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property4["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property5["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property6["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property7["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property8["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property9["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property10["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property11["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property12["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property13["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property14["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
end