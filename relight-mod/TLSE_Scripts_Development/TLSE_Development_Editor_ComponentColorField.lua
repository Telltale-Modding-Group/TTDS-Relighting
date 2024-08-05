--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI COLOR PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI COLOR PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI COLOR PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_ColorPropertyFieldsCount = 1;
TLSE_Development_Editor_GUI_ColorPropertyFields = {};

TLSE_Development_Editor_GUI_CreateColorPropertyField = function(agent_referenceAgent, string_name, string_property, vector_screenPosition, bool_canHold, function_onIncreaseR, function_onIncreaseG, function_onIncreaseB, function_onIncreaseA, function_onDecreaseR, function_onDecreaseG, function_onDecreaseB, function_onDecreaseA)
    local colorPropertyField_newField = 
    {
        ReferenceAgent = agent_referenceAgent,
        ReferenceAgentProperty = string_property,
        Name = string_name,
        Value = nil,
        RedNumber = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (R)", vector_screenPosition, bool_canHold, function_onIncreaseR, function_onDecreaseR),
        GreenNumber = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (G)", vector_screenPosition, bool_canHold, function_onIncreaseG, function_onDecreaseG),
        BlueNumber = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (B)", vector_screenPosition, bool_canHold, function_onIncreaseB, function_onDecreaseB),
        AlphaNumber = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (A)", vector_screenPosition, bool_canHold, function_onIncreaseA, function_onDecreaseA),
        Visible = true,
        ScreenPosition = vector_screenPosition,
        CanHold = bool_canHold
    };

    table.insert(TLSE_Development_Editor_GUI_ColorPropertyFields, colorPropertyField_newField);
    TLSE_Development_Editor_GUI_ColorPropertyFieldsCount = TLSE_Development_Editor_GUI_ColorPropertyFieldsCount + 1;

    return colorPropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateColorPropertyField = function(colorPropertyField_field)
    if(colorPropertyField_field == nil) then
        return
    end

    local bool_visibility = colorPropertyField_field["Visible"];

    colorPropertyField_field["RedNumber"]["Visible"] = bool_visibility;
    colorPropertyField_field["GreenNumber"]["Visible"] = bool_visibility;
    colorPropertyField_field["BlueNumber"]["Visible"] = bool_visibility;
    colorPropertyField_field["AlphaNumber"]["Visible"] = bool_visibility;

    if(bool_visibility == false) then
        return
    end

    local vector_offsetGUI = Vector(0, 0, 0);
    local vector_screenPosition = colorPropertyField_field["ScreenPosition"];
    
    --GREEN
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    colorPropertyField_field["GreenNumber"]["ScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --BLUE
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    colorPropertyField_field["BlueNumber"]["ScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --ALPHA
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    colorPropertyField_field["AlphaNumber"]["ScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    if(colorPropertyField_field["ReferenceAgent"] ~= nil) then
        if(AgentHasProperty(colorPropertyField_field["ReferenceAgent"], colorPropertyField_field["ReferenceAgentProperty"])) then
            colorPropertyField_field["Value"] = AgentGetProperty(colorPropertyField_field["ReferenceAgent"], colorPropertyField_field["ReferenceAgentProperty"]);

            colorPropertyField_field["RedNumber"]["Value"] = colorPropertyField_field["Value"].r;
            colorPropertyField_field["GreenNumber"]["Value"] = colorPropertyField_field["Value"].g;
            colorPropertyField_field["BlueNumber"]["Value"] = colorPropertyField_field["Value"].b;
            colorPropertyField_field["AlphaNumber"]["Value"] = colorPropertyField_field["Value"].a;
        end

        AgentSetProperty(colorPropertyField_field["ReferenceAgent"], colorPropertyField_field["ReferenceAgentProperty"], colorPropertyField_field["Value"]);
    end
end