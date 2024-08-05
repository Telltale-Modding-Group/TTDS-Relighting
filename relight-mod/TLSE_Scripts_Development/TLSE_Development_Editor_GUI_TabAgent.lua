local label_inspectorInfoText = nil;

local boolField_visible = nil; --(boolean) Runtime: Visible
local boolField_groupVisible = nil; --(boolean) Group - Visible
local vector3field_agentLocalPosition = nil;
local vector3field_agentLocalRotation = nil;
local vector3field_agentWorldPosition = nil;
local vector3field_agentWorldRotation = nil;
local vector3field_agentRenderAxisScale = nil;
local numberField_agentRenderGlobalScale = nil;

local textButton_agentDelete = nil;
local textButton_agentDuplicate = nil;
local textButton_agentMoveToCamera = nil;
--local textButton_agentRename = nil;

local numberPropertyFieldAdjustmentValue = 1;

local ModifiyBooleanPropertyValueOnAgent = function(string_property)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, string_property)) then
            local number_originalValue = AgentGetProperty(agent_currentSelectedAgent, string_property);

            number_originalValue = not number_originalValue;

            AgentSetProperty(agent_currentSelectedAgent, string_property, number_originalValue);
        end
    end
end

local ModifiyValueOnAgent = function(string_property, number_component, number_adjustment)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, string_property)) then
            local vector_originalValue = AgentGetProperty(agent_currentSelectedAgent, string_property);

            if(number_component == 0) then
                vector_originalValue.x = vector_originalValue.x + number_adjustment;
            elseif(number_component == 1) then
                vector_originalValue.y = vector_originalValue.y + number_adjustment;
            elseif(number_component == 2) then
                vector_originalValue.z = vector_originalValue.z + number_adjustment;
            end

            AgentSetProperty(agent_currentSelectedAgent, string_property, vector_originalValue);
        end
    end
end

--LOCAL POSITION
local OnIncrease_LocalPositionX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].x = vector3field_agentLocalPosition["Value"].x + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnDecrease_LocalPositionX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].x = vector3field_agentLocalPosition["Value"].x - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnIncrease_LocalPositionY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].y = vector3field_agentLocalPosition["Value"].y + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnDecrease_LocalPositionY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].y = vector3field_agentLocalPosition["Value"].y - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnIncrease_LocalPositionZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].z = vector3field_agentLocalPosition["Value"].z + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnDecrease_LocalPositionZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].z = vector3field_agentLocalPosition["Value"].z - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

--LOCAL ROTATION
local OnIncrease_LocalRotationX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].x = vector3field_agentLocalRotation["Value"].x + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnDecrease_LocalRotationX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].x = vector3field_agentLocalRotation["Value"].x - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnIncrease_LocalRotationY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].y = vector3field_agentLocalRotation["Value"].y + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnDecrease_LocalRotationY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].y = vector3field_agentLocalRotation["Value"].y - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnIncrease_LocalRotationZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].z = vector3field_agentLocalRotation["Value"].z + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnDecrease_LocalRotationZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].z = vector3field_agentLocalRotation["Value"].z - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

--WORLD POSITION
local OnIncrease_WorldPositionX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].x = vector3field_agentWorldPosition["Value"].x + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnDecrease_WorldPositionX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].x = vector3field_agentWorldPosition["Value"].x - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnIncrease_WorldPositionY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].y = vector3field_agentWorldPosition["Value"].y + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnDecrease_WorldPositionY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].y = vector3field_agentWorldPosition["Value"].y - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnIncrease_WorldPositionZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].z = vector3field_agentWorldPosition["Value"].z + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnDecrease_WorldPositionZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].z = vector3field_agentWorldPosition["Value"].z - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

