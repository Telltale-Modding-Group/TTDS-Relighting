--||||||||||||||||||||| PROPERTY KEY FUNCTIONS |||||||||||||||||||||
--||||||||||||||||||||| PROPERTY KEY FUNCTIONS |||||||||||||||||||||
--||||||||||||||||||||| PROPERTY KEY FUNCTIONS |||||||||||||||||||||
--Note: these were before we even knew most of the actual property names within objects.
--I've since compiled a txt document full of all of these prop names which can be extracted from the game exe.
--However, this is still in use because there are still alot of property names that are hashed.
--This still works, but you have to know the property by its hashed symbol.

TLSE_PropertySetWithSymbol = function(propertySet_props, string_symbol, type_value)
    if(propertySet_props == nil) then
        return;
    end

    local propertyKeys_props = PropertyGetKeys(propertySet_props);

    for i, propertyKey_key in ipairs(propertyKeys_props) do
        local string_propertyKey = TLSE_KeyToString(propertyKey_key); --get the property key as a string

        if(string_propertyKey == string_symbol) then
            PropertySet(propertySet_props, propertyKey_key, type_value);
        end
    end
end

TLSE_AgentSetPropertyWithSymbol = function(agent_object, string_symbol, type_value)
    if(agent_object == nil) then
        return;
    end

    local propertySet_object = AgentGetProperties(agent_object);
    TLSE_PropertySetWithSymbol(propertySet_object, string_symbol, type_value);
end

TLSE_AgentNameSetPropertyWithSymbol = function(string_agentName, string_symbol, type_value, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);

    if(agent_object == nil) then
        return;
    end

    TLSE_AgentSetPropertyWithSymbol(agent_object, string_symbol, type_value);
end

TLSE_PropertyGetWithSymbol = function(propertySet_props, string_symbol)
    if(propertySet_props == nil) then
        return nil;
    end

    local propertyKeys_props = PropertyGetKeys(propertySet_props);

    for i, propertyKey_key in ipairs(propertyKeys_props) do
        local string_propertyKey = TLSE_KeyToString(propertyKey_key); --get the property key as a string

        if(string_propertyKey == string_symbol) then
            return PropertyGet(propertySet_props, propertyKey_key);
        end
    end

    return nil;
end

TLSE_AgentGetPropertyWithSymbol = function(agent_object, string_symbol)
    if(agent_object == nil) then
        return nil;
    end

    local propertySet_object = AgentGetProperties(agent_object);
    return TLSE_PropertyGetWithSymbol(propertySet_object, string_symbol);
end

TLSE_AgentNameGetPropertyWithSymbol = function(string_agentName, string_symbol, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);

    if(agent_object == nil) then
        return nil;
    end

    return TLSE_AgentGetPropertyWithSymbol(agent_object, string_symbol);
end