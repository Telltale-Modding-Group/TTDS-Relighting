--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI COLOR PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI COLOR PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI COLOR PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_ColorPropertyFieldsCount = 1;
TLSE_Development_Editor_GUI_ColorPropertyFields = {};

TLSE_Development_Editor_GUI_CreateColorPropertyField = function(agent_referenceAgent, string_name, string_property, vector_screenPosition, bool_canHold, function_onIncreaseR, function_onIncreaseG, function_onIncreaseB, function_onIncreaseA, function_onDecreaseR, function_onDecreaseG, function_onDecreaseB, function_onDecreaseA)
    local colorPropertyField_newField = 
    {
        ColorPropertyFieldAgent = agent_referenceAgent,
        ColorPropertyFieldAgentProperty = string_property,
        ColorPropertyName = string_name,
        ColorPropertyValue = nil,
        ColorFieldRed = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (R)", vector_screenPosition, bool_canHold, function_onIncreaseR, function_onDecreaseR),
        ColorFieldGreen = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (G)", vector_screenPosition, bool_canHold, function_onIncreaseG, function_onDecreaseG),
        ColorFieldBlue = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (B)", vector_screenPosition, bool_canHold, function_onIncreaseB, function_onDecreaseB),
        ColorFieldAlpha = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (A)", vector_screenPosition, bool_canHold, function_onIncreaseA, function_onDecreaseA),
        ColorFieldVisible = true,
        ColorFieldScreenPosition = vector_screenPosition,
        ColorFieldCanHold = bool_canHold
    };

    table.insert(TLSE_Development_Editor_GUI_ColorPropertyFields, colorPropertyField_newField);
    TLSE_Development_Editor_GUI_ColorPropertyFieldsCount = TLSE_Development_Editor_GUI_ColorPropertyFieldsCount + 1;

    return colorPropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateColorPropertyField = function(colorPropertyField_field)
    if(colorPropertyField_field == nil) then
        return
    end

    local bool_visibility = colorPropertyField_field["ColorFieldVisible"];

    colorPropertyField_field["ColorFieldRed"]["NumberPropertyFieldVisible"] = bool_visibility;
    colorPropertyField_field["ColorFieldGreen"]["NumberPropertyFieldVisible"] = bool_visibility;
    colorPropertyField_field["ColorFieldBlue"]["NumberPropertyFieldVisible"] = bool_visibility;
    colorPropertyField_field["ColorFieldAlpha"]["NumberPropertyFieldVisible"] = bool_visibility;

    if(bool_visibility == false) then
        return
    end

    local vector_offsetGUI = Vector(0, 0, 0);
    local vector_screenPosition = colorPropertyField_field["ColorFieldScreenPosition"];
    
    --GREEN
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    colorPropertyField_field["ColorFieldGreen"]["NumberPropertyFieldScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --BLUE
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    colorPropertyField_field["ColorFieldBlue"]["NumberPropertyFieldScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --ALPHA
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    colorPropertyField_field["ColorFieldAlpha"]["NumberPropertyFieldScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    if(colorPropertyField_field["ColorPropertyFieldAgent"] ~= nil) then
        if(AgentHasProperty(colorPropertyField_field["ColorPropertyFieldAgent"], colorPropertyField_field["ColorPropertyFieldAgentProperty"])) then
            colorPropertyField_field["ColorPropertyValue"] = AgentGetProperty(colorPropertyField_field["ColorPropertyFieldAgent"], colorPropertyField_field["ColorPropertyFieldAgentProperty"]);

            colorPropertyField_field["ColorFieldRed"]["NumberPropertyFieldValue"] = colorPropertyField_field["ColorPropertyValue"].r;
            colorPropertyField_field["ColorFieldGreen"]["NumberPropertyFieldValue"] = colorPropertyField_field["ColorPropertyValue"].g;
            colorPropertyField_field["ColorFieldBlue"]["NumberPropertyFieldValue"] = colorPropertyField_field["ColorPropertyValue"].b;
            colorPropertyField_field["ColorFieldAlpha"]["NumberPropertyFieldValue"] = colorPropertyField_field["ColorPropertyValue"].a;
        end

        AgentSetProperty(colorPropertyField_field["ColorPropertyFieldAgent"], colorPropertyField_field["ColorPropertyFieldAgentProperty"], colorPropertyField_field["ColorPropertyValue"]);
    end
end