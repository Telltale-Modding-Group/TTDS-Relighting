--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI STYLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI STYLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI STYLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--Here we define the many parameters that are used to help standardize the GUI elements that we will be creating and messing with.
TLSE_Development_Editor_GUI_TextScale = 0.35;
TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation = 0.0025;
TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation = 0.01;

local color_textButtonHover = Color(1, 1, 1, 1);
local color_textButtonBackgroundHover = Color(1, 1, 1, 0.25);

local color_textButtonPress = Color(0.25, 0.25, 0.25, 1);
local color_textButtonBackgroundPress = Color(0, 0, 0, 1);

local color_textButtonSelected = Color(0.75, 0.85, 1, 1);
local color_textButtonBackgroundSelected = Color(0, 0, 0, 0.75);

local color_textButtonDefault = Color(0.75, 0.75, 0.75, 1);
local color_textButtonBackgroundDefault = Color(0, 0, 0, 0.25);

local color_labelDefault = Color(1, 1, 1, 1);

TLSE_Development_Editor_GUI_TextButtonHover = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_textButtonHover);
    AgentSetProperty(agent_textAgent, "Text Background", true);
    AgentSetProperty(agent_textAgent, "Text Background Color", color_textButtonBackgroundHover);
end

TLSE_Development_Editor_GUI_TextButtonPress = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_textButtonPress);
    AgentSetProperty(agent_textAgent, "Text Background", true);
    AgentSetProperty(agent_textAgent, "Text Background Color", color_textButtonBackgroundPress);
end

TLSE_Development_Editor_GUI_TextButtonSelected = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_textButtonSelected);
    AgentSetProperty(agent_textAgent, "Text Background", true);
    AgentSetProperty(agent_textAgent, "Text Background Color", color_textButtonBackgroundSelected);
end

TLSE_Development_Editor_GUI_TextButtonDefault = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_textButtonDefault);
    AgentSetProperty(agent_textAgent, "Text Background", true);
    AgentSetProperty(agent_textAgent, "Text Background Color", color_textButtonBackgroundDefault);
end

TLSE_Development_Editor_GUI_LabelDefault = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_labelDefault);
    AgentSetProperty(agent_textAgent, "Text Background", false);
end

--|||||||||||||||||||||||||||||||||||||||||||||||||||| PROPERTY FIELD VALUE ADJUSTMENTS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| PROPERTY FIELD VALUE ADJUSTMENTS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| PROPERTY FIELD VALUE ADJUSTMENTS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_GUI_PropertyAdjustmentValue = 1;

TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent = function(agent_object, string_property, number_adjustment, bool_multiplyByFrameTime)
    if(agent_object ~= nil) then
        if(AgentHasProperty(agent_object, string_property)) then
            local number_originalValue = AgentGetProperty(agent_object, string_property);

            if(bool_multiplyByFrameTime) then
                number_originalValue = number_originalValue + (number_adjustment * GetFrameTime());
            else
                number_originalValue = number_originalValue + number_adjustment;
            end

            AgentSetProperty(agent_object, string_property, number_originalValue);
        end
    end
end

TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent = function(agent_object, string_property)
    if(agent_object ~= nil) then
        if(AgentHasProperty(agent_object, string_property)) then
            local number_originalValue = AgentGetProperty(agent_object, string_property);

            number_originalValue = not number_originalValue;

            AgentSetProperty(agent_object, string_property, number_originalValue);
        end
    end
end

TLSE_Development_GUI_ModifiyVector3PropertyValueOnAgent = function(agent_object, string_property, number_component, number_adjustment)
    if(agent_object ~= nil) then
        if(AgentHasProperty(agent_object, string_property)) then
            local vector_originalValue = AgentGetProperty(agent_object, string_property);

            if(number_component == 0) then
                vector_originalValue.x = vector_originalValue.x + number_adjustment;
            elseif(number_component == 1) then
                vector_originalValue.y = vector_originalValue.y + number_adjustment;
            elseif(number_component == 2) then
                vector_originalValue.z = vector_originalValue.z + number_adjustment;
            end

            AgentSetProperty(agent_object, string_property, vector_originalValue);
        end
    end
end

TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent = function(agent_object, string_property, number_channel, number_adjustment, bool_clamp01)
    if(agent_object ~= nil) then
        if(AgentHasProperty(agent_object, string_property)) then
            local color_originalValue = AgentGetProperty(agent_object, string_property);

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

            AgentSetProperty(agent_object, string_property, color_originalValue);
        end
    end
end

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_Update = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        TLSE_Development_GUI_PropertyAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        TLSE_Development_GUI_PropertyAdjustmentValue = 0.01;
    else
        TLSE_Development_GUI_PropertyAdjustmentValue = 1;
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_Labels) do
        TLSE_Development_Editor_GUI_UpdateLabel(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_TextButtons) do
        TLSE_Development_Editor_GUI_UpdateTextButton(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_NumberPropertyFields) do
        TLSE_Development_Editor_GUI_UpdateNumberPropertyField(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_BooleanPropertyFields) do
        TLSE_Development_Editor_GUI_UpdateBooleanPropertyField(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_ColorPropertyFields) do
        TLSE_Development_Editor_GUI_UpdateColorPropertyField(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_Vector3PropertyFields) do
        TLSE_Development_Editor_GUI_UpdateVector3PropertyField(value);
    end
end