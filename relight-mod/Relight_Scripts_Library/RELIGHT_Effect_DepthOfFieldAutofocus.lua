--[[
Custom Depth of Field Autofocusing system.

This is a completely custom solution for doing depth of field within telltale.
It utilizes the oddly 3 different DOF tech that is implemented within the game (Legacy, Modern, Modern + Bokeh).
It's completely automated and designed mostly to implement DOF effects into Season 1/2 of the game since they don't utilize the tech.
Given the nature that its also automated, its not 100% perfect and there are some issues that might occur that are very hard to fix.

--relighting dof autofocus variables
RELIGHT_DOF_AUTOFOCUS_UseCameraDOF = false;
RELIGHT_DOF_AUTOFOCUS_UseLegacyDOF = true;
RELIGHT_DOF_AUTOFOCUS_FocalRange = 1.0;
RELIGHT_DOF_AUTOFOCUS_Aperture = 4.0;
RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames = 
{ 
    "cameraAgentName",
};
RELIGHT_DOF_AUTOFOCUS_ObjectEntries = 
{
    "characterAgentName"
};
RELIGHT_DOF_AUTOFOCUS_Settings =
{
    TargetValidation_IsOnScreen = true,
    TargetValidation_IsVisible = true,
    TargetValidation_IsWithinDistance = true,
    TargetValidation_IsFacingCamera = true,
    TargetValidation_RejectionAngle = 0.0, --goes from -1 to 1 (less than 0 is within the 180 forward facing fov of the given object)
    TargetValidation_RejectionDistance = 40.0, --the max distance before the agent is too far from camera to do autofocus
};
RELIGHT_DOF_AUTOFOCUS_BokehSettings =
{
    BokehBrightnessDeltaThreshold = 0.05,
    BokehBrightnessThreshold = 0.05,
    BokehBlurThreshold = 0.05,
    BokehMaxSizeClamp = 0.125,
    BokehFalloff = 1.0,
    MaxBokehBufferAmount = 1.0,
};

Callback_OnPostUpdate:Add(RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus)
]]--

local agent_sceneAgent = nil;
local agent_currentCamera = nil;

--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) CAMERA CUT DETECTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) CAMERA CUT DETECTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) CAMERA CUT DETECTION ||||||||||||||||||||||||||||||||||||||||||||||||

local bool_onNewCamera = false;

local string_currentCameraName = nil;
local vector_currentCameraPosition = Vector(0, 0, 0);
local vector_currentCameraRotation = Vector(0, 0, 0);
local number_currentCameraFOV = 0;

local string_previousCameraName = nil;
local vector_previousCameraPosition = Vector(0, 0, 0);
local vector_previousCameraRotation = Vector(0, 0, 0);
local number_previousCameraFOV = 0;

local number_cameraCutPositionThreshold = 0.25;
local number_cameraCutRotationThreshold = 2;
local number_cameraCutFieldOfViewThreshold = 2;

--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) DEPTH OF FIELD SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) DEPTH OF FIELD SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) DEPTH OF FIELD SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||

local bool_enableDOF = false;
local number_lerpFactor = 7.5;
local number_lerpFactorPlanes = 5;
local number_lerpFactorFallofs = 5;

local number_currentFocalDistance = 0;
local number_currentFocalRangeOffset = 0; 
local number_currentNearFocusPlane = 0;
local number_currentNearFallof = 0;
local number_currentFarFocusPlane = 0;
local number_currentFarFalloff = 0;
local number_currentBokehSize = 0;
local number_currentBlurStrength = 0;

local number_previousNearFocusPlane = 0;
local number_previousNearFallof = 0;
local number_previousFarFocusPlane = 0;
local number_previousFarFalloff = 0;
local number_previousBokehSize = 0;
local number_previousBlurStrength = 0;

--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) FOCUS TARGETS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) FOCUS TARGETS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) FOCUS TARGETS ||||||||||||||||||||||||||||||||||||||||||||||||

