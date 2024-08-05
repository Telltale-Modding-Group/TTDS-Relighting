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

TLSE_Development_GUI_TabSceneProperties_Tab22Initalize = function()
    --[MISC] 22
    tab22_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "After Effects Enabled", "After Effects Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab22_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HDR lightmaps Enabled", "HDR lightmaps Enabled", Vector(0.685, 0.595, 0.0), nil);
    tab22_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HDR lightmaps Intensity", Vector(0.685, 0.605, 0.0), true, nil, nil);
    tab22_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Noise Scale", Vector(0.685, 0.615, 0.0), true, nil, nil);
    tab22_colorProperty5 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Ambient Color", "Ambient Color", Vector(0.685, 0.625, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    tab22_colorProperty6 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Shadow Color", "Shadow Color", Vector(0.685, 0.665, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    tab22_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Force Linear Depth Offset", Vector(0.685, 0.705, 0.0), true, nil, nil);
    tab22_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HDR - Paper White Nits", Vector(0.685, 0.715, 0.0), true, nil, nil);
    tab22_boolProperty9 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Bake Enabled", "LightEnv Bake Enabled", Vector(0.685, 0.725, 0.0), nil);
    tab22_boolProperty10 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Enabled", "LightEnv Enabled", Vector(0.685, 0.735, 0.0), nil);
    tab22_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Intensity", Vector(0.685, 0.745, 0.0), true, nil, nil);
    tab22_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Saturation", Vector(0.685, 0.755, 0.0), true, nil, nil);
    tab22_colorProperty13 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Tint", "LightEnv Tint", Vector(0.685, 0.765, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    tab22_colorProperty14 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Background Color", "LightEnv Background Color", Vector(0.685, 0.805, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    tab22_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Probe Resolution XZ", Vector(0.685, 0.845, 0.0), true, nil, nil);
    tab22_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Probe Resolution Y", Vector(0.685, 0.855, 0.0), true, nil, nil);
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