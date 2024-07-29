--[BLOOM] 5
local tab5_numberProperty1 = nil; --(number) FX Bloom Threshold
local tab5_numberProperty2 = nil; --(number) FX Bloom Intensity

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

--[BLOOM] 5
TLSE_TabSceneProperties_OnIncrease_Tab5Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Bloom Threshold", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab5Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Bloom Threshold", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab5Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Bloom Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab5Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Bloom Intensity", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab5Initalize = function()
    --[BLOOM] 5
    tab5_numberProperty1 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Bloom Threshold", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab5Property1, TLSE_TabSceneProperties_OnDecrease_Tab5Property1);
    tab5_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Bloom Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab5Property2, TLSE_TabSceneProperties_OnDecrease_Tab5Property2);
end

TLSE_Development_GUI_TabSceneProperties_Tab5Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab5";

    --[BLOOM] 5
    tab5_numberProperty1["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab5_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[BLOOM] 5
    tab5_numberProperty1["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab5_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end