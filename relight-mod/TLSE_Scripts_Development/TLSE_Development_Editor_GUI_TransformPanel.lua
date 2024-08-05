local string_texture_editorColor = "TLSE_Development_EditorGUIGrey.d3dtx";

local string_texture_iconTransformHand = "TLSE_Development_IconTransformHand.d3dtx";
local string_texture_iconTransformHandHover = "TLSE_Development_IconTransformHandHover.d3dtx";
local string_texture_iconTransformHandSelect = "TLSE_Development_IconTransformHandSelect.d3dtx";

local string_texture_iconTransformMove = "TLSE_Development_IconTransformMove.d3dtx";
local string_texture_iconTransformMoveHover = "TLSE_Development_IconTransformMoveHover.d3dtx";
local string_texture_iconTransformMoveSelect = "TLSE_Development_IconTransformMoveSelect.d3dtx";

local string_texture_iconTransformRotate = "TLSE_Development_IconTransformRotate.d3dtx";
local string_texture_iconTransformRotateHover = "TLSE_Development_IconTransformRotateHover.d3dtx";
local string_texture_iconTransformRotateSelect = "TLSE_Development_IconTransformRotateSelect.d3dtx";

local string_texture_iconTransformScale = "TLSE_Development_IconTransformScale.d3dtx";
local string_texture_iconTransformScaleHover = "TLSE_Development_IconTransformScaleHover.d3dtx";
local string_texture_iconTransformScaleSelect = "TLSE_Development_IconTransformScaleSelect.d3dtx";

local agent_bg_transformTools = nil;

local agent_icon_transformHand = nil;
local agent_icon_transformMove = nil;
local agent_icon_transformRotate = nil;
local agent_icon_transformScale = nil;

local textButton_worldSpace = nil;
local textButton_localSpace = nil;

local OnPress_SetTransformGizmoToWorldSpace = function()
    TLSE_Development_TransformTool_GizmoSpace = "world";
end

local OnPress_SetTransformGizmoToLocalSpace = function()
    TLSE_Development_TransformTool_GizmoSpace = "local";
end

