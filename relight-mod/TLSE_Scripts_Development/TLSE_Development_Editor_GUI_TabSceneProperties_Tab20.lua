--[FRAME BUFFER] 20
local tab20_boolProperty1 = nil; --(boolean) Frame Buffer Scale Override
local tab20_numberProperty2 = nil; --(number) Frame Buffer Scale Factor

--[FRAME BUFFER] 20
TLSE_TabSceneProperties_OnToggle_Tab20Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("Frame Buffer Scale Override"); end
TLSE_TabSceneProperties_OnIncrease_Tab20Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Frame Buffer Scale Factor", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab20Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Frame Buffer Scale Factor", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab20Initalize = function()
    --[FRAME BUFFER] 20
    tab20_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Frame Buffer Scale Override", "Frame Buffer Scale Override", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab20Property1);
    tab20_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Frame Buffer Scale Factor", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab20Property2, TLSE_TabSceneProperties_OnDecrease_Tab20Property2);
end

TLSE_Development_GUI_TabSceneProperties_Tab20Update = function()
    --[FRAME BUFFER] 20
    tab20_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab20_Active;
    tab20_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab20_Active;

    if(TLSE_TabSceneProperties_Tab20_Active == false) then
        return
    end

    --[FRAME BUFFER] 20
    tab20_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab20_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
end