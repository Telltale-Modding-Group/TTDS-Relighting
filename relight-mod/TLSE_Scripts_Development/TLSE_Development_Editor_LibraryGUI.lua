--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI STYLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI STYLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI STYLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--Here we define the many parameters that are used to help standardize the GUI elements that we will be creating and messing with.
local number_textScale = 0.35;
local number_propertyFieldHorizontalSeparation = 0.0025;
local number_propertyFieldVerticalSeparation = 0.01;

local color_textButtonHover = Color(1, 1, 1, 1);
local color_textButtonBackgroundHover = Color(1, 1, 1, 0.25);

local color_textButtonPress = Color(0.25, 0.25, 0.25, 1);
local color_textButtonBackgroundPress = Color(0, 0, 0, 1);

local color_textButtonSelected = Color(0.75, 0.85, 1, 1);
local color_textButtonBackgroundSelected = Color(0, 0, 0, 0.75);

local color_textButtonDefault = Color(0.75, 0.75, 0.75, 1);
local color_textButtonBackgroundDefault = Color(0, 0, 0, 0.25);

local color_labelDefault = Color(1, 1, 1, 1);

TLSE_Development_Editor_GUI_TextButtonHover = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_textButtonHover);
    AgentSetProperty(agent_textAgent, "Text Background", true);
    AgentSetProperty(agent_textAgent, "Text Background Color", color_textButtonBackgroundHover);
end

TLSE_Development_Editor_GUI_TextButtonPress = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_textButtonPress);
    AgentSetProperty(agent_textAgent, "Text Background", true);
    AgentSetProperty(agent_textAgent, "Text Background Color", color_textButtonBackgroundPress);
end

TLSE_Development_Editor_GUI_TextButtonSelected = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_textButtonSelected);
    AgentSetProperty(agent_textAgent, "Text Background", true);
    AgentSetProperty(agent_textAgent, "Text Background Color", color_textButtonBackgroundSelected);
end

TLSE_Development_Editor_GUI_TextButtonDefault = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_textButtonDefault);
    AgentSetProperty(agent_textAgent, "Text Background", true);
    AgentSetProperty(agent_textAgent, "Text Background Color", color_textButtonBackgroundDefault);
end

TLSE_Development_Editor_GUI_LabelDefault = function(agent_textAgent)
    TextSetColor(agent_textAgent, color_labelDefault);
    AgentSetProperty(agent_textAgent, "Text Background", false);
end

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI LABELS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI LABELS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI LABELS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--GUI Feature for doing basic text "labels" which have no functionality.

TLSE_Development_Editor_GUI_LabelsCount = 1;
TLSE_Development_Editor_GUI_Labels = {};

TLSE_Development_Editor_GUI_CreateLabel = function(string_textContents, vector_screenPosition)
    local string_agentName = "TLSE_Development_Label" .. tostring(TLSE_Development_Editor_GUI_LabelsCount);

    local label_newLabel = 
    {
        LabelAgentReference = TLSE_TextUI_CreateTextAgent(string_agentName, string_textContents, Vector(0, 0, 0), 0, 0),
        LabelAgentName = string_agentName,
        LabelText = string_textContents,
        LabelVisible = true,
        LabelScreenPosition = vector_screenPosition
    };

    TextSetScale(label_newLabel["LabelAgentReference"], number_textScale);

    TLSE_Development_Editor_GUI_LabelDefault(label_newLabel["LabelAgentReference"]);

    table.insert(TLSE_Development_Editor_GUI_Labels, label_newLabel);
    TLSE_Development_Editor_GUI_LabelsCount = TLSE_Development_Editor_GUI_LabelsCount + 1;

    return label_newLabel;
end

TLSE_Development_Editor_GUI_UpdateLabel = function(label_text)
    if(label_text == nil) then
        return
    end

    local agent_label = label_text["LabelAgentReference"];

    if(label_text["LabelVisible"] == false) then
        AgentSetProperty(agent_label, "Runtime: Visible", false);
        return
    else
        AgentSetProperty(agent_label, "Runtime: Visible", true);
    end

    AgentSetWorldPosFromLogicalScreenPos(agent_label, label_text["LabelScreenPosition"]);

    TextSet(agent_label, label_text["LabelText"]);

    TLSE_Development_Editor_GUI_LabelDefault(agent_label);
end

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI TEXT BUTTONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_TextButtonsCount = 1;
TLSE_Development_Editor_GUI_TextButtons = {};

TLSE_Development_Editor_GUI_CreateTextButton = function(string_textContents, bool_isSelectable, vector_screenPosition, function_onPress, function_onHold)
    local string_agentName = "TLSE_Development_TextButton" .. tostring(TLSE_Development_Editor_GUI_TextButtonsCount);
    
    local textButton_newTextButton = 
    {
        TextButtonAgentReference = TLSE_TextUI_CreateTextAgent(string_agentName, string_textContents, Vector(0, 0, 0), 0, 0),
        TextButtonAgentName = string_agentName,
        TextButtonText = string_textContents,
        TextButtonOnPress = function_onPress,
        TextButtonOnHold = function_onHold,
        TextButtonSelected = false,
        TextButtonIsSelectable = bool_isSelectable,
        TextButtonVisible = true,
        TextButtonScreenPosition = vector_screenPosition
    };

    TextSetScale(textButton_newTextButton["TextButtonAgentReference"], number_textScale);

    TLSE_Development_Editor_GUI_TextButtonDefault(textButton_newTextButton["TextButtonAgentReference"]);

    table.insert(TLSE_Development_Editor_GUI_TextButtons, textButton_newTextButton);
    TLSE_Development_Editor_GUI_TextButtonsCount = TLSE_Development_Editor_GUI_TextButtonsCount + 1;

    return textButton_newTextButton;
