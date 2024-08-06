--[[
Custom Depth of Field Autofocusing system.

This is a completely custom solution for doing depth of field within telltale.
It utilizes the oddly 3 different DOF tech that is implemented within the game (Legacy, Modern, Modern + Bokeh).
It's completely automated and designed mostly to implement DOF effects into Season 1/2 of the game since they don't utilize the tech.
Given the nature that its also automated, its not 100% perfect and there are some issues that might occur that are very hard to fix.


--relighting dof autofocus variables
RELIGHT_DOF_AUTOFOCUS_UseCameraDOF = false;
RELIGHT_DOF_AUTOFOCUS_UseLegacyDOF = true;
RELIGHT_DOF_AUTOFOCUS_UseHighQualityDOF = true;
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
    TargetValidation_IsOccluded = false,
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
    BokehPatternTexture = "bokeh_circle.d3dtx"
};

And in the main function of the level script you add the functionality like so...

Callback_OnPostUpdate:Add(RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus)
]]--

local agent_sceneAgent = nil;

--main focus variables
local number_focalRange = RELIGHT_DOF_AUTOFOCUS_FocalRange;
local number_focalDistance = 0;
local number_focalRangeOffset = number_focalRange; 
local number_focalFarMax = 0;
local number_focalNearMax = 0;
local number_focalFarFallof = 4; 
local number_focalNearFallof = 4;
local number_currentNearFocusDistance = 0;
local number_currentNearFallof = 0;
local number_currentNearMax = 0;
local number_currentFarFocusDistance = 0;
local number_currentFarFalloff = 0;
local number_currentFarMax = 0;
local bool_currentEnabledDOF = false;

local number_nearFocusTargetDistance = 0;
local number_farFocusTargetDistance = 0;

local number_bokehSize = 0;

local vector_sensorSize_16mm = Vector(10.26, 7.49, 0);
local vector_sensorsSize_MicroFourThirds = Vector(18, 13.5, 0);
local vector_sensorsSize_Super35mm = Vector(24, 14, 0);
local vector_sensorsSize_35mmFullFrame = Vector(36, 24, 0);
local vector_sensorsSize_MeduimFormat645 = Vector(42, 56, 0);
local vector_sensorsSize_IMAX = Vector(70.4, 52.6, 0);
local vector_sensorsSize_4x5 = Vector(127, 102, 0);

local agentTable_focusTargets = {};

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

