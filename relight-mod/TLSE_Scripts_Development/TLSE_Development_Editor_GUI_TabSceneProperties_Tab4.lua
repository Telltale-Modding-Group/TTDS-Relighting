--[NPR LINES] 4
local tab4_boolProperty1 = nil; --(boolean) Generate NPR Lines
local tab4_numberProperty2 = nil; --(number) NPR Lines Alpha Bias
local tab4_numberProperty3 = nil; --(number) NPR Lines Alpha Falloff
local tab4_numberProperty4 = nil; --(number) NPR Lines Bias
local tab4_numberProperty5 = nil; --(number) NPR Lines Falloff

--[NPR LINES] 4
TLSE_TabSceneProperties_OnToggle_Tab4Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "Generate NPR Lines"); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "NPR Lines Alpha Bias", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "NPR Lines Alpha Bias", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "NPR Lines Alpha Falloff", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "NPR Lines Alpha Falloff", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "NPR Lines Bias", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "NPR Lines Bias", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "NPR Lines Falloff", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "NPR Lines Falloff", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab4Initalize = function()
    --[NPR LINES] 4
    tab4_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Generate NPR Lines", "Generate NPR Lines", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab4Property1);
    tab4_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Alpha Bias", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property2, TLSE_TabSceneProperties_OnDecrease_Tab4Property2);
    tab4_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Alpha Falloff", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property3, TLSE_TabSceneProperties_OnDecrease_Tab4Property3);
    tab4_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Bias", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property4, TLSE_TabSceneProperties_OnDecrease_Tab4Property4);
    tab4_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Falloff", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property5, TLSE_TabSceneProperties_OnDecrease_Tab4Property5);
end

TLSE_Development_GUI_TabSceneProperties_Tab4Update = function()
    --[NPR LINES] 4
    tab4_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab4_Active;
    tab4_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab4_Active;
    tab4_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab4_Active;
    tab4_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab4_Active;
    tab4_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab4_Active;

    if(TLSE_TabSceneProperties_Tab4_Active == false) then
        return
    end

    --[NPR LINES] 4
    tab4_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
end