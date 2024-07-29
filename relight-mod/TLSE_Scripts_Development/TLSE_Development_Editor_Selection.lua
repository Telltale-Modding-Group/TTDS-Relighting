agent_currentSelectedAgent = nil;
boundsAABB_currentSelectedAgentWorldBounds = nil;
boundsAABB_currentSelectedAgentLocalBounds = nil;

agent_currentHoverAgent = nil;
boundsAABB_currentHoverAgentWorldBounds = nil;
boundsAABB_currentHoverAgentLocalBounds = nil;

TLSE_Development_Selection_SceneAgentsUnderCursor = {};
TLSE_Development_Selection_CanSelect = true;
TLSE_Development_Selection_SelectInvisibleAgents = false;
TLSE_Development_Selection_HideHoverBox = false;
TLSE_Development_Selection_HideSelectBox = false;

TLSE_Development_Selection_SelectBoundingBoxGroup = nil;
TLSE_Development_Selection_SelectBoundingBoxSide1 = nil;
TLSE_Development_Selection_SelectBoundingBoxSide2 = nil;
TLSE_Development_Selection_SelectBoundingBoxSide3 = nil;
TLSE_Development_Selection_SelectBoundingBoxSide4 = nil;
TLSE_Development_Selection_SelectBoundingBoxSide5 = nil;
TLSE_Development_Selection_SelectBoundingBoxSide6 = nil;

TLSE_Development_Selection_HoverBoundingBoxGroup = nil;
TLSE_Development_Selection_HoverBoundingBoxSide1 = nil;
TLSE_Development_Selection_HoverBoundingBoxSide2 = nil;
TLSE_Development_Selection_HoverBoundingBoxSide3 = nil;
TLSE_Development_Selection_HoverBoundingBoxSide4 = nil;
TLSE_Development_Selection_HoverBoundingBoxSide5 = nil;
TLSE_Development_Selection_HoverBoundingBoxSide6 = nil;

local ConfigureBoundingBoxSide = function(agent_boundingBoxSide, string_textureFileName)
    AgentSetProperty(agent_boundingBoxSide, "Render Global Scale", 0.0977);
    AgentSetProperty(agent_boundingBoxSide, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_boundingBoxSide, "Render Depth Test", false); --intersects with the scene
    AgentSetProperty(agent_boundingBoxSide, "Render Depth Write", false);
    AgentSetProperty(agent_boundingBoxSide, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_boundingBoxSide, "Render Cull", false);
    AgentSetProperty(agent_boundingBoxSide, "Render Layer", 45);
    ShaderSwapTexture(agent_boundingBoxSide, TLSE_Development_FlatPlaneOriginalTexture, string_textureFileName);
end