local CalculateCameraProperties = function()
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject);
    local number_currentCameraFarPlane = AgentGetProperty(agent_currentCamera, "Clip Plane - Far"); --Number type
    local number_currentCameraNearPlane = AgentGetProperty(agent_currentCamera, "Clip Plane - Near"); --Number type
    local number_horizontalFOV = AgentGetProperty(agent_currentCamera, "Field Of View"); --NOTE: according to ida, CameraGetFOV returns the horizontal FOV
    local number_FOVScale = AgentGetProperty(agent_currentCamera, "Field Of View Scale");
    local number_finalHorizontalFOV = number_horizontalFOV * number_FOVScale;
    --local number_finalVerticalFOV = number_finalHorizontalFOV / GetAspectRatio();d
    local number_focalDistanceInMM = number_focalDistance * 1000; --NOTE: Multiply by 1000 to be in milimeters

    local number_radiansHorizontalFOV = math.rad(number_finalHorizontalFOV);
    --local number_radiansVerticalFOV = math.rad(number_finalVerticalFOV);

    local number_aperture = RELIGHT_DOF_AUTOFOCUS_Aperture;

    local vector_sensorSize = vector_sensorsSize_35mmFullFrame;
    local number_sensordiagonalSize = math.sqrt((vector_sensorSize.x * vector_sensorSize.x) + (vector_sensorSize.y * vector_sensorSize.y));
    local number_horizontalMagnification = vector_sensorSize.x / number_radiansHorizontalFOV;

    --FORMULA | circle of confusion (CoC) = sensor diagonal / 1500
    local number_circleOfConfusionConstant = number_sensordiagonalSize / 1500; --NOTE: 1500 is modern standard approximation, 1000 is traditional zeiss standard, 1730 is sometimes used.

    local number_horizontalFocalLength = vector_sensorSize.x / (2 * math.tan(number_radiansHorizontalFOV / 2));
    --local number_verticalFocalLength = vector_sensorSize.y / (2 * math.tan(number_radiansVerticalFOV / 2));

    local number_hyperfocalDistance = (number_horizontalFocalLength * number_horizontalFocalLength) / (number_aperture * number_circleOfConfusionConstant) + number_horizontalFocalLength;
    local number_circleOfConfusion = (number_horizontalFocalLength * number_horizontalFocalLength * (number_focalDistanceInMM - number_hyperfocalDistance)) / (number_focalDistanceInMM * number_aperture * (number_hyperfocalDistance - number_horizontalFocalLength));
    number_circleOfConfusion = math.abs(number_circleOfConfusion);

    --NOTE: despite the effort here for getting a physically accurate near/far plane calculation for the given "exposure", the bokeh size here is not 100% accurate so it was eyeballed a bit to get it to roughly match reality.
    number_bokehSize = TLSE_NumberClamp(number_circleOfConfusion / 16, 0, RELIGHT_DOF_AUTOFOCUS_BokehSettings["BokehMaxSizeClamp"]);

    local number_nearFocusDistance = (number_hyperfocalDistance * number_focalDistanceInMM) / (number_hyperfocalDistance + (number_focalDistanceInMM - number_horizontalFocalLength));
    local number_farFocusDistance = (number_hyperfocalDistance * number_focalDistanceInMM) / (number_hyperfocalDistance - (number_focalDistanceInMM - number_horizontalFocalLength));

    number_currentNearFocusDistance = number_nearFocusDistance / 1000; --NOTE: Divide by 1000 to get value in meters
    number_currentFarFocusDistance = number_farFocusDistance / 1000; --NOTE: Divide by 1000 to get value in meters
    
    --add focal range offset
    number_currentNearFocusDistance = number_currentNearFocusDistance - RELIGHT_DOF_AUTOFOCUS_FocalRange;
    number_currentFarFocusDistance = number_currentFarFocusDistance + RELIGHT_DOF_AUTOFOCUS_FocalRange;

    number_currentFarFalloff = 1 / number_circleOfConfusion; 
    number_currentNearFallof = 1 / number_circleOfConfusion; 
end

local GetValidTargetsFromEntries = function()
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject); --Agent type
    local vector_currentCameraForward = AgentGetForwardVec(agent_currentCamera); --Vector type

    --if the dot product is greater than the defined angle then they are not facing camera
    local number_rejectionAngle = RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_RejectionAngle"]; --goes from -1 to 1 (less than 0 is within the 180 forward facing fov of the given object)
    local number_rejectionDistance = RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_RejectionDistance"]; --the max distance before the agent is too far from camera to do autofocus

    --list of valid target agents
    local agentTable_validAgents = {}; --Agent array
    
    --find all of the valid target objects in the scene
    for i, agent_focusTarget in ipairs(agentTable_focusTargets) do
        local bool_isObjectOnScreen = AgentIsOnScreen(agent_focusTarget);
        local bool_isObjectVisible = AgentGetProperty(AgentGetParent(agent_focusTarget), "Runtime: Visible");
        local number_objectDistance = AgentDistanceToAgent(agent_focusTarget, agent_currentCamera);

        --local vector_objectForward = AgentGetForwardVec(agent_focusTarget);
        --local vector_objectForward = AgentGetRightVec(agent_focusTarget);
        local vector_objectForward = TLSE_VectorAverage(AgentGetForwardVec(agent_focusTarget), AgentGetForwardVec(AgentGetParent(agent_focusTarget)));


        local number_objectDotProduct = VectorDot(vector_currentCameraForward, vector_objectForward);
        local bool_isValidTarget = true;

        if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsOnScreen"]) and (bool_isObjectOnScreen == false) then bool_isValidTarget = false; end

        if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsVisible"]) and (bool_isObjectVisible == false) then bool_isValidTarget = false; end

        if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsWithinDistance"]) and (number_objectDistance > number_rejectionDistance) then bool_isValidTarget = false; end

        if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsFacingCamera"]) and (number_objectDotProduct < number_rejectionAngle) then bool_isValidTarget = false; end
            
        --if the target is valid and passed all of our checks
        if (bool_isValidTarget == true) then
            table.insert(agentTable_validAgents, agent_focusTarget);
        end
    end

    return agentTable_validAgents;
end