local number_nearFocusTargetDistance = 0;
local number_farFocusTargetDistance = 0;

local bool_stateIsMultiTarget = false; 
local bool_stateIsSingleTarget = false;

local agentTable_focusTargets = {};

--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) CAMERA SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) CAMERA SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (VARIABLES) CAMERA SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||

--presets
local vector_sensorSize_16mm = Vector(10.26, 7.49, 0);
local vector_sensorsSize_MicroFourThirds = Vector(18, 13.5, 0);
local vector_sensorsSize_Super35mm = Vector(24, 14, 0);
local vector_sensorsSize_35mmFullFrame = Vector(36, 24, 0);
local vector_sensorsSize_MeduimFormat645 = Vector(42, 56, 0);
local vector_sensorsSize_IMAX = Vector(70.4, 52.6, 0);
local vector_sensorsSize_4x5 = Vector(127, 102, 0);

local string_currentBokehTexture = nil;
local string_bokehCircleTexture = "bokeh_circle.d3dtx";
local string_bokehAnamorphicTexture = "bokeh_anamorphic2.d3dtx";

local vector_currentSensorSize = vector_sensorsSize_35mmFullFrame;

--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) CAMERA CUT DETECTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) CAMERA CUT DETECTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) CAMERA CUT DETECTION ||||||||||||||||||||||||||||||||||||||||||||||||

local CheckForNewCameraCut = function()
    if(string_currentCameraName ~= string_previousCameraName) then
        return true;
    end

    if(VectorDistance(vector_currentCameraPosition, vector_previousCameraPosition) > number_cameraCutPositionThreshold) then
        return true;
    end

    if(math.abs(VectorLength(VectorSubtract(vector_currentCameraRotation, vector_previousCameraRotation))) > number_cameraCutRotationThreshold) then
        return true;
    end

    if(math.abs(number_currentCameraFOV - number_previousCameraFOV) > number_cameraCutFieldOfViewThreshold) then
        return true;
    end

    return false;
end

--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) FOCUS TARGETS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) FOCUS TARGETS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) FOCUS TARGETS ||||||||||||||||||||||||||||||||||||||||||||||||

local SetupFocusTargets = function()
    for index, string_objectName in ipairs(RELIGHT_DOF_AUTOFOCUS_ObjectEntries) do
        local agent_objectEntry = AgentFindInScene(string_objectName, RELIGHT_SceneObject); --Agent type

        if(agent_objectEntry ~= nil) then
            local agent_focusTarget = AgentCreate("RELIGHT_FocusTarget_" .. string_objectName, "group.prop", Vector(0, 0, 0), Vector(0, 0, 0), RELIGHT_SceneObject, false, false);

            AgentAttachToNode(agent_focusTarget, agent_objectEntry, "head");
            AgentSetPos(agent_focusTarget, Vector(0, 0, 0));
            AgentSetRot(agent_focusTarget, Vector(0, 0, 0));

            table.insert(agentTable_focusTargets, agent_focusTarget);
        end
    end
end

