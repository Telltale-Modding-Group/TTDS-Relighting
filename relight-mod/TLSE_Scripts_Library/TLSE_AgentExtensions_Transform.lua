--[[
    This script has functions to help deal with transformations on agents.

    Transformations on agents involve simply moving and rotating objects
    in a scene. It's worth mentioning that there are two kinds of transformations.

    Local - Means it's relative to the objects parent, usually by default
    objects that are not parented or grouped to another agent, local transformations
    are basically identical to world transformations. However when an object
    is parented/grouped to another agent then it's transformations will be
    relative to the parent.

    World - Means that you are always treating the transformations of the object
    in world space regardless if it's parented or grouped to another object.
    Whatever position/rotation you set an agent to will always be that
    position/rotation.

    NOTE: AgentFindInScene calls especially in a large bulk can be expensive.
]]

--||||||||||||||||||||||||| TRANSFORMATION - SET |||||||||||||||||||||||||
--||||||||||||||||||||||||| TRANSFORMATION - SET |||||||||||||||||||||||||
--||||||||||||||||||||||||| TRANSFORMATION - SET |||||||||||||||||||||||||
--for moving and rotating agents

--Finds an agent in a scene by it's name and rotates it (locally if it's parented to an object).
--RETURNS: Nothing
TLSE_AgentNameSetRotation = function(string_agentName, vector_rotation, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    AgentSetRot(agent_object, vector_rotation);
end

--Finds an agent in a scene by it's name and moves it (locally if it's parented to an object).
--RETURNS: Nothing
TLSE_AgentNameSetPosition = function(string_agentName, vector_position, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    AgentSetPos(agent_object, vector_position);
end

--Finds an agent in a scene by it's name and rotates it in world space.
--RETURNS: Nothing
TLSE_AgentNameSetWorldRotation = function(string_agentName, vector_rotation, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    AgentSetWorldRot(agent_object, vector_rotation);
end

--Finds an agent in a scene by it's name and moves it in world space.
--RETURNS: Nothing
TLSE_AgentNameSetWorldPosition = function(string_agentName, vector_position, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    AgentSetWorldPos(agent_object, vector_position);
end

--||||||||||||||||||||||||| TRANSFORMATION - GET |||||||||||||||||||||||||
--||||||||||||||||||||||||| TRANSFORMATION - GET |||||||||||||||||||||||||
--||||||||||||||||||||||||| TRANSFORMATION - GET |||||||||||||||||||||||||
--for getting rotation/position of agents

--Finds an agent in a scene by it's name and gets it's rotation (locally if it's parented to an object).
--RETURNS: Vector
TLSE_AgentNameGetRotation = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetRot(agent_object);
end

--Finds an agent in a scene by it's name and gets it's position (locally if it's parented to an object).
--RETURNS: Vector
TLSE_AgentNameGetPosition = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetPos(agent_object);
end

--Finds an agent in a scene by it's name and gets its rotation in world space.
--RETURNS: Vector
TLSE_AgentNameGetWorldRotation = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetWorldRot(agent_object);
end

--Finds an agent in a scene by it's name and gets its position in world space.
--RETURNS: Vector
TLSE_AgentNameGetWorldPosition = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetWorldPos(agent_object);
end

--||||||||||||||||||||||||| DIRECTIONS - GET |||||||||||||||||||||||||
--||||||||||||||||||||||||| DIRECTIONS - GET |||||||||||||||||||||||||
--||||||||||||||||||||||||| DIRECTIONS - GET |||||||||||||||||||||||||

--Gets the world space forward direction relative to the agent.
--RETURNS: Vector
TLSE_AgentGetForward = function(agent_object)
    return AgentGetForwardVec(agent_object);
end

--Gets the world space back direction relative to the agent.
--RETURNS: Vector
TLSE_AgentGetBack = function(agent_object)
    return VectorScale(AgentGetForwardVec(agent_object), -1);
end

--Gets the world space up direction relative to the agent.
--RETURNS: Vector
TLSE_AgentGetUp = function(agent_object)
    local vector_worldPosition = AgentGetWorldPos(agent_object);
    local vector_worldSpaceUp = AgentLocalToWorld(agent_object, Vector(0, 1, 0));
    return VectorNormalize(VectorSubtract(vector_worldSpaceUp, vector_worldPosition));
end

--Gets the world space down direction relative to the agent.
--RETURNS: Vector
TLSE_AgentGetDown = function(agent_object)
    return VectorScale(TLSE_AgentGetUp(agent_object), -1);
end

--Gets the world space right direction relative to the agent.
--RETURNS: Vector
TLSE_AgentGetRight = function(agent_object)
    return AgentGetRightVec(agent_object);
end

--Gets the world space left direction relative to the agent.
--RETURNS: Vector
TLSE_AgentGetLeft = function(agent_object)
    return VectorScale(AgentGetRightVec(agent_object), -1);
end

--Finds an agent in the scene, and gets the world space forward direction relative to the agent.
--RETURNS: Vector
TLSE_AgentNameGetForward = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetForwardVec(agent_object);
end

--Finds an agent in the scene, and gets the world space back direction relative to the agent.
--RETURNS: Vector
TLSE_AgentNameGetBack = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return TLSE_AgentGetBack(agent_object);
end

--Finds an agent in the scene, and gets the world space up direction relative to the agent.
--RETURNS: Vector
TLSE_AgentNameGetUp = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return TLSE_AgentGetUp(agent_object);
end

--Finds an agent in the scene, and gets the world space down direction relative to the agent.
--RETURNS: Vector
TLSE_AgentNameGetDown = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return TLSE_AgentGetDown(agent_object);
end

--Finds an agent in the scene, and gets the world space right direction relative to the agent.
--RETURNS: Vector
TLSE_AgentNameGetRight = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetRightVec(agent_object);
end

--Finds an agent in the scene, and gets the world space left direction relative to the agent.
--RETURNS: Vector
TLSE_AgentNameGetLeft = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return TLSE_AgentGetLeft(agent_object);
end