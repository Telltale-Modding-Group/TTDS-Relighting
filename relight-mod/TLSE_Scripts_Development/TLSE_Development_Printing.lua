--|||||||||||||||||||||||||||||||||||||||||||||| PRINTING FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| PRINTING FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| PRINTING FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_GetSymbolDatabaseMatchesForSymbol = function(symbol_symbolToCheck)
    local string_matches = "";
    local string_symbolToCheck = TLSE_KeyToString(tostring(symbol_symbolToCheck));

    if(TLSE_Development_SymbolKeyValueDatabase[string_symbolToCheck] ~= nil) then
        string_matches = string_matches .. " | " .. TLSE_Development_SymbolKeyValueDatabase[string_symbolToCheck];
    end

    return string_matches;
end

TLSE_Development_GetCachedObjectMatchesForHash = function(cachedObject_cacheObjectToCheck)
    local string_matches = "";
    local string_cachedObjectToCheck = TLSE_CacheObjectToHashString(tostring(cachedObject_cacheObjectToCheck));

    if(TLSE_Development_SymbolKeyValueDatabase[string_cachedObjectToCheck] ~= nil) then
        string_matches = string_matches .. " | " .. TLSE_Development_SymbolKeyValueDatabase[string_cachedObjectToCheck];
    end

    return string_matches;
end

TLSE_Development_GetAllAgentPropertiesToString = function(agent_reference, string_propertySetType, bool_useSymbolDatabase)
    if(bool_useSymbolDatabase) then
        local symbolDatabase = require("TLSE_Development_SymbolKeyValueDatabase.lua");
    end

    local string_result = "[AGENT NAME]: ".. AgentGetName(agent_reference) .. "\n";

    local propertySet_reference = nil;

    if(string_propertySetType == nil) then
        propertySet_reference = AgentGetProperties(agent_reference);
    elseif(string_propertySetType == "class") then
        propertySet_reference = AgentGetClassProperties(agent_reference);
    elseif(string_propertySetType == "scene") then
        propertySet_reference = AgentGetSceneProperties(agent_reference);
    elseif(string_propertySetType == "runtime") then
        propertySet_reference = AgentGetRuntimeProperties(agent_reference);
    elseif(string_propertySetType == "transient") then
        propertySet_reference = AgentGetTransientProperties(agent_reference);
    else
        propertySet_reference = AgentGetProperties(agent_reference);
    end

    local propertySetKeys_reference = PropertyGetKeys(propertySet_reference);
    local number_propertySetKeySize = TLSE_GetPropertySetKeyCount(propertySet_reference);

    string_result = string_result .. "[KEY COUNT]: " .. tostring(number_propertySetKeySize) .. "\n";

    for index, symbol_propertyKey in pairs(propertySetKeys_reference) do
        local string_keyIndex = "(" .. tostring(index) .. " / " .. tostring(number_propertySetKeySize) .. ")";

        string_result = string_result .. "\n";
        string_result = string_result .. string_keyIndex .. " [KEY]: " .. tostring(symbol_propertyKey);

        if(bool_useSymbolDatabase) then
            string_result = string_result .. TLSE_Development_GetSymbolDatabaseMatchesForSymbol(symbol_propertyKey);
        end

        local type_propertyValue = PropertyGet(propertySet_reference, symbol_propertyKey);
        local string_propertyValueType = TypeName(type_propertyValue);
        local string_propertyValue = tostring(type_propertyValue);

        if(string_propertyValueType == "ContainerInterface") then
            string_propertyValue = TLSE_ContainerToString(type_propertyValue, bool_useSymbolDatabase);
        end

        string_result = string_result .. "\n";
        string_result = string_result .. string_keyIndex .. " [VALUE]: (" .. string_propertyValueType .. ") " .. string_propertyValue;

        if(bool_useSymbolDatabase) then
            if(string.match(string_propertyValueType, "Handle")) then
                string_result = string_result .. TLSE_Development_GetCachedObjectMatchesForHash(type_propertyValue);
            end
        end

        if (string_propertyValueType == "table") then
            local string_tableType = TLSE_GetTableType(type_propertyValue);
    
            if (string_tableType == "color") then
                string_result = string_result .. " | " .. TLSE_ColorToString(type_propertyValue);
            else
                string_result = string_result .. " | " .. TLSE_TablePrint(type_propertyValue);
            end
        end
    end

    return string_result;
end

TLSE_Development_PrintAllAgentProperties = function(agent_reference, string_propertySetType, string_scriptName, bool_useSymbolDatabase)
    local string_finalPath = "TLSEDevelopment/" .. string_scriptName .. ".txt";

    if(TLSE_FileExists(string_finalPath) == true) then
        TLSE_FileDelete(string_finalPath);
    else
        TLSE_DirectoryCreate("TLSEDevelopment");
    end

    local file_textFile = io.open(string_finalPath, "w");

    --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    local string_textToWrite = "\n";

    string_textToWrite = string_textToWrite .. TLSE_Development_GetAllAgentPropertiesToString(agent_reference, string_propertySetType, bool_useSymbolDatabase);

    file_textFile:write(string_textToWrite);
    file_textFile:close();
