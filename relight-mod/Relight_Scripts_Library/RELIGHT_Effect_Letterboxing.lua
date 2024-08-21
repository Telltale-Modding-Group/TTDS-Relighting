local agent_letterbox = nil;

RELIGHT_Letterboxing_Initalize = function()
    agent_letterbox = AgentCreate("RELIGHT_LetterboxTop", "ui_boot_title.prop", Vector(0,0,0), Vector(0,0,0), RELIGHT_SceneObject, false, false);
    AgentSetProperty(agent_letterbox, "Render Axis Scale", Vector(100, 1, 1));
    AgentSetProperty(agent_letterbox, "Render Global Scale", 0.0977);
    AgentSetProperty(agent_letterbox, "Render Cull", false);
    AgentSetProperty(agent_letterbox, "Render Layer", 10000);
    AgentSetProperty(agent_letterbox, "Render Diffuse Color", Color(0, 0, 0, 1));
    AgentSetProperty(agent_letterbox, "Render Constant Alpha Multiply", 1);
    AgentSetProperty(agent_letterbox, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_letterbox, "Render EnvLight Shadow Cast Enable", false);
    AgentSetProperty(agent_letterbox, "Motion Blur Enabled", false);
    AgentSetProperty(agent_letterbox, "Render Depth Test", false);
    AgentSetProperty(agent_letterbox, "Camera Facing", false);
    AgentSetProperty(agent_letterbox, "Render Static", false);
    AgentSetProperty(agent_letterbox, "Camera Facing Type", 0);
    AgentSetProperty(agent_letterbox, "Render Depth Write", false);
    AgentSetProperty(agent_letterbox, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_letterbox, "Render 3D Alpha", false);
    AgentSetProperty(agent_letterbox, "Render Color Write", true);
    AgentSetProperty(agent_letterbox, "Render Force As Alpha", false);
    AgentSetProperty(agent_letterbox, "Render Depth Test Function", 4);
    AgentSetProperty(agent_letterbox, "Receive Shadows", false);
    AgentSetProperty(agent_letterbox, "Render FX Color Enabled", false);
    AgentSetProperty(agent_letterbox, "Render Shadow Force Visible", false);
    AgentSetProperty(agent_letterbox, "Render Enlighten Force Visible", false);
    ShaderSwapTexture(agent_letterbox, "ui_boot_title.d3dtx", "RELIGHT_Texture_Letterbox.d3dtx");
end

RELIGHT_Letterboxing_Update = function()
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject); --Agent type
    local vector_currentCameraPosition = AgentGetWorldPos(agent_currentCamera);
    local vector_currentCameraRotation = AgentGetWorldRot(agent_currentCamera); --Vector type
    local vector_currentCameraForward = AgentGetForwardVec(agent_currentCamera);
    local number_distanceToCamera = 5;

    AgentSetProperty(agent_currentCamera, "Field Of View Scale", 1.35);

    local number_renderAspectRatio = RenderGetAspectRatio();
    local number_fieldOfView = AgentGetProperty(agent_currentCamera, "Field of View");  --NOTE: according to ida, CameraGetFOV returns the horizontal FOV
    local number_fieldOfViewScale = AgentGetProperty(agent_currentCamera, "Field Of View Scale");
    local number_finalHorizontalFOV = number_fieldOfView * number_fieldOfViewScale;
    local number_finalVerticalFOV = number_finalHorizontalFOV / number_renderAspectRatio;
    local number_radiansHorizontalFOV = math.rad(number_finalHorizontalFOV);
    local number_radiansVerticalFOV = math.rad(number_finalVerticalFOV);

    local frustumHeight = 2.0 * number_distanceToCamera * math.tan(0.5 * TLSE_Math_Deg2Rad * number_radiansVerticalFOV);
    local scale = frustumHeight * 17;

    AgentSetProperty(agent_letterbox, "Render Global Scale", scale);

    local vector_letterboxTopPosition = AgentLocalToWorld(agent_currentCamera, Vector(0, 0, number_distanceToCamera));

    AgentSetWorldPos(agent_letterbox, vector_letterboxTopPosition);

    AgentSetWorldRot(agent_letterbox, vector_currentCameraRotation);
end