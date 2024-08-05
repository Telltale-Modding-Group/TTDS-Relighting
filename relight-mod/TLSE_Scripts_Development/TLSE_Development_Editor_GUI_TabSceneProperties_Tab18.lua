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

--[SHADOWS] 18
TLSE_TabSceneProperties_OnToggle_Tab18Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Sharp Shadows Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab18Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Auto Depth Bounds"); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Moment Bias", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Moment Bias", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Depth Bias", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Depth Bias", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Position Offset Bias", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Position Offset Bias", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property6 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Light Bleed Reduction", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property6 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Light Bleed Reduction", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property7 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Min Distance", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property7 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Min Distance", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property8 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Max Distance", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property8 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Max Distance", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property9 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Dynamic Shadow Max Distance", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property9 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Dynamic Shadow Max Distance", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property10 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Shadow Trace Max Distance", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property10 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Shadow Trace Max Distance", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property11 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Cascade Split Bias", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property11 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Cascade Split Bias", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property12 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Max Updates", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property12 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Shadow Max Updates", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_X = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Min", 0, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Y = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Min", 1, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Z = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Min", 2, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_X = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Min", 0, -TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Y = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Min", 1, -TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Z = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Min", 2, -TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_X = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Max", 0, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Y = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Max", 1, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Z = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Max", 2, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_X = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Max", 0, -TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Y = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Max", 1, -TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Z = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Light Static Shadow Bounds Max", 2, -TLSE_Development_GUI_PropertyAdjustmentValue); end

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
    --[SHADOWS] 18
    tab18_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_boolProperty2["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty9["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty10["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty11["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty12["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_vector3Property13["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_vector3Property14["Visible"] = TLSE_TabSceneProperties_Tab18_Active;

    if(TLSE_TabSceneProperties_Tab18_Active == false) then
        return
    end

    --[SHADOWS] 18
    tab18_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_boolProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty11["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty12["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_vector3Property13["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_vector3Property14["ReferenceAgent"] = TLSE_Development_SceneAgent;
end