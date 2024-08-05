--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_TextButtonsCount = 1;
TLSE_Development_Editor_GUI_TextButtons = {};

TLSE_Development_Editor_GUI_CreateTextButton = function(string_textContents, bool_isSelectable, vector_screenPosition, function_onPress, function_onHold)
    local string_agentName = "TLSE_Development_TextButton" .. tostring(TLSE_Development_Editor_GUI_TextButtonsCount);
    
    local textButton_newTextButton = 
    {
        TextAgent = TLSE_TextUI_CreateTextAgent(string_agentName, string_textContents, Vector(0, 0, 0), 0, 0, TLSE_Development_SceneObject),
        Name = string_agentName,
        Text = string_textContents,
        OnPress = function_onPress,
        OnHold = function_onHold,
        ParameterData = nil,
        Selected = false,
        IsSelectable = bool_isSelectable,
        Visible = true,
        ScreenPosition = vector_screenPosition
    };

    TextSetScale(textButton_newTextButton["TextAgent"], TLSE_Development_Editor_GUI_TextScale);

    TLSE_Development_Editor_GUI_TextButtonDefault(textButton_newTextButton["TextAgent"]);

    table.insert(TLSE_Development_Editor_GUI_TextButtons, textButton_newTextButton);
    TLSE_Development_Editor_GUI_TextButtonsCount = TLSE_Development_Editor_GUI_TextButtonsCount + 1;

    return textButton_newTextButton;
end

TLSE_Development_Editor_GUI_UpdateTextButton = function(textButton_button)
    if(textButton_button == nil) then return end

    local bool_selected = textButton_button["Selected"];
    local agent_button = textButton_button["TextAgent"];

    if(textButton_button["Visible"] == false) then
        AgentSetProperty(agent_button, "Runtime: Visible", false);
        return
    else
        AgentSetProperty(agent_button, "Runtime: Visible", true);
    end

    AgentSetWorldPosFromLogicalScreenPos(agent_button, textButton_button["ScreenPosition"]);

    TextSet(agent_button, textButton_button["Text"]);

    if(TLSE_TextUI_IsCursorOverTextAgent(agent_button) and TLSE_Development_Freecam_Frozen) then
        TLSE_Development_Editor_GUI_TextButtonHover(agent_button);

        if(TLSE_Development_Editor_Input_LeftMouseClicked) then
            if(textButton_button["IsSelectable"]) then
                textButton_button["Selected"] = not bool_selected;
            end

            TLSE_Development_Editor_GUI_TextButtonPress(agent_button);

            if(textButton_button["OnPress"] ~= nil) then
                textButton_button["OnPress"](textButton_button["ParameterData"]);
            end
        end

        if(TLSE_Development_Editor_Input_LeftMouseHold) then
            TLSE_Development_Editor_GUI_TextButtonPress(agent_button);

            if(textButton_button["OnHold"] ~= nil) then
                textButton_button["OnHold"](textButton_button["ParameterData"]);
            end
        end
    else
        if(bool_selected) then
            TLSE_Development_Editor_GUI_TextButtonSelected(agent_button);
        else
            TLSE_Development_Editor_GUI_TextButtonDefault(agent_button);
        end
    end
end