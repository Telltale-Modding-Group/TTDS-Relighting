--[FX BRUSH] 19
local tab19_boolProperty1 = nil; --(boolean) FX Brush Outline Enable
local tab19_boolProperty2 = nil; --(boolean) FX Brush Outline Filter Enable
local tab19_boolProperty3 = nil; --(boolean) FX Brush DOF Enable
local tab19_numberProperty4 = nil; --(number) FX Brush Outline Size
local tab19_numberProperty5 = nil; --(number) FX Brush Outline Threshold
local tab19_numberProperty6 = nil; --(number) FX Brush Outline Color Threshold
local tab19_numberProperty7 = nil; --(number) FX Brush Outline Falloff
local tab19_numberProperty8 = nil; --(number) FX Brush Near Outline Scale
local tab19_numberProperty9 = nil; --(number) FX Brush Near Scale
local tab19_numberProperty10 = nil; --(number) FX Brush Near Detail
local tab19_numberProperty11 = nil; --(number) FX Brush Far Scale
local tab19_numberProperty12 = nil; --(number) FX Brush Far Detail
local tab19_numberProperty13 = nil; --(number) FX Brush Far Scale Boost
local tab19_numberProperty14 = nil; --(number) FX Brush Far Plane
local tab19_numberProperty15 = nil; --(number) FX Brush Far Plane Falloff
local tab19_numberProperty16 = nil; --(number) FX Brush Far Plane Max Scale

local numberPropertyFieldAdjustmentValue = 1;

local ModifiyNumberPropertyValueOnAgent = function(string_property, number_adjustment, bool_multiplyByFrameTime)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local number_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            if(bool_multiplyByFrameTime) then
                number_originalValue = number_originalValue + (number_adjustment * GetFrameTime());
            else
                number_originalValue = number_originalValue + number_adjustment;
            end

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, number_originalValue);
        end
    end
end

local ModifiyBooleanPropertyValueOnAgent = function(string_property)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local number_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            number_originalValue = not number_originalValue;

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, number_originalValue);
        end
    end
end

--[FX BRUSH] 19
TLSE_TabSceneProperties_OnToggle_Tab19Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Brush Outline Enable"); end
TLSE_TabSceneProperties_OnToggle_Tab19Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Brush Outline Filter Enable"); end
TLSE_TabSceneProperties_OnToggle_Tab19Property3 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Brush DOF Enable"); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Size", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Size", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Threshold", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Threshold", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Color Threshold", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Color Threshold", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Outline Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Outline Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Detail", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Detail", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Detail", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Detail", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Scale Boost", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Scale Boost", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property14 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property14 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane Max Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane Max Scale", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab19Initalize = function()
    --[FX BRUSH] 19
    tab19_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush Outline Enable", "FX Brush Outline Enable", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab19Property1);
    tab19_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush Outline Filter Enable", "FX Brush Outline Filter Enable", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab19Property2);
    tab19_boolProperty3 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush DOF Enable", "FX Brush DOF Enable", Vector(0.685, 0.605, 0.0), TLSE_TabSceneProperties_OnToggle_Tab19Property3);
    tab19_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Size", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property4, TLSE_TabSceneProperties_OnDecrease_Tab19Property4);
    tab19_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Threshold", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property5, TLSE_TabSceneProperties_OnDecrease_Tab19Property5);
    tab19_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Color Threshold", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property6, TLSE_TabSceneProperties_OnDecrease_Tab19Property6);
    tab19_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Falloff", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property7, TLSE_TabSceneProperties_OnDecrease_Tab19Property7);
    tab19_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Outline Scale", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property8, TLSE_TabSceneProperties_OnDecrease_Tab19Property8);
    tab19_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Scale", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property9, TLSE_TabSceneProperties_OnDecrease_Tab19Property9);
    tab19_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Detail", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property10, TLSE_TabSceneProperties_OnDecrease_Tab19Property10);
    tab19_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Scale", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property11, TLSE_TabSceneProperties_OnDecrease_Tab19Property11);
    tab19_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Detail", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property12, TLSE_TabSceneProperties_OnDecrease_Tab19Property12);
    tab19_numberProperty13 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Scale Boost", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property13, TLSE_TabSceneProperties_OnDecrease_Tab19Property13);
    tab19_numberProperty14 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property14, TLSE_TabSceneProperties_OnDecrease_Tab19Property14);
    tab19_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane Falloff", Vector(0.685, 0.725, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property15, TLSE_TabSceneProperties_OnDecrease_Tab19Property15);
    tab19_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane Max Scale", Vector(0.685, 0.735, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property16, TLSE_TabSceneProperties_OnDecrease_Tab19Property16);
end

TLSE_Development_GUI_TabSceneProperties_Tab19Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab19";

    --[FX BRUSH] 19
    tab19_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_boolProperty2["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_boolProperty3["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty6["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty7["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty8["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty9["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty10["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty11["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty12["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty13["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty14["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty15["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab19_numberProperty16["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[FX BRUSH] 19
    tab19_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_boolProperty3["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty13["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty14["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty15["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty16["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end