end

TLSE_Development_PrintAllOriginalSceneAgentNames = function(string_scriptName)
    local string_finalPath = "TLSEDevelopment/" .. string_scriptName .. ".txt";

    if(TLSE_FileExists(string_finalPath) == true) then
        TLSE_FileDelete(string_finalPath);
    else
        TLSE_DirectoryCreate("TLSEDevelopment");
    end

    local file_textFile = io.open(string_finalPath, "w");

    --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    local string_textToWrite = "\n";

    for index, string_sceneAgentName in ipairs(TLSE_Development_OriginalSceneAgentNamesList) do
        string_textToWrite = string_textToWrite .. string_sceneAgentName .. "\n";
    end

    file_textFile:write(string_textToWrite);
    file_textFile:close();
end

TLSE_Development_PrintAllSceneAgentNames = function(string_scriptName, string_scene)
    local string_finalPath = "TLSEDevelopment/" .. string_scriptName .. ".txt";

    if(TLSE_FileExists(string_finalPath) == true) then
        TLSE_FileDelete(string_finalPath);
    else
        TLSE_DirectoryCreate("TLSEDevelopment");
    end

    local file_textFile = io.open(string_finalPath, "w");

    --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    local string_textToWrite = "\n";

    for index, agent_sceneAgent in ipairs(SceneGetAgents(string_scene)) do
        string_textToWrite = string_textToWrite .. AgentGetName(agent_sceneAgent) .. "\n";
    end

    file_textFile:write(string_textToWrite);
    file_textFile:close();
end

































--|||||||||||||||||||||||||||||||||||||||||||||| ARCHIVED ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| ARCHIVED ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| ARCHIVED ||||||||||||||||||||||||||||||||||||||||||||||
--These are all archived and kept here for various reasons, it's not recomended to use them but you can try.

TLSE_PrintChoreAgentNames = function(choreNameString)
    local choreFile = choreNameString;

    local choreAgentNames = ChoreGetAgentNames(choreFile);
    
    local resultTxtFilePath = choreNameString .. "_referencedChoreAgents.txt"
    local resultTxtFile = io.open(resultTxtFilePath, "a")

    resultTxtFile:write(" ", "\n")
    resultTxtFile:write("-------------Referenced Agents In Chore-------------", "\n")
    
    local firstLine = "[CHORE NAME]: " .. choreFile
    resultTxtFile:write(firstLine, "\n")
    
    for _, line in pairs(choreAgentNames) do
        resultTxtFile:write(line, "\n")
    end

    resultTxtFile:close()
end

TLSE_PrintPropertiesFromPropertySet = function(propName, agent_properties)
    --clear the lists
    local agentName_propertyName_validOnesFromFile = {}
    local agentName_propertyName_validOnesFromFile_values = {}
    local agentName_propertyName_validOnesFromFile_valueTypes = {}

    local agent_property_keys = PropertyGetKeys(agent_properties)

    local printValues = true
    local printValueTypes = true

    for i, item in ipairs(agent_property_keys) do
        local agentPropertyName = tostring(item) .. " (" .. SymbolToString(item) .. ")";
        table.insert(agentName_propertyName_validOnesFromFile, agentPropertyName)
            
        if printValues then
            local propertyValue = PropertyGet(agent_properties, item)
            propertyValue = tostring(propertyValue)
            table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
        end
            
        if printValueTypes then
            local propertyValueType = TypeName(PropertyGet(agent_properties, item))
            propertyValueType = tostring(propertyValueType)
            table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
        end
    end

    local agentValidPropertiesTxtFile = propName .. "_props.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------All Properties In PropertySet-------------", "\n")
    
    local firstLine = "[AGENT NAME]: " .. propName
    txt_file_agentValidPropertiesTxtFile:write(firstLine, "\n")
    
    local index = 0
    for _, line in pairs(agentName_propertyName_validOnesFromFile) do
        local totalNameLine = "[NAME ]: " .. line;
        txt_file_agentValidPropertiesTxtFile:write(totalNameLine, "\n")
        
        if printValues then
            if printValueTypes then
                local totalLine = "[VALUE]: (" .. agentName_propertyName_validOnesFromFile_valueTypes[_] .. ") " .. agentName_propertyName_validOnesFromFile_values[_];
                txt_file_agentValidPropertiesTxtFile:write(totalLine, "\n")
            else
                txt_file_agentValidPropertiesTxtFile:write("Value: " .. agentName_propertyName_validOnesFromFile_values[_], "\n")
            end
        end
       
        index = index + 1
    end

    txt_file_agentValidPropertiesTxtFile:close()
end

