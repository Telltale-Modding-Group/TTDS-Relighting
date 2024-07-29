--[FX TONEMAP] 8
local tab8_boolProperty1 = nil; --(boolean) FX Tonemap Enabled
local tab8_boolProperty2 = nil; --(boolean) FX Tonemap DOF Enabled
local tab8_numberProperty3 = nil; --(number) FX Tonemap Intensity
local tab8_numberProperty4 = nil; --(number) FX Tonemap Type
local tab8_numberProperty5 = nil; --(number) FX Tonemap White Point
local tab8_numberProperty6 = nil; --(number) FX Tonemap Black Point
local tab8_numberProperty7 = nil; --(number) FX Tonemap Filmic Pivot
local tab8_numberProperty8 = nil; --(number) FX Tonemap Filmic Sign
local tab8_numberProperty9 = nil; --(number) FX Tonemap Filmic Shoulder Intensity
local tab8_numberProperty10 = nil; --(number) FX Tonemap Filmic Toe Intensity
local tab8_numberProperty11 = nil; --(number) FX Tonemap Far Filmic Pivot
local tab8_numberProperty12 = nil; --(number) FX Tonemap Far Filmic Sign
local tab8_numberProperty13 = nil; --(number) FX Tonemap Far Filmic Shoulder Intensity
local tab8_numberProperty14 = nil; --(number) FX Tonemap Far Filmic Toe Intensity
local tab8_numberProperty15 = nil; --(number) FX Tonemap Far White Point
local tab8_numberProperty16 = nil; --(number) FX Tonemap Far Black Point

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

--[FX TONEMAP] 8
TLSE_TabSceneProperties_OnToggle_Tab8Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Tonemap Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab8Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Tonemap DOF Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Type", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Type", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap White Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap White Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Black Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Black Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Pivot", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Pivot", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Sign", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Sign", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Shoulder Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Shoulder Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Toe Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Toe Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Pivot", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Pivot", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Sign", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Sign", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Shoulder Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Shoulder Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property14 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Toe Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property14 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Toe Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far White Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far White Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Black Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Black Point", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab8Initalize = function()
    --[FX TONEMAP] 8
    tab8_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap Enabled", "FX Tonemap Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab8Property1);
    tab8_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap DOF Enabled", "FX Tonemap DOF Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab8Property2);
    tab8_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Intensity", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property3, TLSE_TabSceneProperties_OnDecrease_Tab8Property3);
    tab8_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Type", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property4, TLSE_TabSceneProperties_OnDecrease_Tab8Property4);
    tab8_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap White Point", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property5, TLSE_TabSceneProperties_OnDecrease_Tab8Property5);
    tab8_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Black Point", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property6, TLSE_TabSceneProperties_OnDecrease_Tab8Property6);
    tab8_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Pivot", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property7, TLSE_TabSceneProperties_OnDecrease_Tab8Property7);
    tab8_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Sign", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property8, TLSE_TabSceneProperties_OnDecrease_Tab8Property8);
    tab8_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Shoulder Intensity", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property9, TLSE_TabSceneProperties_OnDecrease_Tab8Property9);
    tab8_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Toe Intensity", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property10, TLSE_TabSceneProperties_OnDecrease_Tab8Property10);
    tab8_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Pivot", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property11, TLSE_TabSceneProperties_OnDecrease_Tab8Property11);
    tab8_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Sign", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property12, TLSE_TabSceneProperties_OnDecrease_Tab8Property12);
    tab8_numberProperty13 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Shoulder Intensity", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property13, TLSE_TabSceneProperties_OnDecrease_Tab8Property13);
    tab8_numberProperty14 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Toe Intensity", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property14, TLSE_TabSceneProperties_OnDecrease_Tab8Property14);
    tab8_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far White Point", Vector(0.685, 0.725, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property15, TLSE_TabSceneProperties_OnDecrease_Tab8Property15);
    tab8_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Black Point", Vector(0.685, 0.735, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property16, TLSE_TabSceneProperties_OnDecrease_Tab8Property16);
end

TLSE_Development_GUI_TabSceneProperties_Tab8Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab8";

    --[FX TONEMAP] 8
    tab8_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_boolProperty2["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty6["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty7["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty8["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty9["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty10["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty11["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty12["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty13["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty14["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty15["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab8_numberProperty16["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[FX TONEMAP] 8
    tab8_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty13["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty14["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty15["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty16["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end