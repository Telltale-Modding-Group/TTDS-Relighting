--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI BOOLEAN PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI BOOLEAN PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI BOOLEAN PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_BooleanPropertyFieldsCount = 1;
TLSE_Development_Editor_GUI_BooleanPropertyFields = {};

TLSE_Development_Editor_GUI_CreateBooleanPropertyField = function(agent_referenceAgent, string_agentProperty, string_name, vector_screenPosition, function_onClick)
    local booleanPropertyField_newField = 
    {
        BooleanPropertyFieldAgent = agent_referenceAgent,
        BooleanPropertyFieldAgentProperty = string_agentProperty,
        BooleanPropertyFieldNameDisplay = TLSE_Development_Editor_GUI_CreateLabel(string_name, vector_screenPosition),
        BooleanPropertyFieldValueDisplay = TLSE_Development_Editor_GUI_CreateTextButton("nil", false, vector_screenPosition, function_onClick, nil),
        BooleanPropertyFieldValue = nil,
        BooleanPropertyFieldVisible = true,
        BooleanPropertyFieldScreenPosition = vector_screenPosition
    };

    table.insert(TLSE_Development_Editor_GUI_BooleanPropertyFields, booleanPropertyField_newField);
    TLSE_Development_Editor_GUI_BooleanPropertyFieldsCount = TLSE_Development_Editor_GUI_BooleanPropertyFieldsCount + 1;

    return booleanPropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateBooleanPropertyField = function(booleanPropertyField_field)
    if(booleanPropertyField_field == nil) then
        return
    end

    local bool_visibility = booleanPropertyField_field["BooleanPropertyFieldVisible"];

    booleanPropertyField_field["BooleanPropertyFieldNameDisplay"]["LabelVisible"] = bool_visibility;
    booleanPropertyField_field["BooleanPropertyFieldValueDisplay"]["TextButtonVisible"] = bool_visibility;

    if(bool_visibility == false) then
        return
    end

    local vector_screenPosition = booleanPropertyField_field["BooleanPropertyFieldScreenPosition"];
    local vector_contentsScreenSize = TLSE_TextUI_GetTextScreenSize(booleanPropertyField_field["BooleanPropertyFieldNameDisplay"]["LabelAgentReference"]);

    local number_xOffset = (vector_contentsScreenSize.x * 2.0) + TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation;
    booleanPropertyField_field["BooleanPropertyFieldValueDisplay"]["TextButtonScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);
    
    if(booleanPropertyField_field["BooleanPropertyFieldAgent"] ~= nil) then
        if(AgentHasProperty(booleanPropertyField_field["BooleanPropertyFieldAgent"], booleanPropertyField_field["BooleanPropertyFieldAgentProperty"])) then
            local bool_agentPropertyValue = AgentGetProperty(booleanPropertyField_field["BooleanPropertyFieldAgent"], booleanPropertyField_field["BooleanPropertyFieldAgentProperty"]);
            booleanPropertyField_field["BooleanPropertyFieldValue"] = bool_agentPropertyValue;
        else
            booleanPropertyField_field["BooleanPropertyFieldValue"] = nil;
        end
    end

    booleanPropertyField_field["BooleanPropertyFieldValueDisplay"]["TextButtonText"] = tostring(booleanPropertyField_field["BooleanPropertyFieldValue"]);
end