TLSE_Development_Selection_Initalize = function()
    --||||||||||||||||||||||||||||||||||||| CREATE BOUNDS SELECT HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| CREATE BOUNDS SELECT HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| CREATE BOUNDS SELECT HIGHLIGHT |||||||||||||||||||||||||||||||||||||

    TLSE_Development_Selection_SelectBoundingBoxGroup = AgentCreate("TLSE_Development_Selection_SelectBoundingBoxGroup", "group.prop", Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_SelectBoundingBoxSide1 = AgentCreate("TLSE_Development_Selection_SelectBoundingBoxSide1", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_SelectBoundingBoxSide2 = AgentCreate("TLSE_Development_Selection_SelectBoundingBoxSide2", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_SelectBoundingBoxSide3 = AgentCreate("TLSE_Development_Selection_SelectBoundingBoxSide3", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_SelectBoundingBoxSide4 = AgentCreate("TLSE_Development_Selection_SelectBoundingBoxSide4", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_SelectBoundingBoxSide5 = AgentCreate("TLSE_Development_Selection_SelectBoundingBoxSide5", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_SelectBoundingBoxSide6 = AgentCreate("TLSE_Development_Selection_SelectBoundingBoxSide6", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    
    ConfigureBoundingBoxSide(TLSE_Development_Selection_SelectBoundingBoxSide1, "TLSE_Development_BoundsSelectColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_SelectBoundingBoxSide2, "TLSE_Development_BoundsSelectColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_SelectBoundingBoxSide3, "TLSE_Development_BoundsSelectColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_SelectBoundingBoxSide4, "TLSE_Development_BoundsSelectColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_SelectBoundingBoxSide5, "TLSE_Development_BoundsSelectColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_SelectBoundingBoxSide6, "TLSE_Development_BoundsSelectColor.d3dtx");

    AgentAttach(TLSE_Development_Selection_SelectBoundingBoxSide1, TLSE_Development_Selection_SelectBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_SelectBoundingBoxSide2, TLSE_Development_Selection_SelectBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_SelectBoundingBoxSide3, TLSE_Development_Selection_SelectBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_SelectBoundingBoxSide4, TLSE_Development_Selection_SelectBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_SelectBoundingBoxSide5, TLSE_Development_Selection_SelectBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_SelectBoundingBoxSide6, TLSE_Development_Selection_SelectBoundingBoxGroup);

    --||||||||||||||||||||||||||||||||||||| CREATE BOUNDS HOVER HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| CREATE BOUNDS HOVER HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| CREATE BOUNDS HOVER HIGHLIGHT |||||||||||||||||||||||||||||||||||||

    TLSE_Development_Selection_HoverBoundingBoxGroup = AgentCreate("TLSE_Development_Selection_HoverBoundingBoxGroup", "group.prop", Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_HoverBoundingBoxSide1 = AgentCreate("TLSE_Development_Selection_HoverBoundingBoxSide1", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_HoverBoundingBoxSide2 = AgentCreate("TLSE_Development_Selection_HoverBoundingBoxSide2", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_HoverBoundingBoxSide3 = AgentCreate("TLSE_Development_Selection_HoverBoundingBoxSide3", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_HoverBoundingBoxSide4 = AgentCreate("TLSE_Development_Selection_HoverBoundingBoxSide4", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_HoverBoundingBoxSide5 = AgentCreate("TLSE_Development_Selection_HoverBoundingBoxSide5", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_Selection_HoverBoundingBoxSide6 = AgentCreate("TLSE_Development_Selection_HoverBoundingBoxSide6", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    
    ConfigureBoundingBoxSide(TLSE_Development_Selection_HoverBoundingBoxSide1, "TLSE_Development_BoundsHoverColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_HoverBoundingBoxSide2, "TLSE_Development_BoundsHoverColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_HoverBoundingBoxSide3, "TLSE_Development_BoundsHoverColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_HoverBoundingBoxSide4, "TLSE_Development_BoundsHoverColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_HoverBoundingBoxSide5, "TLSE_Development_BoundsHoverColor.d3dtx");
    ConfigureBoundingBoxSide(TLSE_Development_Selection_HoverBoundingBoxSide6, "TLSE_Development_BoundsHoverColor.d3dtx");

    AgentAttach(TLSE_Development_Selection_HoverBoundingBoxSide1, TLSE_Development_Selection_HoverBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_HoverBoundingBoxSide2, TLSE_Development_Selection_HoverBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_HoverBoundingBoxSide3, TLSE_Development_Selection_HoverBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_HoverBoundingBoxSide4, TLSE_Development_Selection_HoverBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_HoverBoundingBoxSide5, TLSE_Development_Selection_HoverBoundingBoxGroup);
    AgentAttach(TLSE_Development_Selection_HoverBoundingBoxSide6, TLSE_Development_Selection_HoverBoundingBoxGroup);
end

TLSE_Development_Selection_Update = function()  
    if(TLSE_Development_Freecam_Frozen) then
        TLSE_Development_Selection_CanSelect = true;
    else
        TLSE_Development_Selection_CanSelect = false;
    end

    if(TLSE_Development_GUI_CursorOverGUI) then
        TLSE_Development_Selection_CanSelect = false;
    end

    if(TLSE_Development_FreezeEditor) then
        TLSE_Development_Selection_CanSelect = false;
    end

    if(TLSE_Development_TransformTool_GizmoIsTransforming) then
        TLSE_Development_Selection_CanSelect = false;
    end

    if(TLSE_Development_TransformTool_GizmoHoveringOverAxis) then
        TLSE_Development_Selection_CanSelect = false;
    end

    --||||||||||||||||||||||||||||||||||||| AGENT HOVER/SELECTION |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| AGENT HOVER/SELECTION |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| AGENT HOVER/SELECTION |||||||||||||||||||||||||||||||||||||
    --In here is the main logic for finding the agent to be selected in the scene.
    --The telltale lua API does have functions for this, however the most obvious ones don't seem to work.
    --So we have to make our own here.

    TLSE_Development_Selection_SceneAgentsUnderCursor = {};

    if(TLSE_Development_Selection_CanSelect == true) then
        for index1, agent_sceneAgent in ipairs(TLSE_Development_SceneAgentsList) do
            if(AgentIsUnderCursor(agent_sceneAgent)) then
                if(TLSE_Development_Selection_SelectInvisibleAgents == false) then
                    if(AgentGetProperty(agent_sceneAgent, "Runtime: Visible") == true) then
                        table.insert(TLSE_Development_Selection_SceneAgentsUnderCursor, agent_sceneAgent);
                    end
                else
                    table.insert(TLSE_Development_Selection_SceneAgentsUnderCursor, agent_sceneAgent);
                end
            end
        end

        if(#TLSE_Development_Selection_SceneAgentsUnderCursor <= 0) then
            agent_currentHoverAgent = nil;
        else
            agent_currentHoverAgent = TLSE_Development_Selection_SceneAgentsUnderCursor[1];
        end

        if(TLSE_Development_Editor_Input_LeftMouseClicked == true) then
            agent_currentSelectedAgent = agent_currentHoverAgent;
        end
    else
        agent_currentHoverAgent = nil;
    end

    TLSE_Development_Selection_UpdateGizmo();
end

TLSE_Development_Selection_UpdateGizmo = function()
    local agent_sceneCamera = SceneGetCamera(TLSE_Development_SceneObject);
    local vector_sceneCameraPosition = AgentGetWorldPos(agent_sceneCamera);
    local vector_sceneCameraRotation = AgentGetWorldRot(agent_sceneCamera);
    local vector_cursorPosition = CursorGetPos();

    AgentFacePos(TLSE_Development_Selection_GizmoCenter, vector_sceneCameraPosition);
    local vector_gizmoCenterRotation = AgentGetWorldRot(TLSE_Development_Selection_GizmoCenter);

    local bool_selectedAgent = agent_currentSelectedAgent ~= nil;
    local bool_hoveringAgent = agent_currentHoverAgent ~= nil;
    local bool_selectVisibility = false;
    local bool_hoverVisibility = false;
    local vector_selectObjectWorldPosition = Vector(0, 0, 0);
    local vector_selectObjectLocalPosition = Vector(0, 0, 0);

    local vector_selectObjectPosition = Vector(0, 0, 0);
    local vector_selectObjectRotation = Vector(0, 0, 0);

    local vector_hoverObjectPosition = Vector(0, 0, 0);
    local vector_hoverObjectRotation = Vector(0, 0, 0);
    local number_globalScale = 0.25;
    local number_distanceToSelection = VectorDistance(vector_selectObjectPosition, vector_sceneCameraPosition);

    if(bool_selectedAgent == true) then
        boundsAABB_currentSelectedAgentWorldBounds = TLSE_Bounds_GetAgentWorldBounds_AABB(agent_currentSelectedAgent);
        boundsAABB_currentSelectedAgentLocalBounds = TLSE_Bounds_GetAgentLocalBounds_AABB(agent_currentSelectedAgent);

        if(boundsAABB_currentSelectedAgentWorldBounds ~= nil) and (boundsAABB_currentSelectedAgentWorldBounds ~= nil) then
            vector_selectObjectPosition = boundsAABB_currentSelectedAgentWorldBounds["center"];
        else
            vector_selectObjectPosition = AgentGetWorldPos(agent_currentSelectedAgent);
        end

        vector_selectObjectRotation = AgentGetWorldRot(agent_currentSelectedAgent);

        vector_selectObjectWorldPosition = AgentGetWorldPos(agent_currentSelectedAgent);
        vector_selectObjectLocalPosition = AgentGetPos(agent_currentSelectedAgent);

        number_globalScale = number_distanceToSelection * 0.05;
        bool_selectVisibility = true;
    else
        boundsAABB_currentSelectedAgentWorldBounds = nil;
        boundsAABB_currentSelectedAgentLocalBounds = nil;
    end

    local bool_isMovingObject = bool_selectVisibility and TLSE_Development_Editor_Input_LeftMouseHold and not (TLSE_Development_Selection_GizmoSelectedAxis == "");

    if(bool_hoveringAgent == true) then
        boundsAABB_currentHoverAgentWorldBounds = TLSE_Bounds_GetAgentWorldBounds_AABB(agent_currentHoverAgent);
        boundsAABB_currentHoverAgentLocalBounds = TLSE_Bounds_GetAgentLocalBounds_AABB(agent_currentHoverAgent);

        if(boundsAABB_currentHoverAgentWorldBounds ~= nil) and (boundsAABB_currentHoverAgentLocalBounds ~= nil) then
            vector_hoverObjectPosition = boundsAABB_currentHoverAgentWorldBounds["center"];
        else
            vector_hoverObjectPosition = AgentGetWorldPos(agent_currentHoverAgent);
        end

        vector_hoverObjectRotation = AgentGetWorldRot(agent_currentHoverAgent);

        bool_hoverVisibility = true;
    else
        boundsAABB_currentHoverAgentWorldBounds = nil;
        boundsAABB_currentHoverAgentLocalBounds = nil;
    end

    --||||||||||||||||||||||||||||||||||||| BOUNDS SELECT HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| BOUNDS SELECT HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| BOUNDS SELECT HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --A transparent yellow bounding box that is used when an agent is selected.

    if(boundsAABB_currentSelectedAgentLocalBounds ~= nil) then
        local vector_extents = boundsAABB_currentSelectedAgentLocalBounds["extents"];
        local vector_size = boundsAABB_currentSelectedAgentLocalBounds["size"];
        local vector_extentsWorldSpace = AgentLocalToWorld(agent_currentSelectedAgent, vector_extents);
        local vector_sizeWorldSpace = AgentLocalToWorld(agent_currentSelectedAgent, vector_size);

        AgentSetWorldPos(TLSE_Development_Selection_SelectBoundingBoxGroup, vector_selectObjectPosition);
        AgentSetWorldRot(TLSE_Development_Selection_SelectBoundingBoxGroup, vector_selectObjectRotation);
        
        AgentSetPos(TLSE_Development_Selection_SelectBoundingBoxSide1, Vector(0, vector_extents.y, 0));
        AgentSetPos(TLSE_Development_Selection_SelectBoundingBoxSide2, Vector(0, -vector_extents.y, 0));
        AgentSetPos(TLSE_Development_Selection_SelectBoundingBoxSide3, Vector(vector_extents.x, 0, 0));
        AgentSetPos(TLSE_Development_Selection_SelectBoundingBoxSide4, Vector(-vector_extents.x, 0, 0));
        AgentSetPos(TLSE_Development_Selection_SelectBoundingBoxSide5, Vector(0, 0, vector_extents.z));
        AgentSetPos(TLSE_Development_Selection_SelectBoundingBoxSide6, Vector(0, 0, -vector_extents.z));

        AgentSetRot(TLSE_Development_Selection_SelectBoundingBoxSide1, Vector(90, 0, 0));
        AgentSetRot(TLSE_Development_Selection_SelectBoundingBoxSide2, Vector(90, 0, 0));
        AgentSetRot(TLSE_Development_Selection_SelectBoundingBoxSide3, Vector(0, 90, 0));
        AgentSetRot(TLSE_Development_Selection_SelectBoundingBoxSide4, Vector(0, 90, 0));
        AgentSetRot(TLSE_Development_Selection_SelectBoundingBoxSide5, Vector(0, 0, 0));
        AgentSetRot(TLSE_Development_Selection_SelectBoundingBoxSide6, Vector(0, 0, 0));

        AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide1, "Render Axis Scale", Vector(vector_size.x, vector_size.z, 1));
        AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide2, "Render Axis Scale", Vector(vector_size.x, vector_size.z, 1));
        AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide3, "Render Axis Scale", Vector(vector_size.z, vector_size.y, 1));
        AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide4, "Render Axis Scale", Vector(vector_size.z, vector_size.y, 1));
        AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide5, "Render Axis Scale", Vector(vector_size.x, vector_size.y, 1));
        AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide6, "Render Axis Scale", Vector(vector_size.x, vector_size.y, 1));
    end

    if(TLSE_Development_Selection_HideSelectBox == true) then
        bool_selectVisibility = false;
    end 

    AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide1, "Runtime: Visible", bool_selectVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide2, "Runtime: Visible", bool_selectVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide3, "Runtime: Visible", bool_selectVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide4, "Runtime: Visible", bool_selectVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide5, "Runtime: Visible", bool_selectVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_SelectBoundingBoxSide6, "Runtime: Visible", bool_selectVisibility and not bool_isMovingObject);

    --||||||||||||||||||||||||||||||||||||| BOUNDS HOVER HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| BOUNDS HOVER HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| BOUNDS HOVER HIGHLIGHT |||||||||||||||||||||||||||||||||||||
    --A transparent white bounding box that is used when your cursor is hovering over agents with a bounding box.

    if(boundsAABB_currentHoverAgentLocalBounds ~= nil) then
        local vector_extents = boundsAABB_currentHoverAgentLocalBounds["extents"];
        local vector_size = boundsAABB_currentHoverAgentLocalBounds["size"];
        local vector_extentsWorldSpace = AgentLocalToWorld(agent_currentHoverAgent, vector_extents);
        local vector_sizeWorldSpace = AgentLocalToWorld(agent_currentHoverAgent, vector_size);

        AgentSetWorldPos(TLSE_Development_Selection_HoverBoundingBoxGroup, vector_hoverObjectPosition);
        AgentSetWorldRot(TLSE_Development_Selection_HoverBoundingBoxGroup, vector_hoverObjectRotation);
        
        AgentSetPos(TLSE_Development_Selection_HoverBoundingBoxSide1, Vector(0, vector_extents.y, 0));
        AgentSetPos(TLSE_Development_Selection_HoverBoundingBoxSide2, Vector(0, -vector_extents.y, 0));
        AgentSetPos(TLSE_Development_Selection_HoverBoundingBoxSide3, Vector(vector_extents.x, 0, 0));
        AgentSetPos(TLSE_Development_Selection_HoverBoundingBoxSide4, Vector(-vector_extents.x, 0, 0));
        AgentSetPos(TLSE_Development_Selection_HoverBoundingBoxSide5, Vector(0, 0, vector_extents.z));
        AgentSetPos(TLSE_Development_Selection_HoverBoundingBoxSide6, Vector(0, 0, -vector_extents.z));

        AgentSetRot(TLSE_Development_Selection_HoverBoundingBoxSide1, Vector(90, 0, 0));
        AgentSetRot(TLSE_Development_Selection_HoverBoundingBoxSide2, Vector(90, 0, 0));
        AgentSetRot(TLSE_Development_Selection_HoverBoundingBoxSide3, Vector(0, 90, 0));
        AgentSetRot(TLSE_Development_Selection_HoverBoundingBoxSide4, Vector(0, 90, 0));
        AgentSetRot(TLSE_Development_Selection_HoverBoundingBoxSide5, Vector(0, 0, 0));
        AgentSetRot(TLSE_Development_Selection_HoverBoundingBoxSide6, Vector(0, 0, 0));

        AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide1, "Render Axis Scale", Vector(vector_size.x, vector_size.z, 1));
        AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide2, "Render Axis Scale", Vector(vector_size.x, vector_size.z, 1));
        AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide3, "Render Axis Scale", Vector(vector_size.z, vector_size.y, 1));
        AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide4, "Render Axis Scale", Vector(vector_size.z, vector_size.y, 1));
        AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide5, "Render Axis Scale", Vector(vector_size.x, vector_size.y, 1));
        AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide6, "Render Axis Scale", Vector(vector_size.x, vector_size.y, 1));
    end

    if(TLSE_Development_Selection_HideHoverBox == true) then
        bool_hoverVisibility = false;
    end 

    AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide1, "Runtime: Visible", bool_hoverVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide2, "Runtime: Visible", bool_hoverVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide3, "Runtime: Visible", bool_hoverVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide4, "Runtime: Visible", bool_hoverVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide5, "Runtime: Visible", bool_hoverVisibility and not bool_isMovingObject);
    AgentSetProperty(TLSE_Development_Selection_HoverBoundingBoxSide6, "Runtime: Visible", bool_hoverVisibility and not bool_isMovingObject);
end