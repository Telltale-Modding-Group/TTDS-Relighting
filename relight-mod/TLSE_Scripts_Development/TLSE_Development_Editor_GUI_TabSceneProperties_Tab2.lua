--[FX LEVELS] 2
local tab2_boolProperty1 = nil; --(boolean) FX Levels Enabled
local tab2_numberProperty2 = nil; --(number) FX Levels Intensity
local tab2_numberProperty3 = nil; --(number) FX Levels Intensity HDR
local tab2_numberProperty4 = nil; --(number) FX Levels White Point
local tab2_numberProperty5 = nil; --(number) FX Levels White Point HDR
local tab2_numberProperty6 = nil; --(number) FX Levels Black Point
local tab2_numberProperty7 = nil; --(number) FX Levels Black Point HDR

--[FX LEVELS] 2
TLSE_TabSceneProperties_OnToggle_Tab2Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("FX Levels Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels Intensity", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels Intensity", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels Intensity HDR", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels Intensity HDR", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels White Point", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels White Point", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property5 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels White Point HDR", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property5 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels White Point HDR", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property6 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels Black Point", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property6 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels Black Point", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels Black Point HDR", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX Levels Black Point HDR", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab2Initalize = function()
    --[FX LEVELS] 2
    tab2_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Levels Enabled", "FX Levels Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab2Property1);
    tab2_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property2, TLSE_TabSceneProperties_OnDecrease_Tab2Property2);
    tab2_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels Intensity HDR", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property3, TLSE_TabSceneProperties_OnDecrease_Tab2Property3);
    tab2_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels White Point", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property4, TLSE_TabSceneProperties_OnDecrease_Tab2Property4);
    tab2_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels White Point HDR", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property5, TLSE_TabSceneProperties_OnDecrease_Tab2Property5);
    tab2_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels Black Point", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property6, TLSE_TabSceneProperties_OnDecrease_Tab2Property6);
    tab2_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels Black Point HDR", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property7, TLSE_TabSceneProperties_OnDecrease_Tab2Property7);
end

TLSE_Development_GUI_TabSceneProperties_Tab2Update = function()
    --[FX LEVELS] 2
    tab2_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab2_Active;
    tab2_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab2_Active;
    tab2_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab2_Active;
    tab2_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab2_Active;
    tab2_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab2_Active;
    tab2_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab2_Active;
    tab2_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab2_Active;

    if(TLSE_TabSceneProperties_Tab2_Active == false) then
        return
    end

    --[FX LEVELS] 2
    tab2_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
end