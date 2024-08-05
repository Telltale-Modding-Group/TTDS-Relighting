local textButton_printAllProperties = nil;
local textButton_printAllPropertiesWithSymbolMatches = nil;
local label_seperatorText = nil;

local OnPress_PrintAllProperties = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then
        return
    end

    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, AgentGetName(agent_currentSelectedAgent), false);
end

local OnPress_PrintAllPropertiesWithSymbolMatching = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then
        return
    end

    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, AgentGetName(agent_currentSelectedAgent), true);
end

TLSE_Development_GUI_TabDebugInitalize = function()
    textButton_printAllProperties = TLSE_Development_Editor_GUI_CreateTextButton("[AGENT PRINT ALL PROPERTIES]", false, Vector(0.685, 0.525, 0.0), OnPress_PrintAllProperties, nil);

    label_seperatorText = TLSE_Development_Editor_GUI_CreateLabel("NOTE: These will freeze the editor for quite a while, they are expensive.", Vector(0.685, 0.545, 0.0));

    textButton_printAllPropertiesWithSymbolMatches = TLSE_Development_Editor_GUI_CreateTextButton("[AGENT PRINT ALL PROPERTIES WITH SYMBOL MATCHING]", false, Vector(0.685, 0.565, 0.0), OnPress_PrintAllPropertiesWithSymbolMatching, nil);
end

TLSE_Development_GUI_TabDebugUpdate = function()
    textButton_printAllProperties["Visible"] = TLSE_Development_GUI_DebugTabActive;
    textButton_printAllPropertiesWithSymbolMatches["Visible"] = TLSE_Development_GUI_DebugTabActive;
    label_seperatorText["Visible"] = TLSE_Development_GUI_DebugTabActive;
end