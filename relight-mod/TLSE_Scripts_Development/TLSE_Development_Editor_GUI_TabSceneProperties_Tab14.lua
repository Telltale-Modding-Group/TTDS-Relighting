--[SCREEN SPACE LINES] 14
local tab14_boolProperty1 = nil; --(boolean) Screen Space Lines - Enabled
local tab14_colorProperty2 = nil; --(Color) Screen Space Lines - Color
local tab14_numberProperty3 = nil; --(number) Screen Space Lines - Thickness
local tab14_numberProperty4 = nil; --(number) Screen Space Lines - Depth Fade Near
local tab14_numberProperty5 = nil; --(number) Screen Space Lines - Depth Fade Far
local tab14_numberProperty6 = nil; --(number) Screen Space Lines - Depth Magnitude
local tab14_numberProperty7 = nil; --(number) Screen Space Lines - Depth Exponent
local tab14_numberProperty8 = nil; --(number) Screen Space Lines - Debug
local tab14_numberProperty9 = nil; --(number) Screen Space Lines - Light Magnitude
local tab14_numberProperty10 = nil; --(number) Screen Space Lines - Light Exponent
local tab14_vector3Property11 = nil; --(Vector3) Screen Space Lines - Light Direction

--[SCREEN SPACE LINES] 14
TLSE_TabSceneProperties_OnToggle_Tab14Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Color", 0, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Color", 1, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Color", 2, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Color", 3, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Color", 0, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Color", 1, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Color", 2, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Color", 3, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Thickness", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Thickness", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Depth Fade Near", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Depth Fade Near", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Depth Fade Far", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Depth Fade Far", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property6 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Depth Magnitude", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property6 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Depth Magnitude", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property7 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Depth Exponent", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property7 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Depth Exponent", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property8 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Debug", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property8 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Debug", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property9 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Magnitude", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property9 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Magnitude", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property10 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Exponent", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property10 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Exponent", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_X = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Direction", 0, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Y = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Direction", 1, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Z = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Direction", 2, TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_X = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Direction", 0, -TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Y = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Direction", 1, -TLSE_Development_GUI_PropertyAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Z = function(textButton_button) TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent(TLSE_Development_SceneAgent, "Screen Space Lines - Light Direction", 2, -TLSE_Development_GUI_PropertyAdjustmentValue); end

TLSE_Development_GUI_TabSceneProperties_Tab14Initalize = function()
    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Screen Space Lines - Enabled", "Screen Space Lines - Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab14Property1);
    tab14_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Screen Space Lines - Color", "Screen Space Lines - Color", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_A);
    tab14_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Thickness", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property3, TLSE_TabSceneProperties_OnDecrease_Tab14Property3);
    tab14_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Fade Near", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property4, TLSE_TabSceneProperties_OnDecrease_Tab14Property4);
    tab14_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Fade Far", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property5, TLSE_TabSceneProperties_OnDecrease_Tab14Property5);
    tab14_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Magnitude", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property6, TLSE_TabSceneProperties_OnDecrease_Tab14Property6);
    tab14_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Exponent", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property7, TLSE_TabSceneProperties_OnDecrease_Tab14Property7);
    tab14_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Debug", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property8, TLSE_TabSceneProperties_OnDecrease_Tab14Property8);
    tab14_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Light Magnitude", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property9, TLSE_TabSceneProperties_OnDecrease_Tab14Property9);
    tab14_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Light Exponent", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property10, TLSE_TabSceneProperties_OnDecrease_Tab14Property10);
    tab14_vector3Property11 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Screen Space Lines - Light Direction", "Screen Space Lines - Light Direction", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_X, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Y, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Z, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_X, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Y, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Z);
end

TLSE_Development_GUI_TabSceneProperties_Tab14Update = function()
    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_colorProperty2["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty3["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty4["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty9["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_numberProperty10["Visible"] = TLSE_TabSceneProperties_Tab14_Active;
    tab14_vector3Property11["Visible"] = TLSE_TabSceneProperties_Tab14_Active;

    if(TLSE_TabSceneProperties_Tab14_Active == false) then
        return
    end

    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_colorProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab14_vector3Property11["ReferenceAgent"] = TLSE_Development_SceneAgent;
end