local GetValidFocusTargets = function()
    local vector_currentCameraForward = AgentGetForwardVec(agent_currentCamera); --Vector type

    --if the dot product is greater than the defined angle then they are not facing camera
    local number_rejectionAngle = RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_RejectionAngle"]; --goes from -1 to 1 (less than 0 is within the 180 forward facing fov of the given object)
    local number_rejectionDistance = RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_RejectionDistance"]; --the max distance before the agent is too far from camera to do autofocus

    --list of valid target agents
    local agentTable_validAgents = {}; --Agent array
    
    --find all of the valid target objects in the scene
    for index, agent_focusTarget in pairs(agentTable_focusTargets) do
        local bool_isObjectOnScreen = AgentIsOnScreen(agent_focusTarget);
        local bool_isObjectVisible = AgentGetProperty(AgentGetParent(agent_focusTarget), "Runtime: Visible");
        local number_objectDistance = AgentDistanceToAgent(agent_focusTarget, agent_currentCamera);

        --local vector_objectForward = AgentGetForwardVec(agent_focusTarget);
        --local vector_objectForward = TLSE_VectorAverage(AgentGetForwardVec(agent_focusTarget), AgentGetForwardVec(AgentGetParent(agent_focusTarget)));
        local vector_objectForward = VectorNormalize(VectorSubtract(AgentLocalToWorld(agent_focusTarget, Vector(0, 0, 1)), AgentGetWorldPos(agent_focusTarget)));

        local number_objectDotProduct = VectorDot(vector_objectForward, vector_currentCameraForward);
        local bool_isValidTarget = true;

        if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsOnScreen"]) and (bool_isObjectOnScreen == false) then bool_isValidTarget = false; end

        if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsVisible"]) and (bool_isObjectVisible == false) then bool_isValidTarget = false; end

        if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsWithinDistance"]) and (number_objectDistance > number_rejectionDistance) then bool_isValidTarget = false; end

        if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsFacingCamera"]) and (number_objectDotProduct > number_rejectionAngle) then bool_isValidTarget = false; end
            
        --if the target is valid and passed all of our checks
        if (bool_isValidTarget == true) then
            table.insert(agentTable_validAgents, agent_focusTarget);
        end
    end

    return agentTable_validAgents;
end

--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) DEPTH OF FIELD SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) DEPTH OF FIELD SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (FUNCTIONS/LOGIC) DEPTH OF FIELD SETTINGS ||||||||||||||||||||||||||||||||||||||||||||||||

local CalculateFocusProperties = function()
    local number_horizontalFOV = AgentGetProperty(agent_currentCamera, "Field Of View"); --NOTE: according to ida, CameraGetFOV returns the horizontal FOV
    local number_FOVScale = AgentGetProperty(agent_currentCamera, "Field Of View Scale");
    local number_finalHorizontalFOV = number_horizontalFOV * number_FOVScale;
    --local number_finalVerticalFOV = number_finalHorizontalFOV / RenderGetAspectRatio();
    local number_focalDistanceInMM = number_currentFocalDistance * 1000; --NOTE: Multiply by 1000 to be in milimeters

    local number_radiansHorizontalFOV = math.rad(number_finalHorizontalFOV);
    --local number_radiansVerticalFOV = math.rad(number_finalVerticalFOV);

    local number_aperture = RELIGHT_DOF_AUTOFOCUS_Aperture;

    local number_sensorDiagonalSize = math.sqrt((vector_currentSensorSize.x * vector_currentSensorSize.x) + (vector_currentSensorSize.y * vector_currentSensorSize.y));
    local number_horizontalMagnification = vector_currentSensorSize.x / number_radiansHorizontalFOV;

    --FORMULA | circle of confusion (CoC) = sensor diagonal / 1500
    local number_circleOfConfusionConstant = number_sensorDiagonalSize / 1500; --NOTE: 1500 is modern standard approximation, 1000 is traditional zeiss standard, 1730 is sometimes used.

    local number_horizontalFocalLength = vector_currentSensorSize.x / (2 * math.tan(number_radiansHorizontalFOV / 2));
    --local number_verticalFocalLength = vector_currentSensorSize.y / (2 * math.tan(number_radiansVerticalFOV / 2));

    local number_hyperfocalDistance = (number_horizontalFocalLength * number_horizontalFocalLength) / (number_aperture * number_circleOfConfusionConstant) + number_horizontalFocalLength;
    local number_circleOfConfusion = (number_horizontalFocalLength * number_horizontalFocalLength * (number_focalDistanceInMM - number_hyperfocalDistance)) / (number_focalDistanceInMM * number_aperture * (number_hyperfocalDistance - number_horizontalFocalLength));
    number_circleOfConfusion = math.abs(number_circleOfConfusion);

    local number_nearFocusDistance = (number_hyperfocalDistance * number_focalDistanceInMM) / (number_hyperfocalDistance + (number_focalDistanceInMM - number_horizontalFocalLength));
    local number_farFocusDistance = (number_hyperfocalDistance * number_focalDistanceInMM) / (number_hyperfocalDistance - (number_focalDistanceInMM - number_horizontalFocalLength));

    --NOTE: despite the effort here for getting a physically accurate near/far plane calculation for the given "exposure", the bokeh size here is not 100% accurate so it was eyeballed a bit to get it to roughly match reality.
    number_currentBokehSize = TLSE_NumberClamp(number_circleOfConfusion / 16, 0, RELIGHT_DOF_AUTOFOCUS_BokehSettings["BokehMaxSizeClamp"]);

    number_currentNearFocusPlane = number_nearFocusDistance / 1000; --NOTE: Divide by 1000 to get value in meters
    number_currentFarFocusPlane = number_farFocusDistance / 1000; --NOTE: Divide by 1000 to get value in meters

    number_currentNearFocusPlane = number_currentNearFocusPlane - number_currentFocalRangeOffset;
    number_currentFarFocusPlane = number_currentFarFocusPlane + number_currentFocalRangeOffset;

    number_currentFarFalloff = 1 / number_circleOfConfusion; 
    number_currentNearFallof = 1 / number_circleOfConfusion; 
