--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI VECTOR3 PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI VECTOR3 PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI VECTOR3 PROPERTY FIELD ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_Vector3PropertyFieldsCount = 1;
TLSE_Development_Editor_GUI_Vector3PropertyFields = {};

TLSE_Development_Editor_GUI_CreateVector3PropertyField = function(agent_referenceAgent, string_name, string_property, vector_screenPosition, bool_canHold, function_onIncreaseX, function_onIncreaseY, function_onIncreaseZ, function_onDecreaseX, function_onDecreaseY, function_onDecreaseZ)
    local vector3PropertyField_newField = 
    {
        ReferenceAgent = agent_referenceAgent,
        ReferenceAgentProperty = string_property,
        Name = string_name,
        Value = nil,
        NumberX = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (X)", vector_screenPosition, bool_canHold, function_onIncreaseX, function_onDecreaseX),
        NumberY = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (Y)", vector_screenPosition, bool_canHold, function_onIncreaseY, function_onDecreaseY),
        NumberZ = TLSE_Development_Editor_GUI_CreateNumberPropertyField(agent_referenceAgent, string_name .. " (Z)", vector_screenPosition, bool_canHold, function_onIncreaseZ, function_onDecreaseZ),
        Visible = true,
        ScreenPosition = vector_screenPosition,
        CanHold = bool_canHold
    };

    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) X ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) X ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) X ||||||||||||||||||||||||||||||||||||||||||||||||

    if(function_onIncreaseX == nil) then
        local function_internalOnIncreaseX = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].x = parameterData["Value"].x + TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            vector3PropertyField_newField["NumberX"]["Increase"]["OnHold"] = function_internalOnIncreaseX;
        else
            vector3PropertyField_newField["NumberX"]["Increase"]["OnPress"] = function_internalOnIncreaseX;
        end
    end

    if(function_onDecreaseX == nil) then
        local function_internalOnDecreaseX = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].x = parameterData["Value"].x - TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            vector3PropertyField_newField["NumberX"]["Decrease"]["OnHold"] = function_internalOnDecreaseX;
        else
            vector3PropertyField_newField["NumberX"]["Decrease"]["OnPress"] = function_internalOnDecreaseX;
        end
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) Y ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) Y ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) Y ||||||||||||||||||||||||||||||||||||||||||||||||

    if(function_onIncreaseY == nil) then
        local function_internalOnIncreaseY = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].y = parameterData["Value"].y + TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            vector3PropertyField_newField["NumberY"]["Increase"]["OnHold"] = function_internalOnIncreaseY;
        else
            vector3PropertyField_newField["NumberY"]["Increase"]["OnPress"] = function_internalOnIncreaseY;
        end
    end

    if(function_onDecreaseY == nil) then
        local function_internalOnDecreaseY = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].y = parameterData["Value"].y - TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            vector3PropertyField_newField["NumberY"]["Decrease"]["OnHold"] = function_internalOnDecreaseY;
        else
            vector3PropertyField_newField["NumberY"]["Decrease"]["OnPress"] = function_internalOnDecreaseY;
        end
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) Z ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) Z ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| (INTERNAL FUNCTIONS) Z ||||||||||||||||||||||||||||||||||||||||||||||||

    if(function_onIncreaseZ == nil) then
        local function_internalOnIncreaseZ = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].z = parameterData["Value"].z + TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            vector3PropertyField_newField["NumberZ"]["Increase"]["OnHold"] = function_internalOnIncreaseZ;
        else
            vector3PropertyField_newField["NumberZ"]["Increase"]["OnPress"] = function_internalOnIncreaseZ;
        end
    end

    if(function_onDecreaseZ == nil) then
        local function_internalOnDecreaseZ = function(parameterData)
            if(parameterData ~= nil) then
                if(parameterData["ReferenceAgent"] ~= nil and parameterData["ReferenceAgentProperty"] ~= nil) then
                    if(AgentHasProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"])) then
                        parameterData["Value"] = AgentGetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"]);
                        parameterData["Value"].z = parameterData["Value"].z - TLSE_Development_GUI_PropertyAdjustmentValue;
                        AgentSetProperty(parameterData["ReferenceAgent"], parameterData["ReferenceAgentProperty"], parameterData["Value"]);
                    end
                end
            end
        end

        if(bool_canHold) then
            vector3PropertyField_newField["NumberZ"]["Decrease"]["OnHold"] = function_internalOnDecreaseZ;
        else
            vector3PropertyField_newField["NumberZ"]["Decrease"]["OnPress"] = function_internalOnDecreaseZ;
        end
    end

    vector3PropertyField_newField["NumberX"]["Decrease"]["ParameterData"] = vector3PropertyField_newField;
    vector3PropertyField_newField["NumberX"]["Increase"]["ParameterData"] = vector3PropertyField_newField;
    vector3PropertyField_newField["NumberY"]["Decrease"]["ParameterData"] = vector3PropertyField_newField;
    vector3PropertyField_newField["NumberY"]["Increase"]["ParameterData"] = vector3PropertyField_newField;
    vector3PropertyField_newField["NumberZ"]["Decrease"]["ParameterData"] = vector3PropertyField_newField;
    vector3PropertyField_newField["NumberZ"]["Increase"]["ParameterData"] = vector3PropertyField_newField;

    table.insert(TLSE_Development_Editor_GUI_Vector3PropertyFields, vector3PropertyField_newField);
    TLSE_Development_Editor_GUI_Vector3PropertyFieldsCount = TLSE_Development_Editor_GUI_Vector3PropertyFieldsCount + 1;

    return vector3PropertyField_newField;
end

TLSE_Development_Editor_GUI_UpdateVector3PropertyField = function(vector3PropertyField_field)
    if(vector3PropertyField_field == nil) then return end

    local bool_visibility = vector3PropertyField_field["Visible"];

    vector3PropertyField_field["NumberX"]["Visible"] = bool_visibility;
    vector3PropertyField_field["NumberY"]["Visible"] = bool_visibility;
    vector3PropertyField_field["NumberZ"]["Visible"] = bool_visibility;

    if(bool_visibility == false) then return end

    local vector_offsetGUI = Vector(0, 0, 0);
    local vector_screenPosition = vector3PropertyField_field["ScreenPosition"];

    --Y
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    vector3PropertyField_field["NumberY"]["ScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --Z
    vector_offsetGUI.y = vector_offsetGUI.y + TLSE_Development_Editor_GUI_PropertyFieldVerticalSeparation;
    vector3PropertyField_field["NumberZ"]["ScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    if(vector3PropertyField_field["ReferenceAgent"] ~= nil) then
        if(AgentHasProperty(vector3PropertyField_field["ReferenceAgent"], vector3PropertyField_field["ReferenceAgentProperty"])) then
            vector3PropertyField_field["Value"] = AgentGetProperty(vector3PropertyField_field["ReferenceAgent"], vector3PropertyField_field["ReferenceAgentProperty"]);
        end

        AgentSetProperty(vector3PropertyField_field["ReferenceAgent"], vector3PropertyField_field["ReferenceAgentProperty"], vector3PropertyField_field["Value"]);
    end

    if(vector3PropertyField_field["Value"] ~= nil) then
        vector3PropertyField_field["NumberX"]["Value"] = vector3PropertyField_field["Value"].x;
        vector3PropertyField_field["NumberY"]["Value"] = vector3PropertyField_field["Value"].y;
        vector3PropertyField_field["NumberZ"]["Value"] = vector3PropertyField_field["Value"].z;
    else
        vector3PropertyField_field["NumberX"]["Value"] = nil;
        vector3PropertyField_field["NumberY"]["Value"] = nil;
        vector3PropertyField_field["NumberZ"]["Value"] = nil;
    end
end