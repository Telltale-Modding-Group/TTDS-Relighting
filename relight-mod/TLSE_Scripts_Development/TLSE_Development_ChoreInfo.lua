--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||

--(public) dev variables (public because these values need to be persistent)
TLSE_Development_ChoreInfo_Text = nil;
TLSE_Development_ChoreInfo_TextTitle = "[Chore Info]";

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

--require("TLSE_Development_SymbolKeyValueDatabase.lua");

TLSE_Development_ChoreInfo_Initalize = function()
    TLSE_Development_ChoreInfo_Text = TLSE_TextUI_CreateTextAgent("TLSE_Development_ChoreInfoText", "Chore Info Error", Vector(0, 0, 0), 0, 0, TLSE_Development_SceneObject);
    TextSetColor(TLSE_Development_ChoreInfo_Text, Color(0.75, 0.75, 1.0, 1.0));
    TextSetScale(TLSE_Development_ChoreInfo_Text, 0.35);
end

TLSE_Development_ChoreInfo_Update = function()  
    local string_finalText = TLSE_Development_ChoreInfo_TextTitle;

    local agentTable_sceneAgents = SceneGetAgents(TLSE_Development_SceneObject); --NOTE: Getting all agents rather than filtered from TLSE_Development_SceneAgentsList

    for index, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        local controllers_agentControllers = AgentGetControllers(agent_sceneAgent);
        local number_controllerIndex = 0;

        if(#controllers_agentControllers > 0) then

            for index2, controller_controllerOnAgent in pairs(controllers_agentControllers) do
                number_controllerIndex = number_controllerIndex + 1;

                local chore_controllerChore = ControllerGetChore(controller_controllerOnAgent);

                string_finalText = string_finalText .. "\n"; --new line
                string_finalText = string_finalText .. "Agent Name: " .. AgentGetName(agent_sceneAgent);
                string_finalText = string_finalText .. " | Controller " .. tostring(number_controllerIndex) .. ": ";
                --string_finalText = string_finalText .. "(Time: " .. tostring(ControllerGetTime(controller_controllerOnAgent)) .. ") ";
                --string_finalText = string_finalText .. "(Time Scale: " .. tostring(ControllerGetTimeScale(controller_controllerOnAgent)) .. ") ";
                --string_finalText = string_finalText .. "(Length: " .. tostring(ControllerGetLength(controller_controllerOnAgent)) .. ") ";
                --string_finalText = string_finalText .. "(Contribution: " .. tostring(ControllerGetContribution(controller_controllerOnAgent)) .. ") ";
                --string_finalText = string_finalText .. "(Priority: " .. tostring(ControllerGetPriority(controller_controllerOnAgent)) .. ") ";

                --string_finalText = string_finalText .. "(Chore: " .. tostring(ControllerGetChore(controller_controllerOnAgent)) .. ") ";
                --string_finalText = string_finalText .. "(Parent: " .. tostring(ControllerGetParent(controller_controllerOnAgent)) .. ") ";

                string_finalText = string_finalText .. "(Chore: " .. tostring(chore_controllerChore) .. tostring(TLSE_Development_GetCachedObjectMatchesForHash(chore_controllerChore)) .. ") ";
            end
        end
    end

    AgentSetWorldPosFromLogicalScreenPos(TLSE_Development_ChoreInfo_Text, Vector(0, 0.2, 0));

    TextSet(TLSE_Development_ChoreInfo_Text, string_finalText);
end