--[[

This script contains functions designed to help you manage colors.
Including artistic functions for controlling saturation and brightness.

]]

TLSE_ColorLerp = function(color_a, color_b, number_transition)
    local number_newColorR = TLSE_NumberLerp(color_a.r, color_b.r, number_transition);
    local number_newColorG = TLSE_NumberLerp(color_a.g, color_b.g, number_transition);
    local number_newColorB = TLSE_NumberLerp(color_a.b, color_b.b, number_transition);
    local number_newColorA = TLSE_NumberLerp(color_a.a, color_b.a, number_transition);

    return Color(number_newColorR, number_newColorG, number_newColorB, number_newColorA);
end

TLSE_ColorClamp01 = function(color)
    local number_newColorR = TLSE_NumberClamp(color.r, 0, 1);
    local number_newColorG = TLSE_NumberClamp(color.g, 0, 1);
    local number_newColorB = TLSE_NumberClamp(color.b, 0, 1);
    local number_newColorA = TLSE_NumberClamp(color.a, 0, 1);

    return Color(number_newColorR, number_newColorG, number_newColorB, number_newColorA);
end

--[[
This is a "wrapper" around telltale's normal built-in Color type.
The difference however is that these will take in values from (0 - 255).
These values then get scaled back down to (0.0 - 1.0)

Parameters
    number_r: RED 0 - 255
    number_g: GREEN 0 - 255
    number_b: BLUE 0 - 255
    number_a: ALPHA 0 - 255

Return Types
    Color()
]]
TLSE_RGBAColor = function(number_r, number_g, number_b, number_a)
    local number_scalar  = 1 / 255;
    
    local number_scaledR = number_r * number_scalar;
    local number_scaledG = number_g * number_scalar;
    local number_scaledB = number_b * number_scalar;
    local number_scaledA = number_a * number_scalar;
    
    return Color(number_scaledR, number_scaledG, number_scaledB, number_scaledA);
end

--[[
This desaturates a Color object.

Parameters
    color_input: Color()
    number_amount: A decimal value (0 is nothing, 1 is total desaturation, -1 is saturation)

Return Types
    Color()
]]
TLSE_DesaturateRGBColor = function(color_input, number_amount)
    local number_lumanince = 0.3 * color_input.r + 0.6 * color_input.g + 0.1 * color_input.b;
    
    color_input.r = color_input.r + number_amount * (number_lumanince - color_input.r);
    color_input.g = color_input.g + number_amount * (number_lumanince - color_input.g);
    color_input.b = color_input.b + number_amount * (number_lumanince - color_input.b);
    
    return color_input;
end

--[[
This multiplies a Color object, which depending on the value can brighten or darken the color.
NOTE: This will NOT affect the alpha channel.

Parameters
    color_input: Color()
    number_amount: A decimal value (1 is default, anything higher is brighter, anything lower is darker)

Return Types
    Color()
]]
TLSE_MultiplyRGBColor = function(color_input, number_amount)
    local number_multiplier = 1.0 * number_amount;
    
    color_input.r = color_input.r * number_multiplier;
    color_input.g = color_input.g * number_multiplier;
    color_input.b = color_input.b * number_multiplier;
    
    return color_input;
end

--[[
This multiplies a Color object, which depending on the value can brighten or darken the color.
NOTE: This will affect the alpha channel.

Parameters
    color_input: Color()
    number_amount: A decimal value (1 is default, anything higher is brighter, anything lower is darker)

Return Types
    Color()
]]
TLSE_MultiplyRGBAColor = function(color_input, number_amount)
    local number_multiplier = 1.0 * number_amount;
    
    color_input.r = color_input.r * number_multiplier;
    color_input.g = color_input.g * number_multiplier;
    color_input.b = color_input.b * number_multiplier;
    color_input.a = color_input.a * number_multiplier;
    
    return color_input;
end