local ApplyDepthOfFieldSettings = function()
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject); --Agent type

    CalculateCameraProperties();

    if (RELIGHT_DOF_AUTOFOCUS_UseCameraDOF == true) then
        --Use the DOF properties on the camera itself
        AgentSetProperty(agent_currentCamera, "Depth Of Field Enabled", bool_currentEnabledDOF);
        AgentSetProperty(agent_currentCamera, "Use High Quality DOF", true);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Type", 1);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Blur Strength", 15);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Coverage Boost", 5);

        if(RELIGHT_DOF_AUTOFOCUS_UseHighQualityDOF == true) then
            AgentSetProperty(agent_currentCamera, "Use Bokeh", true, RELIGHT_SceneObject);
            AgentSetProperty(agent_currentCamera, "Bokeh Brightness Delta Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBrightnessDeltaThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Brightness Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBrightnessThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Blur Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBlurThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Min Size", 0);
            AgentSetProperty(agent_currentCamera, "Bokeh Max Size", number_bokehSize);
            AgentSetProperty(agent_currentCamera, "Bokeh Falloff", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehFalloff);
            AgentSetProperty(agent_currentCamera, "Max Bokeh Buffer Amount", RELIGHT_DOF_AUTOFOCUS_BokehSettings.MaxBokehBufferAmount);
            AgentSetProperty(agent_currentCamera, "Bokeh Pattern Texture", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehPatternTexture);
        else
            AgentSetProperty(agent_currentCamera, "Use Bokeh", false);
        end

        AgentSetProperty(agent_currentCamera, "Depth Of Field - Far", number_currentFarFocusDistance);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Fall Off - Far", number_currentFarFalloff);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Max - Far", number_currentFarMax);
        AgentSetProperty(agent_currentCamera, "Depth Of Field - Near", number_currentNearFocusDistance);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Fall Off - Near", number_currentNearFallof);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Max - Near", number_currentNearMax);
    else
        --Use the DOF properties on the scene post processing itself
        AgentSetProperty(agent_sceneAgent, "FX DOF Enabled", bool_currentEnabledDOF);
        AgentSetProperty(agent_sceneAgent, "FX DOF Far", number_currentFarFocusDistance);
        AgentSetProperty(agent_sceneAgent, "FX DOF Far Falloff", number_currentFarFalloff);
        AgentSetProperty(agent_sceneAgent, "FX DOF Far Max", number_currentFarMax);
        AgentSetProperty(agent_sceneAgent, "FX DOF Near", number_currentNearFocusDistance);
        AgentSetProperty(agent_sceneAgent, "FX DOF Near Falloff", number_currentNearFallof);
        AgentSetProperty(agent_sceneAgent, "FX DOF Near Max", number_currentNearMax);
    end
end

RELIGHT_Camera_DepthOfFieldAutofocus_SetupDOF = function(relightConfigLevel)
    --local bool_dofEnabled = relightConfigLevel.EnableDepthOfField;
    local bool_dofEnabled = true;

    if(bool_dofEnabled == false) then
        RenderSetFeatureEnabled("dof", false);
        RenderSetFeatureEnabled("bokeh", false);
        do return end
    end

    RenderSetFeatureEnabled("dof", true);

    if(RELIGHT_DOF_AUTOFOCUS_UseLegacyDOF == true) then
        PropertySet(GetPreferences(), "Use Legacy DOF", true);
        RenderSetFeatureEnabled("bokeh", false);
    else
        PropertySet(GetPreferences(), "Use Legacy DOF", false);
        RenderSetFeatureEnabled("bokeh", true);
    end

    agent_sceneAgent = AgentFindInScene(RELIGHT_SceneObjectAgentName, RELIGHT_SceneObject);

    SetupFocusTargets();
end

RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus = function()
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject);
    local string_currentCameraName = tostring(AgentGetName(agent_currentCamera));
    local vector_currentCameraPosition = AgentGetWorldPos(agent_currentCamera);

    local agentTable_validAgents = GetValidTargetsFromEntries();
    
    -------------------------------------------------------------
    --once we have our valid agents, filter through that list to obtain the nearest/farthest targets

    local agent_nearFocusTarget = nil;
    local agent_farFocusTarget = nil;
    local vector_nearFocusTargetPosition = nil;
    local vector_farFocusTargetPosition = nil;

    for index, agent_validAgent in pairs(agentTable_validAgents) do
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
    local bool_stateIsMultiTarget = false; 
    local bool_stateIsSingleTarget = false;
    local bool_stateIsDisabled = false;
    
    if (agent_nearFocusTarget) and (not agent_farFocusTarget) then --if our near target is assigned but our far target is nil
        bool_stateIsMultiTarget = false;
        bool_stateIsSingleTarget = true;
        bool_stateIsDisabled = false;
    elseif (agent_nearFocusTarget) and (agent_farFocusTarget) then --if both our near and far targets are assigned
        bool_stateIsMultiTarget = true;
        bool_stateIsSingleTarget = false;
        bool_stateIsDisabled = false;
    else --disable DOF because no targets are in the frame currently
        bool_stateIsMultiTarget = false;
        bool_stateIsSingleTarget = false;
        bool_stateIsDisabled = true;
    end
   
    -------------------------------------------------------------
    --disable DOF when a gameplay camera is in use
    --if the current active camera is a gameplay camera so to speak, then don't enable DOF

    for i, string_gameplayCameraName in pairs(RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames) do
        if (string_currentCameraName == string_gameplayCameraName) then
            bool_stateIsDisabled = true;
            break
        end
    end

    -------------------------------------------------------------
    --if we have our targets and they aren't nil, then we need to then recalculate the vectors we will need
    
    --if we have a near target assigned, get the data we need
    if (agent_nearFocusTarget) then
        --vector_nearFocusTargetPosition = GetClosestFocusPosition(agent_nearFocusTarget, vector_currentCameraPosition);
        vector_nearFocusTargetPosition = AgentGetWorldPos(agent_nearFocusTarget);
        number_nearFocusTargetDistance = VectorDistance(vector_nearFocusTargetPosition, vector_currentCameraPosition);
    end
    
    --if we have a far target assigned, get the data we need
    if (agent_farFocusTarget) then
        --vector_farFocusTargetPosition = GetClosestFocusPosition(agent_farFocusTarget, vector_currentCameraPosition);
        vector_farFocusTargetPosition = AgentGetWorldPos(agent_farFocusTarget);
        number_farFocusTargetDistance = VectorDistance(vector_farFocusTargetPosition, vector_currentCameraPosition);
    end
    
    -------------------------------------------------------------
    --main DOF autofocus calculation

    number_focalRange = RELIGHT_DOF_AUTOFOCUS_FocalRange;
    number_focalDistance = 0;
    number_focalRangeOffset = number_focalRange; 
    number_focalFarMax = 1;
    number_focalNearMax = 1;
    number_focalFarFallof = 4; 
    number_focalNearFallof = 4;
    
    --calculate focal distances
    if (bool_stateIsSingleTarget == true) then
        --only a single target is on screen

        number_focalDistance = number_nearFocusTargetDistance;
        number_focalRangeOffset = number_focalRange;
    elseif (bool_stateIsMultiTarget == true) then
        --both focus targets are on screen
        
        --average both of their positions
        local vector_averagePosition = TLSE_VectorAverage(vector_nearFocusTargetPosition, vector_farFocusTargetPosition);

        --get the distance of the newly calculated average distance relative to the camera
        local number_averageFocalDistance = VectorDistance(vector_averagePosition, vector_currentCameraPosition);
        
        --get the distance difference between the two focus targets
        local number_distanceDifference = number_nearFocusTargetDistance - number_farFocusTargetDistance;
        local number_absoluteDistanceDifference = math.abs(number_distanceDifference); --get the absolute value
        
        --add the distance difference to extend the depth of field so both the nearest and farthest targets are in focus
        --number_focalDistance = number_averageFocalDistance;
        --number_focalRangeOffset = number_focalRange + (number_absoluteDistanceDifference / 2.0);
        number_focalDistance = number_nearFocusTargetDistance;
        number_focalRangeOffset = number_focalRange;
    elseif (bool_stateIsDisabled == true) then
        --disable DOF because neither targets are on screen
        number_focalDistance = 0;
        number_focalRangeOffset = 1000000;
    end

    -------------------------------------------------------------
    --assign our final calculated focusing values to the camera
    
    --get our current values
    number_currentNearFocusDistance = number_focalDistance - number_focalRangeOffset;
    number_currentNearFallof = 0;
    number_currentNearMax = 6;
    number_currentFarFocusDistance = number_focalDistance + number_focalRangeOffset;
    number_currentFarFalloff = 0;
    number_currentFarMax = 6;
    bool_currentEnabledDOF = not bool_stateIsDisabled;

    ApplyDepthOfFieldSettings();
end