TLSE_Development_TransformTool_Text = nil;
TLSE_Development_TransformTool_GizmoSelectedAxis = "";
TLSE_Development_TransformTool_GizmoHoveringOverAxis = false;
TLSE_Development_TransformTool_GizmoIsTransforming = false;
TLSE_Development_TransformTool_GizmoMode = "position";
TLSE_Development_TransformTool_GizmoSpace = "world";
TLSE_Development_TransformTool_GizmoGroup = nil;
TLSE_Development_TransformTool_GizmoCenter = nil;
TLSE_Development_TransformTool_GizmoAgentX = nil;
TLSE_Development_TransformTool_GizmoAgentY = nil;
TLSE_Development_TransformTool_GizmoAgentZ = nil;
TLSE_Development_TransformTool_GizmoAgentSelect_Texture = nil;
TLSE_Development_TransformTool_GizmoAgentX_Texture = nil;
TLSE_Development_TransformTool_GizmoAgentY_Texture = nil;
TLSE_Development_TransformTool_GizmoAgentZ_Texture = nil;
TLSE_Development_TransformTool_GizmoAgentAxisDefaultBoundsMin = Vector(0, 0, 0);
TLSE_Development_TransformTool_GizmoAgentAxisDefaultBoundsMax = Vector(0, 0, 0);

local prevCursorPos = Vector(0, 0, 0);
local vector_cursorPositionBeforeTransforming = Vector(0, 0, 0);
local vector_previousSelectedObjectPosition = Vector(0, 0, 0);

TLSE_Development_TransformTool_Initalize = function()
    -------------------------------------------------------------
    --initalize menu text

    --create our menu text
    TLSE_Development_TransformTool_Text = TLSE_TextUI_CreateTextAgent("TLSE_Development_TransformTool_Text", "Text Initalized", Vector(0, 0, 0), 0, 0);
    AgentSetProperty(TLSE_Development_TransformTool_Text, "Text Render Layer", 90);

    --set the text color
    TextSetColor(TLSE_Development_TransformTool_Text, Color(1.0, 1.0, 1.0, 1.0));

    --scale note
    --1.0 = default
    --0.5 = half
    --2.0 = double
    TextSetScale(TLSE_Development_TransformTool_Text, 0.5);

    --||||||||||||||||||||||||||||||||||||| CREATE TRANSFORM POSITION GIZMO |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| CREATE TRANSFORM POSITION GIZMO |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| CREATE TRANSFORM POSITION GIZMO |||||||||||||||||||||||||||||||||||||

    TLSE_Development_TransformTool_GizmoGroup = AgentCreate("TLSE_Development_TransformTool_GizmoGroup", "group.prop", Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_TransformTool_GizmoCenter = AgentCreate("TLSE_Development_TransformTool_GizmoCenter", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_TransformTool_GizmoAgentX = AgentCreate("TLSE_Development_TransformTool_GizmoAgentX", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    TLSE_Development_TransformTool_GizmoAgentY = AgentCreate("TLSE_Development_TransformTool_GizmoAgentY", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(90, 0, 90), TLSE_Development_SceneObject, false, false);
    TLSE_Development_TransformTool_GizmoAgentZ = AgentCreate("TLSE_Development_TransformTool_GizmoAgentZ", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, -90, 0), TLSE_Development_SceneObject, false, false);
    
    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Render Axis Scale", Vector(1, 1, 1));
    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Render Global Scale", 1);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Render After Anti-Aliasing", true);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Render Depth Test", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Render Depth Write", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Render Depth Write Alpha", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Render Layer", 55);

    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Render Axis Scale", Vector(1, 1, 1));
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Render Global Scale", 1);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Render After Anti-Aliasing", true);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Render Depth Test", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Render Depth Write", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Render Depth Write Alpha", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Render Layer", 50);

    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Render Axis Scale", Vector(1, 1, 1));
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Render Global Scale", 1);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Render After Anti-Aliasing", true);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Render Depth Test", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Render Depth Write", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Render Depth Write Alpha", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Render Layer", 50);

    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Render Axis Scale", Vector(1, 1, 1));
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Render Global Scale", 1);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Render After Anti-Aliasing", true);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Render Depth Test", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Render Depth Write", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Render Depth Write Alpha", false);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Render Layer", 50);

    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoCenter, TLSE_Development_FlatPlaneOriginalTexture, "TLSE_Development_SelectionDotWhite.d3dtx");
    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, "TLSE_Development_TransformPositionGizmoRed.d3dtx");
    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, "TLSE_Development_TransformPositionGizmoGreen.d3dtx");
    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, "TLSE_Development_TransformPositionGizmoBlue.d3dtx");

    AgentAttach(TLSE_Development_TransformTool_GizmoCenter, TLSE_Development_TransformTool_GizmoGroup);
    AgentAttach(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_TransformTool_GizmoGroup);
    AgentAttach(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_TransformTool_GizmoGroup);
    AgentAttach(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_TransformTool_GizmoGroup);

    TLSE_Development_TransformTool_GizmoAgentAxisDefaultBoundsMin = AgentGetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Extents Min");
    TLSE_Development_TransformTool_GizmoAgentAxisDefaultBoundsMax = AgentGetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Extents Min");
