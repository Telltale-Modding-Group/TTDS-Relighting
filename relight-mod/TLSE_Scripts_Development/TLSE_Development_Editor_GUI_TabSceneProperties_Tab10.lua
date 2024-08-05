--[FX AMBIENT OCCLUSION] 10
local tab10_boolProperty1 = nil; --(boolean) FX Ambient Occlusion Enabled
local tab10_numberProperty2 = nil; --(number) FX Ambient Occlusion Intensity
local tab10_numberProperty3 = nil; --(number) FX Ambient Occlusion Falloff
local tab10_numberProperty4 = nil; --(number) FX Ambient Occlusion Radius
local tab10_numberProperty5 = nil; --(number) FX Ambient Occlusion Lightmap

TLSE_Development_GUI_TabSceneProperties_Tab10Initalize = function()
    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Ambient Occlusion Enabled", "FX Ambient Occlusion Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab10_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Intensity", Vector(0.685, 0.595, 0.0), true, nil, nil);
    tab10_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Falloff", Vector(0.685, 0.605, 0.0), true, nil, nil);
    tab10_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Radius", Vector(0.685, 0.615, 0.0), true, nil, nil);
    tab10_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Lightmap", Vector(0.685, 0.625, 0.0), true, nil, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab10Update = function()
    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab10_Active;
    tab10_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab10_Active;
    tab10_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab10_Active;
    tab10_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab10_Active;
    tab10_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab10_Active;

    if(TLSE_TabSceneProperties_Tab10_Active == false) then
        return
    end

    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
end