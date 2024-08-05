--[BLOOM] 5
local tab5_numberProperty1 = nil; --(number) FX Bloom Threshold
local tab5_numberProperty2 = nil; --(number) FX Bloom Intensity

--[BLOOM] 5
TLSE_TabSceneProperties_OnIncrease_Tab5Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Bloom Threshold", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab5Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Bloom Threshold", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab5Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Bloom Intensity", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab5Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Bloom Intensity", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab5Initalize = function()
    --[BLOOM] 5
    tab5_numberProperty1 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Bloom Threshold", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab5Property1, TLSE_TabSceneProperties_OnDecrease_Tab5Property1);
    tab5_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Bloom Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab5Property2, TLSE_TabSceneProperties_OnDecrease_Tab5Property2);
end

TLSE_Development_GUI_TabSceneProperties_Tab5Update = function()
    --[BLOOM] 5
    tab5_numberProperty1["Visible"] = TLSE_TabSceneProperties_Tab5_Active;
    tab5_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab5_Active;

    if(TLSE_TabSceneProperties_Tab5_Active == false) then
        return
    end

    --[BLOOM] 5
    tab5_numberProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab5_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
end