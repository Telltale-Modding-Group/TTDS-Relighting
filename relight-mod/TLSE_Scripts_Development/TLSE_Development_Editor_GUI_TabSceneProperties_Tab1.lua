--[ANTI ALIASING] 1
local tab1_boolProperty1 = nil; --(boolean) FX anti-aliasing
local tab1_numberProperty2 = nil; --(number) FX TAA Weight

TLSE_Development_GUI_TabSceneProperties_Tab1Initalize = function()
    --[ANTI ALIASING] 1
    tab1_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX anti-aliasing", "FX anti-aliasing", Vector(0.685, 0.585, 0.0), nil);
    tab1_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX TAA Weight", Vector(0.685, 0.595, 0.0), true, nil, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab1Update = function()
    --[ANTI ALIASING] 1
    tab1_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab1_Active;
    tab1_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab1_Active;

    if(TLSE_TabSceneProperties_Tab1_Active == false) then
        return
    end

    --[ANTI ALIASING] 1
    tab1_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab1_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
end