TLSE_Development_GUI_TransformPanelInitalize = function()
    textButton_worldSpace = TLSE_Development_Editor_GUI_CreateTextButton("[WORLD SPACE]", true, Vector(0.015, 0.9, 0.0), OnPress_SetTransformGizmoToWorldSpace, nil);
    textButton_localSpace = TLSE_Development_Editor_GUI_CreateTextButton("[LOCAL SPACE]", true, Vector(0.075, 0.9, 0.0), OnPress_SetTransformGizmoToLocalSpace, nil);
    
    agent_icon_transformHand = AgentCreate("TLSE_Development_icon_transformHand", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    agent_icon_transformMove = AgentCreate("TLSE_Development_icon_transformMove", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    agent_icon_transformRotate = AgentCreate("TLSE_Development_icon_transformRotate", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    agent_icon_transformScale = AgentCreate("TLSE_Development_icon_transformScale", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    agent_bg_transformTools = AgentCreate("TLSE_Development_bg_transformTools", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);

    ShaderSwapTexture(agent_icon_transformHand, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformHand);
    ShaderSwapTexture(agent_icon_transformMove, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformMove);
    ShaderSwapTexture(agent_icon_transformRotate, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformRotate);
    ShaderSwapTexture(agent_icon_transformScale, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformScale);

    ShaderSwapTexture(agent_bg_transformTools, TLSE_Development_FlatPlaneOriginalTexture, string_texture_editorColor);

    local number_iconButtonSize = 0.01;

    AgentSetProperty(agent_icon_transformHand, "Render Axis Scale", Vector(-1, 1, 1));
    AgentSetProperty(agent_icon_transformHand, "Render Global Scale", number_iconButtonSize);
    AgentSetProperty(agent_icon_transformHand, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_icon_transformHand, "Render Depth Test", false);
    AgentSetProperty(agent_icon_transformHand, "Render Depth Write", false);
    AgentSetProperty(agent_icon_transformHand, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_icon_transformHand, "Render Layer", 95);

    AgentSetProperty(agent_icon_transformMove, "Render Axis Scale", Vector(-1, 1, 1));
    AgentSetProperty(agent_icon_transformMove, "Render Global Scale", number_iconButtonSize);
    AgentSetProperty(agent_icon_transformMove, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_icon_transformMove, "Render Depth Test", false);
    AgentSetProperty(agent_icon_transformMove, "Render Depth Write", false);
    AgentSetProperty(agent_icon_transformMove, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_icon_transformMove, "Render Layer", 95);

    AgentSetProperty(agent_icon_transformRotate, "Render Axis Scale", Vector(-1, 1, 1));
    AgentSetProperty(agent_icon_transformRotate, "Render Global Scale", number_iconButtonSize);
    AgentSetProperty(agent_icon_transformRotate, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_icon_transformRotate, "Render Depth Test", false);
    AgentSetProperty(agent_icon_transformRotate, "Render Depth Write", false);
    AgentSetProperty(agent_icon_transformRotate, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_icon_transformRotate, "Render Layer", 95);

    AgentSetProperty(agent_icon_transformScale, "Render Axis Scale", Vector(-1, 1, 1));
    AgentSetProperty(agent_icon_transformScale, "Render Global Scale", number_iconButtonSize);
    AgentSetProperty(agent_icon_transformScale, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_icon_transformScale, "Render Depth Test", false);
    AgentSetProperty(agent_icon_transformScale, "Render Depth Write", false);
    AgentSetProperty(agent_icon_transformScale, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_icon_transformScale, "Render Layer", 95);

    AgentSetProperty(agent_bg_transformTools, "Render Axis Scale", Vector(0.06, 0.0185, 1));
    AgentSetProperty(agent_bg_transformTools, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_bg_transformTools, "Render Depth Test", false);
    AgentSetProperty(agent_bg_transformTools, "Render Depth Write", false);
    AgentSetProperty(agent_bg_transformTools, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_bg_transformTools, "Render Layer", 94);
end

TLSE_Development_GUI_TransformPanelUpdate = function()
    local agent_sceneCamera = SceneGetCamera(TLSE_Development_SceneObject);
    local vector_sceneCameraPosition = AgentGetWorldPos(agent_sceneCamera);
    local vector_sceneCameraRotation = AgentGetWorldRot(agent_sceneCamera);
    local vector_sceneCameraForward = AgentGetForwardVec(agent_sceneCamera);

    local number_buttonVerticalSize = 0.04;
    local number_buttonHorizontalSize = 0.04 / RenderGetAspectRatio();
    local vector_buttonExtentsMin = Vector(-number_buttonHorizontalSize, -number_buttonVerticalSize, 1);
    local vector_buttonExtentsMax = Vector(number_buttonHorizontalSize, number_buttonVerticalSize, 1);

    local bool_isOverTransformHand = TLSE_TextUI_IsCursorOverBounds(AgentGetScreenPos(agent_icon_transformHand), vector_buttonExtentsMin, vector_buttonExtentsMax);
    local bool_isOverTransformMove = TLSE_TextUI_IsCursorOverBounds(AgentGetScreenPos(agent_icon_transformMove), vector_buttonExtentsMin, vector_buttonExtentsMax);
    local bool_isOverTransformRotate = TLSE_TextUI_IsCursorOverBounds(AgentGetScreenPos(agent_icon_transformRotate), vector_buttonExtentsMin, vector_buttonExtentsMax);
    local bool_isOverTransformScale = TLSE_TextUI_IsCursorOverBounds(AgentGetScreenPos(agent_icon_transformScale), vector_buttonExtentsMin, vector_buttonExtentsMax);

    --screen pos notes
    --0.0 0.0 0.0 = top left
    --0.5 0.5 0.0 = center
    --0.0 1.0 0.0 = bottom left
    local bool_isOverTransformToolbar = TLSE_TextUI_IsCursorOverBounds(Vector(0, 1, 0), Vector(-0.2, -0.2, 0), Vector(0.2, 0.2, 0));

    if(bool_isOverTransformToolbar) then
        TLSE_Development_GUI_CursorOverGUI = bool_isOverTransformToolbar;
    end

    if(bool_isOverTransformHand) and (TLSE_Development_Editor_Input_LeftMouseClicked) then
        TLSE_Development_TransformTool_GizmoMode = "hand";
    end

    if(bool_isOverTransformMove) and (TLSE_Development_Editor_Input_LeftMouseClicked) then
        TLSE_Development_TransformTool_GizmoMode = "position";
    end

    if(bool_isOverTransformRotate) and (TLSE_Development_Editor_Input_LeftMouseClicked) then
        TLSE_Development_TransformTool_GizmoMode = "rotation";
    end

    if(bool_isOverTransformScale) and (TLSE_Development_Editor_Input_LeftMouseClicked) then
        TLSE_Development_TransformTool_GizmoMode = "scale";
    end

    --------------------------------
    if(TLSE_Development_TransformTool_GizmoMode == "hand") then
        ShaderSwapTexture(agent_icon_transformHand, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformHandSelect);
    else
        if(bool_isOverTransformHand) then
            ShaderSwapTexture(agent_icon_transformHand, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformHandHover);
        else
            ShaderSwapTexture(agent_icon_transformHand, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformHand);
        end
    end

    if(TLSE_Development_TransformTool_GizmoMode == "position") then
        ShaderSwapTexture(agent_icon_transformMove, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformMoveSelect);
    else
        if(bool_isOverTransformMove) then
            ShaderSwapTexture(agent_icon_transformMove, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformMoveHover);
        else
            ShaderSwapTexture(agent_icon_transformMove, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformMove);
        end
    end

    if(TLSE_Development_TransformTool_GizmoMode == "rotation") then
        ShaderSwapTexture(agent_icon_transformRotate, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformRotateSelect);
    else
        if(bool_isOverTransformRotate) then
            ShaderSwapTexture(agent_icon_transformRotate, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformRotateHover);
        else
            ShaderSwapTexture(agent_icon_transformRotate, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformRotate);
        end
    end

    if(TLSE_Development_TransformTool_GizmoMode == "scale") then
        ShaderSwapTexture(agent_icon_transformScale, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformScaleSelect);
    else
        if(bool_isOverTransformScale) then
            ShaderSwapTexture(agent_icon_transformScale, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformScaleHover);
        else
            ShaderSwapTexture(agent_icon_transformScale, TLSE_Development_FlatPlaneOriginalTexture, string_texture_iconTransformScale);
        end
    end

    if(TLSE_Development_TransformTool_GizmoSpace == "world") then
        textButton_worldSpace["Selected"] = true;
        textButton_localSpace["Selected"] = false;
    else
        textButton_worldSpace["Selected"] = false;
        textButton_localSpace["Selected"] = true;
    end

    --screen pos notes
    --0.0 0.0 0.0 = top left
    --0.5 0.5 0.0 = center
    --0.0 1.0 0.0 = bottom left
    AgentSetWorldPos(agent_icon_transformHand, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(-9.333, 10, 0))));
    AgentSetWorldPos(agent_icon_transformMove, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(-8.333, 10, 0))));
    AgentSetWorldPos(agent_icon_transformRotate, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(-7.333, 10, 0))));
    AgentSetWorldPos(agent_icon_transformScale, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(-6.333, 10, 0))));
    AgentSetWorldPos(agent_bg_transformTools, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(-8, 10, 0))));

    AgentSetWorldRot(agent_icon_transformHand, vector_sceneCameraRotation);
    AgentSetWorldRot(agent_icon_transformMove, vector_sceneCameraRotation);
    AgentSetWorldRot(agent_icon_transformRotate, vector_sceneCameraRotation);
    AgentSetWorldRot(agent_icon_transformScale, vector_sceneCameraRotation);
    AgentSetWorldRot(agent_bg_transformTools, vector_sceneCameraRotation);
end