--WORLD ROTATION
local OnIncrease_WorldRotationX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].x = vector3field_agentWorldRotation["Value"].x + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnDecrease_WorldRotationX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].x = vector3field_agentWorldRotation["Value"].x - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnIncrease_WorldRotationY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].y = vector3field_agentWorldRotation["Value"].y + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnDecrease_WorldRotationY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].y = vector3field_agentWorldRotation["Value"].y - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnIncrease_WorldRotationZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].z = vector3field_agentWorldRotation["Value"].z + (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnDecrease_WorldRotationZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].z = vector3field_agentWorldRotation["Value"].z - (numberPropertyFieldAdjustmentValue * GetFrameTime());
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnIncrease_RenderGlobalScale = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end

    local number_originalValue = AgentGetProperty(agent_currentSelectedAgent, "Render Global Scale");
    number_originalValue = number_originalValue + (numberPropertyFieldAdjustmentValue * GetFrameTime());

    AgentSetProperty(agent_currentSelectedAgent, "Render Global Scale", number_originalValue);
end

local OnDecrease_RenderGlobalScale = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end

    local number_originalValue = AgentGetProperty(agent_currentSelectedAgent, "Render Global Scale");
    number_originalValue = number_originalValue - (numberPropertyFieldAdjustmentValue * GetFrameTime());

    AgentSetProperty(agent_currentSelectedAgent, "Render Global Scale", number_originalValue);
end

