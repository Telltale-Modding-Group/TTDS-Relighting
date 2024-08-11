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
local textButton_agentZeroRotation = nil;
local textButton_agentZeroPosition = nil;

--LOCAL POSITION
local OnIncrease_LocalPositionX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].x = vector3field_agentLocalPosition["Value"].x + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnDecrease_LocalPositionX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].x = vector3field_agentLocalPosition["Value"].x - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnIncrease_LocalPositionY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].y = vector3field_agentLocalPosition["Value"].y + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnDecrease_LocalPositionY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].y = vector3field_agentLocalPosition["Value"].y - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnIncrease_LocalPositionZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].z = vector3field_agentLocalPosition["Value"].z + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

local OnDecrease_LocalPositionZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalPosition["Value"].z = vector3field_agentLocalPosition["Value"].z - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetPos(agent_currentSelectedAgent, vector3field_agentLocalPosition["Value"]);
end

--LOCAL ROTATION
local OnIncrease_LocalRotationX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].x = vector3field_agentLocalRotation["Value"].x + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnDecrease_LocalRotationX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].x = vector3field_agentLocalRotation["Value"].x - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnIncrease_LocalRotationY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].y = vector3field_agentLocalRotation["Value"].y + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnDecrease_LocalRotationY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].y = vector3field_agentLocalRotation["Value"].y - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnIncrease_LocalRotationZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].z = vector3field_agentLocalRotation["Value"].z + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

local OnDecrease_LocalRotationZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentLocalRotation["Value"].z = vector3field_agentLocalRotation["Value"].z - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetRot(agent_currentSelectedAgent, vector3field_agentLocalRotation["Value"]);
end

--WORLD POSITION
local OnIncrease_WorldPositionX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].x = vector3field_agentWorldPosition["Value"].x + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnDecrease_WorldPositionX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].x = vector3field_agentWorldPosition["Value"].x - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnIncrease_WorldPositionY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].y = vector3field_agentWorldPosition["Value"].y + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnDecrease_WorldPositionY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].y = vector3field_agentWorldPosition["Value"].y - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnIncrease_WorldPositionZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].z = vector3field_agentWorldPosition["Value"].z + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

local OnDecrease_WorldPositionZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldPosition["Value"].z = vector3field_agentWorldPosition["Value"].z - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldPos(agent_currentSelectedAgent, vector3field_agentWorldPosition["Value"]);
end

--WORLD ROTATION
local OnIncrease_WorldRotationX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].x = vector3field_agentWorldRotation["Value"].x + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnDecrease_WorldRotationX = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].x = vector3field_agentWorldRotation["Value"].x - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnIncrease_WorldRotationY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].y = vector3field_agentWorldRotation["Value"].y + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnDecrease_WorldRotationY = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].y = vector3field_agentWorldRotation["Value"].y - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnIncrease_WorldRotationZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].z = vector3field_agentWorldRotation["Value"].z + TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

local OnDecrease_WorldRotationZ = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end
    vector3field_agentWorldRotation["Value"].z = vector3field_agentWorldRotation["Value"].z - TLSE_Development_GUI_PropertyAdjustmentValue;
    AgentSetWorldRot(agent_currentSelectedAgent, vector3field_agentWorldRotation["Value"]);
end

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

local OnPress_AgentZeroPosition = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end

    AgentSetWorldPos(agent_currentSelectedAgent, Vector(0, 0, 0));
    AgentSetPos(agent_currentSelectedAgent, Vector(0, 0, 0));
end

local OnPress_AgentZeroRotation = function(textButton_button)
    if(agent_currentSelectedAgent == nil) then return end

    AgentSetWorldRot(agent_currentSelectedAgent, Vector(0, 0, 0));
    AgentSetRot(agent_currentSelectedAgent, Vector(0, 0, 0));
end

OnTextFinish_AgentRename = function()
    --AgentSetName(agent_currentSelectedAgent, "testasfasf");
    
    --if(TLSE_Development_TextBox_TextResult ~= nil) then
        --AgentSetName(agent_currentSelectedAgent, TLSE_Development_TextBox_TextResult);
    --end

    --TLSE_Development_TextBox_Inputing = false;
    --TLSE_Development_TextBox_InitalText = nil;
    --TLSE_Development_TextBox_TextResult = nil;
    --TLSE_Development_TextBox_OnFinish = nil;
end

local OnPress_AgentRename = function(textButton_button)
    --if(agent_currentSelectedAgent == nil) then return end

    --TLSE_Development_TextBox_OnFinish = OnTextFinish_AgentRename();
    --TLSE_Development_Editor_ShowTextBox(AgentGetName(agent_currentSelectedAgent), "Renaming Agent");
end

