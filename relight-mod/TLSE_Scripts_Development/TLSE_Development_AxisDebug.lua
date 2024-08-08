local CreateDebugAxis = function(string_agentName, number_scale)
    local agent_group = AgentCreate("TLSE_Development_AxisDebugGroup_" .. string_agentName, "group.prop", Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    local agent_center = AgentCreate("TLSE_Development_AxisDebugCenter_" .. string_agentName, TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    local agent_axisX = AgentCreate("TLSE_Development_AxisDebugX_" .. string_agentName, TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    local agent_axisY = AgentCreate("TLSE_Development_AxisDebugY_" .. string_agentName, TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(90, 0, 90), TLSE_Development_SceneObject, false, false);
    local agent_axisZ = AgentCreate("TLSE_Development_AxisDebugZ_" .. string_agentName, TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, -90, 0), TLSE_Development_SceneObject, false, false);
    
    AgentSetProperty(agent_center, "Render Axis Scale", Vector(1, 1, 1));
    AgentSetProperty(agent_center, "Render Global Scale", number_scale);
    AgentSetProperty(agent_center, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_center, "Render Depth Test", false);
    AgentSetProperty(agent_center, "Render Depth Write", false);
    AgentSetProperty(agent_center, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_center, "Render Layer", 55);
    AgentSetProperty(agent_center, "Camera Facing", true);

    AgentSetProperty(agent_axisX, "Render Axis Scale", Vector(1, 1, 1));
    AgentSetProperty(agent_axisX, "Render Global Scale", number_scale);
    AgentSetProperty(agent_axisX, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_axisX, "Render Depth Test", false);
    AgentSetProperty(agent_axisX, "Render Depth Write", false);
    AgentSetProperty(agent_axisX, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_axisX, "Render Layer", 50);

    AgentSetProperty(agent_axisY, "Render Axis Scale", Vector(1, 1, 1));
    AgentSetProperty(agent_axisY, "Render Global Scale", number_scale);
    AgentSetProperty(agent_axisY, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_axisY, "Render Depth Test", false);
    AgentSetProperty(agent_axisY, "Render Depth Write", false);
    AgentSetProperty(agent_axisY, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_axisY, "Render Layer", 50);

    AgentSetProperty(agent_axisZ, "Render Axis Scale", Vector(1, 1, 1));
    AgentSetProperty(agent_axisZ, "Render Global Scale", number_scale);
    AgentSetProperty(agent_axisZ, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_axisZ, "Render Depth Test", false);
    AgentSetProperty(agent_axisZ, "Render Depth Write", false);
    AgentSetProperty(agent_axisZ, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_axisZ, "Render Layer", 50);

    ShaderSwapTexture(agent_center, TLSE_Development_FlatPlaneOriginalTexture, "TLSE_Development_SelectionDotWhite.d3dtx");
    ShaderSwapTexture(agent_axisX, TLSE_Development_FlatPlaneOriginalTexture, "TLSE_Development_TransformPositionGizmoRed.d3dtx");
    ShaderSwapTexture(agent_axisY, TLSE_Development_FlatPlaneOriginalTexture, "TLSE_Development_TransformPositionGizmoGreen.d3dtx");
    ShaderSwapTexture(agent_axisZ, TLSE_Development_FlatPlaneOriginalTexture, "TLSE_Development_TransformPositionGizmoBlue.d3dtx");

    AgentAttach(agent_center, agent_group);
    AgentAttach(agent_axisX, agent_group);
    AgentAttach(agent_axisY, agent_group);
    AgentAttach(agent_axisZ, agent_group);

    TLSE_Development_AxisDebug_GizmoAgentAxisDefaultBoundsMin = AgentGetProperty(agent_axisX, "Extents Min");
    TLSE_Development_AxisDebug_GizmoAgentAxisDefaultBoundsMax = AgentGetProperty(agent_axisX, "Extents Min");

    return agent_group;
end

TLSE_Development_AxisDebug_CreateAndAttach = function(agent_objectToDebug, number_scale)
    local agent_axisDebugGroup = CreateDebugAxis(AgentGetName(agent_objectToDebug), number_scale);
    AgentAttach(agent_axisDebugGroup, agent_objectToDebug);
    AgentSetPos(agent_axisDebugGroup, Vector(0, 0, 0));
    AgentSetRot(agent_axisDebugGroup, Vector(0, 0, 0));
end

TLSE_Development_AxisDebug_CreateAndAttachToNode = function(agent_objectToDebug, number_scale, string_skeletonNode)
    local agent_axisDebugGroup = CreateDebugAxis(AgentGetName(agent_objectToDebug), number_scale);
    AgentAttachToNode(agent_axisDebugGroup, agent_objectToDebug, string_skeletonNode);
    AgentSetPos(agent_axisDebugGroup, Vector(0, 0, 0));
    AgentSetRot(agent_axisDebugGroup, Vector(0, 0, 0));
end