TLSE_GetCacheObjectName = function(string_cacheObjectName, cacheObjectListName)
    if (string.match)(string_cacheObjectName, "Cached Object") then
        local shortenedString = string_cacheObjectName:gsub("Cached Object: ", "");
        local shortenedString2 = shortenedString:gsub('"','');

        local readTxtFile = io.open(cacheObjectListName, "r")

        for line in readTxtFile:lines() do
            if (string.find)(line, shortenedString2) then
                return line;
            end
        end

        readTxtFile:close()
    end

    return "nothing";
end

TLSE_GetCacheObjectNamesFromProperties = function(agent, cacheObjectListName)
    local propertyKeyNames = {}
    local propertyValues = {}
    local propertyValueTypes = {}

    --local readTxtFile = io.open("cleanedCacheObjectsList.txt", "r")

    local agent_properties = AgentGetRuntimeProperties(agent)
    local agent_property_keys = PropertyGetKeys(agent_properties)

    for i, item in ipairs(agent_property_keys) do
        local propertyValue = PropertyGet(agent_properties, item);

        if (propertyValue) then
            local propertyKeyNameString = tostring(item);
            local propertyValueType = tostring(TypeName(propertyValue));
            local propertyValueString = tostring(propertyValue);

            if (string.match)(propertyValueString, "Cached Object") then
                local shortenedString = propertyValueString:gsub("Cached Object: ", "");
                local shortenedString2 = shortenedString:gsub('"','');

                local readTxtFile = io.open(cacheObjectListName, "r")

                for line in readTxtFile:lines() do
                    if (string.find)(line, shortenedString2) then
                        table.insert(propertyKeyNames, propertyKeyNameString);
                        table.insert(propertyValues, line);
                        table.insert(propertyValueTypes, propertyValueType);
                    end
                end

                readTxtFile:close()
            end
        end
    end

    local agentValidPropertiesTxtFile = AgentGetName(agent) .. "_foundcacheobjectnames.txt"
    local resultTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    resultTxtFile:write(" ", "\n")
    resultTxtFile:write("-------------All Cached Objects In Agent-------------", "\n")
    
    local firstLine = "[AGENT NAME]: " .. AgentGetName(agent)
    resultTxtFile:write(firstLine, "\n")

    for _, line in pairs(propertyKeyNames) do
        local totalNameLine = "[NAME ]: " .. line;
        resultTxtFile:write(totalNameLine, "\n")
        
        local totalLine = "[VALUE]: (" .. propertyValueTypes[_] .. ") " .. propertyValues[_];
        resultTxtFile:write(totalLine, "\n")
    end

    resultTxtFile:close()
end

TLSE_PrintOutCacheObjectProperties = function(agent, propertyString)
    local list_lineName = {}
    local liast_resultName = {}

    local txtFile = io.open("strings.txt", "r")

    local agent_properties = AgentGetRuntimeProperties(agent)

    local printValues = true
    local printValueTypes = true

    for line in txtFile:lines() do
        if PropertyExists(agent_properties, propertyString) then
            PropertySet(agent_properties, propertyString, line);

            local result = PropertyGet(agent_properties, propertyString);

            table.insert(list_lineName, line)
            table.insert(liast_resultName, tostring(result))
        end
    end

    txtFile:close()
    
    local agentValidPropertiesTxtFile = AgentGetName(agent) .. "_cacheObjectNames.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------FoundCacheObjectNames-------------", "\n")
    
    local firstLine = "[AGENT NAME]: " .. AgentGetName(agent)
    txt_file_agentValidPropertiesTxtFile:write(firstLine, "\n")

    for _, line in pairs(list_lineName) do
        local resultLineString = line .. " | " .. liast_resultName[_];
        txt_file_agentValidPropertiesTxtFile:write(resultLineString, "\n")
    end

    txt_file_agentValidPropertiesTxtFile:close()
end

