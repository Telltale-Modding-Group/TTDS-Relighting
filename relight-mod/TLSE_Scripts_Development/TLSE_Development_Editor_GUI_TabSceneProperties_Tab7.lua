--[FX COLOR] 7
local tab7_boolProperty1 = nil; --(boolean) FX Color Enabled
local tab7_colorProperty2 = nil; --(Color) FX Color Tint
local tab7_numberProperty3 = nil; --(number) FX Color Opacity

TLSE_Development_GUI_TabSceneProperties_Tab7Initalize = function()
    --[FX COLOR] 7
    tab7_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Color Enabled", "FX Color Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab7_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "FX Color Tint", "FX Color Tint", Vector(0.685, 0.595, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    tab7_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Color Opacity", Vector(0.685, 0.635, 0.0), true, nil, nil);
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