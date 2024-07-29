--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI NUMBER PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI NUMBER PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI NUMBER PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_NumberPropertyFieldsCount = 1;
TLSE_Development_Editor_GUI_NumberPropertyFields = {};

TLSE_Development_Editor_GUI_CreateNumberPropertyField = function(agent_referenceAgent, string_property, vector_screenPosition, bool_canHold, function_onIncrease, function_onDecrease)
    local numberPropertyField_newField = 
    {
        NumberPropertyFieldAgent = agent_referenceAgent,
        NumberPropertyFieldAgentProperty = string_property,
        NumberPropertyFieldNameDisplay = TLSE_Development_Editor_GUI_CreateLabel(string_property, vector_screenPosition),
        NumberPropertyFieldValueDisplay = TLSE_Development_Editor_GUI_CreateLabel("nil", vector_screenPosition),
        NumberPropertyFieldValue = nil,
        NumberPropertyFieldDecrease = nil,
        NumberPropertyFieldIncrease = nil,
        NumberPropertyFieldVisible = true,
        NumberPropertyFieldScreenPosition = vector_screenPosition,
        NumberPropertyFieldCanHold = bool_canHold
    };

    if(bool_canHold) then
        numberPropertyField_newField["NumberPropertyFieldDecrease"] = TLSE_Development_Editor_GUI_CreateTextButton("(-)", false, vector_screenPosition, nil, function_onDecrease);
        numberPropertyField_newField["NumberPropertyFieldIncrease"] = TLSE_Development_Editor_GUI_CreateTextButton("(+)", false, vector_screenPosition, nil, function_onIncrease);
    else
        numberPropertyField_newField["NumberPropertyFieldDecrease"] = TLSE_Development_Editor_GUI_CreateTextButton("(-)", false, vector_screenPosition, function_onDecrease, nil);
        numberPropertyField_newField["NumberPropertyFieldIncrease"] = TLSE_Development_Editor_GUI_CreateTextButton("(+)", false, vector_screenPosition, function_onIncrease, nil);
    end

    table.insert(TLSE_Development_Editor_GUI_NumberPropertyFields, numberPropertyField_newField);
    TLSE_Development_Editor_GUI_NumberPropertyFieldsCount = TLSE_Development_Editor_GUI_NumberPropertyFieldsCount + 1;

    return numberPropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateNumberPropertyField = function(numberPropertyField_field)
    if(numberPropertyField_field == nil) then
        return
    end

    local bool_visibility = numberPropertyField_field["NumberPropertyFieldVisible"];

    numberPropertyField_field["NumberPropertyFieldNameDisplay"]["LabelVisible"] = bool_visibility;
    numberPropertyField_field["NumberPropertyFieldValueDisplay"]["LabelVisible"] = bool_visibility;
    numberPropertyField_field["NumberPropertyFieldIncrease"]["TextButtonVisible"] = bool_visibility;
    numberPropertyField_field["NumberPropertyFieldDecrease"]["TextButtonVisible"] = bool_visibility;

    if(bool_visibility == false) then
        return
    end

    local number_xOffset = 0;
    local vector_screenPosition = numberPropertyField_field["NumberPropertyFieldScreenPosition"];
    local vector_contentsScreenSize = TLSE_TextUI_GetTextScreenSize(numberPropertyField_field["NumberPropertyFieldNameDisplay"].LabelAgentReference);
    local vector_decreaseScreenSize = TLSE_TextUI_GetTextScreenSize(numberPropertyField_field["NumberPropertyFieldDecrease"].TextButtonAgentReference);
    local vector_increaseScreenSize = TLSE_TextUI_GetTextScreenSize(numberPropertyField_field["NumberPropertyFieldIncrease"].TextButtonAgentReference);

    numberPropertyField_field["NumberPropertyFieldNameDisplay"]["LabelScreenPosition"] = vector_screenPosition;

    number_xOffset = number_xOffset + (vector_contentsScreenSize.x * 2.0) + TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation;
    numberPropertyField_field["NumberPropertyFieldDecrease"]["TextButtonScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    number_xOffset = number_xOffset + (vector_decreaseScreenSize.x * 2.0) + TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation;
    numberPropertyField_field["NumberPropertyFieldIncrease"]["TextButtonScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    number_xOffset = number_xOffset + (vector_increaseScreenSize.x * 2.0) + TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation;
    numberPropertyField_field["NumberPropertyFieldValueDisplay"]["LabelScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    if(numberPropertyField_field["NumberPropertyFieldAgent"] ~= nil) then
        if(AgentHasProperty(numberPropertyField_field["NumberPropertyFieldAgent"], numberPropertyField_field["NumberPropertyFieldAgentProperty"])) then
            local number_agentPropertyValue = AgentGetProperty(numberPropertyField_field["NumberPropertyFieldAgent"], numberPropertyField_field["NumberPropertyFieldAgentProperty"]);
            numberPropertyField_field["NumberPropertyFieldValue"] = number_agentPropertyValue;
        end
    end

    numberPropertyField_field["NumberPropertyFieldValueDisplay"]["LabelText"] = tostring(numberPropertyField_field["NumberPropertyFieldValue"]);
end