--loads the lines from agentName_propertyName_txtFile into an array
--probably a bad idea to load all the lines of a file into memory... but fuck it!
--note to self: need to filter the array for copies and remove them
TLSE_PrintValidPropertyNames = function(agent)
    local theAgentName = AgentGetName(agent)

    --clear the lists
    local agentName_propertyName_validOnesFromFile = {}
    local agentName_propertyName_validOnesFromFile_values = {}
    local agentName_propertyName_validOnesFromFile_valueTypes = {}

    local txtFile = io.open("strings.txt", "r")

    --local agent_properties = AgentGetRuntimeProperties(agent)
    local agent_properties = AgentGetProperties(agent)
    local agent_property_keys = PropertyGetKeys(agent_properties)

    local printValues = true
    local printValueTypes = true

    for line in txtFile:lines() do
        local comparisonLines = {
            line,
            "Mesh " .. line .. " - Visible",
            line .. " - Texture",
            line .. " - Base Texture",
            line .. " - Diffuse Texture",
            line .. " - Normal Map Texture",
            line .. " - Normalmap Texture",
            line .. " - Lightmap Texture",
            line .. " - Detail Texture",
            line .. " - AO Texture",
            line .. " - Font Texture",
            line .. " - Particle Texture",
            line .. " - Misc Texture",
            line .. " - Specular Map Texture",
            line .. " - Diffuse Albedo Color",
            line .. " - Light Color Diffuse",
            line .. " - Visible",
            line .. " - GlossExponent",
            line .. " - SpecularPower",
            line .. " - Gloss Exponent",
            line .. " - Specular Power",
            line .. " - CubeMap",
            line .. " - Reflection",
            line .. " - Light Model",
            line .. " - Normal Space",
            line .. " - Double Sided",
            line .. " - Double Sided Normals",
            line .. " - Shadow Cast Enable",
            line .. " - Shadow Receive Enable",
            line .. " - Light Wrap",
            line .. " - Roughness",
            line .. " - Smoothness",
            line .. " - ",
            line .. " "
        };

        ---------------------------------------------------
        for index6, string_comparisonLine in ipairs(comparisonLines) do
            if PropertyExists(agent_properties, string_comparisonLine) then
                local agentPropertyName = string_comparisonLine .. " (" .. tostring(StringToSymbol(string_comparisonLine)) .. ")";
                table.insert(agentName_propertyName_validOnesFromFile, agentPropertyName)
            
                if printValues then
                    local propertyValue = PropertyGet(agent_properties, string_comparisonLine)
                    propertyValue = tostring(propertyValue)
                    table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
                end
            
                if printValueTypes then
                    local propertyValueType = TypeName(PropertyGet(agent_properties, string_comparisonLine))
                    propertyValueType = tostring(propertyValueType)
                    table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
                end
            end
        end















        ---------------------------------------------------
        --test 2
        --local txtFile2 = io.open("strings.txt", "r")
        --local testPropLine2_start = line .. " ";

        --for line2 in txtFile2:lines() do
            --local testPropLine2_final = testPropLine2_start .. line2;

            --if PropertyExists(agent_properties, testPropLine2_final) then
			    --local agentPropertyName = testPropLine2_final .. " (" .. tostring(StringToSymbol(testPropLine2_final)) .. ")";
                --table.insert(agentName_propertyName_validOnesFromFile, agentPropertyName)
            
                --if printValues then
                    --local propertyValue = PropertyGet(agent_properties, testPropLine2_final)
                    --propertyValue = tostring(propertyValue)
                    --table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
                --end
            
                --if printValueTypes then
                    --local propertyValueType = TypeName(PropertyGet(agent_properties, testPropLine2_final))
                    --propertyValueType = tostring(propertyValueType)
                    --table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
                --end
            --end
        --end
    end
    
    txtFile:close()
    
    local agentValidPropertiesTxtFile = AgentGetName(agent) .. "_foundpropnames.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------Found Valid Properties By Name-------------", "\n")
    
    local firstLine = "[AGENT NAME]: " .. theAgentName
    txt_file_agentValidPropertiesTxtFile:write(firstLine, "\n")
    
    local index = 0
    for _, line in pairs(agentName_propertyName_validOnesFromFile) do
        local totalNameLine = "[NAME ]: " .. line;
    
        txt_file_agentValidPropertiesTxtFile:write(totalNameLine, "\n")
        
        if printValues then
            if printValueTypes then
                local totalLine = "[VALUE]: (" .. agentName_propertyName_validOnesFromFile_valueTypes[_] .. ") " .. agentName_propertyName_validOnesFromFile_values[_];
                txt_file_agentValidPropertiesTxtFile:write(totalLine, "\n")
            else
                txt_file_agentValidPropertiesTxtFile:write("Value: " .. agentName_propertyName_validOnesFromFile_values[_], "\n")
            end
        end
       
        index = index + 1
    end

    txt_file_agentValidPropertiesTxtFile:close()
end

