--[[
    This script contains functions for handling binary operations.

    Since the Walking Dead Definitive Edition uses only Lua 5.2, we unfortunately don't have access to the handy
    String.Pack or String.Unpack functions supported in 5.3 which make binary formatting incredibly easy.
    But... we are on an older version so we have to implement these binary formatting functions ourselves.
]]

--|||||||||||||||||||||||||||||||||||||||||||| SIGNED INTEGER 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| SIGNED INTEGER 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| SIGNED INTEGER 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--This is a signed 32-bit integer, which means you can store negative numbers.
--This packs a number value into 4 bytes.
--This will only work properly for whole numbers (numbers without decimals, for numbers with decimals use floats).
--Max Value: 2147483647 (inclusive)
--Min Value: -2147483648 (inclusive)

--Packs a lua number value into a 32-bit signed integer string (4 bytes).
--RETURNS: String
TLSE_Binary_PackInt32 = function(number_value)
    -- Extracting individual bytes of the number
    local number_byte1 = number_value % 256;
    local number_byte2 = math.floor(number_value / 256) % 256;
    local number_byte3 = math.floor(number_value / 65536) % 256;
    local number_byte4 = math.floor(number_value / 16777216) % 256;

    -- Constructing the binary string using the individual bytes
    return string.char(number_byte1, number_byte2, number_byte3, number_byte4);
end

--Unpacks a (4 byte) 32-bit signed integer string into a number.
--RETURNS: Number
TLSE_Binary_UnpackInt32 = function(string_binaryEncodedString)
    if(string_binaryEncodedString == nil) then
        print("[TLSE_Binary_UnpackInt32] ERROR! Failed to unpack Int32 from binary encoded string because the string was nil!");
        return 0;
    end

    -- Extracting individual bytes from the encoded string
    local number_byte1 = string_binaryEncodedString:byte(1);
    local number_byte2 = string_binaryEncodedString:byte(2);
    local number_byte3 = string_binaryEncodedString:byte(3);
    local number_byte4 = string_binaryEncodedString:byte(4);

    -- Calculating the integer value by combining the bytes
    local number_result = number_byte1 + number_byte2 * 256 + number_byte3 * 65536 + number_byte4 * 16777216;

    -- Check if the most significant bit is set (sign bit)
    if (number_result >= 2147483648) then
        number_result = number_result - 4294967296; -- Convert to signed value
    end

    return number_result;
end

--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--This is an unsigned 32-bit integer, which means you can't store negative values (but you can store really high positive values)
--This packs a number value into 4 bytes.
--This will only work properly for whole numbers (numbers without decimals, for numbers with decimals use floats).
--Max Value: 4294967295 (inclusive)
--Min Value: 0 (inclusive)

--Packs a lua number value into a 32-bit unsigned integer string (4 bytes).
--RETURNS: String
TLSE_Binary_PackUInt32 = function(number_value)
    -- Ensure the number is within the range of 0 to 4294967295 (2^32 - 1)
    number_value = number_value % 4294967296;

    -- Extracting individual bytes of the number
    local number_byte1 = number_value % 256;
    local number_byte2 = math.floor(number_value / 256) % 256;
    local number_byte3 = math.floor(number_value / 65536) % 256;
    local number_byte4 = math.floor(number_value / 16777216) % 256;

    -- Constructing the binary string using the individual bytes
    return string.char(number_byte1, number_byte2, number_byte3, number_byte4);
end

--Unpacks a (4 byte) 32-bit unsigned integer string into a number.
--RETURNS: Number
TLSE_Binary_UnpackUInt32 = function(string_binaryEncodedString)
    if(string_binaryEncodedString == nil) then
        print("[TLSE_Binary_UnpackUInt32] ERROR! Failed to unpack UInt32 from binary encoded string because the string was nil!");
        return 0;
    end

    -- Extracting individual bytes from the encoded string
    local number_byte1 = string_binaryEncodedString:byte(1);
    local number_byte2 = string_binaryEncodedString:byte(2);
    local number_byte3 = string_binaryEncodedString:byte(3);
    local number_byte4 = string_binaryEncodedString:byte(4);

    -- Calculating the integer value by combining the bytes
    return number_byte1 + number_byte2 * 256 + number_byte3 * 65536 + number_byte4 * 16777216;
