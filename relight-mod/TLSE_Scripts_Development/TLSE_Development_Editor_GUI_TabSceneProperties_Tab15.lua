--[GRAPHIC BLACK] 15
local tab15_numberProperty1 = nil; --(number) Graphic Black Threshold
local tab15_numberProperty2 = nil; --(number) Graphic Black Softness
local tab15_numberProperty3 = nil; --(number) Graphic Black Alpha
local tab15_numberProperty4 = nil; --(number) Graphic Black Near
local tab15_numberProperty5 = nil; --(number) Graphic Black Far
local textButton_graphicBlackToggle = nil;

--[GRAPHIC BLACK] 15
TLSE_TabSceneProperties_OnIncrease_Tab15Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Threshold", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Threshold", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Softness", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Softness", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Alpha", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Alpha", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Near", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Near", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Far", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Graphic Black Far", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end

TLSE_TabSceneProperties_OnClick_ToggleGraphicBlack = function(textButton_button)
    local prefs = GetPreferences()

    local bool_initalValue = PropertyGet(prefs, "Enable Graphic Black");

    bool_initalValue = not bool_initalValue;

    PropertySet(prefs, "Enable Graphic Black", bool_initalValue);
    PropertySet(prefs, "Render - Graphic Black Enabled", bool_initalValue);
end

TLSE_Development_GUI_TabSceneProperties_Tab15Initalize = function()
    --[GRAPHIC BLACK] 15
    tab15_numberProperty1 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Threshold", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property1, TLSE_TabSceneProperties_OnDecrease_Tab15Property1);
    tab15_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Softness", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property2, TLSE_TabSceneProperties_OnDecrease_Tab15Property2);
    tab15_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Alpha", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property3, TLSE_TabSceneProperties_OnDecrease_Tab15Property3);
    tab15_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Near", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property4, TLSE_TabSceneProperties_OnDecrease_Tab15Property4);
    tab15_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Far", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property5, TLSE_TabSceneProperties_OnDecrease_Tab15Property5);

    textButton_graphicBlackToggle = TLSE_Development_Editor_GUI_CreateTextButton("[TOGGLE GRAPHIC BLACK]", true, Vector(0.685, 0.635, 0.0), TLSE_TabSceneProperties_OnClick_ToggleGraphicBlack, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab15Update = function()
    --[GRAPHIC BLACK] 15
    tab15_numberProperty1["Visible"] = TLSE_TabSceneProperties_Tab15_Active;
    tab15_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab15_Active;
    tab15_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab15_Active;
    tab15_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab15_Active;
    tab15_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab15_Active;
    textButton_graphicBlackToggle["Visible"] = TLSE_TabSceneProperties_Tab15_Active;

    if(TLSE_TabSceneProperties_Tab15_Active == false) then
        return
    end

    --[GRAPHIC BLACK] 15
    tab15_numberProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
end