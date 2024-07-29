--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI VECTOR3 PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI VECTOR3 PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI VECTOR3 PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_Vector3PropertyFieldsCount = 1;
TLSE_Development_Editor_GUI_Vector3PropertyFields = {};

TLSE_Development_Editor_GUI_CreateVector3PropertyField = function(agent_referenceAgent, string_name, string_property, vector_screenPosition, bool_canHold, function_onIncreaseX, function_onIncreaseY, function_onIncreaseZ, function_onDecreaseX, function_onDecreaseY, function_onDecreaseZ)
    local vector3PropertyField_newField = 
    {
        Vector3PropertyFieldAgent = agent_referenceAgent,
        Vector3PropertyAgentProperty = string_property,
        Vector3PropertyName = string_name,
        Vector3PropertyValue = nil,
        Vector3FieldX = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (X)", vector_screenPosition, bool_canHold, function_onIncreaseX, function_onDecreaseX),
        Vector3FieldY = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (Y)", vector_screenPosition, bool_canHold, function_onIncreaseY, function_onDecreaseY),
        Vector3FieldZ = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (Z)", vector_screenPosition, bool_canHold, function_onIncreaseZ, function_onDecreaseZ),
        Vector3FieldVisible = true,
        Vector3FieldScreenPosition = vector_screenPosition,
        Vector3FieldCanHold = bool_canHold
    };

    table.insert(TLSE_Development_Editor_GUI_Vector3PropertyFields, vector3PropertyField_newField);
    TLSE_Development_Editor_GUI_Vector3PropertyFieldsCount = TLSE_Development_Editor_GUI_Vector3PropertyFieldsCount + 1;

    return vector3PropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateVector3PropertyField = function(vector3PropertyField_field)
    if(vector3PropertyField_field == nil) then
        return
    end

    local bool_visibility = vector3PropertyField_field["Vector3FieldVisible"];

    vector3PropertyField_field["Vector3FieldX"]["NumberPropertyFieldVisible"] = bool_visibility;
    vector3PropertyField_field["Vector3FieldY"]["NumberPropertyFieldVisible"] = bool_visibility;
    vector3PropertyField_field["Vector3FieldZ"]["NumberPropertyFieldVisible"] = bool_visibility;

    if(bool_visibility == false) then
        return
    end

    local vector_offsetGUI = Vector(0, 0, 0);
    local vector_screenPosition = vector3PropertyField_field["Vector3FieldScreenPosition"];

    --Y
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    vector3PropertyField_field["Vector3FieldY"]["NumberPropertyFieldScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --Z
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    vector3PropertyField_field["Vector3FieldZ"]["NumberPropertyFieldScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    if(vector3PropertyField_field["Vector3PropertyFieldAgent"] ~= nil) then
        if(AgentHasProperty(vector3PropertyField_field["Vector3PropertyFieldAgent"], vector3PropertyField_field["Vector3PropertyAgentProperty"])) then
            vector3PropertyField_field["Vector3PropertyValue"] = AgentGetProperty(vector3PropertyField_field["Vector3PropertyFieldAgent"], vector3PropertyField_field["Vector3PropertyAgentProperty"]);
        end

        AgentSetProperty(vector3PropertyField_field["Vector3PropertyFieldAgent"], vector3PropertyField_field["Vector3PropertyAgentProperty"], vector3PropertyField_field["Vector3PropertyValue"]);
    end

    if(vector3PropertyField_field["Vector3PropertyValue"] ~= nil) then
        vector3PropertyField_field["Vector3FieldX"]["NumberPropertyFieldValue"] = vector3PropertyField_field["Vector3PropertyValue"].x;
        vector3PropertyField_field["Vector3FieldY"]["NumberPropertyFieldValue"] = vector3PropertyField_field["Vector3PropertyValue"].y;
        vector3PropertyField_field["Vector3FieldZ"]["NumberPropertyFieldValue"] = vector3PropertyField_field["Vector3PropertyValue"].z;
    else
        vector3PropertyField_field["Vector3FieldX"]["NumberPropertyFieldValue"] = nil;
        vector3PropertyField_field["Vector3FieldY"]["NumberPropertyFieldValue"] = nil;
        vector3PropertyField_field["Vector3FieldZ"]["NumberPropertyFieldValue"] = nil;
    end
end