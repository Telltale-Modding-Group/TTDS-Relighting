TLSE_RGBColor = function(number_r, number_g, number_b)
    local number_scalar  = 1 / 255;
    
    local number_scaledR = number_r * number_scalar;
    local number_scaledG = number_g * number_scalar;
    local number_scaledB = number_b * number_scalar;

    return Color(number_scaledR, number_scaledG, number_scaledB, 1.0);
end

TLSE_RGBAColor = function(number_r, number_g, number_b, number_a)
    local number_scalar  = 1 / 255;
    
    local number_scaledR = number_r * number_scalar;
    local number_scaledG = number_g * number_scalar;
    local number_scaledB = number_b * number_scalar;
    local number_scaledA = number_a * number_scalar;
    
    return Color(number_scaledR, number_scaledG, number_scaledB, number_scaledA);
end

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

TLSE_DesaturateRGBColor = function(color_input, number_amount)
    local number_lumanince = 0.3 * color_input.r + 0.6 * color_input.g + 0.1 * color_input.b;
    
    color_input.r = color_input.r + number_amount * (number_lumanince - color_input.r);
    color_input.g = color_input.g + number_amount * (number_lumanince - color_input.g);
    color_input.b = color_input.b + number_amount * (number_lumanince - color_input.b);
    
    return color_input;
end

TLSE_MultiplyRGBColor = function(color_input, number_amount)
    color_input.r = color_input.r * number_amount;
    color_input.g = color_input.g * number_amount;
    color_input.b = color_input.b * number_amount;
    
    return color_input;
end

TLSE_MultiplyRGBAColor = function(color_input, number_amount)
    color_input.r = color_input.r * number_amount;
    color_input.g = color_input.g * number_amount;
    color_input.b = color_input.b * number_amount;
    color_input.a = color_input.a * number_amount;
    
    return color_input;
end

TLSE_MultiplyColorWithColorRGB = function(color_input, color_toMultiply)
    color_input.r = color_input.r * color_toMultiply.r;
    color_input.g = color_input.g * color_toMultiply.g;
    color_input.b = color_input.b * color_toMultiply.b;
    
    return color_input;
end

TLSE_MultiplyColorWithColorRGBA = function(color_input, color_toMultiply)
    color_input.r = color_input.r * color_toMultiply.r;
    color_input.g = color_input.g * color_toMultiply.g;
    color_input.b = color_input.b * color_toMultiply.b;
    color_input.a = color_input.a * color_toMultiply.a;
    
    return color_input;
end