--[SCREEN SPACE LINES] 14
local tab14_boolProperty1 = nil; --(boolean) Screen Space Lines - Enabled
local tab14_colorProperty2 = nil; --(Color) Screen Space Lines - Color
local tab14_numberProperty3 = nil; --(number) Screen Space Lines - Thickness
local tab14_numberProperty4 = nil; --(number) Screen Space Lines - Depth Fade Near
local tab14_numberProperty5 = nil; --(number) Screen Space Lines - Depth Fade Far
local tab14_numberProperty6 = nil; --(number) Screen Space Lines - Depth Magnitude
local tab14_numberProperty7 = nil; --(number) Screen Space Lines - Depth Exponent
local tab14_numberProperty8 = nil; --(number) Screen Space Lines - Debug
local tab14_numberProperty9 = nil; --(number) Screen Space Lines - Light Magnitude
local tab14_numberProperty10 = nil; --(number) Screen Space Lines - Light Exponent
local tab14_vector3Property11 = nil; --(Vector3) Screen Space Lines - Light Direction

TLSE_Development_GUI_TabSceneProperties_Tab14Initalize = function()
    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Screen Space Lines - Enabled", "Screen Space Lines - Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab14_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Screen Space Lines - Color", "Screen Space Lines - Color", Vector(0.685, 0.595, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    tab14_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Thickness", Vector(0.685, 0.635, 0.0), true, nil, nil);
    tab14_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Fade Near", Vector(0.685, 0.645, 0.0), true, nil, nil);
    tab14_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Fade Far", Vector(0.685, 0.655, 0.0), true, nil, nil);
    tab14_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Magnitude", Vector(0.685, 0.665, 0.0), true, nil, nil);
    tab14_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Exponent", Vector(0.685, 0.675, 0.0), true, nil, nil);
    tab14_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Debug", Vector(0.685, 0.685, 0.0), true, nil, nil);
    tab14_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Light Magnitude", Vector(0.685, 0.695, 0.0), true, nil, nil);
    tab14_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Light Exponent", Vector(0.685, 0.705, 0.0), true, nil, nil);
    tab14_vector3Property11 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Screen Space Lines - Light Direction", "Screen Space Lines - Light Direction", Vector(0.685, 0.715, 0.0), true, nil, nil, nil, nil, nil, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab14Update = function()
    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_colorProperty2["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty9["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty10["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_vector3Property11["Visible"] = TLSE_TabSceneProperties_Tab14_Active;

    if(TLSE_TabSceneProperties_Tab14_Active == false) then
        return
    end

    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_colorProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_vector3Property11["ReferenceAgent"] = TLSE_Development_SceneAgent;
end