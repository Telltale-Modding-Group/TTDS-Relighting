local textButton_printSceneAgentNames = nil;
local textButton_printOriginalSceneAgentNames = nil;

local textButton_printAllProperties = nil;
local textButton_printAllClassProperties = nil;
local textButton_printAllSceneProperties = nil;
local textButton_printAllRuntimeProperties = nil;
local textButton_printAllTransientProperties = nil;

local textButton_printAllPropertiesInLua = nil;

local textButton_printAllPropertiesWithSymbolMatches = nil;
local textButton_printAllPropertiesInLuaWithSymbolMatches = nil;
local label_seperatorText = nil;

local OnPress_PrintSceneAgentNames = function(textButton_button)
    TLSE_Development_PrintAllSceneAgentNames("PRINT_CurrentAgents_" .. TLSE_Development_SceneObject, TLSE_Development_SceneObject);
end

local OnPress_PrintSceneOriginalAgentNames = function(textButton_button)
    TLSE_Development_PrintAllOriginalSceneAgentNames("PRINT_OriginalAgents_" .. TLSE_Development_SceneObject);
end



local OnPress_PrintAllPropertiesTXT = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, nil, "PRINT_AllProperties_" .. AgentGetName(agent_currentSelectedAgent), false);
end

local OnPress_PrintAllClassPropertiesTXT = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, "class", "PRINT_AllClassProperties_" .. AgentGetName(agent_currentSelectedAgent), false);
end

local OnPress_PrintAllScenePropertiesTXT = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, "scene", "PRINT_AllSceneProperties_" .. AgentGetName(agent_currentSelectedAgent), false);
end

local OnPress_PrintAllRuntimePropertiesTXT = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, "runtime", "PRINT_AllRuntimeProperties_" .. AgentGetName(agent_currentSelectedAgent), false);
end

local OnPress_PrintAllTransientPropertiesTXT = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, "transient", "PRINT_AllTransientProperties_" .. AgentGetName(agent_currentSelectedAgent), false);
end












local OnPress_PrintAllPropertiesLUA = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    TLSE_Development_Editor_RelightLuaExport_ExportAgentSetPropertiesBySymbolToScript(agent_currentSelectedAgent, "RELIGHT_AllProperties_" .. AgentGetName(agent_currentSelectedAgent), false);
end

local OnPress_PrintAllPropertiesWithSymbolMatchingTXT = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    TLSE_Development_PrintAllAgentProperties(agent_currentSelectedAgent, "runtime", "PRINT_AllPropertiesWithSymbolMatching_" .. AgentGetName(agent_currentSelectedAgent), true);
end

local OnPress_PrintAllPropertiesWithSymbolMatchingLUA = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    TLSE_Development_Editor_RelightLuaExport_ExportAgentSetPropertiesBySymbolToScript(agent_currentSelectedAgent, "PRINT_AllPropertiesWithSymbolMatching_" .. AgentGetName(agent_currentSelectedAgent), true);
end

TLSE_Development_GUI_TabDebugInitalize = function()
    textButton_printSceneAgentNames = TLSE_Development_Editor_GUI_CreateTextButton("[SCENE PRINT ALL CURRENT AGENT NAMES]", false, Vector(0.685, 0.525, 0.0), OnPress_PrintSceneAgentNames, nil);
    textButton_printOriginalSceneAgentNames = TLSE_Development_Editor_GUI_CreateTextButton("[SCENE PRINT ALL ORIGINAL AGENT NAMES]", false, Vector(0.685, 0.540, 0.0), OnPress_PrintSceneOriginalAgentNames, nil);

    textButton_printAllProperties = TLSE_Development_Editor_GUI_CreateTextButton("[SELECTED AGENT PRINT ALL PROPERTIES .txt]", false, Vector(0.685, 0.555, 0.0), OnPress_PrintAllPropertiesTXT, nil);
    textButton_printAllClassProperties = TLSE_Development_Editor_GUI_CreateTextButton("[SELECTED AGENT PRINT ALL CLASS PROPERTIES .txt]", false, Vector(0.685, 0.570, 0.0), OnPress_PrintAllClassPropertiesTXT, nil);
    textButton_printAllSceneProperties = TLSE_Development_Editor_GUI_CreateTextButton("[SELECTED AGENT PRINT ALL SCENE PROPERTIES .txt]", false, Vector(0.685, 0.585, 0.0), OnPress_PrintAllScenePropertiesTXT, nil);
    textButton_printAllRuntimeProperties = TLSE_Development_Editor_GUI_CreateTextButton("[SELECTED AGENT PRINT ALL RUNTIME PROPERTIES .txt]", false, Vector(0.685, 0.600, 0.0), OnPress_PrintAllRuntimePropertiesTXT, nil);
    textButton_printAllTransientProperties = TLSE_Development_Editor_GUI_CreateTextButton("[SELECTED AGENT PRINT ALL TRANSIENT PROPERTIES .txt]", false, Vector(0.685, 0.615, 0.0), OnPress_PrintAllTransientPropertiesTXT, nil);

    textButton_printAllPropertiesInLua = TLSE_Development_Editor_GUI_CreateTextButton("[SELECTED AGENT PRINT ALL PROPERTIES .lua]", false, Vector(0.685, 0.630, 0.0), OnPress_PrintAllPropertiesLUA, nil);

    label_seperatorText = TLSE_Development_Editor_GUI_CreateLabel("NOTE: These will freeze the editor for a short period of time, they are expensive.", Vector(0.685, 0.650, 0.0));

    textButton_printAllPropertiesWithSymbolMatches = TLSE_Development_Editor_GUI_CreateTextButton("[SELECTED AGENT PRINT ALL PROPERTIES WITH SYMBOL MATCHING .txt]", false, Vector(0.685, 0.665, 0.0), OnPress_PrintAllPropertiesWithSymbolMatchingTXT, nil);
    textButton_printAllPropertiesInLuaWithSymbolMatches = TLSE_Development_Editor_GUI_CreateTextButton("[SELECTED AGENT PRINT ALL PROPERTIES WITH SYMBOL MATCHING .lua]", false, Vector(0.685, 0.680, 0.0), OnPress_PrintAllPropertiesWithSymbolMatchingLUA, nil);
end

TLSE_Development_GUI_TabDebugUpdate = function()
    textButton_printSceneAgentNames["Visible"] = TLSE_Development_GUI_DebugTabActive;
    textButton_printOriginalSceneAgentNames["Visible"] = TLSE_Development_GUI_DebugTabActive;

    textButton_printAllProperties["Visible"] = TLSE_Development_GUI_DebugTabActive;
    textButton_printAllClassProperties["Visible"] = TLSE_Development_GUI_DebugTabActive;
    textButton_printAllSceneProperties["Visible"] = TLSE_Development_GUI_DebugTabActive;
    textButton_printAllRuntimeProperties["Visible"] = TLSE_Development_GUI_DebugTabActive;
    textButton_printAllTransientProperties["Visible"] = TLSE_Development_GUI_DebugTabActive;

    textButton_printAllPropertiesInLua["Visible"] = TLSE_Development_GUI_DebugTabActive;

    label_seperatorText["Visible"] = TLSE_Development_GUI_DebugTabActive;

    textButton_printAllPropertiesWithSymbolMatches["Visible"] = TLSE_Development_GUI_DebugTabActive;
    textButton_printAllPropertiesInLuaWithSymbolMatches["Visible"] = TLSE_Development_GUI_DebugTabActive;
end