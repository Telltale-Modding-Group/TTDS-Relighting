--checks if a file exists
TLSE_FileExists = function(filePathRelativeToGameExe)
    return FileExists(filePathRelativeToGameExe);

    --[[
    NOTE: Kept in here for legacy purposes
    local f = io.open(filePathRelativeToGameExe, "r");
    
    if f ~= nil then
        io.close(f);
        return true;
    else
        return false;
    end
    ]]
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