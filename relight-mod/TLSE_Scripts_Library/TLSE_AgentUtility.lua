--[[
    This script has numerous utility functions to help deal different aspects of agents.

    The names and descriptions should explain what each function is for.

    NOTE: AgentFindInScene calls especially in a large bulk can be expensive.
]]

--||||||||||||||||||||||||| RENDER VISIBILITY |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER VISIBILITY |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER VISIBILITY |||||||||||||||||||||||||

--Finds an agent in a scene by it's name and hides it.
--RETURNS: Nothing
TLSE_AgentNameHide = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);

    if(agent_object ~= nil) then
        AgentHide(agent_object);
    end
end

--Sets the visibility of a given agent.
--RETURNS: Nothing
TLSE_AgentSetVisibillity = function(agent_object, bool_visibility)
    AgentSetProperty(agent_object, "Runtime: Visible", bool_visibility);
end

--Finds an agent in a scene by it's name and sets it's visibility.
--RETURNS: Nothing
TLSE_AgentNameSetVisibillity = function(string_agentName, bool_visibility, string_scene)
    TLSE_AgentNameSetProperty(string_agentName, "Runtime: Visible", bool_visibility, string_scene);
end

--||||||||||||||||||||||||| RENDER CULLING |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER CULLING |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER CULLING |||||||||||||||||||||||||

--Sets culling on an agent.
--RETURNS: Nothing
TLSE_AgentSetCulling = function(agent_object, bool_cull)
    AgentSetProperty(agent_object, "Render Cull", bool_cull);
end

--Finds an agent in a scene by it's name and sets it's culling.
--RETURNS: Nothing
TLSE_AgentNameSetCulling = function(string_agentName, bool_cull, string_scene)
    TLSE_AgentNameSetProperty(string_agentName, "Render Cull", bool_cull, string_scene);
end

--||||||||||||||||||||||||| RENDER SCALE |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER SCALE |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER SCALE |||||||||||||||||||||||||

--Sets the global render scale on an agent.
--RETURNS: Nothing
TLSE_AgentSetScale = function(agent_object, number_scale)
    AgentSetProperty(agent_object, "Render Global Scale", number_scale);
end

--Finds an agent in a scene by it's name and sets it's global render scale.
--RETURNS: Nothing
TLSE_AgentNameSetScale = function(string_agentName, number_scale, string_scene)
    TLSE_AgentNameSetProperty(string_agentName, "Render Global Scale", number_scale, string_scene);
end

--Sets the axis render scale on an agent.
--RETURNS: Nothing
TLSE_AgentSetAxisScale = function(agent_object, vector_scale)
    AgentSetProperty(agent_object, "Render Axis Scale", vector_scale);
end

--Finds an agent in a scene by it's name and sets it's axis render scale.
--RETURNS: Nothing
TLSE_AgentNameSetAxisScale = function(string_agentName, vector_scale, string_scene)
    TLSE_AgentNameSetProperty(string_agentName, "Render Axis Scale", vector_scale, string_scene);
end

--||||||||||||||||||||||||| RENDER SHADOW CASTING |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER SHADOW CASTING |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER SHADOW CASTING |||||||||||||||||||||||||

--Sets shadow casting on an agent.
--RETURNS: Nothing
TLSE_AgentSetShadowCasting = function(agent_object, bool_shadowCasting)
    AgentSetProperty(agent_object, "Render EnvLight Shadow Cast Enable", bool_shadowCasting);
    AgentSetProperty(agent_object, "Render Shadow Force Visible", bool_shadowCasting);
end

--Finds an agent in a scene by it's name and sets it's shadow casting value.
--RETURNS: Nothing
TLSE_AgentNameSetShadowCasting = function(string_agentName, bool_shadowCasting, string_scene)
    TLSE_AgentNameSetProperty(string_agentName, "Render EnvLight Shadow Cast Enable", bool_shadowCasting, string_scene);
    TLSE_AgentNameSetProperty(string_agentName, "Render Shadow Force Visible", bool_shadowCasting, string_scene);
end

