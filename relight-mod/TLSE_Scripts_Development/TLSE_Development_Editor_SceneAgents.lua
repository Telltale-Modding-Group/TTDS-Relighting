--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_SceneAgentsStringFilter = "TLSE_Development";
TLSE_Development_SceneAgentsList = {};
TLSE_Development_SceneAgent = nil;

TLSE_Development_SceneAgents_FilterLights = false;
TLSE_Development_SceneAgents_FilterFog = false;
TLSE_Development_SceneAgents_FilterParticle = false;
TLSE_Development_SceneAgents_FilterCineLight = false;
TLSE_Development_SceneAgents_FilterCineLightRig = false;
TLSE_Development_SceneAgents_FilterMesh = false;

TLSE_Development_SceneAgentsDeletedNames = {};
TLSE_Development_SceneAgentsDuplicated = {};
TLSE_Development_SceneAgentsDuplicatedCount = 0;

--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_AgentDuplicate = function(agent_agentToDuplicate)
    TLSE_Development_SceneAgentsDuplicatedCount = TLSE_Development_SceneAgentsDuplicatedCount + 1;

    local string_selectedAgentName = AgentGetName(agent_agentToDuplicate);
    local vector_selectedAgentWorldPosition = AgentGetWorldPos(agent_agentToDuplicate);
    local vector_selectedAgentWorldRotation = AgentGetWorldRot(agent_agentToDuplicate);

    local bool_duplicateChildren = false;
    local bool_copySceneProps = true;
    local bool_copyClasses = true;
    local string_duplicatedName = tostring(TLSE_Development_SceneAgentsDuplicatedCount) .. "_" .. string_selectedAgentName;
    local agent_newDuplicate = AgentDuplicate(string_duplicatedName, agent_agentToDuplicate, bool_duplicateChildren, bool_copySceneProps, bool_copyClasses);

    AgentImportAgentPropertyKeyValues(agent_newDuplicate, agent_agentToDuplicate);

    AgentSetWorldPos(agent_newDuplicate, vector_selectedAgentWorldPosition);
    AgentSetWorldRot(agent_newDuplicate, vector_selectedAgentWorldRotation);

    local duplicateAgent_object = 
    {
        AgentReferenceName = string_selectedAgentName,
        AgentDuplicateName = string_duplicatedName
    }

    table.insert(TLSE_Development_SceneAgentsDuplicated, duplicateAgent_object);

    return agent_newDuplicate;
end

TLSE_Development_Editor_UpdateSceneAgentsList = function()
    TLSE_Development_SceneAgent = AgentFindInScene(TLSE_Development_SceneObjectAgentName, TLSE_Development_SceneObject);

    TLSE_Development_SceneAgentsList = {};

    local agentTable_sceneAgents = SceneGetAgents(TLSE_Development_SceneObject);

    for index, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        local string_sceneAgentName = AgentGetName(agent_sceneAgent);

        --if an agent is not a development agent
        if not (string.match)(string_sceneAgentName, TLSE_Development_SceneAgentsStringFilter) then

            if(TLSE_Development_SceneAgents_FilterLights) then
                if(AgentHasProperty(agent_sceneAgent, "EnvLight - Type")) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterFog) then
                if(AgentHasProperty(agent_sceneAgent, "Env - Fog Enabled")) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterParticle) then
                if(AgentHasProperty(agent_sceneAgent, "Emitters - Enabled")) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterCineLight) then
                if(AgentHasProperty(agent_sceneAgent, "CinLight - Enabled")) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterCineLightRig) then
                if(AgentHasProperty(agent_sceneAgent, "CharLightComposer - Enabled")) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterMesh) then
                if(AgentHasProperty(agent_sceneAgent, "D3D Mesh") or AgentHasProperty(agent_sceneAgent, "D3D Mesh List")) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            else
                table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
            end
        end
    end
end