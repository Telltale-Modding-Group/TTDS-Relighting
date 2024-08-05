--[GLOW] 6
local tab6_colorProperty1 = nil; --(Color) Glow Clear Color
local tab6_numberProperty2 = nil; --(number) Glow Sigma Scale

TLSE_Development_GUI_TabSceneProperties_Tab6Initalize = function()
    --[GLOW] 6
    tab6_colorProperty1 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Glow Clear Color", "Glow Clear Color", Vector(0.685, 0.585, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    tab6_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Glow Sigma Scale", Vector(0.685, 0.625, 0.0), true, nil, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab6Update = function()
    --[GLOW] 6
    tab6_colorProperty1["Visible"] = TLSE_TabSceneProperties_Tab6_Active;
    tab6_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab6_Active;
    
    if(TLSE_TabSceneProperties_Tab6_Active == false) then
        return
    end

    --[GLOW] 6
    tab6_colorProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab6_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
end