TLSE_TabAgent_OnIncrease_RenderAxisScale_X = function(textButton_button) ModifiyValueOnAgent("Render Axis Scale", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabAgent_OnIncrease_RenderAxisScale_Y = function(textButton_button) ModifiyValueOnAgent("Render Axis Scale", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabAgent_OnIncrease_RenderAxisScale_Z = function(textButton_button) ModifiyValueOnAgent("Render Axis Scale", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabAgent_OnDecrease_RenderAxisScale_X = function(textButton_button) ModifiyValueOnAgent("Render Axis Scale", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabAgent_OnDecrease_RenderAxisScale_Y = function(textButton_button) ModifiyValueOnAgent("Render Axis Scale", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabAgent_OnDecrease_RenderAxisScale_Z = function(textButton_button) ModifiyValueOnAgent("Render Axis Scale", 2, -numberPropertyFieldAdjustmentValue); end

TLSE_TabAgent_OnToggle_Visible = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Runtime: Visible"); end
TLSE_TabAgent_OnToggle_GroupVisible = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Group - Visible"); end

local OnPress_AgentDelete = function(textButton_button)
    local agentTable_attachments = AgentGetAttachments(agent_currentSelectedAgent);

    if(agentTable_attachments ~= nil) then
        local bool_preserveWorldPos = true;

        for index, agent_attachedAgent in pairs(agentTable_attachments) do
            AgentDetach(agent_attachedAgent, bool_preserveWorldPos);
        end
    end

    --NOTE TO SELF: Deleting the selected agent directly leads to an instant crash...
    local string_selectedAgentName = AgentGetName(agent_currentSelectedAgent);
    agent_currentSelectedAgent = nil;
    AgentDestroy(AgentFindInScene(string_selectedAgentName, TLSE_Development_SceneObject));
        
    table.insert(TLSE_Development_SceneAgentsDeletedNames, string_selectedAgentName);
end

local OnPress_AgentDuplicate = function(textButton_button)
    agent_currentSelectedAgent = TLSE_Development_Editor_AgentDuplicate(agent_currentSelectedAgent);
    --NOTE TO SELF: Tried to retain the currently selected agent position/rotation before duplication, and applying it after (with AgentSetWorldPos AND Scene: Location Info AND transform gizmo...) but to no sucess
end

local OnPress_AgentMoveToCamera = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end

    local agent_sceneCamera = SceneGetCamera(TLSE_Development_SceneObject);
    local vector_sceneCameraPosition = AgentGetWorldPos(agent_sceneCamera);
    local vector_sceneCameraRotation = AgentGetWorldRot(agent_sceneCamera);

    AgentSetWorldPos(agent_currentSelectedAgent, vector_sceneCameraPosition);
    AgentSetWorldRot(agent_currentSelectedAgent, vector_sceneCameraRotation);
end

OnTextFinish_AgentRename = function()
    --AgentSetName(agent_currentSelectedAgent, "testasfasf");
    
    if(TLSE_Development_TextBox_TextResult ~= nil) then
        AgentSetName(agent_currentSelectedAgent, TLSE_Development_TextBox_TextResult);
    end

    TLSE_Development_TextBox_Inputing = false;
    TLSE_Development_TextBox_InitalText = nil;
    TLSE_Development_TextBox_TextResult = nil;
    TLSE_Development_TextBox_OnFinish = nil;
end

local OnPress_AgentRename = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end

    TLSE_Development_TextBox_OnFinish = OnTextFinish_AgentRename();
    TLSE_Development_Editor_ShowTextBox(AgentGetName(agent_currentSelectedAgent), "Renaming Agent");
end

TLSE_Development_GUI_TabAgentInitalize = function()
    label_inspectorInfoText = TLSE_Development_Editor_GUI_CreateLabel("Inspector Info", Vector(0.685, 0.515, 0.0));

    boolField_visible = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Runtime: Visible", "Runtime: Visible", Vector(0.685, 0.525, 0.0), TLSE_TabAgent_OnToggle_Visible);
    boolField_groupVisible = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Group - Visible", "Group - Visible", Vector(0.685, 0.535, 0.0), TLSE_TabAgent_OnToggle_GroupVisible);

    vector3field_agentLocalPosition = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Local Position", "", Vector(0.685, 0.545, 0.0), true, OnIncrease_LocalPositionX, OnIncrease_LocalPositionY, OnIncrease_LocalPositionZ, OnDecrease_LocalPositionX, OnDecrease_LocalPositionY, OnDecrease_LocalPositionZ);
    vector3field_agentLocalRotation = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Local Rotation", "", Vector(0.685, 0.575, 0.0), true, OnIncrease_LocalRotationX, OnIncrease_LocalRotationY, OnIncrease_LocalRotationZ, OnDecrease_LocalRotationX, OnDecrease_LocalRotationY, OnDecrease_LocalRotationZ);
    vector3field_agentWorldPosition = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "World Position", "", Vector(0.685, 0.605, 0.0), true, OnIncrease_WorldPositionX, OnIncrease_WorldPositionY, OnIncrease_WorldPositionZ, OnDecrease_WorldPositionX, OnDecrease_WorldPositionY, OnDecrease_WorldPositionZ);
    vector3field_agentWorldRotation = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "World Rotation", "", Vector(0.685, 0.635, 0.0), true, OnIncrease_WorldRotationX, OnIncrease_WorldRotationY, OnIncrease_WorldRotationZ, OnDecrease_WorldRotationX, OnDecrease_WorldRotationY, OnDecrease_WorldRotationZ);
    numberField_agentRenderGlobalScale = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Global Scale", Vector(0.685, 0.665, 0.0), true, OnIncrease_RenderGlobalScale, OnDecrease_RenderGlobalScale);
    vector3field_agentRenderAxisScale = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Render Axis Scale", "Render Axis Scale", Vector(0.685, 0.675, 0.0), true, TLSE_TabAgent_OnIncrease_RenderAxisScale_X, TLSE_TabAgent_OnIncrease_RenderAxisScale_Y, TLSE_TabAgent_OnIncrease_RenderAxisScale_Z, TLSE_TabAgent_OnDecrease_RenderAxisScale_X, TLSE_TabAgent_OnDecrease_RenderAxisScale_Y, TLSE_TabAgent_OnDecrease_RenderAxisScale_Z);

    textButton_agentMoveToCamera = TLSE_Development_Editor_GUI_CreateTextButton("[MOVE AGENT TO CAMERA]", false, Vector(0.685, 0.715, 0.0), OnPress_AgentMoveToCamera, nil);
    textButton_agentDelete = TLSE_Development_Editor_GUI_CreateTextButton("[DELETE AGENT]", false, Vector(0.685, 0.735, 0.0), OnPress_AgentDelete, nil);
    textButton_agentDuplicate = TLSE_Development_Editor_GUI_CreateTextButton("[DUPLICATE AGENT]", false, Vector(0.685, 0.755, 0.0), OnPress_AgentDuplicate, nil);
    --textButton_agentRename = TLSE_Development_Editor_GUI_CreateTextButton("[RENAME AGENT]", false, Vector(0.685, 0.765, 0.0), OnPress_AgentRename, nil);
end

TLSE_Development_GUI_TabAgentUpdate = function()
    label_inspectorInfoText["Visible"] = TLSE_Development_GUI_AgentTabActive;
    boolField_visible["Visible"] = TLSE_Development_GUI_AgentTabActive;
    boolField_groupVisible["Visible"] = TLSE_Development_GUI_AgentTabActive;
    vector3field_agentLocalPosition["Visible"] = TLSE_Development_GUI_AgentTabActive;
    vector3field_agentLocalRotation["Visible"] = TLSE_Development_GUI_AgentTabActive;
    vector3field_agentWorldPosition["Visible"] = TLSE_Development_GUI_AgentTabActive;
    vector3field_agentWorldRotation["Visible"] = TLSE_Development_GUI_AgentTabActive;
    numberField_agentRenderGlobalScale["Visible"] = TLSE_Development_GUI_AgentTabActive;
    vector3field_agentRenderAxisScale["Visible"] = TLSE_Development_GUI_AgentTabActive;
    textButton_agentDelete["Visible"] = TLSE_Development_GUI_AgentTabActive;
    textButton_agentDuplicate["Visible"] = TLSE_Development_GUI_AgentTabActive;
    --textButton_agentRename["Visible"] = TLSE_Development_GUI_AgentTabActive;
    textButton_agentMoveToCamera["Visible"] = TLSE_Development_GUI_AgentTabActive;

    if(TLSE_Development_GUI_AgentTabActive == false) then
        return
    end

    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local string_inspectorMainText = "";
    local bool_inspectingObject = agent_currentSelectedAgent ~= nil;

    if(bool_inspectingObject) then
        string_inspectorMainText = string_inspectorMainText .. "Agent Name: " .. AgentGetName(agent_currentSelectedAgent);
        string_inspectorMainText = string_inspectorMainText .. "\n"; --new line

        vector3field_agentLocalPosition["Value"] = AgentGetPos(agent_currentSelectedAgent);
        vector3field_agentLocalRotation["Value"] = AgentGetRot(agent_currentSelectedAgent);
        vector3field_agentWorldPosition["Value"] = AgentGetWorldPos(agent_currentSelectedAgent);
        vector3field_agentWorldRotation["Value"] = AgentGetWorldRot(agent_currentSelectedAgent);

        boolField_visible["ReferenceAgent"] = agent_currentSelectedAgent;
        boolField_groupVisible["ReferenceAgent"] = agent_currentSelectedAgent;
        vector3field_agentRenderAxisScale["ReferenceAgent"] = agent_currentSelectedAgent;
        numberField_agentRenderGlobalScale["ReferenceAgent"] = agent_currentSelectedAgent;

        if(TLSE_Development_Editor_Input_DeleteClicked) then
            OnPress_AgentDelete(nil);
        end

        if(TLSE_Development_Editor_Input_DuplicateActionEnter) then
            OnPress_AgentDuplicate(nil);
        end
    end

    boolField_visible["Visible"] = bool_inspectingObject;
    boolField_groupVisible["Visible"] = bool_inspectingObject;
    vector3field_agentLocalPosition["Visible"] = bool_inspectingObject;
    vector3field_agentLocalRotation["Visible"] = bool_inspectingObject;
    vector3field_agentWorldPosition["Visible"] = bool_inspectingObject;
    vector3field_agentWorldRotation["Visible"] = bool_inspectingObject;
    numberField_agentRenderGlobalScale["Visible"] = bool_inspectingObject;
    vector3field_agentRenderAxisScale["Visible"] = bool_inspectingObject;
    textButton_agentDelete["Visible"] = bool_inspectingObject;
    textButton_agentDuplicate["Visible"] = bool_inspectingObject;
    --textButton_agentRename["Visible"] = bool_inspectingObject;
    textButton_agentMoveToCamera["Visible"] = bool_inspectingObject;

    label_inspectorInfoText["Text"] = string_inspectorMainText;
end