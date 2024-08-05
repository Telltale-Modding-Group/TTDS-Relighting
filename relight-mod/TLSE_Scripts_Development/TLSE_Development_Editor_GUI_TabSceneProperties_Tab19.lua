--[FX BRUSH] 19
local tab19_boolProperty1 = nil; --(boolean) FX Brush Outline Enable
local tab19_boolProperty2 = nil; --(boolean) FX Brush Outline Filter Enable
local tab19_boolProperty3 = nil; --(boolean) FX Brush DOF Enable
local tab19_numberProperty4 = nil; --(number) FX Brush Outline Size
local tab19_numberProperty5 = nil; --(number) FX Brush Outline Threshold
local tab19_numberProperty6 = nil; --(number) FX Brush Outline Color Threshold
local tab19_numberProperty7 = nil; --(number) FX Brush Outline Falloff
local tab19_numberProperty8 = nil; --(number) FX Brush Near Outline Scale
local tab19_numberProperty9 = nil; --(number) FX Brush Near Scale
local tab19_numberProperty10 = nil; --(number) FX Brush Near Detail
local tab19_numberProperty11 = nil; --(number) FX Brush Far Scale
local tab19_numberProperty12 = nil; --(number) FX Brush Far Detail
local tab19_numberProperty13 = nil; --(number) FX Brush Far Scale Boost
local tab19_numberProperty14 = nil; --(number) FX Brush Far Plane
local tab19_numberProperty15 = nil; --(number) FX Brush Far Plane Falloff
local tab19_numberProperty16 = nil; --(number) FX Brush Far Plane Max Scale

TLSE_Development_GUI_TabSceneProperties_Tab19Initalize = function()
    --[FX BRUSH] 19
    tab19_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush Outline Enable", "FX Brush Outline Enable", Vector(0.685, 0.585, 0.0), nil);
    tab19_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush Outline Filter Enable", "FX Brush Outline Filter Enable", Vector(0.685, 0.595, 0.0), nil);
    tab19_boolProperty3 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush DOF Enable", "FX Brush DOF Enable", Vector(0.685, 0.605, 0.0), nil);
    tab19_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Size", Vector(0.685, 0.615, 0.0), true, nil, nil);
    tab19_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Threshold", Vector(0.685, 0.625, 0.0), true, nil, nil);
    tab19_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Color Threshold", Vector(0.685, 0.635, 0.0), true, nil, nil);
    tab19_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Falloff", Vector(0.685, 0.645, 0.0), true, nil, nil);
    tab19_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Outline Scale", Vector(0.685, 0.655, 0.0), true, nil, nil);
    tab19_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Scale", Vector(0.685, 0.665, 0.0), true, nil, nil);
    tab19_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Detail", Vector(0.685, 0.675, 0.0), true, nil, nil);
    tab19_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Scale", Vector(0.685, 0.685, 0.0), true, nil, nil);
    tab19_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Detail", Vector(0.685, 0.695, 0.0), true, nil, nil);
    tab19_numberProperty13 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Scale Boost", Vector(0.685, 0.705, 0.0), true, nil, nil);
    tab19_numberProperty14 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane", Vector(0.685, 0.715, 0.0), true, nil, nil);
    tab19_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane Falloff", Vector(0.685, 0.725, 0.0), true, nil, nil);
    tab19_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane Max Scale", Vector(0.685, 0.735, 0.0), true, nil, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab19Update = function()
    --[FX BRUSH] 19
    tab19_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_boolProperty2["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_boolProperty3["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty9["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty10["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty11["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty12["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty13["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty14["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty15["Visible"] = TLSE_TabSceneProperties_Tab19_Active;
    tab19_numberProperty16["Visible"] = TLSE_TabSceneProperties_Tab19_Active;

    if(TLSE_TabSceneProperties_Tab19_Active == false) then
        return
    end

    --[FX BRUSH] 19
    tab19_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_boolProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_boolProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty11["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty12["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty13["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty14["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty15["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty16["ReferenceAgent"] = TLSE_Development_SceneAgent;
end