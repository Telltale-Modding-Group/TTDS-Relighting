--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||

--(public) dev variables (public because these values need to be persistent)
TLSE_Development_CameraInfo_Text = nil;
TLSE_Development_CameraInfo_TextTitle = "[Camera Info]";

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_CameraInfo_Initalize = function()
    TLSE_Development_CameraInfo_Text = TLSE_TextUI_CreateTextAgent("TLSE_Development_CameraInfoText", "Camera Info Error", Vector(0, 0, 0), 0, 0, TLSE_Development_SceneObject);
    TextSetColor(TLSE_Development_CameraInfo_Text, Color(0.75, 0.75, 1.0, 1.0));
    TextSetScale(TLSE_Development_CameraInfo_Text, 0.15);
end

TLSE_Development_CameraInfo_Update = function()  
    local agent_currentCamera = SceneGetCamera(TLSE_Development_SceneObject);
    local vector_localPosition = AgentGetPos(agent_currentCamera);
    local vector_localRotation = AgentGetRot(agent_currentCamera);
    local vector_worldPosition = AgentGetWorldPos(agent_currentCamera);
    local vector_worldRotation = AgentGetWorldRot(agent_currentCamera);
    local vector_forwardDirection = AgentGetForwardVec(agent_currentCamera);
    local number_clipPlaneNear = AgentGetProperty(agent_currentCamera, "Clip Plane - Near");
    local number_clipPlaneFar = AgentGetProperty(agent_currentCamera, "Clip Plane - Far");
    local number_fieldOfView = AgentGetProperty(agent_currentCamera, "Field of View");  --NOTE: according to ida, CameraGetFOV returns the horizontal FOV
    local number_fieldOfViewScale = AgentGetProperty(agent_currentCamera, "Field Of View Scale");
    local number_finalHorizontalFOV = number_fieldOfView * number_fieldOfViewScale;
    local number_finalVerticalFOV = number_finalHorizontalFOV / RenderGetAspectRatio();
    local number_radiansHorizontalFOV = math.rad(number_finalHorizontalFOV);
    local number_radiansVerticalFOV = math.rad(number_finalVerticalFOV);

    --local vector_sensorSize = Vector(10.26, 7.49, 0); --SENSOR SIZE: 16mm Film
    --local vector_sensorSize = Vector(18, 13.5, 0); --SENSOR SIZE: Micro Four Thirds
    --local vector_sensorSize = Vector(24, 14, 0); --SENSOR SIZE: Suoer 35mm 
    local vector_sensorSize = Vector(36, 24, 0); --SENSOR SIZE: Full Frame
    --local vector_sensorSize = Vector(42, 56, 0); --SENSOR SIZE: Meduim Format 645
    --local vector_sensorSize = Vector(70.4, 52.6, 0); --SENSOR SIZE: IMAX
    --local vector_sensorSize = Vector(127, 102, 0); --SENSOR SIZE: Large Format 4x5
    local number_horizontalFocalLength = vector_sensorSize.x / (2 * math.tan(number_radiansHorizontalFOV / 2));
    local number_verticalFocalLength = vector_sensorSize.y / (2 * math.tan(number_radiansVerticalFOV / 2));

    AgentSetWorldPosFromLogicalScreenPos(TLSE_Development_CameraInfo_Text, Vector(0, 0, 0));

    local string_finalText = TLSE_Development_CameraInfo_TextTitle;

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Name: " .. AgentGetName(agent_currentCamera);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Local Position: " .. TLSE_VectorToString(vector_localPosition);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Local Rotation: " .. TLSE_VectorToString(vector_localRotation);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "World Position: " .. TLSE_VectorToString(vector_worldPosition);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "World Rotation: " .. TLSE_VectorToString(vector_worldRotation);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Forward Direction: " .. TLSE_VectorToString(vector_forwardDirection);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Clip Plane - Near: " .. tostring(number_clipPlaneNear);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Clip Plane - Far: " .. tostring(number_clipPlaneFar);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Field of View: " .. tostring(number_fieldOfView);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Field of View Scale: " .. tostring(number_fieldOfViewScale);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "[Physical Camera Calculations]"

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Horizontal FOV: " .. tostring(number_finalHorizontalFOV);
    
    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "Vertical FOV: " .. tostring(number_finalVerticalFOV);

    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "[FULL FRAME] Horizontal Focal Length: " .. tostring(number_horizontalFocalLength);
    
    string_finalText = string_finalText .. "\n"; --new line
    string_finalText = string_finalText .. "[FULL FRAME] Vertical Focal Length: " .. tostring(number_verticalFocalLength);

    TextSet(TLSE_Development_CameraInfo_Text, string_finalText);
end