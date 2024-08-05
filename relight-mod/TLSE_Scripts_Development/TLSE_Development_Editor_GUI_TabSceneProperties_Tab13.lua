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

TLSE_Development_GUI_TabSceneProperties_Tab13Initalize = function()
    --[HBAO] 13
    tab13_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HBAO Enabled", "HBAO Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab13_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HBAO Debug", "HBAO Debug", Vector(0.685, 0.595, 0.0), nil);
    tab13_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Intensity", Vector(0.685, 0.605, 0.0), true, nil, nil);
    tab13_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Radius", Vector(0.685, 0.615, 0.0), true, nil, nil);
    tab13_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Max Radius Percent", Vector(0.685, 0.625, 0.0), true, nil, nil);
    tab13_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Hemisphere Bias", Vector(0.685, 0.635, 0.0), true, nil, nil);
    tab13_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Occlusion Scale", Vector(0.685, 0.645, 0.0), true, nil, nil);
    tab13_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Luminance Scale", Vector(0.685, 0.655, 0.0), true, nil, nil);
    tab13_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Max Distance", Vector(0.685, 0.665, 0.0), true, nil, nil);
    tab13_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Distance Falloff", Vector(0.685, 0.675, 0.0), true, nil, nil);
    tab13_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Blur Sharpness", Vector(0.685, 0.685, 0.0), true, nil, nil);
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