end

TLSE_Development_TransformTool_Update = function()  

    --||||||||||||||||||||||||||||||||||||| TEXT HANDLING |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| TEXT HANDLING |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| TEXT HANDLING |||||||||||||||||||||||||||||||||||||
    TLSE_Development_TransformTool_UpdateGizmo();

    local string_finalText = "";

    if(agent_currentSelectedAgent ~= nil) then
        local vector_agentPosition = AgentGetWorldPos(agent_currentSelectedAgent);
        local vector_agentRotation = AgentGetWorldRot(agent_currentSelectedAgent);

        string_finalText = string_finalText .. AgentGetName(agent_currentSelectedAgent);
        string_finalText = string_finalText .. "\n"; --new line

        string_finalText = string_finalText .. TLSE_VectorToString(vector_agentPosition);
        string_finalText = string_finalText .. "\n"; --new line

        string_finalText = string_finalText .. TLSE_VectorToString(vector_agentRotation);
        string_finalText = string_finalText .. "\n"; --new line

        if(boundsAABB_currentSelectedAgentWorldBounds ~= nil) then
            AgentSetWorldPos(TLSE_Development_TransformTool_Text, boundsAABB_currentSelectedAgentWorldBounds["center"]);
        else
            AgentSetWorldPos(TLSE_Development_TransformTool_Text, vector_agentPosition);
        end
    else
        string_finalText = "";

        --screen pos notes
        --0.0 0.0 0.0 = top left
        --0.5 0.5 0.0 = center
        --0.0 1.0 0.0 = bottom left
        local screenPos = Vector(0.5, 0.5, 0.0);
        AgentSetWorldPosFromLogicalScreenPos(TLSE_Development_TransformTool_Text, screenPos);
    end

    TextSet(TLSE_Development_TransformTool_Text, string_finalText);
end

