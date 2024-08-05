--[FX COLOR] 7
local tab7_boolProperty1 = nil; --(boolean) FX Color Enabled
local tab7_colorProperty2 = nil; --(Color) FX Color Tint
local tab7_numberProperty3 = nil; --(number) FX Color Opacity

--[FX COLOR] 7
TLSE_TabSceneProperties_OnToggle_Tab7Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Tint", 0, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Tint", 1, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Tint", 2, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Tint", 3, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Tint", 0, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Tint", 1, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Tint", 2, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Tint", 3, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Opacity", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Color Opacity", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab7Initalize = function()
    --[FX COLOR] 7
    tab7_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Color Enabled", "FX Color Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab7Property1);
    tab7_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "FX Color Tint", "FX Color Tint", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_A);
    tab7_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Color Opacity", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab7Property3, TLSE_TabSceneProperties_OnDecrease_Tab7Property3);
end

TLSE_Development_GUI_TabSceneProperties_Tab7Update = function()
    --[FX COLOR] 7
    tab7_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab7_Active;
    tab7_colorProperty2["Visible"] = TLSE_TabSceneProperties_Tab7_Active;
    tab7_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab7_Active;

    if(TLSE_TabSceneProperties_Tab7_Active == false) then
        return
    end

    --[FX COLOR] 7
    tab7_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab7_colorProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab7_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
end