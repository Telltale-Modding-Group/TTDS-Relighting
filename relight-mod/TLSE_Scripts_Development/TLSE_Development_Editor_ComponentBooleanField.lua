--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI BOOLEAN PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI BOOLEAN PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI BOOLEAN PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_BooleanPropertyFieldsCount = 1;
TLSE_Development_Editor_GUI_BooleanPropertyFields = {};

TLSE_Development_Editor_GUI_CreateBooleanPropertyField = function(agent_referenceAgent, string_agentProperty, string_name, vector_screenPosition, function_onClick)
    local booleanPropertyField_newField = 
    {
        ReferenceAgent = agent_referenceAgent,
        ReferenceAgentProperty = string_agentProperty,
        NameLabel = TLSE_Development_Editor_GUI_CreateLabel(string_name, vector_screenPosition),
        ValueLabel = TLSE_Development_Editor_GUI_CreateTextButton("nil", false, vector_screenPosition, function_onClick, nil),
        Value = nil,
        Visible = true,
        ScreenPosition = vector_screenPosition
    };

    table.insert(TLSE_Development_Editor_GUI_BooleanPropertyFields, booleanPropertyField_newField);
    TLSE_Development_Editor_GUI_BooleanPropertyFieldsCount = TLSE_Development_Editor_GUI_BooleanPropertyFieldsCount + 1;

    return booleanPropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateBooleanPropertyField = function(booleanPropertyField_field)
    if(booleanPropertyField_field == nil) then
        return
    end

    local bool_visibility = booleanPropertyField_field["Visible"];

    booleanPropertyField_field["NameLabel"]["Visible"] = bool_visibility;
    booleanPropertyField_field["ValueLabel"]["Visible"] = bool_visibility;

    if(bool_visibility == false) then
        return
    end

    local vector_screenPosition = booleanPropertyField_field["ScreenPosition"];
    local vector_contentsScreenSize = TLSE_TextUI_GetTextScreenSize(booleanPropertyField_field["NameLabel"]["TextAgent"]);

    local number_xOffset = (vector_contentsScreenSize.x * 2.0) + TLSE_Development_Editor_GUI_PropertyFieldHorizontalSeparation;
    booleanPropertyField_field["ValueLabel"]["ScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);
    
    if(booleanPropertyField_field["ReferenceAgent"] ~= nil) then
        if(AgentHasProperty(booleanPropertyField_field["ReferenceAgent"], booleanPropertyField_field["ReferenceAgentProperty"])) then
            local bool_agentPropertyValue = AgentGetProperty(booleanPropertyField_field["ReferenceAgent"], booleanPropertyField_field["ReferenceAgentProperty"]);
            booleanPropertyField_field["Value"] = bool_agentPropertyValue;
        else
            booleanPropertyField_field["Value"] = nil;
        end
    end

    booleanPropertyField_field["ValueLabel"]["Text"] = tostring(booleanPropertyField_field["Value"]);
end