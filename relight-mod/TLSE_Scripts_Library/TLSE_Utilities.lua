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