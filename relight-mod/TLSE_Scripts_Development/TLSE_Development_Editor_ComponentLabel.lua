--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI LABELS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI LABELS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI LABELS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--GUI Feature for doing basic text "labels" which have no functionality.

TLSE_Development_Editor_GUI_LabelsCount = 1;
TLSE_Development_Editor_GUI_Labels = {};

TLSE_Development_Editor_GUI_CreateLabel = function(string_textContents, vector_screenPosition)
    local string_agentName = "TLSE_Development_Label" .. tostring(TLSE_Development_Editor_GUI_LabelsCount);

    local label_newLabel = 
    {
        LabelAgentReference = TLSE_TextUI_CreateTextAgent(string_agentName, string_textContents, Vector(0, 0, 0), 0, 0),
        LabelAgentName = string_agentName,
        LabelText = string_textContents,
        LabelVisible = true,
        LabelScreenPosition = vector_screenPosition
    };

    TextSetScale(label_newLabel["LabelAgentReference"], TLSE_Development_Editor_GUI_TextScale);

    TLSE_Development_Editor_GUI_LabelDefault(label_newLabel["LabelAgentReference"]);

    table.insert(TLSE_Development_Editor_GUI_Labels, label_newLabel);
    TLSE_Development_Editor_GUI_LabelsCount = TLSE_Development_Editor_GUI_LabelsCount + 1;

    return label_newLabel;
end

TLSE_Development_Editor_GUI_UpdateLabel = function(label_text)
    if(label_text == nil) then
        return
    end

    local agent_label = label_text["LabelAgentReference"];

    if(label_text["LabelVisible"] == false) then
        AgentSetProperty(agent_label, "Runtime: Visible", false);
        return
    else
        AgentSetProperty(agent_label, "Runtime: Visible", true);
    end

    AgentSetWorldPosFromLogicalScreenPos(agent_label, label_text["LabelScreenPosition"]);

    TextSet(agent_label, label_text["LabelText"]);

    TLSE_Development_Editor_GUI_LabelDefault(agent_label);
end