--||||||||||||||||||||||||| RENDER BOUNDS EXTENTS |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER BOUNDS EXTENTS |||||||||||||||||||||||||
--||||||||||||||||||||||||| RENDER BOUNDS EXTENTS |||||||||||||||||||||||||

--Sets the bounds on an agent.
--RETURNS: Nothing
TLSE_AgentSetExtents = function(agent, vector_extentsMin, vector_extentsMax)
    AgentSetProperty(agent, "Extents Min", vector_extentsMin);
    AgentSetProperty(agent, "Extents Max", vector_extentsMax);
end

--Finds an agent in a scene by it's name and sets it's bounds.
--RETURNS: Nothing
TLSE_AgentNameSetExtents = function(string_agentName, vector_extentsMin, vector_extentsMax, string_scene)
    TLSE_AgentNameSetProperty(string_agentName, "Extents Min", vector_extentsMin, string_scene);
    TLSE_AgentNameSetProperty(string_agentName, "Extents Max", vector_extentsMax, string_scene);
end

--||||||||||||||||||||||||| AGENT REMOVAL |||||||||||||||||||||||||
--||||||||||||||||||||||||| AGENT REMOVAL |||||||||||||||||||||||||
--||||||||||||||||||||||||| AGENT REMOVAL |||||||||||||||||||||||||

--Checks if an agent by the given name exists, finds it in the scene and destroys it.
--RETURNS: Nothing
TLSE_AgentNameDestroy = function(string_agentName, string_scene)
   if(AgentExists(AgentGetName(string_agentName)) == true) then
       local agent_object = AgentFindInScene(string_agentName, string_scene);
       AgentDestroy(agent_object);
   end
end

--Finds all scene agents, checks if they match the given prefix and removes them if they exist.
--RETURNS: Nothing
TLSE_RemoveSceneAgentsWithPrefix = function(string_scene, string_agentNamePrefix)
    local agentTable_sceneAgents = SceneGetAgents(string_scene);

    for index, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        local string_agentName = tostring(AgentGetName(agent_sceneAgent));

        if (string.match)(string_agentName, string_agentNamePrefix) then
            AgentDestroy(agent_sceneAgent);
        end
    end
end

--||||||||||||||||||||||||| AGENT TYPE |||||||||||||||||||||||||
--||||||||||||||||||||||||| AGENT TYPE |||||||||||||||||||||||||
--||||||||||||||||||||||||| AGENT TYPE |||||||||||||||||||||||||

TLSE_AgentIsCamera = function(agent_object)
    return AgentHasProperty(agent_object, "Field of View");
end

TLSE_AgentIsLight = function(agent_object)
    return AgentHasProperty(agent_object, "EnvLight - Type");
end

TLSE_AgentIsEnvironmentFog = function(agent_object)
    return AgentHasProperty(agent_object, "Env - Fog Enabled");
end

TLSE_AgentIsParticle = function(agent_object)
    return AgentHasProperty(agent_object, "Emitters - Enabled");
end

TLSE_AgentIsCinematicLight = function(agent_object)
    return AgentHasProperty(agent_object, "CinLight - Enabled");
end

TLSE_AgentIsCinematicLightRig = function(agent_object)
    return AgentHasProperty(agent_object, "CharLightComposer - Enabled");
end

TLSE_AgentIsMesh = function(agent_object)
    return AgentHasProperty(agent_object, "D3D Mesh") or AgentHasProperty(agent_object, "D3D Mesh List");
end

TLSE_AgentIsGroup = function(agent_object)
    return AgentHasProperty(agent_object, "Group - Visible");
end

--||||||||||||||||||||||||| GET ALL SCENE AGENTS BY TYPE |||||||||||||||||||||||||
--||||||||||||||||||||||||| GET ALL SCENE AGENTS BY TYPE |||||||||||||||||||||||||
--||||||||||||||||||||||||| GET ALL SCENE AGENTS BY TYPE |||||||||||||||||||||||||

TLSE_GetAllLightAgentsInScene = function(string_scene)
    local agentTable_sceneAgents = SceneGetAgents(string_scene);
    local agentTable_lightAgents = {};

    for index, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        if(TLSE_AgentIsLight(agent_sceneAgent)) then
            table.insert(agentTable_lightAgents, agent_sceneAgent);
        end
    end

    return agentTable_lightAgents;
