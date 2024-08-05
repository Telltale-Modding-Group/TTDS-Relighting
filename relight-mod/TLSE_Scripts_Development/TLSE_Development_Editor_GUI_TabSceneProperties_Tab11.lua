--[FX DOF] 11
local tab11_boolProperty1 = nil; --(boolean) FX DOF Enabled
local tab11_boolProperty2 = nil; --(boolean) FX DOF FOV Adjust Enabled
local tab11_boolProperty3 = nil; --(boolean) FX DOF Auto Focus Enabled
local tab11_boolProperty4 = nil; --(boolean) FX Vignette DOF Enabled
local tab11_numberProperty5 = nil; --(number) FX DOF Near
local tab11_numberProperty6 = nil; --(number) FX DOF Far
local tab11_numberProperty7 = nil; --(number) FX DOF Near Falloff
local tab11_numberProperty8 = nil; --(number) FX DOF Far Falloff
local tab11_numberProperty9 = nil; --(number) FX DOF Near Max
local tab11_numberProperty10 = nil; --(number) FX DOF Far Max
local tab11_numberProperty11 = nil; --(number) FX DOF Vignette Max
local tab11_numberProperty12 = nil; --(number) FX DOF Coverage Boost
local tab11_numberProperty13 = nil; --(number) FX DOF Debug

--[FX DOF] 11
TLSE_TabSceneProperties_OnToggle_Tab11Property1 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("FX DOF Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab11Property2 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("FX DOF FOV Adjust Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab11Property3 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("FX DOF Auto Focus Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab11Property4 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyBooleanPropertyValueOnAgent("FX Vignette DOF Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property5 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Near", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property5 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Near", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property6 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Far", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property6 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Far", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Near Falloff", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property7 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Near Falloff", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property8 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Far Falloff", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property8 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Far Falloff", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property9 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Near Max", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property9 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Near Max", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property10 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Far Max", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property10 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Far Max", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property11 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Vignette Max", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property11 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Vignette Max", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property12 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Coverage Boost", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property12 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Coverage Boost", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property13 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Debug", TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property13 = function(textButton_button) TLSE_Development_GUI_TabSceneProperties_ModifiyNumberPropertyValueOnAgent("FX DOF Debug", -TLSE_Development_GUI_TabSceneProperties_NumberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab11Initalize = function()
    --[FX DOF] 11
    tab11_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX DOF Enabled", "FX DOF Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab11Property1);
    tab11_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX DOF FOV Adjust Enabled", "FX DOF FOV Adjust Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab11Property2);
    tab11_boolProperty3 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX DOF Auto Focus Enabled", "FX DOF Auto Focus Enabled", Vector(0.685, 0.605, 0.0), TLSE_TabSceneProperties_OnToggle_Tab11Property3);
    tab11_boolProperty4 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Vignette DOF Enabled", "FX Vignette DOF Enabled", Vector(0.685, 0.615, 0.0), TLSE_TabSceneProperties_OnToggle_Tab11Property4);
    tab11_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Near", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property5, TLSE_TabSceneProperties_OnDecrease_Tab11Property5);
    tab11_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Far", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property6, TLSE_TabSceneProperties_OnDecrease_Tab11Property6);
    tab11_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Near Falloff", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property7, TLSE_TabSceneProperties_OnDecrease_Tab11Property7);
    tab11_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Far Falloff", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property8, TLSE_TabSceneProperties_OnDecrease_Tab11Property8);
    tab11_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Near Max", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property9, TLSE_TabSceneProperties_OnDecrease_Tab11Property9);
    tab11_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Far Max", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property10, TLSE_TabSceneProperties_OnDecrease_Tab11Property10);
    tab11_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Vignette Max", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property11, TLSE_TabSceneProperties_OnDecrease_Tab11Property11);
    tab11_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Coverage Boost", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property12, TLSE_TabSceneProperties_OnDecrease_Tab11Property12);
    tab11_numberProperty13 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Debug", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property13, TLSE_TabSceneProperties_OnDecrease_Tab11Property13);
end

TLSE_Development_GUI_TabSceneProperties_Tab11Update = function()
    --[FX DOF] 11
    tab11_boolProperty1["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_boolProperty2["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_boolProperty3["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_boolProperty4["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty5["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty6["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty7["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty8["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty9["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty10["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty11["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty12["Visible"] = TLSE_TabSceneProperties_Tab11_Active;
    tab11_numberProperty13["Visible"] = TLSE_TabSceneProperties_Tab11_Active;

    if(TLSE_TabSceneProperties_Tab11_Active == false) then
        return
    end

    --[FX DOF] 11
    tab11_boolProperty1["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_boolProperty2["ReferenceAgent"] = TLSE_Development_SceneAgent
    tab11_boolProperty3["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_boolProperty4["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty5["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty6["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty7["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty8["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty9["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty10["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty11["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty12["ReferenceAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty13["ReferenceAgent"] = TLSE_Development_SceneAgent;
end