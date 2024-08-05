--[MISC] 22
local tab22_boolProperty1 = nil; --(boolean) After Effects Enabled
local tab22_boolProperty2 = nil; --(boolean) HDR lightmaps Enabled
local tab22_numberProperty3 = nil; --(number) HDR lightmaps Intensity
local tab22_numberProperty4 = nil; --(number) FX Noise Scale
local tab22_colorProperty5 = nil; --(Color) Ambient Color
local tab22_colorProperty6 = nil; --(Color) Shadow Color
local tab22_numberProperty7 = nil; --(number) FX Force Linear Depth Offset
local tab22_numberProperty8 = nil; --(number) HDR - Paper White Nits
local tab22_boolProperty9 = nil; --(boolean) LightEnv Bake Enabled
local tab22_boolProperty10 = nil; --(boolean) LightEnv Enabled
local tab22_numberProperty11 = nil; --(number) LightEnv Intensity
local tab22_numberProperty12 = nil; --(number) LightEnv Saturation
local tab22_colorProperty13 = nil; --(Color) LightEnv Tint
local tab22_colorProperty14 = nil; --(Color) LightEnv Background Color
local tab22_numberProperty15 = nil; --(number) LightEnv Probe Resolution XZ
local tab22_numberProperty16 = nil; --(number) LightEnv Probe Resolution Y

--[MISC] 22
TLSE_TabSceneProperties_OnToggle_Tab22Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("After Effects Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("HDR lightmaps Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property9 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("LightEnv Bake Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property10 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("LightEnv Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HDR lightmaps Intensity", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HDR lightmaps Intensity", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Noise Scale", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Noise Scale", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Force Linear Depth Offset", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Force Linear Depth Offset", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property8 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HDR - Paper White Nits", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property8 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("HDR - Paper White Nits", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property11 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("LightEnv Intensity", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property11 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("LightEnv Intensity", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property12 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("LightEnv Saturation", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property12 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("LightEnv Saturation", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property15 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution XZ", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property15 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution XZ", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property16 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution Y", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property16 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution Y", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Ambient Color", 0, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Ambient Color", 1, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Ambient Color", 2, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Ambient Color", 3, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Ambient Color", 0, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Ambient Color", 1, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Ambient Color", 2, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Ambient Color", 3, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Shadow Color", 0, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Shadow Color", 1, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Shadow Color", 2, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Shadow Color", 3, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Shadow Color", 0, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Shadow Color", 1, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Shadow Color", 2, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Shadow Color", 3, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Tint", 0, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Tint", 1, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Tint", 2, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Tint", 3, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Tint", 0, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Tint", 1, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Tint", 2, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Tint", 3, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 0, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 1, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 2, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 3, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 0, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 1, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 2, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 3, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end

TLSE_Development_GUI_TabSceneProperties_Tab22Initalize = function()
    --[MISC] 22
    tab22_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "After Effects Enabled", "After Effects Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property1);
    tab22_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HDR lightmaps Enabled", "HDR lightmaps Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property2);
    tab22_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HDR lightmaps Intensity", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property3, TLSE_TabSceneProperties_OnDecrease_Tab22Property3);
    tab22_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Noise Scale", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property4, TLSE_TabSceneProperties_OnDecrease_Tab22Property4);
    tab22_colorProperty5 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Ambient Color", "Ambient Color", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_A);
    tab22_colorProperty6 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Shadow Color", "Shadow Color", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_A);
    tab22_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Force Linear Depth Offset", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property7, TLSE_TabSceneProperties_OnDecrease_Tab22Property7);
    tab22_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HDR - Paper White Nits", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property8, TLSE_TabSceneProperties_OnDecrease_Tab22Property8);
    tab22_boolProperty9 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Bake Enabled", "LightEnv Bake Enabled", Vector(0.685, 0.725, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property9);
    tab22_boolProperty10 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Enabled", "LightEnv Enabled", Vector(0.685, 0.735, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property10);
    tab22_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Intensity", Vector(0.685, 0.745, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property11, TLSE_TabSceneProperties_OnDecrease_Tab22Property11);
    tab22_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Saturation", Vector(0.685, 0.755, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property12, TLSE_TabSceneProperties_OnDecrease_Tab22Property12);
    tab22_colorProperty13 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Tint", "LightEnv Tint", Vector(0.685, 0.765, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_A);
    tab22_colorProperty14 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Background Color", "LightEnv Background Color", Vector(0.685, 0.805, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_A);
    tab22_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Probe Resolution XZ", Vector(0.685, 0.845, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property15, TLSE_TabSceneProperties_OnDecrease_Tab22Property15);
    tab22_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Probe Resolution Y", Vector(0.685, 0.855, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property16, TLSE_TabSceneProperties_OnDecrease_Tab22Property16);
end

TLSE_Development_GUI_TabSceneProperties_Tab22Update = function()
    --[MISC] 22
    tab22_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_boolProperty2["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_colorProperty5["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_colorProperty6["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_boolProperty9["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_boolProperty10["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_numberProperty11["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_numberProperty12["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_colorProperty13["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_colorProperty14["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_numberProperty15["Visible"] = TLSE_TabSceneProperties_Tab22_Active;
    tab22_numberProperty16["Visible"] = TLSE_TabSceneProperties_Tab22_Active;

    if(TLSE_TabSceneProperties_Tab22_Active == false) then
        return
    end

    --[MISC] 22
    tab22_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty11["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty12["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty13["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty14["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty15["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty16["ReferenceAgent"] = TLSE_Development_SceneAgent;
end