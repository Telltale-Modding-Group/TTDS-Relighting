--[FX TONEMAP] 8
local tab8_boolProperty1 = nil; --(boolean) FX Tonemap Enabled
local tab8_boolProperty2 = nil; --(boolean) FX Tonemap DOF Enabled
local tab8_numberProperty3 = nil; --(number) FX Tonemap Intensity
local tab8_numberProperty4 = nil; --(number) FX Tonemap Type
local tab8_numberProperty5 = nil; --(number) FX Tonemap White Point
local tab8_numberProperty6 = nil; --(number) FX Tonemap Black Point
local tab8_numberProperty7 = nil; --(number) FX Tonemap Filmic Pivot
local tab8_numberProperty8 = nil; --(number) FX Tonemap Filmic Sign
local tab8_numberProperty9 = nil; --(number) FX Tonemap Filmic Shoulder Intensity
local tab8_numberProperty10 = nil; --(number) FX Tonemap Filmic Toe Intensity
local tab8_numberProperty11 = nil; --(number) FX Tonemap Far Filmic Pivot
local tab8_numberProperty12 = nil; --(number) FX Tonemap Far Filmic Sign
local tab8_numberProperty13 = nil; --(number) FX Tonemap Far Filmic Shoulder Intensity
local tab8_numberProperty14 = nil; --(number) FX Tonemap Far Filmic Toe Intensity
local tab8_numberProperty15 = nil; --(number) FX Tonemap Far White Point
local tab8_numberProperty16 = nil; --(number) FX Tonemap Far Black Point

TLSE_Development_GUI_TabSceneProperties_Tab8Initalize = function()
    --[FX TONEMAP] 8
    tab8_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap Enabled", "FX Tonemap Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab8_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap DOF Enabled", "FX Tonemap DOF Enabled", Vector(0.685, 0.595, 0.0), nil);
    tab8_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Intensity", Vector(0.685, 0.605, 0.0), true, nil, nil);
    tab8_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Type", Vector(0.685, 0.615, 0.0), true, nil, nil);
    tab8_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap White Point", Vector(0.685, 0.625, 0.0), true, nil, nil);
    tab8_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Black Point", Vector(0.685, 0.635, 0.0), true, nil, nil);
    tab8_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Pivot", Vector(0.685, 0.645, 0.0), true, nil, nil);
    tab8_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Sign", Vector(0.685, 0.655, 0.0), true, nil, nil);
    tab8_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Shoulder Intensity", Vector(0.685, 0.665, 0.0), true, nil, nil);
    tab8_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Toe Intensity", Vector(0.685, 0.675, 0.0), true, nil, nil);
    tab8_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Pivot", Vector(0.685, 0.685, 0.0), true, nil, nil);
    tab8_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Sign", Vector(0.685, 0.695, 0.0), true, nil, nil);
    tab8_numberProperty13 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Shoulder Intensity", Vector(0.685, 0.705, 0.0), true, nil, nil);
    tab8_numberProperty14 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Toe Intensity", Vector(0.685, 0.715, 0.0), true, nil, nil);
    tab8_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far White Point", Vector(0.685, 0.725, 0.0), true, nil, nil);
    tab8_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Black Point", Vector(0.685, 0.735, 0.0), true, nil, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab8Update = function()
    --[FX TONEMAP] 8
    tab8_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_boolProperty2["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty9["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty10["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty11["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty12["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty13["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty14["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty15["Visible"] = TLSE_TabSceneProperties_Tab8_Active;
    tab8_numberProperty16["Visible"] = TLSE_TabSceneProperties_Tab8_Active;

    if(TLSE_TabSceneProperties_Tab8_Active == false) then
        return
    end

    --[FX TONEMAP] 8
    tab8_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_boolProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty11["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty12["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty13["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty14["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty15["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty16["ReferenceAgent"] = TLSE_Development_SceneAgent;
end