end

TLSE_Development_Editor_GUI_UpdateTextButton = function(textButton_button)
    if(textButton_button == nil) then
        return
    end

    local bool_selected = textButton_button["TextButtonSelected"];
    local agent_button = textButton_button["TextButtonAgentReference"];

    if(textButton_button["TextButtonVisible"] == false) then
        AgentSetProperty(agent_button, "Runtime: Visible", false);
        return
    else
        AgentSetProperty(agent_button, "Runtime: Visible", true);
    end

    AgentSetWorldPosFromLogicalScreenPos(agent_button, textButton_button["TextButtonScreenPosition"]);

    TextSet(agent_button, textButton_button["TextButtonText"]);

    if(TLSE_TextUI_IsCursorOverTextAgent(agent_button) and TLSE_Development_Freecam_Frozen) then
        TLSE_Development_Editor_GUI_TextButtonHover(agent_button);

        if(TLSE_Development_Editor_Input_LeftMouseClicked) then
            if(textButton_button["TextButtonIsSelectable"]) then
                textButton_button["TextButtonSelected"] = not bool_selected;
            end

            TLSE_Development_Editor_GUI_TextButtonPress(agent_button);

            if(textButton_button["TextButtonOnPress"] ~= nil) then
                textButton_button["TextButtonOnPress"](textButton_button);
            end
        end

        if(TLSE_Development_Editor_Input_LeftMouseHold) then
            TLSE_Development_Editor_GUI_TextButtonPress(agent_button);

            if(textButton_button["TextButtonOnHold"] ~= nil) then
                textButton_button["TextButtonOnHold"](textButton_button);
            end
        end
    else
        if(bool_selected) then
            TLSE_Development_Editor_GUI_TextButtonSelected(agent_button);
        else
            TLSE_Development_Editor_GUI_TextButtonDefault(agent_button);
        end
    end
end

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

    number_xOffset = number_xOffset + (vector_contentsScreenSize.x * 2.0) + number_propertyFieldHorizontalSeparation;
    numberPropertyField_field["NumberPropertyFieldDecrease"]["TextButtonScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    number_xOffset = number_xOffset + (vector_decreaseScreenSize.x * 2.0) + number_propertyFieldHorizontalSeparation;
    numberPropertyField_field["NumberPropertyFieldIncrease"]["TextButtonScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    number_xOffset = number_xOffset + (vector_increaseScreenSize.x * 2.0) + number_propertyFieldHorizontalSeparation;
    numberPropertyField_field["NumberPropertyFieldValueDisplay"]["LabelScreenPosition"] = VectorAdd(Vector(number_xOffset, 0, 0), vector_screenPosition);

    if(numberPropertyField_field["NumberPropertyFieldAgent"] ~= nil) then
        if(AgentHasProperty(numberPropertyField_field["NumberPropertyFieldAgent"], numberPropertyField_field["NumberPropertyFieldAgentProperty"])) then
            local number_agentPropertyValue = AgentGetProperty(numberPropertyField_field["NumberPropertyFieldAgent"], numberPropertyField_field["NumberPropertyFieldAgentProperty"]);
            numberPropertyField_field["NumberPropertyFieldValue"] = number_agentPropertyValue;
        end
    end

    numberPropertyField_field["NumberPropertyFieldValueDisplay"]["LabelText"] = tostring(numberPropertyField_field["NumberPropertyFieldValue"]);
end

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

    local number_xOffset = (vector_contentsScreenSize.x * 2.0) + number_propertyFieldHorizontalSeparation;
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
    vector_offsetGUI.y = vector_offsetGUI.y + number_propertyFieldVerticalSeparation;
    colorPropertyField_field["ColorFieldGreen"]["NumberPropertyFieldScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --BLUE
    vector_offsetGUI.y = vector_offsetGUI.y + number_propertyFieldVerticalSeparation;
    colorPropertyField_field["ColorFieldBlue"]["NumberPropertyFieldScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --ALPHA
    vector_offsetGUI.y = vector_offsetGUI.y + number_propertyFieldVerticalSeparation;
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
    vector_offsetGUI.y = vector_offsetGUI.y + number_propertyFieldVerticalSeparation;
    vector3PropertyField_field["Vector3FieldY"]["NumberPropertyFieldScreenPosition"] = VectorAdd(vector_offsetGUI, vector_screenPosition);

    --Z
    vector_offsetGUI.y = vector_offsetGUI.y + number_propertyFieldVerticalSeparation;
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

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GUI UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_GUI_Update = function()
    for key, value in pairs(TLSE_Development_Editor_GUI_Labels) do
        TLSE_Development_Editor_GUI_UpdateLabel(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_TextButtons) do
        TLSE_Development_Editor_GUI_UpdateTextButton(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_NumberPropertyFields) do
        TLSE_Development_Editor_GUI_UpdateNumberPropertyField(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_BooleanPropertyFields) do
        TLSE_Development_Editor_GUI_UpdateBooleanPropertyField(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_ColorPropertyFields) do
        TLSE_Development_Editor_GUI_UpdateColorPropertyField(value);
    end

    for key, value in pairs(TLSE_Development_Editor_GUI_Vector3PropertyFields) do
        TLSE_Development_Editor_GUI_UpdateVector3PropertyField(value);
    end
end