TLSE_Development_SceneAgentsStringFilter = "TLSE_Development";
TLSE_Development_SceneAgentsList = {};
TLSE_Development_SceneAgent = nil;

TLSE_Development_SceneAgentsDeletedNames = {};

TLSE_Development_SceneAgents_FilterLights = false;
TLSE_Development_SceneAgents_FilterFog = false;
TLSE_Development_SceneAgents_FilterParticle = false;
TLSE_Development_SceneAgents_FilterCineLight = false;
TLSE_Development_SceneAgents_FilterCineLightRig = false;
TLSE_Development_SceneAgents_FilterMesh = false;

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