TLSE_PrintValidPropertyNamesOnPropertySet = function(newName, agent_properties)
    --clear the lists
    local agentName_propertyName_validOnesFromFile = {}
    local agentName_propertyName_validOnesFromFile_values = {}
    local agentName_propertyName_validOnesFromFile_valueTypes = {}

    local txtFile = io.open("strings.txt", "r")
    local txtFile2 = io.open("strings.txt", "r")

    local agent_property_keys = PropertyGetKeys(agent_properties)

    local printValues = true
    local printValueTypes = true
    
    for line in txtFile:lines() do
        ---------------------------------------------------
        --print classic properties from file
        if PropertyExists(agent_properties, line) then
            local agentPropertyName = line .. " (" .. tostring(StringToSymbol(line)) .. ")";
            table.insert(agentName_propertyName_validOnesFromFile, agentPropertyName)
            
            if printValues then
                local propertyValue = PropertyGet(agent_properties, line)
                propertyValue = tostring(propertyValue)
                table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
            end
            
            if printValueTypes then
                local propertyValueType = TypeName(PropertyGet(agent_properties, line))
                propertyValueType = tostring(propertyValueType)
                table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
            end
        end

        ---------------------------------------------------
        --test 1
        local testPropLine1_start = line .. " - ";

        for line2 in txtFile2:lines() do
            local testPropLine1_final = testPropLine1_start .. line2;

            if PropertyExists(agent_properties, testPropLine1_final) then
			    local agentPropertyName = testPropLine1_final .. " (" .. tostring(StringToSymbol(testPropLine1_final)) .. ")";
                table.insert(agentName_propertyName_validOnesFromFile, agentPropertyName)
            
                if printValues then
                    local propertyValue = PropertyGet(agent_properties, testPropLine1_final)
                    propertyValue = tostring(propertyValue)
                    table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
                end
            
                if printValueTypes then
                    local propertyValueType = TypeName(PropertyGet(agent_properties, testPropLine1_final))
                    propertyValueType = tostring(propertyValueType)
                    table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
                end
            end
        end

        ---------------------------------------------------
        --test 2
        local testPropLine2_start = line .. " ";

        for line2 in txtFile2:lines() do
            local testPropLine2_final = testPropLine2_start .. line2;

            if PropertyExists(agent_properties, testPropLine2_final) then
			    local agentPropertyName = testPropLine2_final .. " (" .. tostring(StringToSymbol(testPropLine2_final)) .. ")";
                table.insert(agentName_propertyName_validOnesFromFile, agentPropertyName)
            
                if printValues then
                    local propertyValue = PropertyGet(agent_properties, testPropLine2_final)
                    propertyValue = tostring(propertyValue)
                    table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
                end
            
                if printValueTypes then
                    local propertyValueType = TypeName(PropertyGet(agent_properties, testPropLine2_final))
                    propertyValueType = tostring(propertyValueType)
                    table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
                end
            end
        end
    end
    
    txtFile:close()
    
    local agentValidPropertiesTxtFile = newName .. "_foundpropnames.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------Found Valid Properties By Name-------------", "\n")
    
    local firstLine = "[PROPERTY SET NAME]: " .. newName
    txt_file_agentValidPropertiesTxtFile:write(firstLine, "\n")
    
    local index = 0
    for _, line in pairs(agentName_propertyName_validOnesFromFile) do
        local totalNameLine = "[NAME ]: " .. line;
    
        txt_file_agentValidPropertiesTxtFile:write(totalNameLine, "\n")
        
        if printValues then
            if printValueTypes then
                local totalLine = "[VALUE]: (" .. agentName_propertyName_validOnesFromFile_valueTypes[_] .. ") " .. agentName_propertyName_validOnesFromFile_values[_];
                txt_file_agentValidPropertiesTxtFile:write(totalLine, "\n")
            else
                txt_file_agentValidPropertiesTxtFile:write("Value: " .. agentName_propertyName_validOnesFromFile_values[_], "\n")
            end
        end
       
        index = index + 1
    end

    txt_file_agentValidPropertiesTxtFile:close()
end








TLSE_PrintValidAgentStateNames = function(agent)
    local theAgentName = AgentGetName(agent)

    --clear the lists
    local agentName_propertyName_validOnesFromFile = {}
    local agentName_propertyName_validOnesFromFile_values = {}
    local agentName_propertyName_validOnesFromFile_valueTypes = {}

    local txtFile = io.open("strings.txt", "r")

    local agent_properties = AgentGetRuntimeProperties(agent)
    local agent_property_keys = PropertyGetKeys(agent_properties)

    local printValues = true
    local printValueTypes = true
    
    if (PropertyHasGlobal(agent_properties, "module_agent_state")) then
        for line in txtFile:lines() do
            local stateProps = ContainerGetElement(PropertyGet(agent_properties, "States"), line)
        
            if (stateProps) then
                for _, key in ipairs(PropertyGetKeys(stateProps)) do

                
                    if PropertyExists(agentProps, key) then
                        local agentPropertyName = line .. " (" .. tostring(StringToSymbol(line)) .. ")";
                        table.insert(agentName_propertyName_validOnesFromFile, agentPropertyName)
            
                        if printValues then
                            local propertyValue = PropertyGet(agent_properties, line)
                            propertyValue = tostring(propertyValue)
                            table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
                        end
            
                        if printValueTypes then
                            local propertyValueType = TypeName(PropertyGet(agent_properties, line))
                            propertyValueType = tostring(propertyValueType)
                            table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
                        end
                    end
                    

                end
            end
        end
    end
    
    txtFile:close()
    
    local agentValidPropertiesTxtFile = AgentGetName(agent) .. "_foundpropnames.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------Found Valid Properties By Name-------------", "\n")
    
    local firstLine = "[AGENT NAME]: " .. theAgentName
    txt_file_agentValidPropertiesTxtFile:write(firstLine, "\n")
    
    local index = 0
    for _, line in pairs(agentName_propertyName_validOnesFromFile) do
        local totalNameLine = "[NAME ]: " .. line;
    
        txt_file_agentValidPropertiesTxtFile:write(totalNameLine, "\n")
        
        if printValues then
            if printValueTypes then
                local totalLine = "[VALUE]: (" .. agentName_propertyName_validOnesFromFile_valueTypes[_] .. ") " .. agentName_propertyName_validOnesFromFile_values[_];
                txt_file_agentValidPropertiesTxtFile:write(totalLine, "\n")
            else
                txt_file_agentValidPropertiesTxtFile:write("Value: " .. agentName_propertyName_validOnesFromFile_values[_], "\n")
            end
        end
       
        index = index + 1
    end

    txt_file_agentValidPropertiesTxtFile:close()
