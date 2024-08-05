--[SCENE FOG] 3
local tab3_boolProperty1 = nil; --(boolean) Fog Enabled
local tab3_colorProperty2 = nil; --(Color) Fog Color
local tab3_numberProperty3 = nil; --(number) Fog Far Plane
local tab3_numberProperty4 = nil; --(number) Fog Near Plane
local tab3_numberProperty5 = nil; --(number) Fog Alpha

--[SCENE FOG] 3
TLSE_TabSceneProperties_OnToggle_Tab3Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property2_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Color", 0, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property2_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Color", 1, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property2_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Color", 2, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property2_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Color", 3, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property2_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Color", 0, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property2_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Color", 1, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property2_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Color", 2, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property2_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Color", 3, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Far Plane", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Far Plane", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Near Plane", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Near Plane", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Alpha", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Fog Alpha", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab3Initalize = function()
    --[SCENE FOG] 3
    tab3_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Fog Enabled", "Fog Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab3Property1);
    tab3_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Fog Color", "Fog Color", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab3Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab3Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab3Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab3Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab3Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab3Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab3Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab3Property2_A);
    tab3_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Far Plane", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab3Property3, TLSE_TabSceneProperties_OnDecrease_Tab3Property3);
    tab3_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Near Plane", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab3Property4, TLSE_TabSceneProperties_OnDecrease_Tab3Property4);
    tab3_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Alpha", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab3Property5, TLSE_TabSceneProperties_OnDecrease_Tab3Property5);
end

TLSE_Development_GUI_TabSceneProperties_Tab3Update = function()
    --[SCENE FOG] 3
    tab3_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab3_Active;
    tab3_colorProperty2["Visible"] = TLSE_TabSceneProperties_Tab3_Active;
    tab3_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab3_Active;
    tab3_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab3_Active;
    tab3_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab3_Active;

    if(TLSE_TabSceneProperties_Tab3_Active == false) then
        return
    end

    --[SCENE FOG] 3
    tab3_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab3_colorProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab3_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab3_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab3_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
end