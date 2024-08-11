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
    local string_vector = "";
    
    local string_xNumber = string.format("%.6f", vectorValue.x);
    local string_yNumber = string.format("%.6f", vectorValue.y);
    local string_zNumber = string.format("%.6f", vectorValue.z);

    string_vector = string_vector .. "x: " .. string_xNumber;
    string_vector = string_vector .. " y: " .. string_yNumber;
    string_vector = string_vector .. " z: " .. string_zNumber;
    
    return string_vector;
end

TLSE_ColorToString = function(colorValue)
    local string_color = "";
    
    local string_redNumber = string.format("%.6f", colorValue.r);
    local string_greenNumber = string.format("%.6f", colorValue.g);
    local string_blueNumber = string.format("%.6f", colorValue.b);
    local string_alphaNumber = string.format("%.6f", colorValue.a);
    
    string_color = string_color .. "r: " .. string_redNumber;
    string_color = string_color .. " g: " .. string_greenNumber;
    string_color = string_color .. " b: " .. string_blueNumber;
    string_color = string_color .. " a: " .. string_alphaNumber;
    
    return string_color;
end

TLSE_ColorToRGBAColorToString = function(colorValue)
    local string_color = "";
    
    local number_8bitScale = 255;
    local string_redNumber = string.format("%.0f", colorValue.r * number_8bitScale);
    local string_greenNumber = string.format("%.0f", colorValue.g * number_8bitScale);
    local string_blueNumber = string.format("%.0f", colorValue.b * number_8bitScale);
    local string_alphaNumber = string.format("%.0f", colorValue.a * number_8bitScale);
    
    string_color = string_color .. "r: " .. string_redNumber;
    string_color = string_color .. " g: " .. string_greenNumber;
    string_color = string_color .. " b: " .. string_blueNumber;
    string_color = string_color .. " a: " .. string_alphaNumber;
    
    return string_color;
end

--gets the key and if it's a symbol it removes the symbol: tag and quotations
TLSE_KeyToString = function(key)
    local string_key = tostring(key);
    
    --if the string contains symbol: then remove it, otherwise keep the string as is
    if (string.match)(string_key, "symbol: ") then
        string_key = (string.sub)(string_key, 9);
    else
        string_key = string_key;
    end
    
    --remove any leftover quotations from the string
    string_key = string_key:gsub('"','');

    return string_key;
end

TLSE_TimeSecondsFormatted = function(number_timeSecondsValue)
    local number_hours = math.floor(number_timeSecondsValue / 3600);
    local number_minutes = math.floor((number_timeSecondsValue % 3600) / 60);
    local number_seconds = number_timeSecondsValue % 60;
    local number_milliseconds = math.floor((number_timeSecondsValue - math.floor(number_timeSecondsValue)) * 1000);

    return string.format("%02d:%02d:%02d:%03d", number_hours, number_minutes, number_seconds, number_milliseconds);
end

TLSE_ContainerToString = function(containerInterface)
    local string_result = "ContainerInterface";
    local number_containerElements = ContainerGetNumElements(containerInterface);
    
    string_result = string_result .. " (" .. tostring(number_containerElements) .. ") \n";
    string_result = string_result .. "{ \n";

    for index = 0, number_containerElements - 1 do 
        local containerElement_element = ContainerGetElement(containerInterface, index);
        local string_containerElementName = ContainerGetElementName(containerInterface, index);
        local string_containerElementType = TypeName(containerElement_element);

        string_result = string_result .."    Container Element " .. tostring(index) .. " Name: " .. "(" .. TypeName(string_containerElementName) .. ") " .. tostring(string_containerElementName) .. "\n";
        string_result = string_result .."    Container Element " .. tostring(index) .. " Value: " .. "(" .. string_containerElementType .. ") " .. tostring(containerElement_element) .. "\n";
    end

    string_result = string_result .. "} \n";

    return string_result;
end