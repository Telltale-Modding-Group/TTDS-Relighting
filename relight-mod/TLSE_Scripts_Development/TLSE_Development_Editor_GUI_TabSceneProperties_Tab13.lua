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

--[HBAO] 13
TLSE_TabSceneProperties_OnToggle_Tab13Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("HBAO Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab13Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("HBAO Debug"); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Intensity", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Intensity", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Radius", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Radius", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property5 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Max Radius Percent", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property5 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Max Radius Percent", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property6 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Hemisphere Bias", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property6 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Hemisphere Bias", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Occlusion Scale", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Occlusion Scale", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property8 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Luminance Scale", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property8 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Luminance Scale", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property9 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Max Distance", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property9 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Max Distance", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property10 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Distance Falloff", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property10 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Distance Falloff", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property11 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Blur Sharpness", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property11 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HBAO Blur Sharpness", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end

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
    --[HBAO] 13
    tab13_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_boolProperty2["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty9["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty10["Visible"] = TLSE_TabSceneProperties_Tab13_Active;
    tab13_numberProperty11["Visible"] = TLSE_TabSceneProperties_Tab13_Active;

    if(TLSE_TabSceneProperties_Tab13_Active == false) then
        return
    end

    --[HBAO] 13
    tab13_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_boolProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty11["ReferenceAgent"] = TLSE_Development_SceneAgent;
end