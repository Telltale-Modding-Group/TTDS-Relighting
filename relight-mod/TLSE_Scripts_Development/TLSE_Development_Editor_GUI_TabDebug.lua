local textButton_printAllProperties = nil;

local OnPress_PrintAllProperties = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then
        return
    end

    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, AgentGetName(agent_currentSelectedAgent), false);
end

TLSE_Development_GUI_TabDebugInitalize = function()
    textButton_printAllProperties = TLSE_Development_Editor_GUI_CreateTextButton("[AGENT PRINT ALL PROPERTIES]", false, Vector(0.685, 0.525, 0.0), OnPress_PrintAllProperties, nil);
end

TLSE_Development_GUI_TabDebugUpdate = function()
    textButton_printAllProperties["Visible"] = TLSE_Development_GUI_DebugTabActive;
end