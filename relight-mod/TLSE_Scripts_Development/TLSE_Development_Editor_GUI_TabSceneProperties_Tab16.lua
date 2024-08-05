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

--[WIND] 16
TLSE_TabSceneProperties_OnIncrease_Tab16Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Speed", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Speed", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Idle Strength", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Idle Strength", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Idle Spacial Frequency", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Idle Spacial Frequency", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Speed", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Speed", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property5 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Strength", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property5 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Strength", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property6 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Spacial Frequency", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property6 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Spacial Frequency", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Idle Strength Multiplier", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Idle Strength Multiplier", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property8 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Separation Exponent", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property8 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Wind Gust Separation Exponent", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_X = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyVector3PropertyValueOnAgent("Wind Direction", 0, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Y = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyVector3PropertyValueOnAgent("Wind Direction", 1, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Z = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyVector3PropertyValueOnAgent("Wind Direction", 2, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_X = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyVector3PropertyValueOnAgent("Wind Direction", 0, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Y = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyVector3PropertyValueOnAgent("Wind Direction", 1, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Z = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyVector3PropertyValueOnAgent("Wind Direction", 2, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue); end

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
    --[WIND] 16
    tab16_numberProperty1["Visible"] = TLSE_TabSceneProperties_Tab16_Active;
    tab16_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab16_Active;
    tab16_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab16_Active;
    tab16_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab16_Active;
    tab16_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab16_Active;
    tab16_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab16_Active;
    tab16_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab16_Active;
    tab16_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab16_Active;
    tab16_vector3Property9["Visible"] = TLSE_TabSceneProperties_Tab16_Active;

    if(TLSE_TabSceneProperties_Tab16_Active == false) then
        return
    end

    --[WIND] 16
    tab16_numberProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab16_vector3Property9["ReferenceAgent"] = TLSE_Development_SceneAgent;
end