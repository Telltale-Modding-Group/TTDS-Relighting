--[FX AMBIENT OCCLUSION] 10
local tab10_boolProperty1 = nil; --(boolean) FX Ambient Occlusion Enabled
local tab10_numberProperty2 = nil; --(number) FX Ambient Occlusion Intensity
local tab10_numberProperty3 = nil; --(number) FX Ambient Occlusion Falloff
local tab10_numberProperty4 = nil; --(number) FX Ambient Occlusion Radius
local tab10_numberProperty5 = nil; --(number) FX Ambient Occlusion Lightmap

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

--[FX AMBIENT OCCLUSION] 10
TLSE_TabSceneProperties_OnToggle_Tab10Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Ambient Occlusion Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab10Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab10Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab10Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab10Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab10Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Radius", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab10Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Radius", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab10Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Lightmap", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab10Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Lightmap", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab10Initalize = function()
    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Ambient Occlusion Enabled", "FX Ambient Occlusion Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab10Property1);
    tab10_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab10Property2, TLSE_TabSceneProperties_OnDecrease_Tab10Property2);
    tab10_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Falloff", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab10Property3, TLSE_TabSceneProperties_OnDecrease_Tab10Property3);
    tab10_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Radius", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab10Property4, TLSE_TabSceneProperties_OnDecrease_Tab10Property4);
    tab10_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Lightmap", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab10Property5, TLSE_TabSceneProperties_OnDecrease_Tab10Property5);
end

TLSE_Development_GUI_TabSceneProperties_Tab10Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab10";

    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1["BooleanPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab10_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab10_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab10_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab10_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end