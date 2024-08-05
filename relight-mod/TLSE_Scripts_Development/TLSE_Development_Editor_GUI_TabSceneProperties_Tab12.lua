--[FX VIGNETTE] 12
local tab12_boolProperty1 = nil; --(boolean) FX Vignette Tint Enabled
local tab12_colorProperty2 = nil; --(Color) FX Vignette Tint
local tab12_numberProperty3 = nil; --(number) FX Vignette Falloff
local tab12_numberProperty4 = nil; --(number) FX Vignette Center
local tab12_numberProperty5 = nil; --(number) FX Vignette Corners

--[FX VIGNETTE] 12
TLSE_TabSceneProperties_OnToggle_Tab12Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint", 0, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint", 1, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint", 2, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint", 3, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint", 0, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint", 1, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint", 2, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Tint", 3, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Falloff", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Falloff", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Center", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Center", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Corners", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "FX Vignette Corners", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab12Initalize = function()
    --[FX VIGNETTE] 12
    tab12_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Vignette Tint Enabled", "FX Vignette Tint Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab12Property1);
    tab12_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "FX Vignette Tint", "FX Vignette Tint", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_A);
    tab12_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Falloff", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property3, TLSE_TabSceneProperties_OnDecrease_Tab12Property3);
    tab12_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Center", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property4, TLSE_TabSceneProperties_OnDecrease_Tab12Property4);
    tab12_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Corners", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property5, TLSE_TabSceneProperties_OnDecrease_Tab12Property5);
end

TLSE_Development_GUI_TabSceneProperties_Tab12Update = function()
    --[FX VIGNETTE] 12
    tab12_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab12_Active;
    tab12_colorProperty2["Visible"] = TLSE_TabSceneProperties_Tab12_Active;
    tab12_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab12_Active;
    tab12_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab12_Active;
    tab12_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab12_Active;

    if(TLSE_TabSceneProperties_Tab12_Active == false) then
        return
    end

    --[FX VIGNETTE] 12
    tab12_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab12_colorProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
end