end

TLSE_PrintAgentStates = function(agent)
    local theAgentName = AgentGetName(agent)

    --clear the lists
    local agentName_propertyName_validOnesFromFile = {}
    local agentName_propertyName_validOnesFromFile_values = {}
    local agentName_propertyName_validOnesFromFile_valueTypes = {}

    local txtFile = io.open("strings.txt", "r")

    local agent_properties = AgentGetRuntimeProperties(agent)
    local agent_property_keys = PropertyGetKeys(agent_properties)

    local printValues = true
    local printValueTypes = true
    
    if (PropertyHasGlobal(agent_properties, "module_agent_state")) then
        for line in txtFile:lines() do
            local stateProps = ContainerGetElement(PropertyGet(agent_properties, "States"), line)
        
            if (stateProps) then
                for _, key in ipairs(PropertyGetKeys(stateProps)) do

                
                    if PropertyExists(agentProps, key) then
                        local agentPropertyName = line .. " (" .. tostring(StringToSymbol(line)) .. ")";
                        table.insert(agentName_propertyName_validOnesFromFile, agentPropertyName)
            
                        if printValues then
                            local propertyValue = PropertyGet(agent_properties, line)
                            propertyValue = tostring(propertyValue)
                            table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
                        end
            
                        if printValueTypes then
                            local propertyValueType = TypeName(PropertyGet(agent_properties, line))
                            propertyValueType = tostring(propertyValueType)
                            table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
                        end
                    end
                    

                end
            end
        end
    end
    
    txtFile:close()
    
    local agentValidPropertiesTxtFile = AgentGetName(agent) .. "_foundpropnames.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------Found Valid Properties By Name-------------", "\n")
    
    local firstLine = "[AGENT NAME]: " .. theAgentName
    txt_file_agentValidPropertiesTxtFile:write(firstLine, "\n")
    
    local index = 0
    for _, line in pairs(agentName_propertyName_validOnesFromFile) do
        local totalNameLine = "[NAME ]: " .. line;
    
        txt_file_agentValidPropertiesTxtFile:write(totalNameLine, "\n")
        
        if printValues then
            if printValueTypes then
                local totalLine = "[VALUE]: (" .. agentName_propertyName_validOnesFromFile_valueTypes[_] .. ") " .. agentName_propertyName_validOnesFromFile_values[_];
                txt_file_agentValidPropertiesTxtFile:write(totalLine, "\n")
            else
                txt_file_agentValidPropertiesTxtFile:write("Value: " .. agentName_propertyName_validOnesFromFile_values[_], "\n")
            end
        end
       
        index = index + 1
    end

    txt_file_agentValidPropertiesTxtFile:close()
end













--loads the lines from agentName_propertyName_txtFile into an array
--probably a bad idea to load all the lines of a big ass text file into memory... but fuck it!
TLSE_PrintValidNodeNames = function(agent)
    local theAgentName = AgentGetName(agent)

    --clear the lists
    local agentName_propertyName_validOnesFromFile = {}

    local txtFile = io.open("strings.txt", "r")

    --find the ones valid in the file
    for line in txtFile:lines() do
        --print classic properties from file
        if AgentHasNode(agent, line) then
            local agentNodeName = line;
            table.insert(agentName_propertyName_validOnesFromFile, agentNodeName)
        end
    end
    
    txtFile:close()
    
    local agentValidPropertiesTxtFile = AgentGetName(agent) .. "_foundnodenames.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------Found Valid Nodes By Name-------------", "\n")
    
    local firstLine = "[AGENT NAME]: " .. theAgentName
    txt_file_agentValidPropertiesTxtFile:write(firstLine, "\n")
    
    local index = 0
    for _, line in pairs(agentName_propertyName_validOnesFromFile) do
        local totalNameLine = "[NAME]: " .. line;
    
        txt_file_agentValidPropertiesTxtFile:write(totalNameLine, "\n")
       
        index = index + 1
    end

    txt_file_agentValidPropertiesTxtFile:close()
end