end

local ApplyDepthOfFieldSettings = function()
    if(bool_stateIsSingleTarget == false) and (bool_stateIsMultiTarget == false) then
        number_currentBokehSize = 0; 
        number_currentBlurStrength = 0;
    else
        number_currentBlurStrength = 1;
    end

    if(bool_onNewCamera == true) then
        number_previousNearFocusPlane = number_currentNearFocusPlane;
        number_previousNearFallof = number_currentNearFallof;
        number_previousFarFocusPlane = number_currentFarFocusPlane;
        number_previousFarFalloff = number_currentFarFalloff;
        number_previousBokehSize = number_currentBokehSize;
        number_previousBlurStrength = number_currentBlurStrength;
    else
        number_previousNearFocusPlane = TLSE_NumberLerp(number_previousNearFocusPlane, number_currentNearFocusPlane, GetFrameTime() * number_lerpFactorPlanes);
        number_previousNearFallof = TLSE_NumberLerp(number_previousNearFallof, number_currentNearFallof, GetFrameTime() * number_lerpFactorFallofs);
        number_previousFarFocusPlane = TLSE_NumberLerp(number_previousFarFocusPlane, number_currentFarFocusPlane, GetFrameTime() * number_lerpFactorPlanes);
        number_previousFarFalloff = TLSE_NumberLerp(number_previousFarFalloff, number_currentFarFalloff, GetFrameTime() * number_lerpFactorFallofs);
        number_previousBokehSize = TLSE_NumberLerp(number_previousBokehSize, number_currentBokehSize, GetFrameTime() * number_lerpFactor);
        number_previousBlurStrength = TLSE_NumberLerp(number_previousBlurStrength, number_currentBlurStrength, GetFrameTime() * number_lerpFactor);
    end

    if (RELIGHT_DOF_AUTOFOCUS_UseCameraDOF == true) then
        --Use the DOF properties on the camera itself
        AgentSetProperty(agent_currentCamera, "Depth Of Field Enabled", bool_enableDOF);
        AgentSetProperty(agent_currentCamera, "Use High Quality DOF", true);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Type", 1);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Blur Strength", number_previousBlurStrength);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Coverage Boost", 5);

        if(RelightConfigGlobal["HighQualityDepthOfField"] == true and RELIGHT_DOF_AUTOFOCUS_UseLegacyDOF == false) then
            AgentSetProperty(agent_currentCamera, "Use Bokeh", true, RELIGHT_SceneObject);
            AgentSetProperty(agent_currentCamera, "Bokeh Brightness Delta Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBrightnessDeltaThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Brightness Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBrightnessThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Blur Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBlurThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Min Size", 0);
            AgentSetProperty(agent_currentCamera, "Bokeh Max Size", number_previousBokehSize);
            AgentSetProperty(agent_currentCamera, "Bokeh Falloff", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehFalloff);
            AgentSetProperty(agent_currentCamera, "Max Bokeh Buffer Amount", RELIGHT_DOF_AUTOFOCUS_BokehSettings.MaxBokehBufferAmount);
            AgentSetProperty(agent_currentCamera, "Bokeh Pattern Texture", string_currentBokehTexture);
        else
            AgentSetProperty(agent_currentCamera, "Use Bokeh", false);
        end

        AgentSetProperty(agent_currentCamera, "Depth Of Field - Far", number_previousFarFocusPlane);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Fall Off - Far", number_previousFarFalloff);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Max - Far", number_previousBlurStrength);
        AgentSetProperty(agent_currentCamera, "Depth Of Field - Near", number_previousNearFocusPlane);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Fall Off - Near", number_previousNearFallof);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Max - Near", number_previousBlurStrength);

    else
        --Use the DOF properties on the scene post processing itself
        AgentSetProperty(agent_sceneAgent, "FX DOF Enabled", bool_enableDOF);
        AgentSetProperty(agent_sceneAgent, "FX DOF Far", number_previousFarFocusPlane);
        AgentSetProperty(agent_sceneAgent, "FX DOF Far Falloff", number_previousFarFalloff);
        AgentSetProperty(agent_sceneAgent, "FX DOF Far Max", number_previousBlurStrength);
        AgentSetProperty(agent_sceneAgent, "FX DOF Near", number_previousNearFocusPlane);
        AgentSetProperty(agent_sceneAgent, "FX DOF Near Falloff", number_previousNearFallof);
        AgentSetProperty(agent_sceneAgent, "FX DOF Near Max", number_previousBlurStrength);
    end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||

