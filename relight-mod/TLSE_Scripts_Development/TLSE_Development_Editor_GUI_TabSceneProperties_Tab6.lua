--[GLOW] 6
local tab6_colorProperty1 = nil; --(Color) Glow Clear Color
local tab6_numberProperty2 = nil; --(number) Glow Sigma Scale

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

local ModifiyColorPropertyValueOnAgent = function(string_property, number_channel, number_adjustment, bool_clamp01)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local color_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            if(number_channel == 0) then
                color_originalValue.r = color_originalValue.r + number_adjustment;
            elseif(number_channel == 1) then
                color_originalValue.g = color_originalValue.g + number_adjustment;
            elseif(number_channel == 2) then
                color_originalValue.b = color_originalValue.b + number_adjustment;
            elseif(number_channel == 3) then
                color_originalValue.a = color_originalValue.a + number_adjustment;
            end

            if(bool_clamp01) then
                color_originalValue = TLSE_ColorClamp01(color_originalValue);
            end

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, color_originalValue);
        end
    end
end

--[GLOW] 6
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Glow Sigma Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Glow Sigma Scale", -numberPropertyFieldAdjustmentValue, false); end

TLSE_Development_GUI_TabSceneProperties_Tab6Initalize = function()
    --[GLOW] 6
    tab6_colorProperty1 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Glow Clear Color", "Glow Clear Color", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_R, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_G, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_B, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_A, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_R, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_G, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_B, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_A);
    tab6_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Glow Sigma Scale", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab6Property2, TLSE_TabSceneProperties_OnDecrease_Tab6Property2);
end

TLSE_Development_GUI_TabSceneProperties_Tab6Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab6";

    --[GLOW] 6
    tab6_colorProperty1["ColorFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab6_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    
    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[GLOW] 6
    tab6_colorProperty1["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab6_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end