end

--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 24-BIT (3 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 24-BIT (3 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 24-BIT (3 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--This is an unsigned 24-bit integer, which means you can't store negative values (but you can store really high positive values)
--This packs a number value into 3 bytes.
--This will only work properly for whole numbers (numbers without decimals, for numbers with decimals use floats).
--Max Value: 16777215 (inclusive)
--Min Value: 0 (inclusive)

--Packs a lua number value into a 24-bit unsigned integer string (3 bytes).
--RETURNS: String
TLSE_Binary_PackUInt24 = function(number_value)
    -- Ensure the number is within the range of 0 to 16777215 (2^24 - 1)
    number_value = number_value % 16777216;

    -- Extracting individual bytes of the number
    local number_byte1 = number_value % 256;
    local number_byte2 = math.floor(number_value / 256) % 256;
    local number_byte3 = math.floor(number_value / 65536) % 256;

    -- Constructing the binary string using the individual bytes
    return string.char(number_byte1, number_byte2, number_byte3);
end

--Unpacks a (3 byte) 24-bit unsigned integer string into a number.
--RETURNS: Number
TLSE_Binary_UnpackUInt24 = function(string_binaryEncodedString)
    if(string_binaryEncodedString == nil) then
        print("[TLSE_Binary_UnpackUInt24] ERROR! Failed to unpack UInt24 from binary encoded string because the string was nil!");
        return 0;
    end

    -- Extracting individual bytes from the encoded string
    local number_byte1 = string_binaryEncodedString:byte(1);
    local number_byte2 = string_binaryEncodedString:byte(2);
    local number_byte3 = string_binaryEncodedString:byte(3);

    -- Calculating the integer value by combining the bytes
    local result = number_byte1 + number_byte2 * 256 + number_byte3 * 65536;

    return result;
end

--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 16-BIT (2 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 16-BIT (2 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| UNSIGNED INTEGER 16-BIT (2 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--This is an unsigned 16-bit integer, which means you can't store negative values (but you can store really high positive values)
--This packs a number value into 2 bytes.
--This will only work properly for whole numbers (numbers without decimals, for numbers with decimals use floats).
--Max Value: 65536 (inclusive)
--Min Value: 0 (inclusive)

--Packs a lua number value into a 16-bit unsigned integer string (2 bytes).
--RETURNS: String
TLSE_Binary_PackUInt16 = function(number_value)
    -- Ensure the number is within the range of 0 to 65535 (2^16 - 1)
    number_value = number_value % 65536;

    -- Extracting individual bytes of the number
    local number_byte1 = number_value % 256;
    local number_byte2 = math.floor(number_value / 256) % 256;

    -- Constructing the binary string using the individual bytes
    return string.char(number_byte1, number_byte2);
end

--Unpacks a (2 byte) 16-bit unsigned integer string into a number.
--RETURNS: Number
TLSE_Binary_UnpackUInt16 = function(string_binaryEncodedString)
    if(string_binaryEncodedString == nil) then
        print("[TLSE_Binary_UnpackUInt16] ERROR! Failed to unpack UInt16 from binary encoded string because the string was nil!");
        return 0;
    end

    -- Extracting individual bytes from the encoded string
    local number_byte1 = string_binaryEncodedString:byte(1);
    local number_byte2 = string_binaryEncodedString:byte(2);

    -- Calculating the integer value by combining the bytes
    local result = number_byte1 + number_byte2 * 256;

    return result;
end

--|||||||||||||||||||||||||||||||||||||||||||| FLOAT 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| FLOAT 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| FLOAT 32-BIT (4 BYTES) ||||||||||||||||||||||||||||||||||||||||||||
--This is a 32-bit float, which means you can store decimal values (up to a point)
--This packs a decimal number value into 4 bytes.
--Max Value: 3.402823466E+38 (with 7 significant digits of precision)
--Min Value: 1.175494351E-38 (with 7 significant digits of precision)
--  NOTE: For these min/max values, in actuality their max values are roughly in line with a 32 bit integer and not way over it...
--  These large values really are to represent the combination of values that you can represent with decimals.
--  It's a different way to think about it, but to minimize confusion, the number "cap" is close to a 32 bit signed integer.

--Packs a lua number value into a 32-bit single precision number string (4 bytes).
--RETURNS: String
TLSE_Binary_PackFloat = function(number_value)
    -- Bitmask used for handling infinity and NaN values
    local number_infinityBitmask = 2^32 - 2^22;
    local string_binaryString = ""; -- Resulting binary string
    local number_significand, number_exponent, number_increment = 1, 1, 1; -- Variables for intermediate calculations
    
    if (number_value == number_value) then -- Checking if value is not NaN
        number_infinityBitmask = 2^31 - 2^23; -- Bitmask for positive infinity
        
        if (number_value < 0 or (number_value == 0 and 1/number_value < 0)) then
            number_value, number_infinityBitmask = -number_value, 2^32 - 2^23; -- Bitmask for negative infinity
        end
        
        if (number_value > 0.5 * 2^-149 and number_value < 2^128) then
            -- Rounding 64-bit double to 32-bit float
            number_exponent = math.floor(math.log(number_value) / math.log(2) + 0.5);
            number_exponent = (number_value < 2^number_exponent) and (number_exponent - 1) or number_exponent;

            local number_epsilon = 2^((number_exponent < -126) and -149 or (number_exponent - 23)); -- Smallest positive number

            number_value = number_value + 0.5 * number_epsilon;

            local number_remainder = number_value % number_epsilon;

            number_value = number_value - ((number_remainder == 0) and (number_value % (number_epsilon + number_epsilon)) or number_remainder);
        end
        
        -- Dumping 32-bit image of float
        if (number_value < 2^-149) then
            number_infinityBitmask = number_infinityBitmask - (2^31 - 2^23); -- Bitmask for denormalized numbers
        elseif (number_value <= 2^128 - 2^104) then

            if (number_exponent < -126) then
                number_exponent, number_increment = -126, 0; -- Exponent and increment for denormalized numbers
            end

            number_infinityBitmask = number_infinityBitmask + ((number_value / 2^number_exponent) + ((number_exponent - (-126)) * number_increment) - 255) * 2^23;
        end
    end
    
    -- Convert 32-bit image to little-endian binary string
    while (#string_binaryString < 4) do
        local byte = number_infinityBitmask % 256;
        string_binaryString = string_binaryString .. string.char(byte);
        number_infinityBitmask = (number_infinityBitmask - byte) / 256;
    end
    
    return string_binaryString;
end

--Unpacks a (4 bytes) 32-bit single precision number string into a lua number.
--RETURNS: Number
TLSE_Binary_UnpackFloat = function(string_binaryEncodedString)
    if(string_binaryEncodedString == nil) then
        print("[TLSE_Binary_UnpackFloat] ERROR! Failed to unpack Float from binary encoded string because the string was nil!");
        return 0;
    end

    local number_byte1 = string_binaryEncodedString:byte(1);
    local number_byte2 = string_binaryEncodedString:byte(2);
    local number_byte3 = string_binaryEncodedString:byte(3);
    local number_byte4 = string_binaryEncodedString:byte(4);

    -- Extracting the significand bytes and combining them
    local number_significand = (number_byte3 % 0x80) * 0x10000 + number_byte2 * 0x100 + number_byte1;

    -- Extracting the exponent byte and calculating the exponent value
    local number_exponent = (number_byte4 % 0x80) * 2 + math.floor(number_byte3 / 0x80) - 0x7F;

    -- Handling special case: if exponent is 0x7F, the value is 0
    if (number_exponent == 0x7F) then
        return 0;
    end

    -- Calculating the decoded float value
    return math.ldexp(math.ldexp(number_significand, -23) + 1, number_exponent) * (number_byte4 < 0x80 and 1 or -1);
end