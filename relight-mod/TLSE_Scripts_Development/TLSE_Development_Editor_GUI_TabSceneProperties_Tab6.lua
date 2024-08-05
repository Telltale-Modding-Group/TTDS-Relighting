--[GLOW] 6
local tab6_colorProperty1 = nil; --(Color) Glow Clear Color
local tab6_numberProperty2 = nil; --(number) Glow Sigma Scale

--[GLOW] 6
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Glow Clear Color", 0, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_R = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Glow Clear Color", 0, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Glow Clear Color", 1, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_G = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Glow Clear Color", 1, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Glow Clear Color", 2, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_B = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Glow Clear Color", 2, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Glow Clear Color", 3, TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_A = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyColorPropertyValueOnAgent("Glow Clear Color", 3, -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Glow Sigma Scale", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("Glow Sigma Scale", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab6Initalize = function()
    --[GLOW] 6
    tab6_colorProperty1 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Glow Clear Color", "Glow Clear Color", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_R, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_G, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_B, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_A, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_R, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_G, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_B, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_A);
    tab6_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Glow Sigma Scale", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab6Property2, TLSE_TabSceneProperties_OnDecrease_Tab6Property2);
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