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

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_Update = function()
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