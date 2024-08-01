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

    for i, agent_property_key in ipairs(propertyKeys_props) do
        local agent_propety_key_string = TLSE_KeyToString(agent_property_key); --get the property key as a string

        if agent_propety_key_string == string_symbol then
            PropertySet(propertySet_props, agent_property_key, type_value);
        end
    end
end

TLSE_AgentSetPropertyWithSymbol = function(agent_object, string_symbol, type_value)
    local propertySet_object = AgentGetProperties(agent_object);
    TLSE_PropertySetWithSymbol(propertySet_object, string_symbol, type_value);
end

TLSE_AgentNameSetPropertyWithSymbol = function(string_agentName, string_symbol, type_value, string_scene)
    local agent_object = AgentFindInScene(string_agentName, string_scene);
    TLSE_AgentSetPropertyWithSymbol(agent_object, string_symbol, type_value);
end