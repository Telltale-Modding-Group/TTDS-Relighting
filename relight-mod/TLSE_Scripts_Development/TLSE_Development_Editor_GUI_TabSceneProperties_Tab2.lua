--[FX LEVELS] 2
local tab2_boolProperty1 = nil; --(boolean) FX Levels Enabled
local tab2_numberProperty2 = nil; --(number) FX Levels Intensity
local tab2_numberProperty3 = nil; --(number) FX Levels Intensity HDR
local tab2_numberProperty4 = nil; --(number) FX Levels White Point
local tab2_numberProperty5 = nil; --(number) FX Levels White Point HDR
local tab2_numberProperty6 = nil; --(number) FX Levels Black Point
local tab2_numberProperty7 = nil; --(number) FX Levels Black Point HDR

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

--[FX LEVELS] 2
TLSE_TabSceneProperties_OnToggle_Tab2Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Levels Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Intensity HDR", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Intensity HDR", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels White Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels White Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels White Point HDR", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels White Point HDR", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Black Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Black Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Black Point HDR", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Black Point HDR", -numberPropertyFieldAdjustmentValue, false); end

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
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab2";

    --[FX LEVELS] 2
    tab2_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab2_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab2_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab2_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab2_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab2_numberProperty6["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab2_numberProperty7["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[FX LEVELS] 2
    tab2_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end