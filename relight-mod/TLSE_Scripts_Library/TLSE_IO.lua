--checks if a file exists
TLSE_FileExists = function(filePathRelativeToGameExe)
    --return FileExists(filePathRelativeToGameExe);

    local f = io.open(filePathRelativeToGameExe, "r");
    
    if f ~= nil then
        io.close(f);
        return true;
    else
        return false;
    end
end

TLSE_FileDelete = function(filePathRelativeToGameExe)
    os.remove(filePathRelativeToGameExe);
end

TLSE_DirectoryCreate = function(directoryPathRelativeToGameExe)
    --reference command: mkdir filterscripts\\account

    os.execute("mkdir " .. directoryPathRelativeToGameExe);
end

TLSE_DirectoryDelete = function(directoryPathRelativeToGameExe)
    os.remove(directoryPathRelativeToGameExe);
end

TLSE_DirectoryExists = function(directoryPathRelativeToGameExe)
    return TLSE_FileExists(directoryPathRelativeToGameExe)
end

TLSE_LoadAndUseLuaFile = function(string_luaScriptPath)
    if(string_luaScriptPath == nil) then
        return false;
    end

    if(TLSE_FileExists(string_luaScriptPath)) then
        local file_luaScript = io.open(string_luaScriptPath, "rb");
        local string_luaScriptContents = file_luaScript:read("*all");
        file_luaScript:close();
    
        local luaScriptCompiled, luaScriptCompiledError = load(string_luaScriptContents);

        if(luaScriptCompiled) then
          local luaScriptExecution, luaScriptExecutionError = pcall(luaScriptCompiled)
    
          if(luaScriptExecution) then
            return true;
          end
        end
    end

    return false;
end

TLSE_JSON = require("TLSE_JSON.lua");

--Decodes a JSON file and returns the raw object. Useful for non-standard reads.
TLSE_DecodeJSONFile = function(fileName) 
    local theFile = (io.open)(fileName, "r") --Open the file
    if theFile == nil then
        return nil;
    end

    local content = theFile:read("*all") --Read the file's content
    theFile:close()
    
    return TLSE_JSON.decode(content) --Return the decoded file.
end

TLSE_EncodeJSONFile = function(content, path)
    local theFile = (io.open)(path .. ".json", "w")
    theFile:write(TLSE_JSON.encode(content));
    theFile:close();
    return true;
end