RELIGHT_Camera_DepthOfFieldAutofocus_SetupDOF = function(relightConfigLevel)
    --local bool_dofEnabled = relightConfigLevel.EnableDepthOfField;
    local bool_dofEnabled = true;

    if(bool_dofEnabled == false) then
        RenderSetFeatureEnabled("dof", false);
        RenderSetFeatureEnabled("bokeh", false);
        return;
    end

    RenderSetFeatureEnabled("dof", true);

    if(RELIGHT_DOF_AUTOFOCUS_UseLegacyDOF == true) then
        PropertySet(GetPreferences(), "Use Legacy DOF", true);
        RenderSetFeatureEnabled("bokeh", false);
    else
        PropertySet(GetPreferences(), "Use Legacy DOF", false);
        RenderSetFeatureEnabled("bokeh", true);
    end

    if(RelightConfigGlobal["CinematicMode"] == true) then
        string_currentBokehTexture = "bokeh_anamorphic2.d3dtx";
    else
        string_currentBokehTexture = "bokeh_circle.d3dtx";
    end

    agent_sceneAgent = AgentFindInScene(RELIGHT_SceneObjectAgentName, RELIGHT_SceneObject);

    SetupFocusTargets();
end

RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus = function()
    agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject);
    string_currentCameraName = AgentGetName(agent_currentCamera);
    vector_currentCameraPosition = AgentGetWorldPos(agent_currentCamera);
    vector_currentCameraRotation = AgentGetWorldRot(agent_currentCamera);
    number_currentCameraFOV = AgentGetProperty(agent_currentCamera, "Field of View");

    bool_onNewCamera = CheckForNewCameraCut();

    -------------------------------------------------------------
    --once we have our valid agents, filter through that list to obtain the nearest/farthest targets

    local agent_nearFocusTarget = nil;
    local agent_farFocusTarget = nil;
    local vector_nearFocusTargetPosition = nil;
    local vector_farFocusTargetPosition = nil;

    for index, agent_validAgent in pairs(GetValidFocusTargets()) do
        if (agent_nearFocusTarget ~= nil) then
            agent_nearFocusTarget = TLSE_GetNearestAgent(agent_currentCamera, agent_nearFocusTarget, agent_validAgent);
        else
            agent_nearFocusTarget = agent_validAgent;
        end
        
        if (agent_farFocusTarget ~= nil) then
            agent_farFocusTarget = TLSE_GetFarthestAgent(agent_currentCamera, agent_farFocusTarget, agent_validAgent);
        else
            agent_farFocusTarget = agent_validAgent;
        end
    end
    
    --make sure that both the near and far targets don't reference the same agent
    if (AgentGetName(agent_farFocusTarget) == AgentGetName(agent_nearFocusTarget)) then
        agent_farFocusTarget = nil;
    end

    -------------------------------------------------------------
    if (agent_nearFocusTarget ~= nil) and (agent_farFocusTarget == nil) then --if our near target is assigned but our far target is nil
        bool_stateIsMultiTarget = false;
        bool_stateIsSingleTarget = true;
    elseif (agent_nearFocusTarget ~= nil) and (agent_farFocusTarget ~= nil) then --if both our near and far targets are assigned
        bool_stateIsMultiTarget = true;
        bool_stateIsSingleTarget = false;
    else --disable DOF because no targets are in the frame currently
        bool_stateIsMultiTarget = false;
        bool_stateIsSingleTarget = false;
    end
   
    -------------------------------------------------------------
    --disable DOF when a gameplay camera is in use
    --if the current active camera is a gameplay camera so to speak, then don't enable DOF

    for i, string_gameplayCameraName in pairs(RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames) do
        if (string_currentCameraName == string_gameplayCameraName) then
            bool_enableDOF = false;
            break
        else
            bool_enableDOF = true;
        end
    end

    -------------------------------------------------------------
    --if we have our targets and they aren't nil, then we need to then recalculate the vectors we will need
    
    --if we have a near target assigned, get the data we need
    if (agent_nearFocusTarget) then
        vector_nearFocusTargetPosition = AgentGetWorldPos(agent_nearFocusTarget);
        number_nearFocusTargetDistance = VectorDistance(vector_nearFocusTargetPosition, vector_currentCameraPosition);
    end
    
    --if we have a far target assigned, get the data we need
    if (agent_farFocusTarget) then
        vector_farFocusTargetPosition = AgentGetWorldPos(agent_farFocusTarget);
        number_farFocusTargetDistance = VectorDistance(vector_farFocusTargetPosition, vector_currentCameraPosition);
    end
    
    -------------------------------------------------------------
    --main DOF autofocus calculation

    if (bool_stateIsSingleTarget == true) then --only a single target is on screen
        number_currentFocalDistance = number_nearFocusTargetDistance;
        number_currentFocalRangeOffset = RELIGHT_DOF_AUTOFOCUS_FocalRange;
    elseif (bool_stateIsMultiTarget == true) then --both focus targets are on screen
        local vector_averagePosition = TLSE_VectorAverage(vector_nearFocusTargetPosition, vector_farFocusTargetPosition);
        local number_averageFocalDistance = VectorDistance(vector_averagePosition, vector_currentCameraPosition);
        local number_absoluteDistanceDifference = math.abs(number_nearFocusTargetDistance - number_farFocusTargetDistance);
        
        number_currentFocalDistance = number_averageFocalDistance;
        number_currentFocalRangeOffset = RELIGHT_DOF_AUTOFOCUS_FocalRange + (number_absoluteDistanceDifference / 2.0);
    else --disable DOF because neither targets are on screen
        --number_currentFocalDistance = 0;
        --number_currentFocalRangeOffset = 1000;
    end

    CalculateFocusProperties();
    ApplyDepthOfFieldSettings();

    string_previousCameraName = string_currentCameraName;
    vector_previousCameraPosition = vector_currentCameraPosition;
    vector_previousCameraRotation = vector_currentCameraRotation;
    number_previousCameraFOV = number_currentCameraFOV;
end