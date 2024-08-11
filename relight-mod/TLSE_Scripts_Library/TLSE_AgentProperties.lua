--[[
    This script has functions to help deal with properties on agents.

    Properties are essential to how the Telltale Tool works, agents can have many properties attached to them. 
    These properties are usually responsible for many things, like controlling the color of a material, or controlling the scale of an object.

    Finding these properties can be tough especially since we don't have an editor, but many of these property names can be found through various means like...
    - Decompiling Telltale Lua scripts and looking at property strings that are manually written and set.
    - Extracting strings from the Game.exe
    However you won't be able to find every possible property name as they are unfortunately hashed.

    NOTE: AgentFindInScene calls especially in a large bulk can be expensive.
    NOTE 2: The order of properties (in terms of overriding) are Class, Scene, Runtime, Transient
]]

--||||||||||||||||||||||||| PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| PROPERTIES |||||||||||||||||||||||||

--Finds an agent in a scene by it's name and gets a property on it.
--RETURNS: Dynamic type depending on the property
TLSE_AgentNameGetProperty = function(string_agentName, string_propertyName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);

    if(agent_object ~= nil) then
        return AgentGetProperty(agent_object, string_propertyName);
    else
        return nil;
    end
end

--This finds an agent in a scene by its name, and checks if it has the given property.
--RETURNS: Boolean (True/False)
TLSE_AgentNameHasProperty = function(string_agentName, string_propertyName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);

    if(agent_object ~= nil) then
        return AgentHasProperty(agent_object, string_propertyName);
    else
        return false;
    end
end

--This finds an agent in a scene by its name, and sets the given property.
--RETURNS: Nothing
TLSE_AgentNameSetProperty = function(string_agentName, string_propertyName, type_propertyValue, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);

    if(agent_object ~= nil) then
        AgentSetProperty(agent_object, string_propertyName, type_propertyValue);
    end
end

--||||||||||||||||||||||||| CLASS PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| CLASS PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| CLASS PROPERTIES |||||||||||||||||||||||||

--Given an agent, it sets a class property on it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any type.
TLSE_AgentClassPropertySet = function(agent_object, string_propertyName, type_propertyValue)
    local propertySet_agentObject = AgentGetClassProperties(agent_object);
    PropertySet(propertySet_agentObject, string_propertyName, type_propertyValue);
end

