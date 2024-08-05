--[SPECULAR] 21
local tab21_boolProperty1 = nil; --(boolean) Specular Multiplier Enabled
local tab21_numberProperty2 = nil; --(number) Specular Color Multiplier
local tab21_numberProperty3 = nil; --(number) Specular Intensity Multiplier
local tab21_numberProperty4 = nil; --(number) Specular Exponent Multiplier

--[SPECULAR] 21
TLSE_TabSceneProperties_OnToggle_Tab21Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "Specular Multiplier Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Specular Color Multiplier", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Specular Color Multiplier", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Specular Intensity Multiplier", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Specular Intensity Multiplier", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Specular Exponent Multiplier", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Specular Exponent Multiplier", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab21Initalize = function()
    --[SPECULAR] 21
    tab21_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Specular Multiplier Enabled", "Specular Multiplier Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab21Property1);
    tab21_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Color Multiplier", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property2, TLSE_TabSceneProperties_OnDecrease_Tab21Property2);
    tab21_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Intensity Multiplier", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property3, TLSE_TabSceneProperties_OnDecrease_Tab21Property3);
    tab21_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Exponent Multiplier", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property4, TLSE_TabSceneProperties_OnDecrease_Tab21Property4);
end

TLSE_Development_GUI_TabSceneProperties_Tab21Update = function()
    --[SPECULAR] 21
    tab21_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab21_Active;
    tab21_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab21_Active;
    tab21_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab21_Active;
    tab21_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab21_Active;

    if(TLSE_TabSceneProperties_Tab21_Active == false) then
        return
    end

    --[SPECULAR] 21
    tab21_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
end