TLSE_PrintMatchingAgentProperties = function(agent_one, agent_two)
    local string_agentOneName = AgentGetName(agent_one);
    local string_agentTwoName = AgentGetName(agent_two);

    local strings_matchingPropertySymbols = {};

    local strings_agentOnePropertyValues = {};
    local strings_agentOnePropertyValueTypes = {};
    local strings_agentTwoPropertyValues = {};
    local strings_agentTwoPropertyValueTypes = {};

    local propertySet_agentOne = AgentGetRuntimeProperties(agent_one);
    local propertySet_agentTwo = AgentGetRuntimeProperties(agent_two);
    local propertyKeys_agentOne = PropertyGetKeys(propertySet_agentOne);
    local propertyKeys_agentTwo = PropertyGetKeys(propertySet_agentTwo);

    local bool_printValues = true;
    local bool_printValueTypes = true;

    for index1, propertyKey_agentOne in ipairs(propertyKeys_agentOne) do
        local string_agentOnePropertyName = tostring(propertyKey_agentOne) .. " (" .. SymbolToString(propertyKey_agentOne) .. ")";
        local type_agentOnePropertyValue = PropertyGet(propertySet_agentOne, propertyKey_agentOne);
        local type_agentOnePropertyValueType = TypeName(type_agentOnePropertyValue);
        local string_agentOnePropertyValue = tostring(type_agentOnePropertyValue);
        local string_agentOnePropertyValueType = tostring(type_agentOnePropertyValueType);

        for index2, propertyKey_agentTwo in ipairs(propertyKeys_agentTwo) do
            local string_agentTwoPropertyName = tostring(propertyKey_agentTwo) .. " (" .. SymbolToString(propertyKey_agentTwo) .. ")";
            local type_agentTwoPropertyValue = PropertyGet(propertySet_agentTwo, propertyKey_agentTwo);
            local type_agentTwoPropertyValueType = TypeName(type_agentTwoPropertyValue);
            local string_agentTwoPropertyValue = tostring(type_agentTwoPropertyValue);
            local string_agentTwoPropertyValueType = tostring(type_agentTwoPropertyValueType);

            if(string_agentOnePropertyName == string_agentTwoPropertyName) then
                table.insert(strings_matchingPropertySymbols, string_agentOnePropertyName);
                table.insert(strings_agentOnePropertyValues, string_agentOnePropertyValue);
                table.insert(strings_agentOnePropertyValueTypes, string_agentOnePropertyValueType);
                table.insert(strings_agentTwoPropertyValues, string_agentTwoPropertyValue);
                table.insert(strings_agentTwoPropertyValueTypes, string_agentTwoPropertyValueType);
            end
        end
    end
    
    local string_fileName = "MATCHING-PROPERTIES_" .. AgentGetName(agent_one) .. "_AND_" .. AgentGetName(agent_two) .. ".txt";
    local file_textFile = io.open(string_fileName, "w");

    file_textFile:write(" ", "\n");
    file_textFile:write("-------------Matching Properties In Both Agents-------------", "\n");
    file_textFile:write("[AGENT ONE]: " .. string_agentOneName, "\n");
    file_textFile:write("[AGENT TWO]: " .. string_agentTwoName, "\n");

    for index1, string_matchingPropertySymbol in pairs(strings_matchingPropertySymbols) do
        file_textFile:write(" [NAME]: " .. string_matchingPropertySymbol, "\n");
    end

    file_textFile:close();
end















