--Finds an agent in a scene by it's name, it sets a class property on it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any value type.
TLSE_AgentNameSetClassProperty = function(string_agentName, string_propertyName, type_propertyValue, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    TLSE_AgentClassPropertySet(agent_object, string_propertyName, type_propertyValue);
end

--Gets a class property on a given agent.
--RETURNS: Dynamic type depending on the property
TLSE_AgentGetClassProperty = function(agent_object, string_propertyName)
    local propertySet_agentObject = AgentGetClassProperties(agent_object);
    return PropertyGet(propertySet_agentObject, string_propertyName);
end

--Finds an agent in a scene by it's name and gets the class property set.
--RETURNS: PropertySet
TLSE_AgentNameGetClassProperties = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetClassProperties(agent_object);
end

--||||||||||||||||||||||||| SCENE PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| SCENE PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| SCENE PROPERTIES |||||||||||||||||||||||||

--Given an agent, it sets a scene property on it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any type.
TLSE_AgentScenePropertySet = function(agent_object, string_propertyName, type_propertyValue)
    local propertySet_agentObject = AgentGetSceneProperties(agent_object);
    PropertySet(propertySet_agentObject, string_propertyName, type_propertyValue);
end

--Finds an agent in a scene by it's name, it sets a scene property on it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any value type.
TLSE_AgentNameSetSceneProperty = function(string_agentName, string_propertyName, type_propertyValue, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    TLSE_AgentScenePropertySet(agent_object, string_propertyName, type_propertyValue);
end

--Gets a scene property on a given agent.
--RETURNS: Dynamic type depending on the property
TLSE_AgentGetSceneProperty = function(agent_object, string_propertyName)
    local propertySet_agentObject = AgentGetSceneProperties(agent_object);
    return PropertyGet(propertySet_agentObject, string_propertyName);
end

--Finds an agent in a scene by it's name and gets the scene property set.
--RETURNS: PropertySet
TLSE_AgentNameGetSceneProperties = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetSceneProperties(agent_object);
end

--||||||||||||||||||||||||| RUNTIME PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| RUNTIME PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| RUNTIME PROPERTIES |||||||||||||||||||||||||

--Given an agent, it sets a runtime property on it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any type.
TLSE_AgentRuntimePropertySet = function(agent_object, string_propertyName, type_propertyValue)
    local propertySet_agentObject = AgentGetRuntimeProperties(agent_object);
    PropertySet(propertySet_agentObject, string_propertyName, type_propertyValue);
end

--Finds an agent in a runtime by it's name, it sets a runtime property on it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any value type.
TLSE_AgentNameSetRuntimeProperty = function(string_agentName, string_propertyName, type_propertyValue, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    TLSE_AgentRuntimePropertySet(agent_object, string_propertyName, type_propertyValue);
end

--Gets a runtime property on a given agent.
--RETURNS: Dynamic type depending on the property
TLSE_AgentGetRuntimeProperty = function(agent_object, string_propertyName)
    local propertySet_agentObject = AgentGetRuntimeProperties(agent_object);
    return PropertyGet(propertySet_agentObject, string_propertyName);
end

--Finds an agent in a scene by it's name and gets the runtime property set.
--RETURNS: PropertySet
TLSE_AgentNameGetRuntimeProperties = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetRuntimeProperties(agent_object);
end

--||||||||||||||||||||||||| TRANSIENT PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| TRANSIENT PROPERTIES |||||||||||||||||||||||||
--||||||||||||||||||||||||| TRANSIENT PROPERTIES |||||||||||||||||||||||||

--Given an agent, it sets a transient property on it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any type.
TLSE_AgentTransientPropertySet = function(agent_object, string_propertyName, type_propertyValue)
    local propertySet_agentObject = AgentGetTransientProperties(agent_object);
    PropertySet(propertySet_agentObject, string_propertyName, type_propertyValue);
end

--Finds an agent in a scene by it's name, it sets a transient property on it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any value type.
TLSE_AgentNameSetTransientProperty = function(string_agentName, string_propertyName, type_propertyValue, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    TLSE_AgentTransientPropertySet(agent_object, string_propertyName, type_propertyValue);
end

--Gets a transient property on a given agent.
--RETURNS: Dynamic type depending on the property
TLSE_AgentGetTransientProperty = function(agent_object, string_propertyName)
    local propertySet_agentObject = AgentGetTransientProperties(agent_object);
    return PropertyGet(propertySet_agentObject, string_propertyName);
end

--Finds an agent in a scene by it's name and gets the transient property set.
--RETURNS: PropertySet
TLSE_AgentNameGetTransientProperties = function(string_agentName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    return AgentGetTransientProperties(agent_object);
end

--Removes a transient property on a given agent.
--RETURNS: Nothing
TLSE_AgentRemoveTransientProperty = function(agent_object, string_propertyName)
    local propertySet_agentObject = AgentGetTransientProperties(agent_object);
    PropertyRemove(propertySet_agentObject, string_propertyName);
end

--Finds an agent in a scene by it's name and removes a property on the transient property set.
--RETURNS: Nothing
TLSE_AgentNameRemoveTransientProperty = function(string_agentName, string_propertyName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    TLSE_AgentRemoveTransientProperty(agent_object, string_propertyName);
end

--||||||||||||||||||||||||| UTILITY PROPERTY FUNCTIONS |||||||||||||||||||||||||
--||||||||||||||||||||||||| UTILITY PROPERTY FUNCTIONS |||||||||||||||||||||||||
--||||||||||||||||||||||||| UTILITY PROPERTY FUNCTIONS |||||||||||||||||||||||||

--Forcibly sets a property on an agent by getting all possible property sets on it and setting it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any value type.
TLSE_AgentForceSetProperty = function(agent_object, string_propertyName, type_propertyValue)
    local propertySet_properties = AgentGetProperties(agent_object);
    local propertySet_classProperties = AgentGetClassProperties(agent_object);
    local propertySet_sceneProperties = AgentGetSceneProperties(agent_object);
    local propertySet_runtimeProperties = AgentGetRuntimeProperties(agent_object);
    local propertySet_transientProperties = AgentGetTransientProperties(agent_object);

    PropertySet(propertySet_properties, string_propertyName, type_propertyValue);
    PropertySet(propertySet_classProperties, string_propertyName, type_propertyValue);
    PropertySet(propertySet_sceneProperties, string_propertyName, type_propertyValue);
    PropertySet(propertySet_runtimeProperties, string_propertyName, type_propertyValue);
    PropertySet(propertySet_transientProperties, string_propertyName, type_propertyValue);
end

--Finds an agent in a scene by it's name, and forcibly sets a property on an agent by getting all possible property sets on it and setting it.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any value type.
TLSE_AgentNameForceSetProperty = function(string_agentName, string_propertyName, type_propertyValue, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    TLSE_AgentForceSetProperty(agent_object, string_propertyName, type_propertyValue);
end

--Sets a property on all agents with the given prefix in a scene.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any value type.
TLSE_SetPropertyOnSceneAgentsWithNamePrefix = function(string_scene, string_prefix, string_propertyName, type_propertyValue)
    local agentTable_sceneAgents = SceneGetAgents(string_scene);

    for i, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        local string_agentName = tostring(AgentGetName(agent_sceneAgent));

        if (string.match)(string_agentName, string_prefix) then
            AgentSetProperty(agent_sceneAgent, string_propertyName, type_propertyValue);
        end
    end
end

--Sets a property on all camera objects in a scene.
--RETURNS: Nothing
--NOTE: type_propertyValue can be any value type.
TLSE_SetPropertyOnAllCameras = function(string_scene, string_propertyName, type_propertyValue)
    local agentTable_sceneAgents = TLSE_GetAllCameraAgentsInScene(string_scene);

    for i, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        AgentSetProperty(agent_sceneAgent, string_propertyName, type_propertyValue);
    end
end

TLSE_SetPropertyOnAllMeshes = function(string_scene, string_propertyName, type_propertyValue)
    local agentTable_sceneAgents = TLSE_GetAllMeshAgentsInScene(string_scene);

    for i, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        AgentSetProperty(agent_sceneAgent, string_propertyName, type_propertyValue);
    end
end

TLSE_SetPropertyOnAllMeshes = function(string_scene, string_propertyName, type_propertyValue)
    local agentTable_sceneAgents = TLSE_GetAllMeshAgentsInScene(string_scene);

    for i, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        AgentSetProperty(agent_sceneAgent, string_propertyName, type_propertyValue);
    end
end

















--Attempts to set all textures (by the texture name prefix) on an agent.
--RETURNS: Nothing
--NOTE: THIS REQUIRES A TEXT FILE WITH ALL TELLTALE PROP NAMES AND FILE NAMES ON IT (Most likely you won't have it)
--NOTE: type_newPropertyValue can be any value type.
TLSE_SetTexturesOnAgentWithNamePrefix = function(string_agentName, string_texturePrefix, type_newPropertyValue, string_cacheObjectListFileName, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    local propertySet_agentObject = AgentGetProperties(agent_object);
    local propertyKeyTable_agentObject = PropertyGetKeys(propertySet_agentObject);
    
    local propertyKeyTable_textureKeys = {};

    for index1, propertyKey_key in ipairs(propertyKeyTable_agentObject) do
        local type_propertyValue = PropertyGet(propertySet_agentObject, propertyKey_key);

        if (type_propertyValue) then
            local string_propertyValue = tostring(type_propertyValue);

            if (string.match)(string_propertyValue, "Cached Object") then
                local string_shortened1 = string_propertyValue:gsub("Cached Object: ", "");
                local string_shortened2 = string_shortened1:gsub('"','');

                local file_propertyFileList = io.open(string_cacheObjectListFileName, "r");

                for string_line in file_propertyFileList:lines() do
                    if (string.find)(string_line, string_shortened2) then
                        if (string.find)(string_line, ".d3dtx") then
                            if (string.find)(string_line, string_texturePrefix) then
                                table.insert(propertyKeyTable_textureKeys, propertyKey_key);
                            end
                        end
                    end
                end

                file_propertyFileList:close();
            end
        end
    end

    for index2, propertyKey_textureKey in ipairs(propertyKeyTable_textureKeys) do
        PropertySet(propertySet_agentObject, propertyKey_textureKey, type_newPropertyValue);
    end
end

--Attempts to set all textures (by the texture name prefix) on all agents with the name prefix
--RETURNS: Nothing
--NOTE: THIS REQUIRES A TEXT FILE WITH ALL TELLTALE PROP NAMES AND FILE NAMES ON IT (Most likely you won't have it)
--NOTE: type_newPropertyValue can be any value type.
TLSE_SetTexturesOnAgentsWithNamePrefixes = function(string_agentNamePrefix, string_texturePrefix, type_newPropertyValue, string_cacheObjectListFileName, string_scene)
    local agentTable_sceneAgents = SceneGetAgents(string_scene);

    for index, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        local string_agentName = tostring(AgentGetName(agent_sceneAgent));

        if (string.match)(string_agentName, string_agentNamePrefix) then
            TLSE_SetTexturesOnAgentWithNamePrefix(string_agentName, string_texturePrefix, type_newPropertyValue, string_cacheObjectListFileName, string_scene);
        end
    end
end

--Attempts to set all diffuse textures (by the texture name prefix) on all agents with the name prefix
--RETURNS: Nothing
--NOTE: THIS REQUIRES A TEXT FILE WITH ALL TELLTALE PROP NAMES AND FILE NAMES ON IT (Most likely you won't have it)
--NOTE: type_newPropertyValue can be any value type.
TLSE_SetDiffuseTexturesOnAgentsWithNamePrefixes = function(string_agentNamePrefix, type_newPropertyValue, string_cacheObjectListFileName, string_scene)
    local agentTable_sceneAgents = SceneGetAgents(string_scene);

    for index1, agent_sceneAgent in pairs(agentTable_sceneAgents) do
        local string_agentName = tostring(AgentGetName(agent_sceneAgent));

        if (string.match)(string_agentName, string_agentNamePrefix) then
            local agent_object = AgentFindInScene(string_agentName, string_scene);
            local propertySet_agentObject = AgentGetProperties(agent_object);
            local propertyKeyTable_agentObject = PropertyGetKeys(propertySet_agentObject);
    
            local propertyKeyTable_textureKeys = {};

            for index2, propertyKey_key in ipairs(propertyKeyTable_agentObject) do
                local type_propertyValue = PropertyGet(propertySet_agentObject, propertyKey_key);

                if (type_propertyValue) then
                    local string_propertyValue = tostring(type_propertyValue);

                    if (string.match)(string_propertyValue, "Cached Object") then
                        local string_shortened1 = string_propertyValue:gsub("Cached Object: ", "");
                        local string_shortened2 = string_shortened1:gsub('"','');

                        local file_propertyFileList = io.open(string_cacheObjectListFileName, "r")

                        for string_line in file_propertyFileList:lines() do
                            if (string.find)(string_line, string_shortened2) then
                                if (string.find)(string_line, ".d3dtx") then
                                    local bool_case1 = (string.find)(string_line, "_detail");
                                    local bool_case2 = (string.find)(string_line, "_ink");
                                    local bool_case3 = (string.find)(string_line, "_nm");
                                    local bool_case4 = (string.find)(string_line, "_bnm");
                                    local bool_case5 = (string.find)(string_line, "_spec");
                                    local bool_case6 = (string.find)(string_line, "_mask");
                                    local bool_case7 = (string.find)(string_line, "_microdetail");
                                    local bool_case8 = (string.find)(string_line, "_grime");
                                    local bool_combinedCases = (not bool_case1) and (not bool_case2) and (not bool_case3) and (not bool_case4) and (not bool_case5) and (not bool_case6) and (not bool_case7) and (not bool_case8);

                                    if(bool_combinedCases == true) then
                                        table.insert(propertyKeyTable_textureKeys, propertyKey_key);
                                    end
                                end
                            end
                        end

                        file_propertyFileList:close();
                    end
                end
            end

            for index3, propertyKey_textureKey in ipairs(propertyKeyTable_textureKeys) do
                PropertySet(propertySet_agentObject, propertyKey_textureKey, type_newPropertyValue);
            end
        end
    end
end