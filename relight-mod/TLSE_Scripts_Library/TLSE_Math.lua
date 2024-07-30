--references
--Unity3d Vector3 C# - https://github.com/Unity-Technologies/UnityCsReference/blob/master/Runtime/Export/Math/Vector3.cs
--Unity3d Mathf C# - https://github.com/Unity-Technologies/UnityCsReference/blob/master/Runtime/Export/Math/Mathf.cs

--|||||||||||||||||||||||||||||||||||||||||||| MATH VARIABLES ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH VARIABLES ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH VARIABLES ||||||||||||||||||||||||||||||||||||||||||||

--PI constant
TLSE_Math_PI = math.pi;

--Degrees-to-radians conversion constant (RO).
TLSE_Math_Deg2Rad = TLSE_Math_PI * 2 / 360;

--Radians-to-degrees conversion constant (RO).
TLSE_Math_Rad2Deg = 1 / TLSE_Math_Deg2Rad;

TLSE_Math_MaxValue = 65535; --NOTE: can go higher but lua uses doubles, for most purposes this shoud suffice...

--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - NUMBER ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - NUMBER ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - NUMBER ||||||||||||||||||||||||||||||||||||||||||||

TLSE_NumberClamp = function(number_value, number_minimum, number_maximum)
    if (number_value > number_maximum) then
        return number_maximum;
    elseif (number_value < number_minimum) then
        return number_minimum;
    else
        return number_value;
    end
end

TLSE_NumberRepeat = function(number_value, number_length)
    return TLSE_NumberClamp(number_value - math.floor(number_value / number_length) * number_length, 0.0, number_length);
end

TLSE_NumberPingPong = function(number_value, number_length)
    number_value = TLSE_NumberRepeat(number_value, number_length * 2);
    return number_length - math.abs(number_value - number_length);
end

TLSE_NumberLerp = function(number_valueA, number_valueB, number_transition)
    return number_valueA + (number_valueB - number_valueA) * number_transition;
end

TLSE_NumberSmoothstep = function(number_valueA, number_valueB, number_transition)
    return number_valueA + (number_valueB - number_valueA) * ( (-2 * math.pow(number_transition, 3)) + (3 * math.pow(number_transition, 2)) );
end

TLSE_NumberSign = function(number_value)
    if (number_value >= 0) then
        return 1;
    else
        return -1;
    end
end

TLSE_RandomIntegerValue = function(number_min, number_max)
    local number_randomValue = math.random(number_min, number_max);

    return number_randomValue;
end

TLSE_RandomFloatValue = function(number_min, number_max, number_decimals)
    local number_randomValue = math.random(number_min * number_decimals, number_max * number_decimals);
    local number_randomValueAdjusted = number_randomValue / number_decimals;

    return number_randomValueAdjusted;
end

TLSE_NumberRound = function(number_value, number_decimals)
    local mult = 10^(number_decimals or 0);
    
    return math.floor(number_value * mult + 0.5) / mult;
end

TLSE_NumberModulo = function(number_valueA, number_valueB)
    return number_valueA - math.floor(number_valueA/number_valueB) * number_valueB;
end