TLSE_Development_TransformTool_UpdateGizmo = function()
    local agent_sceneCamera = SceneGetCamera(TLSE_Development_SceneObject);
    local vector_sceneCameraPosition = AgentGetWorldPos(agent_sceneCamera);
    local vector_sceneCameraRotation = AgentGetWorldRot(agent_sceneCamera);
    local vector_sceneCameraForward = AgentGetForwardVec(agent_sceneCamera);
    local vector_cursorPosition = CursorGetPos();
    local vector_cursorOrigin3D = CursorGet3DOrigin(TLSE_Development_SceneObject);
    local vector_cursorDirection3D = CursorGet3DDirection(TLSE_Development_SceneObject);

    AgentFacePos(TLSE_Development_TransformTool_GizmoCenter, vector_sceneCameraPosition);
    local vector_gizmoCenterRotation = AgentGetWorldRot(TLSE_Development_TransformTool_GizmoCenter);

    local bool_selectedAgent = agent_currentSelectedAgent ~= nil;
    local vector_selectObjectWorldPosition = Vector(0, 0, 0);
    local vector_selectObjectLocalPosition = Vector(0, 0, 0);
    local vector_selectObjectWorldRotation = Vector(0, 0, 0);
    local vector_selectObjectLocalRotation = Vector(0, 0, 0);


    local vector_selectObjectPosition = Vector(0, 0, 0);
    local vector_selectObjectRotation = Vector(0, 0, 0);

    local number_globalScale = 0.25;
    local number_distanceToSelection = VectorDistance(vector_selectObjectPosition, vector_sceneCameraPosition);

    if(bool_selectedAgent == true) then
        boundsAABB_currentSelectedAgentWorldBounds = TLSE_Bounds_GetAgentWorldBounds_AABB(agent_currentSelectedAgent);
        boundsAABB_currentSelectedAgentLocalBounds = TLSE_Bounds_GetAgentLocalBounds_AABB(agent_currentSelectedAgent);

        vector_selectObjectWorldPosition = AgentGetWorldPos(agent_currentSelectedAgent);
        vector_selectObjectWorldRotation = AgentGetWorldRot(agent_currentSelectedAgent);
        vector_selectObjectLocalPosition = AgentGetPos(agent_currentSelectedAgent);
        vector_selectObjectLocalRotation = AgentGetRot(agent_currentSelectedAgent);

        if(boundsAABB_currentSelectedAgentWorldBounds ~= nil) and (boundsAABB_currentSelectedAgentWorldBounds ~= nil) then
            vector_selectObjectPosition = boundsAABB_currentSelectedAgentWorldBounds["center"];
        else
            vector_selectObjectPosition = vector_selectObjectWorldPosition;
        end

        vector_selectObjectRotation = vector_selectObjectWorldRotation;

        number_globalScale = number_distanceToSelection * 0.05;
    else
        boundsAABB_currentSelectedAgentWorldBounds = nil;
        boundsAABB_currentSelectedAgentLocalBounds = nil;
    end

    local bool_isMovingObject = TLSE_Development_Editor_Input_LeftMouseHold and not (TLSE_Development_TransformTool_GizmoSelectedAxis == "");

    --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO START |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO START |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO START |||||||||||||||||||||||||||||||||||||
    --Move/Rotate the transform gizmo to the appropriate spot

    if(TLSE_Development_TransformTool_GizmoSpace == "local") then
        AgentSetWorldPos(TLSE_Development_TransformTool_GizmoGroup, vector_selectObjectLocalPosition);
    else
        AgentSetWorldPos(TLSE_Development_TransformTool_GizmoGroup, vector_selectObjectWorldPosition);
    end

    if(TLSE_Development_TransformTool_GizmoSpace == "local") then
        AgentSetWorldRot(TLSE_Development_TransformTool_GizmoGroup, vector_selectObjectRotation);
    else
        AgentSetWorldRot(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, 0));
    end

    --Change the appearance of the transform gizmo to match the chosen transformation mode
    if(TLSE_Development_TransformTool_GizmoMode == "position") then
        TLSE_Development_TransformTool_GizmoAgentSelect_Texture = "TLSE_Development_TransformPositionGizmoWhite.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentX_Texture = "TLSE_Development_TransformPositionGizmoRed.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentY_Texture = "TLSE_Development_TransformPositionGizmoGreen.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentZ_Texture = "TLSE_Development_TransformPositionGizmoBlue.d3dtx";

        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentX, Vector(0, 0, 0));
        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentY, Vector(90, 0, 90));
        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentZ, Vector(0, -90, 0));
    elseif(TLSE_Development_TransformTool_GizmoMode == "rotation") then
        TLSE_Development_TransformTool_GizmoAgentSelect_Texture = "TLSE_Development_TransformRotateGizmoWhite.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentX_Texture = "TLSE_Development_TransformRotateGizmoRed.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentY_Texture = "TLSE_Development_TransformRotateGizmoGreen.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentZ_Texture = "TLSE_Development_TransformRotateGizmoBlue.d3dtx";

        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentX, Vector(0, 0, 0));
        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentY, Vector(90, 0, 0));
        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentZ, Vector(0, 90, 0));
    elseif(TLSE_Development_TransformTool_GizmoMode == "scale") then
        TLSE_Development_TransformTool_GizmoAgentSelect_Texture = "TLSE_Development_TransformScaleGizmoWhite.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentX_Texture = "TLSE_Development_TransformScaleGizmoRed.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentY_Texture = "TLSE_Development_TransformScaleGizmoGreen.d3dtx";
        TLSE_Development_TransformTool_GizmoAgentZ_Texture = "TLSE_Development_TransformScaleGizmoBlue.d3dtx";

        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentX, Vector(0, 0, 0));
        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentY, Vector(90, 0, 90));
        AgentSetRot(TLSE_Development_TransformTool_GizmoAgentZ, Vector(0, -90, 0));
    end

    --Scale the gizmo according to distance (so that it stays mostly consistent)
    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Render Global Scale", number_globalScale);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Render Global Scale", number_globalScale);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Render Global Scale", number_globalScale);
    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Render Global Scale", number_globalScale);

    --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO ACTIVE |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO ACTIVE |||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO ACTIVE |||||||||||||||||||||||||||||||||||||
    --When the gizmo is active and in a non hand mode (and when there is an object selected)
    if(bool_selectedAgent == true) and not (TLSE_Development_TransformTool_GizmoMode == "hand") and TLSE_Development_Freecam_Frozen then

        local bool_is_X_UnderCursor = false;
        local bool_is_Y_UnderCursor = false;
        local bool_is_Z_UnderCursor = false;

        local number_chosenDistance = TLSE_Math_MaxValue;
        local number_distanceToHit_X = nil;
        local number_distanceToHit_Y = nil;
        local number_distanceToHit_Z = nil;

        --||||||||||||||||||||||||||||||||||||| TRANSFORM - POSITION |||||||||||||||||||||||||||||||||||||
        --||||||||||||||||||||||||||||||||||||| TRANSFORM - POSITION |||||||||||||||||||||||||||||||||||||
        --||||||||||||||||||||||||||||||||||||| TRANSFORM - POSITION |||||||||||||||||||||||||||||||||||||

        if(TLSE_Development_TransformTool_GizmoMode == "position") then
            
            --||||||||||||||||||||||||||||||||||||| TRANSFORM POSITION HANDLES |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM POSITION HANDLES |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM POSITION HANDLES |||||||||||||||||||||||||||||||||||||
            --Since we can't really modify the bounding boxes of the gizmo handles, we just have to make some manually.

            local number_capsuleRadius = number_globalScale * 4 * 0.25;
            local number_capsuleHeight = number_globalScale * 4;
 
            local vector_X_UnderCursor = TLSE_GetRayIntersectsCapsuleHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(number_capsuleHeight, 0, 0)), AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, 0)), number_capsuleRadius);
            local vector_Y_UnderCursor = TLSE_GetRayIntersectsCapsuleHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, number_capsuleHeight, 0)), AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, 0)), number_capsuleRadius);
            local vector_Z_UnderCursor = TLSE_GetRayIntersectsCapsuleHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, number_capsuleHeight)), AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, 0)), number_capsuleRadius);

            if(vector_X_UnderCursor ~= nil) then
                number_distanceToHit_X = VectorDistance(vector_sceneCameraPosition, vector_X_UnderCursor);
            end

            if(vector_Y_UnderCursor ~= nil) then
                number_distanceToHit_Y = VectorDistance(vector_sceneCameraPosition, vector_Y_UnderCursor);
            end

            if(vector_Z_UnderCursor ~= nil) then
                number_distanceToHit_Z = VectorDistance(vector_sceneCameraPosition, vector_Z_UnderCursor);
            end

            if(number_distanceToHit_X ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_X);
            end

            if(number_distanceToHit_Y ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_Y);
            end

            if(number_distanceToHit_Z ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_Z);
            end

            if(number_chosenDistance == number_distanceToHit_X) then
                bool_is_X_UnderCursor = true;
            elseif(number_chosenDistance == number_distanceToHit_Y) then
                bool_is_Y_UnderCursor = true;
            elseif(number_chosenDistance == number_distanceToHit_Z) then
                bool_is_Z_UnderCursor = true;
            end

            if(bool_is_X_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "x";
                end
            elseif(bool_is_Y_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "y";
                end
            elseif(bool_is_Z_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "z";
                end
            else
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);
            end

            --||||||||||||||||||||||||||||||||||||| TRANSFORM POSITION HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM POSITION HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM POSITION HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||
            
            if(TLSE_Development_Editor_Input_LeftMouseHold == true) then

                local vector_newPosition = Vector(0, 0, 0);
                local xDifference = vector_cursorPosition.x - prevCursorPos.x;
                local yDifference = vector_cursorPosition.y - prevCursorPos.y;
                local vector_transformedCursorPosition = AgentGetWorldPosFromCursorPos(agent_currentSelectedAgent);

                if(TLSE_Development_TransformTool_GizmoSelectedAxis == "x") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                    vector_newPosition = Vector(vector_transformedCursorPosition.x, vector_selectObjectWorldPosition.y, vector_selectObjectWorldPosition.z);
                    AgentSetWorldPos(agent_currentSelectedAgent, vector_newPosition);
                elseif(TLSE_Development_TransformTool_GizmoSelectedAxis == "y") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                    vector_newPosition = Vector(vector_selectObjectWorldPosition.x, vector_transformedCursorPosition.y, vector_selectObjectWorldPosition.z);
                    AgentSetWorldPos(agent_currentSelectedAgent, vector_newPosition);
                elseif(TLSE_Development_TransformTool_GizmoSelectedAxis == "z") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                    vector_newPosition = Vector(vector_selectObjectWorldPosition.x, vector_selectObjectWorldPosition.y, vector_transformedCursorPosition.z);
                    AgentSetWorldPos(agent_currentSelectedAgent, vector_newPosition);
                end

                TLSE_Development_TransformTool_GizmoIsTransforming = TLSE_Development_TransformTool_GizmoSelectedAxis ~= "";

            else
                --Not moving/messing with the transform gizmo
                TLSE_Development_TransformTool_GizmoSelectedAxis = "";
                AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", true);

                TLSE_Development_TransformTool_GizmoIsTransforming = false;
            end

        --||||||||||||||||||||||||||||||||||||| TRANSFORM - ROTATION |||||||||||||||||||||||||||||||||||||
        --||||||||||||||||||||||||||||||||||||| TRANSFORM - ROTATION |||||||||||||||||||||||||||||||||||||
        --||||||||||||||||||||||||||||||||||||| TRANSFORM - ROTATION |||||||||||||||||||||||||||||||||||||

        elseif(TLSE_Development_TransformTool_GizmoMode == "rotation") then

            --||||||||||||||||||||||||||||||||||||| TRANSFORM ROTATION HANDLES |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM ROTATION HANDLES |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM ROTATION HANDLES |||||||||||||||||||||||||||||||||||||
            --Since we can't really modify the bounding boxes of the gizmo handles, we just have to make some manually.

            local number_diskRadius = number_globalScale * 5;
            local vector_diskPosition = AgentGetWorldPos(TLSE_Development_TransformTool_GizmoGroup);
            local vector_gizmoForward = TLSE_AgentGetForward(TLSE_Development_TransformTool_GizmoGroup);
            local vector_gizmoRight = TLSE_AgentGetRight(TLSE_Development_TransformTool_GizmoGroup);
            local vector_gizmoUp = TLSE_AgentGetUp(TLSE_Development_TransformTool_GizmoGroup);

            local vector_X_UnderCursor = TLSE_GetRayIntersectsDiskHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, vector_diskPosition, vector_gizmoForward, number_diskRadius, true);
            local vector_Y_UnderCursor = TLSE_GetRayIntersectsDiskHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, vector_diskPosition, vector_gizmoUp, number_diskRadius, true);
            local vector_Z_UnderCursor = TLSE_GetRayIntersectsDiskHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, vector_diskPosition, vector_gizmoRight, number_diskRadius, true);

            if(vector_X_UnderCursor ~= nil) then
                number_distanceToHit_X = VectorDistance(vector_sceneCameraPosition, vector_X_UnderCursor);
            end

            if(vector_Y_UnderCursor ~= nil) then
                number_distanceToHit_Y = VectorDistance(vector_sceneCameraPosition, vector_Y_UnderCursor);
            end

            if(vector_Z_UnderCursor ~= nil) then
                number_distanceToHit_Z = VectorDistance(vector_sceneCameraPosition, vector_Z_UnderCursor);
            end

            if(number_distanceToHit_X ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_X);
            end

            if(number_distanceToHit_Y ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_Y);
            end

            if(number_distanceToHit_Z ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_Z);
            end

            if(number_chosenDistance == number_distanceToHit_X) then
                bool_is_X_UnderCursor = true;
            elseif(number_chosenDistance == number_distanceToHit_Y) then
                bool_is_Y_UnderCursor = true;
            elseif(number_chosenDistance == number_distanceToHit_Z) then
                bool_is_Z_UnderCursor = true;
            end

            if(bool_is_X_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "x";
                end
            elseif(bool_is_Y_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "y";
                end
            elseif(bool_is_Z_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "z";
                end
            else
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);
            end

            --||||||||||||||||||||||||||||||||||||| TRANSFORM ROTATION HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM ROTATION HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM ROTATION HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||
            --AgentGetAnglesTo(agent, vector3, (optional) vector3) returns number
            --AgentRotateToWorld(agent, vector3) returns vector3
            --AgentRotateToLocal(agent, vector3) returns vector3
            --MathRotateAroundAxis(vector3, vector3, number) returns vector3 NOTE: first vector3 being the vector you input and output I think
            --VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));
            --vector_cursorOrigin3D
            --vector_cursorDirection3D

            if(TLSE_Development_Editor_Input_LeftMouseHold == true) then
                local vector_newRotation = Vector(0, 0, 0);
                local xDifference = vector_cursorPosition.x - prevCursorPos.x;
                local yDifference = vector_cursorPosition.y - prevCursorPos.y;
                local vector_transformedCursorPosition = AgentGetWorldPosFromCursorPos(agent_currentSelectedAgent);

                if(TLSE_Development_TransformTool_GizmoSelectedAxis == "x") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                    --vector_newRotation = Vector(vector_transformedCursorPosition.x, vector_selectObjectRotation.y, vector_selectObjectRotation.z);
                    --vector_newRotation = MathRotateAroundAxis(vector_newRotation, Vector(1, 0, 0), );
                    --AgentRotateToWorld(agent_currentSelectedAgent, vector_cursorOrigin3D);
                    --AgentSetWorldRot(agent_currentSelectedAgent, vector_newRotation);
                    --AgentSetWorldRot(agent_currentSelectedAgent, AgentRotateToWorld(agent_currentSelectedAgent, vector_transformedCursorPosition));
                    --AgentSetWorldRot(agent_currentSelectedAgent, AgentRotateToWorld(agent_currentSelectedAgent, vector_cursorOrigin3D));

                    vector_newRotation = Vector(vector_selectObjectRotation.x + xDifference * 360, vector_selectObjectRotation.y, vector_selectObjectRotation.z);
                    AgentSetWorldRot(agent_currentSelectedAgent, vector_newRotation);
                elseif(TLSE_Development_TransformTool_GizmoSelectedAxis == "y") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                    vector_newRotation = Vector(vector_selectObjectRotation.x, vector_selectObjectRotation.y + xDifference * 360, vector_selectObjectRotation.z);
                    AgentSetWorldRot(agent_currentSelectedAgent, vector_newRotation);
                elseif(TLSE_Development_TransformTool_GizmoSelectedAxis == "z") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                    vector_newRotation = Vector(vector_selectObjectRotation.x, vector_selectObjectRotation.y, vector_selectObjectRotation.z + xDifference * 360);
                    AgentSetWorldRot(agent_currentSelectedAgent, vector_newRotation);
                end

                TLSE_Development_TransformTool_GizmoIsTransforming = TLSE_Development_TransformTool_GizmoSelectedAxis ~= "";

            else
                --Not moving/messing with the transform gizmo
                TLSE_Development_TransformTool_GizmoSelectedAxis = "";
                AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", true);

                TLSE_Development_TransformTool_GizmoIsTransforming = false;
            end

        --||||||||||||||||||||||||||||||||||||| TRANSFORM - SCALE |||||||||||||||||||||||||||||||||||||
        --||||||||||||||||||||||||||||||||||||| TRANSFORM - SCALE |||||||||||||||||||||||||||||||||||||
        --||||||||||||||||||||||||||||||||||||| TRANSFORM - SCALE |||||||||||||||||||||||||||||||||||||

        elseif(TLSE_Development_TransformTool_GizmoMode == "scale") then
            
            --||||||||||||||||||||||||||||||||||||| TRANSFORM SCALE HANDLES |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM SCALE HANDLES |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM SCALE HANDLES |||||||||||||||||||||||||||||||||||||
            --Since we can't really modify the bounding boxes of the gizmo handles, we just have to make some manually.

            local number_capsuleRadius = number_globalScale * 4 * 0.25;
            local number_capsuleHeight = number_globalScale * 4;
 
            local vector_X_UnderCursor = TLSE_GetRayIntersectsCapsuleHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(number_capsuleHeight, 0, 0)), AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, 0)), number_capsuleRadius);
            local vector_Y_UnderCursor = TLSE_GetRayIntersectsCapsuleHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, number_capsuleHeight, 0)), AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, 0)), number_capsuleRadius);
            local vector_Z_UnderCursor = TLSE_GetRayIntersectsCapsuleHitPointNullable(vector_cursorOrigin3D, vector_cursorDirection3D, AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, number_capsuleHeight)), AgentLocalToWorld(TLSE_Development_TransformTool_GizmoGroup, Vector(0, 0, 0)), number_capsuleRadius);

            if(vector_X_UnderCursor ~= nil) then
                number_distanceToHit_X = VectorDistance(vector_sceneCameraPosition, vector_X_UnderCursor);
            end

            if(vector_Y_UnderCursor ~= nil) then
                number_distanceToHit_Y = VectorDistance(vector_sceneCameraPosition, vector_Y_UnderCursor);
            end

            if(vector_Z_UnderCursor ~= nil) then
                number_distanceToHit_Z = VectorDistance(vector_sceneCameraPosition, vector_Z_UnderCursor);
            end

            if(number_distanceToHit_X ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_X);
            end

            if(number_distanceToHit_Y ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_Y);
            end

            if(number_distanceToHit_Z ~= nil) then
                number_chosenDistance = math.min(number_chosenDistance, number_distanceToHit_Z);
            end

            if(number_chosenDistance == number_distanceToHit_X) then
                bool_is_X_UnderCursor = true;
            elseif(number_chosenDistance == number_distanceToHit_Y) then
                bool_is_Y_UnderCursor = true;
            elseif(number_chosenDistance == number_distanceToHit_Z) then
                bool_is_Z_UnderCursor = true;
            end

            if(bool_is_X_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "x";
                end
            elseif(bool_is_Y_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "y";
                end
            elseif(bool_is_Z_UnderCursor == true) then
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);

                if(TLSE_Development_Editor_Input_LeftMouseHold and (TLSE_Development_TransformTool_GizmoSelectedAxis == "")) then
                    TLSE_Development_TransformTool_GizmoSelectedAxis = "z";
                end
            else
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentX_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentY_Texture);
                ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentZ_Texture);
            end

            --||||||||||||||||||||||||||||||||||||| TRANSFORM SCALE HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM SCALE HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||
            --||||||||||||||||||||||||||||||||||||| TRANSFORM SCALE HANDLE BEHAVIOR |||||||||||||||||||||||||||||||||||||

            if(TLSE_Development_Editor_Input_LeftMouseHold == true) then
                if(TLSE_Development_TransformTool_GizmoSelectedAxis == "x") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentX, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                elseif(TLSE_Development_TransformTool_GizmoSelectedAxis == "y") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentY, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                elseif(TLSE_Development_TransformTool_GizmoSelectedAxis == "z") then
                    ShaderSwapTexture(TLSE_Development_TransformTool_GizmoAgentZ, TLSE_Development_FlatPlaneOriginalTexture, TLSE_Development_TransformTool_GizmoAgentSelect_Texture);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", false);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", true);
                    AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);

                end

                TLSE_Development_TransformTool_GizmoIsTransforming = TLSE_Development_TransformTool_GizmoSelectedAxis ~= "";

            else
                --Not moving/messing with the transform gizmo
                TLSE_Development_TransformTool_GizmoSelectedAxis = "";
                AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", true);
                AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", true);

                TLSE_Development_TransformTool_GizmoIsTransforming = false;
            end

        end

        TLSE_Development_TransformTool_GizmoHoveringOverAxis = bool_is_X_UnderCursor or bool_is_Y_UnderCursor or bool_is_Z_UnderCursor;
    else
        --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO HAND MODE |||||||||||||||||||||||||||||||||||||
        --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO HAND MODE |||||||||||||||||||||||||||||||||||||
        --||||||||||||||||||||||||||||||||||||| TRANSFORM GIZMO HAND MODE |||||||||||||||||||||||||||||||||||||
        TLSE_Development_TransformTool_GizmoHoveringOverAxis = false;
        TLSE_Development_TransformTool_GizmoIsTransforming = false; 

        AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentX, "Runtime: Visible", false);
        AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentY, "Runtime: Visible", false);
        AgentSetProperty(TLSE_Development_TransformTool_GizmoAgentZ, "Runtime: Visible", false);
        AgentSetProperty(TLSE_Development_TransformTool_GizmoCenter, "Runtime: Visible", false);
    end

    prevCursorPos = vector_cursorPosition;
end