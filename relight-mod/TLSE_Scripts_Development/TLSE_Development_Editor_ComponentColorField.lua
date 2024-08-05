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

    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) RED ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) RED ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) RED ||||||||||||||||||||||||||||||||||||||||||||||||

    if(function_onIncreaseR == nil) then
        local function_internalOnIncreaseR = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].r = parameterData["Value"].r + TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            colorPropertyField_newField["RedNumber"]["Increase"]["OnHold"] = function_internalOnIncreaseR;
        else
            colorPropertyField_newField["RedNumber"]["Increase"]["OnPress"] = function_internalOnIncreaseR;
        end
    end

    if(function_onDecreaseR == nil) then
        local function_internalOnDecreaseR = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].r = parameterData["Value"].r - TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            colorPropertyField_newField["RedNumber"]["Decrease"]["OnHold"] = function_internalOnDecreaseR;
        else
            colorPropertyField_newField["RedNumber"]["Decrease"]["OnPress"] = function_internalOnDecreaseR;
        end
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) GREEN ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) GREEN ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) GREEN ||||||||||||||||||||||||||||||||||||||||||||||||    

    if(function_onIncreaseG == nil) then
        local function_internalOnIncreaseG = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].g = parameterData["Value"].g + TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            colorPropertyField_newField["GreenNumber"]["Increase"]["OnHold"] = function_internalOnIncreaseG;
        else
            colorPropertyField_newField["GreenNumber"]["Increase"]["OnPress"] = function_internalOnIncreaseG;
        end
    end

    if(function_onDecreaseG == nil) then
        local function_internalOnDecreaseG = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].g = parameterData["Value"].g - TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            colorPropertyField_newField["GreenNumber"]["Decrease"]["OnHold"] = function_internalOnDecreaseG;
        else
            colorPropertyField_newField["GreenNumber"]["Decrease"]["OnPress"] = function_internalOnDecreaseG;
        end
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) BLUE ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) BLUE ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) BLUE ||||||||||||||||||||||||||||||||||||||||||||||||    

    if(function_onIncreaseB == nil) then
        local function_internalOnIncreaseB = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].b = parameterData["Value"].b + TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            colorPropertyField_newField["BlueNumber"]["Increase"]["OnHold"] = function_internalOnIncreaseB;
        else
            colorPropertyField_newField["BlueNumber"]["Increase"]["OnPress"] = function_internalOnIncreaseB;
        end
    end

    if(function_onDecreaseB == nil) then
        local function_internalOnDecreaseB = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].b = parameterData["Value"].b - TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            colorPropertyField_newField["BlueNumber"]["Decrease"]["OnHold"] = function_internalOnDecreaseB;
        else
            colorPropertyField_newField["BlueNumber"]["Decrease"]["OnPress"] = function_internalOnDecreaseB;
        end
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) ALPHA ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) ALPHA ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) ALPHA ||||||||||||||||||||||||||||||||||||||||||||||||    

    if(function_onIncreaseA == nil) then
        local function_internalOnIncreaseA = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].a = parameterData["Value"].a + TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            colorPropertyField_newField["AlphaNumber"]["Increase"]["OnHold"] = function_internalOnIncreaseA;
        else
            colorPropertyField_newField["AlphaNumber"]["Increase"]["OnPress"] = function_internalOnIncreaseA;
        end
    end

    if(function_onDecreaseA == nil) then
        local function_internalOnDecreaseA = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].a = parameterData["Value"].a - TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            colorPropertyField_newField["AlphaNumber"]["Decrease"]["OnHold"] = function_internalOnDecreaseA;
        else
            colorPropertyField_newField["AlphaNumber"]["Decrease"]["OnPress"] = function_internalOnDecreaseA;
        end
    end

    colorPropertyField_newField["RedNumber"]["Decrease"]["ParameterData"] = colorPropertyField_newField;
    colorPropertyField_newField["RedNumber"]["Increase"]["ParameterData"] = colorPropertyField_newField;
    colorPropertyField_newField["GreenNumber"]["Decrease"]["ParameterData"] = colorPropertyField_newField;
    colorPropertyField_newField["GreenNumber"]["Increase"]["ParameterData"] = colorPropertyField_newField;
    colorPropertyField_newField["BlueNumber"]["Decrease"]["ParameterData"] = colorPropertyField_newField;
    colorPropertyField_newField["BlueNumber"]["Increase"]["ParameterData"] = colorPropertyField_newField;
    colorPropertyField_newField["AlphaNumber"]["Decrease"]["ParameterData"] = colorPropertyField_newField;
    colorPropertyField_newField["AlphaNumber"]["Increase"]["ParameterData"] = colorPropertyField_newField;

    table.insert(TLSE_Development_Editor_GUI_ColorPropertyFields, colorPropertyField_newField);
    TLSE_Development_Editor_GUI_ColorPropertyFieldsCount = TLSE_Development_Editor_GUI_ColorPropertyFieldsCount + 1;

    return colorPropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateColorPropertyField = function(colorPropertyField_field)
    if(colorPropertyField_field == nil) then return end

    local bool_visibility = colorPropertyField_field["Visible"];

    colorPropertyField_field["RedNumber"]["Visible"] = bool_visibility;
    colorPropertyField_field["GreenNumber"]["Visible"] = bool_visibility;
    colorPropertyField_field["BlueNumber"]["Visible"] = bool_visibility;
    colorPropertyField_field["AlphaNumber"]["Visible"] = bool_visibility;

    if(bool_visibility == false) then return end

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