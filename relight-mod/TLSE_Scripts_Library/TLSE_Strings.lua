--|||||||||||||||||||||||||||||||||||||||||||||| TYPES TO STRING ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| TYPES TO STRING ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| TYPES TO STRING ||||||||||||||||||||||||||||||||||||||||||||||

TLSE_TablePrint = function(tbl, indent)
    if not indent then 
        indent = 0;
    end
  
    local toprint = string.rep(" ", indent) .. "{\r\n";
    
    indent = indent + 2;
    
    for k, v in pairs(tbl) do
        toprint = toprint .. string.rep(" ", indent);
        
        --print key
        if (type(k) == "number") then
            toprint = toprint .. "[" .. k .. "] = ";
        elseif (type(k) == "string") then
            toprint = toprint  .. k ..  " = "   ;
        end
        
        --print value
        if (type(v) == "number") then
            toprint = toprint .. v .. ",\r\n";
        elseif (type(v) == "string") then
            toprint = toprint .. "\"" .. v .. "\",\r\n";
        elseif (type(v) == "table") then
            toprint = toprint .. TLSE_TablePrint(v, indent + 2) .. ",\r\n";
        else
            toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n";
        end
    end
    
    toprint = toprint .. string.rep(" ", indent - 2) .. "}";
    
    return toprint;
end

TLSE_VectorToString = function(vectorValue)
    local stringValue = "";
    
    local xValue = string.format("%.6f", vectorValue.x);
    local yValue = string.format("%.6f", vectorValue.y);
    local zValue = string.format("%.6f", vectorValue.z);

    stringValue = stringValue .. "x: " .. xValue;
    stringValue = stringValue .. " y: " .. yValue;
    stringValue = stringValue .. " z: " .. zValue;
    
    return stringValue;
end

TLSE_ColorToString = function(colorValue)
    local stringValue = "";
    
    local rValue = string.format("%.6f", colorValue.r);
    local gValue = string.format("%.6f", colorValue.g);
    local bValue = string.format("%.6f", colorValue.b);
    local aValue = string.format("%.6f", colorValue.a);
    
    stringValue = stringValue .. "r: " .. rValue;
    stringValue = stringValue .. " g: " .. gValue;
    stringValue = stringValue .. " b: " .. bValue;
    stringValue = stringValue .. " a: " .. aValue;
    
    return stringValue;
end

TLSE_ColorToRGBAColorToString = function(colorValue)
    local stringValue = "";
    
    local scalar = 255
    local rValue = string.format("%.0f", colorValue.r * scalar);
    local gValue = string.format("%.0f", colorValue.g * scalar);
    local bValue = string.format("%.0f", colorValue.b * scalar);
    local aValue = string.format("%.0f", colorValue.a * scalar);
    
    stringValue = stringValue .. "r: " .. rValue;
    stringValue = stringValue .. " g: " .. gValue;
    stringValue = stringValue .. " b: " .. bValue;
    stringValue = stringValue .. " a: " .. aValue;
    
    return stringValue;
end

--gets the key and if it's a symbol it removes the symbol: tag and quotations
TLSE_KeyToString = function(key)
    --convert the key to a string
    local keyAsString = tostring(key)
    
    --if the string contains symbol: then remove it, otherwise keep the string as is
    if (string.match)(keyAsString, "symbol: ") then
        keyAsString = (string.sub)(keyAsString, 9)
    else
        keyAsString = keyAsString
    end
    
    --remove any leftover quotations from the string
    keyAsString = keyAsString:gsub('"','')

    --return the final result
    return keyAsString
end

TLSE_TimeSecondsFormatted = function(number_timeSecondsValue)
    local number_hours = math.floor(number_timeSecondsValue / 3600);
    local number_minutes = math.floor((number_timeSecondsValue % 3600) / 60);
    local number_seconds = number_timeSecondsValue % 60;
    local number_milliseconds = math.floor((number_timeSecondsValue - math.floor(number_timeSecondsValue)) * 1000);

    return string.format("%02d:%02d:%02d:%03d", number_hours, number_minutes, number_seconds, number_milliseconds);
end