TLSE_PrintInvalidPropertyNames = function(agent)
    local theAgentName = AgentGetName(agent)

    --clear the lists
    local agentName_propertyName_validOnesFromFile = {}

    local txtFile = io.open("strings.txt", "r")
    local txtFile2 = io.open("strings.txt", "r")

    --local agent_properties = AgentGetRuntimeProperties(agent)
    local agent_properties = AgentGetProperties(agent)
    local agent_property_keys = PropertyGetKeys(agent_properties)

    local printValues = true
    local printValueTypes = true
    
    for line in txtFile:lines() do
        ---------------------------------------------------
        --print classic properties from file
        if PropertyExists(agent_properties, line) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(line)))
        end

        ---------------------------------------------------
        --print mesh properties from file
        local meshPropLineStart = "Mesh " .. line .. " - Visible";

        if PropertyExists(agent_properties, meshPropLineStart) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(meshPropLineStart)))
        end

        ---------------------------------------------------
        --print base textures from file
        local baseTexPropLine = line .. " - Texture";

        if PropertyExists(agent_properties, baseTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(baseTexPropLine)))
        end

        ---------------------------------------------------
        --print base2 textures from file
        local base2TexPropLine = line .. " - Base Texture";

        if PropertyExists(agent_properties, base2TexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(base2TexPropLine)))
        end

        ---------------------------------------------------
        --print diffuse textures from file
        local diffuseTexPropLine = line .. " - Diffuse Texture";

        if PropertyExists(agent_properties, diffuseTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(diffuseTexPropLine)))
        end

        ---------------------------------------------------
        --print normal textures from file
        local normalTexPropLine = line .. " - Normal Map Texture";

        if PropertyExists(agent_properties, normalTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(normalTexPropLine)))
        end

        ---------------------------------------------------
        --print normalmap textures from file
        local normalmapTexPropLine = line .. " - Normalmap Texture";

        if PropertyExists(agent_properties, normalmapTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(normalmapTexPropLine)))
        end

        ---------------------------------------------------
        --print lightmap textures from file
        local lightmapTexPropLine = line .. " - Lightmap Texture";

        if PropertyExists(agent_properties, lightmapTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(lightmapTexPropLine)))
        end

        ---------------------------------------------------
        --print detail textures from file
        local detailTexPropLine = line .. " - Detail Texture";

        if PropertyExists(agent_properties, detailTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(detailTexPropLine)))
        end

        ---------------------------------------------------
        --print ao textures from file
        local aoTexPropLine = line .. " - AO Texture";

        if PropertyExists(agent_properties, aoTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(aoTexPropLine)))
        end

        ---------------------------------------------------
        --print font textures from file
        local fontTexPropLine = line .. " - Font Texture";

        if PropertyExists(agent_properties, fontTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(fontTexPropLine)))
        end

        ---------------------------------------------------
        --print particle textures from file
        local particleTexPropLine = line .. " - Particle Texture";

        if PropertyExists(agent_properties, particleTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(particleTexPropLine)))
        end

        ---------------------------------------------------
        --print misc textures from file
        local miscTexPropLine = line .. " - Misc Texture";

        if PropertyExists(agent_properties, miscTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(miscTexPropLine)))
        end

        ---------------------------------------------------
        --print specular textures from file
        local specularTexPropLine = line .. " - Specular Map Texture";

        if PropertyExists(agent_properties, specularTexPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(specularTexPropLine)))
        end

        ---------------------------------------------------
        --print diffuse albedo color from file
        local diffuseAlbedoColorPropLine = line .. " - Diffuse Albedo Color";

        if PropertyExists(agent_properties, diffuseAlbedoColorPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(diffuseAlbedoColorPropLine)))
        end

        ---------------------------------------------------
        --print light color diffuse from file
        local lightColorDiffusePropLine = line .. " - Light Color Diffuse";

        if PropertyExists(agent_properties, lightColorDiffusePropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(lightColorDiffusePropLine)))
        end

        ---------------------------------------------------
        --print double sided from file
        local doubleSidedPropLine = line .. " - Double Sided";

        if PropertyExists(agent_properties, doubleSidedPropLine) then
            table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(doubleSidedPropLine)))
        end

        ---------------------------------------------------
        --test 1
        local testPropLine1_start = line .. " - ";

        for line2 in txtFile2:lines() do
            local testPropLine1_final = testPropLine1_start .. line2;

            if PropertyExists(agent_properties, testPropLine1_final) then
                table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(testPropLine1_start)))
            end
        end

        ---------------------------------------------------
        --test 2
        local testPropLine2_start = line .. " ";

        for line2 in txtFile2:lines() do
            local testPropLine2_final = testPropLine2_start .. line2;

            if PropertyExists(agent_properties, testPropLine2_final) then
                table.insert(agentName_propertyName_validOnesFromFile, tostring(StringToSymbol(testPropLine2_start)))
            end
        end
    end
    
    txtFile:close()

    local strings_unfoundPropSymbols = {};
    local strings_unfoundPropValues = {};
    local strings_unfoundPropValueTypes = {};

    local propertySet_agentOne = AgentGetRuntimeProperties(agent);
    local propertyKeys_agentOne = PropertyGetKeys(propertySet_agentOne);

    for index1, propertyKey_agentOne in ipairs(propertyKeys_agentOne) do
        for index2, string_foundPropName in pairs(agentName_propertyName_validOnesFromFile) do
            if not (string_foundPropName == tostring(propertyKey_agentOne)) then
                local string_agentOnePropertyName = tostring(propertyKey_agentOne) .. " (" .. SymbolToString(propertyKey_agentOne) .. ")";
                local type_agentOnePropertyValue = PropertyGet(agent, propertyKey_agentOne);
                local type_agentOnePropertyValueType = TypeName(type_agentOnePropertyValue);
                local string_agentOnePropertyValue = tostring(type_agentOnePropertyValue);
                local string_agentOnePropertyValueType = tostring(type_agentOnePropertyValueType);

                table.insert(strings_unfoundPropSymbols, string_agentOnePropertyName);
                table.insert(strings_unfoundPropValues, string_agentOnePropertyValue);
                table.insert(strings_unfoundPropValueTypes, string_agentOnePropertyValueType);
            end
        end
    end












    
    local agentValidPropertiesTxtFile = AgentGetName(agent) .. "_unfoundpropnames.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "w")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------Found Invalid Properties (By Name)-------------", "\n")
    txt_file_agentValidPropertiesTxtFile:write("[AGENT NAME]: " .. theAgentName, "\n")

    local index = 1;
    for _, line in pairs(strings_unfoundPropSymbols) do
        local totalNameLine = "[NAME ]: " .. line;
        local totalLine = "[VALUE]: (" .. strings_unfoundPropValueTypes[index] .. ") " .. strings_unfoundPropValues[index];
        txt_file_agentValidPropertiesTxtFile:write(totalNameLine, "\n")
        txt_file_agentValidPropertiesTxtFile:write(totalLine, "\n")
        index = index + 1;
    end

    txt_file_agentValidPropertiesTxtFile:close()
end