TLSE_Development_GUI_TabAgentInitalize = function()
    label_inspectorInfoText = TLSE_Development_Editor_GUI_CreateLabel("Inspector Info", Vector(0.685, 0.515, 0.0));

    boolField_visible = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Runtime: Visible", "Runtime: Visible", Vector(0.685, 0.525, 0.0), nil);
    boolField_groupVisible = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Group - Visible", "Group - Visible", Vector(0.685, 0.535, 0.0), nil);

    vector3field_agentLocalPosition = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Local Position", "", Vector(0.685, 0.545, 0.0), true, OnIncrease_LocalPositionX, OnIncrease_LocalPositionY, OnIncrease_LocalPositionZ, OnDecrease_LocalPositionX, OnDecrease_LocalPositionY, OnDecrease_LocalPositionZ);
    vector3field_agentLocalRotation = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Local Rotation", "", Vector(0.685, 0.575, 0.0), true, OnIncrease_LocalRotationX, OnIncrease_LocalRotationY, OnIncrease_LocalRotationZ, OnDecrease_LocalRotationX, OnDecrease_LocalRotationY, OnDecrease_LocalRotationZ);
    vector3field_agentWorldPosition = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "World Position", "", Vector(0.685, 0.605, 0.0), true, OnIncrease_WorldPositionX, OnIncrease_WorldPositionY, OnIncrease_WorldPositionZ, OnDecrease_WorldPositionX, OnDecrease_WorldPositionY, OnDecrease_WorldPositionZ);
    vector3field_agentWorldRotation = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "World Rotation", "", Vector(0.685, 0.635, 0.0), true, OnIncrease_WorldRotationX, OnIncrease_WorldRotationY, OnIncrease_WorldRotationZ, OnDecrease_WorldRotationX, OnDecrease_WorldRotationY, OnDecrease_WorldRotationZ);
    numberField_agentRenderGlobalScale = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Global Scale", Vector(0.685, 0.665, 0.0), true, nil, nil);
    vector3field_agentRenderAxisScale = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Render Axis Scale", "Render Axis Scale", Vector(0.685, 0.675, 0.0), true, nil, nil, nil, nil, nil, nil);

    textButton_agentDelete = TLSE_Development_Editor_GUI_CreateTextButton("[DELETE AGENT]", false, Vector(0.685, 0.715, 0.0), OnPress_AgentDelete, nil);
    textButton_agentDuplicate = TLSE_Development_Editor_GUI_CreateTextButton("[DUPLICATE AGENT]", false, Vector(0.685, 0.730, 0.0), OnPress_AgentDuplicate, nil);
    textButton_agentRename = TLSE_Development_Editor_GUI_CreateTextButton("[RENAME AGENT]", false, Vector(0.685, 0.745, 0.0), OnPress_AgentRename, nil);
    textButton_agentMoveToCamera = TLSE_Development_Editor_GUI_CreateTextButton("[MOVE AGENT TO CAMERA]", false, Vector(0.685, 0.760, 0.0), OnPress_AgentMoveToCamera, nil);
    textButton_agentZeroRotation = TLSE_Development_Editor_GUI_CreateTextButton("[ZERO POSITION]", false, Vector(0.685, 0.775, 0.0), OnPress_AgentZeroPosition, nil);
    textButton_agentZeroPosition = TLSE_Development_Editor_GUI_CreateTextButton("[ZERO ROTATION]", false, Vector(0.685, 0.790, 0.0), OnPress_AgentZeroRotation, nil);
end

TLSE_Development_GUI_TabAgentUpdate = function()
    local bool_inspectingObject = agent_currentSelectedAgent ~= nil;

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
    textButton_agentRename["Visible"] = TLSE_Development_GUI_AgentTabActive;
    textButton_agentMoveToCamera["Visible"] = TLSE_Development_GUI_AgentTabActive;
    textButton_agentZeroRotation["Visible"] = TLSE_Development_GUI_AgentTabActive;
    textButton_agentZeroPosition["Visible"] = TLSE_Development_GUI_AgentTabActive;

    if(bool_inspectingObject) then
        if(TLSE_Development_Editor_Input_DeleteClicked) then
            OnPress_AgentDelete(nil);
        end

        if(TLSE_Development_Editor_Input_DuplicateActionEnter) then
            OnPress_AgentDuplicate(nil);
        end
    end

    if(TLSE_Development_GUI_AgentTabActive == false) then
        return
    end

    local string_inspectorMainText = "";

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
    else
        string_inspectorMainText = string_inspectorMainText .. "No Agent selected...";
        string_inspectorMainText = string_inspectorMainText .. "\n"; --new line
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
    textButton_agentRename["Visible"] = bool_inspectingObject;
    textButton_agentMoveToCamera["Visible"] = bool_inspectingObject;
    textButton_agentZeroRotation["Visible"] = bool_inspectingObject;
    textButton_agentZeroPosition["Visible"] = bool_inspectingObject;

    label_inspectorInfoText["Text"] = string_inspectorMainText;
end