--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_TextButtonsCount = 1;
TLSE_Development_Editor_GUI_TextButtons = {};

TLSE_Development_Editor_GUI_CreateTextButton = function(string_textContents, bool_isSelectable, vector_screenPosition, function_onPress, function_onHold)
    local string_agentName = "TLSE_Development_TextButton" .. tostring(TLSE_Development_Editor_GUI_TextButtonsCount);
    
    local textButton_newTextButton = 
    {
        TextButtonAgentReference = TLSE_TextUI_CreateTextAgent(string_agentName, string_textContents, Vector(0, 0, 0), 0, 0),
        TextButtonAgentName = string_agentName,
        TextButtonText = string_textContents,
        TextButtonOnPress = function_onPress,
        TextButtonOnHold = function_onHold,
        TextButtonSelected = false,
        TextButtonIsSelectable = bool_isSelectable,
        TextButtonVisible = true,
        TextButtonScreenPosition = vector_screenPosition
    };

    TextSetScale(textButton_newTextButton["TextButtonAgentReference"], TLSE_Development_Editor_GUI_TextScale);

    TLSE_Development_Editor_GUI_TextButtonDefault(textButton_newTextButton["TextButtonAgentReference"]);

    table.insert(TLSE_Development_Editor_GUI_TextButtons, textButton_newTextButton);
    TLSE_Development_Editor_GUI_TextButtonsCount = TLSE_Development_Editor_GUI_TextButtonsCount + 1;

    return textButton_newTextButton;
end

TLSE_Development_Editor_GUI_UpdateTextButton = function(textButton_button)
    if(textButton_button == nil) then
        return
    end

    local bool_selected = textButton_button["TextButtonSelected"];
    local agent_button = textButton_button["TextButtonAgentReference"];

    if(textButton_button["TextButtonVisible"] == false) then
        AgentSetProperty(agent_button, "Runtime: Visible", false);
        return
    else
        AgentSetProperty(agent_button, "Runtime: Visible", true);
    end

    AgentSetWorldPosFromLogicalScreenPos(agent_button, textButton_button["TextButtonScreenPosition"]);

    TextSet(agent_button, textButton_button["TextButtonText"]);

    if(TLSE_TextUI_IsCursorOverTextAgent(agent_button) and TLSE_Development_Freecam_Frozen) then
        TLSE_Development_Editor_GUI_TextButtonHover(agent_button);

        if(TLSE_Development_Editor_Input_LeftMouseClicked) then
            if(textButton_button["TextButtonIsSelectable"]) then
                textButton_button["TextButtonSelected"] = not bool_selected;
            end

            TLSE_Development_Editor_GUI_TextButtonPress(agent_button);

            if(textButton_button["TextButtonOnPress"] ~= nil) then
                textButton_button["TextButtonOnPress"](textButton_button);
            end
        end

        if(TLSE_Development_Editor_Input_LeftMouseHold) then
            TLSE_Development_Editor_GUI_TextButtonPress(agent_button);

            if(textButton_button["TextButtonOnHold"] ~= nil) then
                textButton_button["TextButtonOnHold"](textButton_button);
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