end

TLSE_GetAllCameraAgentsInScene = function(string_scene)
    local agentTable_sceneAgents = SceneGetAgents(string_scene);
    local agentTable_cameraAgents = {};

    for index, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        if(TLSE_AgentIsCamera(agent_sceneAgent)) then
            table.insert(agentTable_cameraAgents, agent_sceneAgent);
        end
    end

    return agentTable_cameraAgents;
end

--||||||||||||||||||||||||| UTILITY |||||||||||||||||||||||||
--||||||||||||||||||||||||| UTILITY |||||||||||||||||||||||||
--||||||||||||||||||||||||| UTILITY |||||||||||||||||||||||||

TLSE_FindEnvironmentFogModuleInScene = function(string_scene)
    local agentTable_sceneAgents = SceneGetAgents(string_scene);

    for index, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        if(TLSE_AgentIsEnvironmentFog(agent_sceneAgent)) then
            return agent_sceneAgent;
        end
    end

    return nil;
end

--Given a comparison agent, and two other agents, the agent that is nearest to the comparison agent will be returned.
--RETURNS: Agent
TLSE_GetNearestAgent = function(agent_comparison, agent_one, agent_two)
    local number_distanceToAgentOne = AgentDistanceToAgent(agent_comparison, agent_one); --number type
    local number_distanceToAgentTwo = AgentDistanceToAgent(agent_comparison, agent_two); --number type
    
    if (number_distanceToAgentOne < number_distanceToAgentTwo) then
        return agent_one;
    else
        return agent_two;
    end
end

--Given a comparison agent, and two other agents, the agent that is farthest to the comparison agent will be returned.
--RETURNS: Agent
TLSE_GetFarthestAgent = function(agent_comparison, agent_one, agent_two)
    local number_distanceToAgentOne = AgentDistanceToAgent(agent_comparison, agent_one); --number type
    local number_distanceToAgentTwo = AgentDistanceToAgent(agent_comparison, agent_two); --number type
    
    if (number_distanceToAgentOne > number_distanceToAgentTwo) then
        return agent_one;
    else
        return agent_two;
    end
end

--performs a raycast from a given agent, to another agent
--returns true when raycast intersects with scene geometry
--returns false when raycast doesn't intersect with geometry
--RETURNS: Boolean (True/False)
TLSE_RaycastFromAgentToAgent = function(agent_from, agent_to)
	--calculate ray origin
	local vector_rayOrigin = AgentGetWorldPos(agent_from);
	
	if (AgentHasNode(agent_from, "eye_L")) and (AgentHasNode(agent_from, "eye_R")) then
		vector_rayOrigin = AgentGetWorldPosBetweenNodes(agent_from, "eye_R", "eye_L");
	else
		if (AgentHasNode(agent_from, "Head")) then
			vector_rayOrigin = AgentGetWorldPos(agent_from, "Head");
		end
	end
	
	--calculate ray direction
	local vector_rayDirection = AgentGetWorldPos(agent_to) - vector_rayOrigin;
	
	if (AgentHasNode(agent_to, "Root")) then
		vector_rayDirection = AgentGetWorldPos(agent_to, "Root") - vector_rayOrigin;
    else
		if (AgentHasNode(agent_to, "Head")) then
			vector_rayDirection = AgentGetWorldPos(agent_to, "Head") - vector_rayOrigin;
		end
    end
	
	--perform a raycast
	if (MathRaySceneIntersect(vector_rayOrigin, vector_rayDirection, AgentGetScene(agent_from))) then
		return true;
    else
		return false;
	end
end

--plays a .chore specifically on an agent
--RETURNS: Controller
TLSE_ChorePlayOnAgent = function(chore_object, string_agentName, number_priority, bool_wait)
    --if a priority value is not given (nil)
    if (number_priority ~= nil) then
        number_priority = 100;
    end

    if (bool_wait ~= nil) then --if bool_wait value is given
        ChorePlayAndWait(chore_object, number_priority, "default", string_agentName);
    else --if there is no bool_wait value given (nil)
        return ChorePlay(chore_object, number_priority, "default", string_agentName);
    end
end