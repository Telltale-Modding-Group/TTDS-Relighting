--[REFLECTION] 17
local tab17_boolProperty1 = nil; --(boolean) LightEnv Reflection Enabled
local tab17_numberProperty2 = nil; --(number) LightEnv Reflection Intensity
local tab17_numberProperty3 = nil; --(number) LightEnv Reflection Intensity Shadow
local tab17_colorProperty4 = nil; --(Color) LightEnv Reflection Tint
local tab17_labelProperty5 = nil; --(String) LightEnv Reflection Texture

--[REFLECTION] 17
TLSE_TabSceneProperties_OnToggle_Tab17Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Intensity", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Intensity", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Intensity Shadow", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Intensity Shadow", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Tint", 0, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Tint", 1, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Tint", 2, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Tint", 3, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Tint", 0, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Tint", 1, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Tint", 2, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "LightEnv Reflection Tint", 3, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end

TLSE_Development_GUI_TabSceneProperties_Tab17Initalize = function()
    --[REFLECTION] 17
    tab17_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Reflection Enabled", "LightEnv Reflection Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab17Property1);
    tab17_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Reflection Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property2, TLSE_TabSceneProperties_OnDecrease_Tab17Property2);
    tab17_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Reflection Intensity Shadow", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property3, TLSE_TabSceneProperties_OnDecrease_Tab17Property3);
    tab17_colorProperty4 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Reflection Tint", "LightEnv Reflection Tint", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_R, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_G, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_B, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_A, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_R, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_G, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_B, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_A);
    tab17_labelProperty5 = TLSE_Development_Editor_GUI_CreateLabel("LightEnv Reflection Texture", Vector(0.685, 0.655, 0.0));
end

TLSE_Development_GUI_TabSceneProperties_Tab17Update = function()
    --[REFLECTION] 17
    tab17_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab17_Active;
    tab17_numberProperty2["Visible"] = TLSE_TabSceneProperties_Tab17_Active;
    tab17_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab17_Active;
    tab17_colorProperty4["Visible"] = TLSE_TabSceneProperties_Tab17_Active;
    tab17_labelProperty5["Visible"] = TLSE_TabSceneProperties_Tab17_Active;

    if(TLSE_TabSceneProperties_Tab17_Active == false) then
        return
    end

    --[REFLECTION] 17
    tab17_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab17_numberProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab17_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab17_colorProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;

    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, "LightEnv Reflection Texture")) then
            local string_reflectionTexture = AgentGetProperty(TLSE_Development_SceneAgent, "LightEnv Reflection Texture");
            tab17_labelProperty5["Text"] = "LightEnv Reflection Texture: " .. tostring(string_reflectionTexture);
        else
            tab17_labelProperty5["Text"] = "LightEnv Reflection Texture: nil";
        end
    else
        tab17_labelProperty5["Text"] = "LightEnv Reflection Texture: nil";
    end
end