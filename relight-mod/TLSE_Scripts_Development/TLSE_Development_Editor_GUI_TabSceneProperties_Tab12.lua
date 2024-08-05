--[FX VIGNETTE] 12
local tab12_boolProperty1 = nil; --(boolean) FX Vignette Tint Enabled
local tab12_colorProperty2 = nil; --(Color) FX Vignette Tint
local tab12_numberProperty3 = nil; --(number) FX Vignette Falloff
local tab12_numberProperty4 = nil; --(number) FX Vignette Center
local tab12_numberProperty5 = nil; --(number) FX Vignette Corners

TLSE_Development_GUI_TabSceneProperties_Tab12Initalize = function()
    --[FX VIGNETTE] 12
    tab12_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Vignette Tint Enabled", "FX Vignette Tint Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab12_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "FX Vignette Tint", "FX Vignette Tint", Vector(0.685, 0.595, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    tab12_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Falloff", Vector(0.685, 0.635, 0.0), true, nil, nil);
    tab12_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Center", Vector(0.685, 0.645, 0.0), true, nil, nil);
    tab12_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Corners", Vector(0.685, 0.655, 0.0), true, nil, nil);
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