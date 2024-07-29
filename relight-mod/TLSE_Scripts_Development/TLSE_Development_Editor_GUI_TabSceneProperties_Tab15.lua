--[GRAPHIC BLACK] 15
local tab15_numberProperty1 = nil; --(number) Graphic Black Threshold
local tab15_numberProperty2 = nil; --(number) Graphic Black Softness
local tab15_numberProperty3 = nil; --(number) Graphic Black Alpha
local tab15_numberProperty4 = nil; --(number) Graphic Black Near
local tab15_numberProperty5 = nil; --(number) Graphic Black Far
local textButton_graphicBlackToggle = nil;

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

--[GRAPHIC BLACK] 15
TLSE_TabSceneProperties_OnIncrease_Tab15Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Threshold", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Threshold", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Softness", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Softness", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Alpha", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Alpha", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Near", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Near", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Far", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Far", -numberPropertyFieldAdjustmentValue, false); end

TLSE_TabSceneProperties_OnClick_ToggleGraphicBlack = function(textButton_button)
    local prefs = GetPreferences()

    local bool_initalValue = PropertyGet(prefs, "Enable Graphic Black");

    bool_initalValue = not bool_initalValue;

    PropertySet(prefs, "Enable Graphic Black", bool_initalValue);
    PropertySet(prefs, "Render - Graphic Black Enabled", bool_initalValue);
end

TLSE_Development_GUI_TabSceneProperties_Tab15Initalize = function()
    --[GRAPHIC BLACK] 15
    tab15_numberProperty1 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Threshold", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property1, TLSE_TabSceneProperties_OnDecrease_Tab15Property1);
    tab15_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Softness", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property2, TLSE_TabSceneProperties_OnDecrease_Tab15Property2);
    tab15_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Alpha", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property3, TLSE_TabSceneProperties_OnDecrease_Tab15Property3);
    tab15_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Near", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property4, TLSE_TabSceneProperties_OnDecrease_Tab15Property4);
    tab15_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Far", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property5, TLSE_TabSceneProperties_OnDecrease_Tab15Property5);

    textButton_graphicBlackToggle = TLSE_Development_Editor_GUI_CreateTextButton("[TOGGLE GRAPHIC BLACK]", true, Vector(0.685, 0.635, 0.0), TLSE_TabSceneProperties_OnClick_ToggleGraphicBlack, nil);
end

TLSE_Development_GUI_TabSceneProperties_Tab15Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_currentTabActive = TLSE_TabSceneProperties_CurrentTab == "Tab15";

    --[GRAPHIC BLACK] 15
    tab15_numberProperty1["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab15_numberProperty2["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab15_numberProperty3["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab15_numberProperty4["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    tab15_numberProperty5["NumberPropertyFieldVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;
    textButton_graphicBlackToggle["TextButtonVisible"] = bool_currentTabActive and TLSE_TabSceneProperties_IsActive;

    if(TLSE_TabSceneProperties_IsActive == false) then
        return
    end

    --[GRAPHIC BLACK] 15
    tab15_numberProperty1["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end