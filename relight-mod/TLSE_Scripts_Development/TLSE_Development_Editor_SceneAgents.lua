--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_SceneAgentsStringFilter = "TLSE_Development";
TLSE_Development_OriginalSceneAgentNamesList = {};
TLSE_Development_SceneAgentsList = {};
TLSE_Development_SceneAgentsUnfilteredList = {};
TLSE_Development_SceneAgentsRelightExportList = {};
TLSE_Development_SceneAgent = nil;

TLSE_Development_SceneAgents_FilterLights = false;
TLSE_Development_SceneAgents_FilterFog = false;
TLSE_Development_SceneAgents_FilterParticle = false;
TLSE_Development_SceneAgents_FilterCineLight = false;
TLSE_Development_SceneAgents_FilterCineLightRig = false;
TLSE_Development_SceneAgents_FilterMesh = false;
TLSE_Development_SceneAgents_FilterGroup = false;

TLSE_Development_SceneAgentsDeletedNames = {};
TLSE_Development_SceneAgentsDuplicated = {};
TLSE_Development_SceneAgentsDuplicatedCount = 0;

--|||||||||||||||||||||||||||||||||||||||||||||||||||| Agent Duplication Transform Fix ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| Agent Duplication Transform Fix ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| Agent Duplication Transform Fix ||||||||||||||||||||||||||||||||||||||||||||||||||||
--This is implemented because in our agent duplicate function we use AgentImportAgentPropertyKeyValues, and this seems to override any set position/rotation calls made in the same frame.
--And this causes the agent to be moved to it's original spot in the level once you duplicate it which is rather annoying.
--So for the proper behavior when duplicating an object is for the object you duplicated to retain the position/rotation that it was previously in just before it was duplicated.
--In order to do that we need to apply the transformations after the agent has been duplicated in another frame, again because AgentImportAgentPropertyKeyValues seems to override position/rotation calls made in the same frame for transformations.

local vector_duplicateFix_previousAgentPosition = Vector(0, 0, 0);
local vector_duplicateFix_previousAgentRotation = Vector(0, 0, 0);
local agent_duplicateFix_duplicatedAgent = nil;
local number_duplicateFix_currentFramesToWait = 0;
local number_duplicateFix_framesToWaitToBeforeFixing = 1;
local bool_applyDuplicationFix = false;

local ApplyDuplicateAgentTransformFix = function()
    if(bool_applyDuplicationFix == false) then
        return
    end

    --increment this value every time we are in a new frame
    number_duplicateFix_currentFramesToWait = number_duplicateFix_currentFramesToWait + 1;

    --when the conditions are right, apply the transformation fix for the duplicate agent
    if(number_duplicateFix_currentFramesToWait >= number_duplicateFix_framesToWaitToBeforeFixing) and (bool_applyDuplicationFix == true) then
        AgentSetWorldPos(agent_duplicateFix_duplicatedAgent, vector_duplicateFix_previousAgentPosition);
        AgentSetWorldRot(agent_duplicateFix_duplicatedAgent, vector_duplicateFix_previousAgentRotation);
    
        bool_applyDuplicationFix = false;
        agent_duplicateFix_duplicatedAgent = nil;
    end
end

--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_CaptureOriginalSceneAgentNames = function()
    local agentTable_originalSceneAgents = SceneGetAgents(TLSE_Development_SceneObject);

    for index, agent_sceneAgent in pairs(agentTable_originalSceneAgents) do
        table.insert(TLSE_Development_OriginalSceneAgentNamesList, AgentGetName(agent_sceneAgent));
    end
end

TLSE_Development_Editor_AgentDuplicate = function(agent_agentToDuplicate)
    TLSE_Development_SceneAgentsDuplicatedCount = TLSE_Development_SceneAgentsDuplicatedCount + 1;

    local string_selectedAgentName = AgentGetName(agent_agentToDuplicate);
    local vector_selectedAgentWorldPosition = AgentGetWorldPos(agent_agentToDuplicate);
    local vector_selectedAgentWorldRotation = AgentGetWorldRot(agent_agentToDuplicate);
    vector_duplicateFix_previousAgentPosition = vector_selectedAgentWorldPosition;
    vector_duplicateFix_previousAgentRotation = vector_selectedAgentWorldRotation;

    local bool_duplicateChildren = false;
    local bool_copySceneProps = true;
    local bool_copyClasses = true;
    local string_duplicatedName = tostring(TLSE_Development_SceneAgentsDuplicatedCount) .. "_" .. string_selectedAgentName;
    local agent_newDuplicate = AgentDuplicate(string_duplicatedName, agent_agentToDuplicate, bool_duplicateChildren, bool_copySceneProps, bool_copyClasses);

    AgentImportAgentPropertyKeyValues(agent_newDuplicate, agent_agentToDuplicate);

    agent_duplicateFix_duplicatedAgent = agent_newDuplicate;
    number_duplicateFix_currentFramesToWait = 0;
    bool_applyDuplicationFix = true;

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
    TLSE_Development_SceneAgentsRelightExportList = {};

    TLSE_Development_SceneAgentsUnfilteredList = SceneGetAgents(TLSE_Development_SceneObject);

    for index, agent_sceneAgent in pairs(TLSE_Development_SceneAgentsUnfilteredList) do
        local string_sceneAgentName = AgentGetName(agent_sceneAgent);

        --if an agent is not a development agent
        if not (string.match)(string_sceneAgentName, TLSE_Development_SceneAgentsStringFilter) then
            if(TLSE_Development_SceneAgents_FilterLights) then
                if(TLSE_AgentIsLight(agent_sceneAgent)) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterFog) then
                if(TLSE_AgentIsEnvironmentFog(agent_sceneAgent)) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterParticle) then
                if(TLSE_AgentIsParticle(agent_sceneAgent)) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterCineLight) then
                if(TLSE_AgentIsCinematicLight(agent_sceneAgent)) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterCineLightRig) then
                if(TLSE_AgentIsCinematicLightRig(agent_sceneAgent)) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterMesh) then
                if(TLSE_AgentIsMesh(agent_sceneAgent)) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            elseif(TLSE_Development_SceneAgents_FilterGroup) then
                if(TLSE_AgentIsGroup(agent_sceneAgent)) then
                    table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
                end
            else
                table.insert(TLSE_Development_SceneAgentsList, agent_sceneAgent);
            end

            table.insert(TLSE_Development_SceneAgentsRelightExportList, agent_sceneAgent);
        end
    end

    ApplyDuplicateAgentTransformFix();
end