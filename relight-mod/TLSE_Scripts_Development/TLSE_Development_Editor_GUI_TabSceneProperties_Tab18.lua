--[SHADOWS] 18
local tab18_boolProperty1 = nil; --(boolean) FX Sharp Shadows Enabled
local tab18_boolProperty2 = nil; --(boolean) LightEnv Shadow Auto Depth Bounds
local tab18_numberProperty3 = nil; --(number) LightEnv Shadow Moment Bias
local tab18_numberProperty4 = nil; --(number) LightEnv Shadow Depth Bias
local tab18_numberProperty5 = nil; --(number) LightEnv Shadow Position Offset Bias
local tab18_numberProperty6 = nil; --(number) LightEnv Shadow Light Bleed Reduction
local tab18_numberProperty7 = nil; --(number) LightEnv Shadow Min Distance
local tab18_numberProperty8 = nil; --(number) LightEnv Shadow Max Distance
local tab18_numberProperty9 = nil; --(number) LightEnv Dynamic Shadow Max Distance
local tab18_numberProperty10 = nil; --(number) Light Shadow Trace Max Distance
local tab18_numberProperty11 = nil; --(number) LightEnv Shadow Cascade Split Bias
local tab18_numberProperty12 = nil; --(number) LightEnv Shadow Max Updates
local tab18_vector3Property13 = nil; --(Vector3) Light Static Shadow Bounds Min
local tab18_vector3Property14 = nil; --(Vector3) Light Static Shadow Bounds Max

TLSE_Development_GUI_TabSceneProperties_Tab18Initalize = function()
    --[SHADOWS] 18
    tab18_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Sharp Shadows Enabled", "FX Sharp Shadows Enabled", Vector(0.685, 0.585, 0.0), nil);
    tab18_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Shadow Auto Depth Bounds", "LightEnv Shadow Auto Depth Bounds", Vector(0.685, 0.595, 0.0), nil);
    tab18_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Moment Bias", Vector(0.685, 0.605, 0.0), true, nil, nil);
    tab18_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Depth Bias", Vector(0.685, 0.615, 0.0), true, nil, nil);
    tab18_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Position Offset Bias", Vector(0.685, 0.625, 0.0), true, nil, nil);
    tab18_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Light Bleed Reduction", Vector(0.685, 0.635, 0.0), true, nil, nil);
    tab18_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Min Distance", Vector(0.685, 0.645, 0.0), true, nil, nil);
    tab18_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Max Distance", Vector(0.685, 0.655, 0.0), true, nil, nil);
    tab18_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Dynamic Shadow Max Distance", Vector(0.685, 0.665, 0.0), true, nil, nil);
    tab18_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Light Shadow Trace Max Distance", Vector(0.685, 0.675, 0.0), true, nil, nil);
    tab18_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Cascade Split Bias", Vector(0.685, 0.685, 0.0), true, nil, nil);
    tab18_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Max Updates", Vector(0.685, 0.695, 0.0), true, nil, nil);
    tab18_vector3Property13 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Light Static Shadow Bounds Min", "Light Static Shadow Bounds Min", Vector(0.685, 0.705, 0.0), true, nil, nil, nil, nil, nil, nil);
    tab18_vector3Property14 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Light Static Shadow Bounds Max", "Light Static Shadow Bounds Max", Vector(0.685, 0.735, 0.0), true, nil, nil, nil, nil, nil, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab18Update = function()
    --[SHADOWS] 18
    tab18_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_boolProperty2["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty9["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty10["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty11["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_numberProperty12["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_vector3Property13["Visible"] = TLSE_TabSceneProperties_Tab18_Active;
    tab18_vector3Property14["Visible"] = TLSE_TabSceneProperties_Tab18_Active;

    if(TLSE_TabSceneProperties_Tab18_Active == false) then
        return
    end

    --[SHADOWS] 18
    tab18_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_boolProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty11["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty12["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_vector3Property13["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab18_vector3Property14["ReferenceAgent"] = TLSE_Development_SceneAgent;
end