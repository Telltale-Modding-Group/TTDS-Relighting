print = function(message)
    if (TLSE_Project_DebugPrinting == true) then
        os.execute("echo " .. message);
    end
end

TLSE_GetTableType = function(tableValue)
    local stringType = "table";
    
    local colorMatch = 0;
    
    for key, value in pairs(tableValue) do
        --if the key is a string type
        if (type(key) == "string") then
            --check if the key name matches the variables of the color type
            if (key == "r") or (key == "g") or (key == "b") or (key == "a") then
                colorMatch = colorMatch + 1
            end
        end
    end
    
    --if the color is a full match then this table is infact a color
    if (colorMatch == 4) then
        stringType = "color";
    end
    
    return stringType;
end

TLSE_GetPropertySetKeyCount = function(propertySet_props)
    local propertySetKeys_reference = PropertyGetKeys(propertySet_props);
    local number_count = 0;

    for index, symbol_propertyKey in pairs(propertySetKeys_reference) do
        number_count = number_count + 1;
    end

    return number_count;
end

TLSE_SetAllPropertyColors = function(agent_object, color_newColor)
    local propertySet_agent = AgentGetProperties(agent_object);
    local propertySetKeys_agent = PropertyGetKeys(propertySet_agent);

    for index, symbol_propertyKey in pairs(propertySetKeys_agent) do
        local type_propertyValue = PropertyGet(propertySet_agent, symbol_propertyKey);

        if(TypeName(type_propertyValue) == "table") then
            if(TLSE_GetTableType(type_propertyValue) == "color") then
                AgentSetProperty(agent_object, symbol_propertyKey, color_newColor);
            end
        end
    end
end

TLSE_GetTableSize = function(table)
    local number_size = 1;

    for index, item in ipairs(table) do
        number_size = number_size + 1;
    end

    return number_size;
end

TLSE_GetTableItemByIndex = function(table, desiredIndex)
    for index, item in ipairs(table) do
        if(desiredIndex == index) then
            return item;
        end
    end

    return nil;
end