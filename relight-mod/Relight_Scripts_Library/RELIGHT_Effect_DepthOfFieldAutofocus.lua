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
    BokehBrightnessDeltaThreshold = 0.02,
    BokehBrightnessThreshold = 0.02,
    BokehBlurThreshold = 0.02,
    BokehMinSize = 0.0,
    BokehMaxSize = 0.035,
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

--disables cel shaded outlines in a scene
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
    for i, string_objectEntryName in ipairs(RELIGHT_DOF_AUTOFOCUS_ObjectEntries) do
        --find the given object in the current scene
        local agent_objectEntry = AgentFindInScene(string_objectEntryName, RELIGHT_SceneObject); --Agent type
        
        --if the object exists
        if (agent_objectEntry) then
            --assign our variables
            local bool_isObjectOnScreen = AgentIsOnScreen(agent_objectEntry);
            local bool_isObjectVisible = AgentGetProperty(agent_objectEntry, "Runtime: Visible");
            local number_objectDistance = AgentDistanceToAgent(agent_objectEntry, agent_currentCamera);
            local vector_objectForward = AgentGetForwardVec(agent_objectEntry);
            local number_objectDotProduct = VectorDot(vector_currentCameraForward, vector_objectForward);

            --variable to determine whether the given object is a valid target for autofocusing
            local bool_isValidTarget = true;

            --check if the target is on the screen
            if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsOnScreen"]) and (bool_isObjectOnScreen == false) then bool_isValidTarget = false; end
            
            --check if the target's visibillity is disabled
            if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsVisible"]) and (bool_isObjectVisible == false) then bool_isValidTarget = false; end
            
            --check if the target is too far from camera
            if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsWithinDistance"]) and (number_objectDistance > number_rejectionDistance) then bool_isValidTarget = false; end

            --check if the target is not within the rejection angle relative to the camera
            if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsFacingCamera"]) and (number_objectDotProduct > number_rejectionAngle) then bool_isValidTarget = false; end
            
            --perform a raycast, if the ray intersects with the scene then the target is occluded and therefore, not valid.
            --if (bool_isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsOccluded"]) and (RELIGHT_RaycastFromAgentToAgent(agent_objectEntry, agent_currentCamera) == true) then bool_isValidTarget = false; end
            
            --if the target is valid and passed all of our checks
            if (bool_isValidTarget == true) then
                --add it to the array of valid agents
                table.insert(agentTable_validAgents, agent_objectEntry);
            end
        end
    end

    return agentTable_validAgents;
end

local ApplyDepthOfFieldSettings = function()
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject); --Agent type

    if (RELIGHT_DOF_AUTOFOCUS_UseCameraDOF == true) then
        --Use the DOF properties on the camera itself
        AgentSetProperty(agent_currentCamera, "Depth Of Field Enabled", bool_currentEnabledDOF);
        AgentSetProperty(agent_currentCamera, "Use High Quality DOF", true);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Type", 1);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Blur Strength", 3);
        AgentSetProperty(agent_currentCamera, "Depth Of Field Coverage Boost", 1);

        if(RELIGHT_DOF_AUTOFOCUS_UseHighQualityDOF == true) then
            AgentSetProperty(agent_currentCamera, "Use Bokeh", true, RELIGHT_SceneObject);
            AgentSetProperty(agent_currentCamera, "Bokeh Brightness Delta Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBrightnessDeltaThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Brightness Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBrightnessThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Blur Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBlurThreshold);
            AgentSetProperty(agent_currentCamera, "Bokeh Min Size", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehMinSize);
            AgentSetProperty(agent_currentCamera, "Bokeh Max Size", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehMaxSize);
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

RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus = function()
    --FUTURE ADDITION: would be nice to add smooth interpolation to the DOF so focus doesn't snap constantly if an object appears/dissapears offscreen

    -------------------------------------------------------------
    --get the current camera, normally we would just cache this but scene cameras change all the time
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject); --Agent type
    local string_currentCameraName = tostring(AgentGetName(agent_currentCamera)); --String type
    local number_currentCameraFarPlane = AgentGetProperty(agent_currentCamera, "Clip Plane - Far"); --Number type
    local number_currentCameraNearPlane = AgentGetProperty(agent_currentCamera, "Clip Plane - Near"); --Number type
    local vector_currentCameraPosition = AgentGetWorldPos(agent_currentCamera); --Vector type
        
    -------------------------------------------------------------
    --start by finding all of the valid targets within the scene
    
    --list of valid target agents
    local agentTable_validAgents = GetValidTargetsFromEntries();
    
    -------------------------------------------------------------
    --once we have our valid agents, filter through that list to obtain the nearest/farthest targets
    
    --create our near target variables that will be filled with data later 
    local agent_nearFocusTarget = nil;
    local vector_nearFocusTargetPosition = nil;
    local number_nearFocusTargetDistance = nil;
    
    --create our far target variables that will be filled with data later 
    local agent_farFocusTarget = nil;
    local vector_farFocusTargetPosition = nil;
    local number_farFocusTargetDistance = nil;

    --go through the array of valid agents
    for x, agent_validAgent in ipairs(agentTable_validAgents) do
        --get the nearest agent
        if (agent_nearFocusTarget) then
            --if our near target is assigned, then compare it with the next valid agent in the scene and return the closest one.
            agent_nearFocusTarget = RELIGHT_GetNearestAgent(agent_currentCamera, agent_nearFocusTarget, agent_validAgent);
        else
            agent_nearFocusTarget = agent_validAgent;
        end
        
        --get the farthest agent
        if (agent_farFocusTarget) then
            --if our near target is assigned, then compare it with the next valid agent in the scene and return the farthest one.
            agent_farFocusTarget = RELIGHT_GetFarthestAgent(agent_currentCamera, agent_farFocusTarget, agent_validAgent);
        else
            agent_farFocusTarget = agent_validAgent;
        end
    end
    
    --make sure that both the near and far targets don't reference the same agent
    if (AgentGetName(agent_farFocusTarget) == AgentGetName(agent_nearFocusTarget)) then
        agent_farFocusTarget = nil;
    end

    -------------------------------------------------------------
    --create our states
    local bool_stateIsMultiTarget = false; --bool type
    local bool_stateIsSingleTarget = false; --bool type
    local bool_stateIsDisabled = false; --bool type
    
    if (agent_nearFocusTarget) and (not agent_farFocusTarget) then
        --if our near target is assigned but our far target is nil
        bool_stateIsMultiTarget = false;
        bool_stateIsSingleTarget = true;
        bool_stateIsDisabled = false;
    elseif (agent_nearFocusTarget) and (agent_farFocusTarget) then
        --if both our near and far targets are assigned
        bool_stateIsMultiTarget = true;
        bool_stateIsSingleTarget = false;
        bool_stateIsDisabled = false;
    else
        --disable DOF because no targets are in the frame currently
        bool_stateIsMultiTarget = false;
        bool_stateIsSingleTarget = false;
        bool_stateIsDisabled = true;
    end
   
    -------------------------------------------------------------
    --disable DOF when a gameplay camera is in use
    --if the current active camera is a gameplay camera so to speak, then don't enable DOF

    --loop through all of the gameplay camera names that are defined in a scene
    for i, name in ipairs(RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames) do
        --if the current camera is infact a gameplay camera
        if (string_currentCameraName == RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames[i]) then
            --disable DOF, even if there are valid targets since currently we are on a gameplay camera
            bool_stateIsDisabled = true;
            
            break
        end
    end

    -------------------------------------------------------------
    --if we have our targets and they aren't nil, then we need to then recalculate the vectors we will need
    
    --if we have a near target assigned, get the data we need
    if (agent_nearFocusTarget) then
        vector_nearFocusTargetPosition = AgentGetWorldPos(agent_nearFocusTarget);
        number_nearFocusTargetDistance = AgentDistanceToAgent(agent_nearFocusTarget, agent_currentCamera);
    end
    
    --if we have a far target assigned, get the data we need
    if (agent_farFocusTarget) then
        vector_farFocusTargetPosition = AgentGetWorldPos(agent_farFocusTarget);
        number_farFocusTargetDistance = AgentDistanceToAgent(agent_farFocusTarget, agent_currentCamera);
    end
    
    -------------------------------------------------------------
    --main DOF autofocus calculation
    
    --main focus variables
    number_focalRange = RELIGHT_DOF_AUTOFOCUS_FocalRange;
    number_focalDistance = 0;
    number_focalRangeOffset = number_focalRange; 
    number_focalFarMax = 0;
    number_focalNearMax = 0;
    number_focalFarFallof = 4; 
    number_focalNearFallof = 4;
    
    --calculate focal distances
    if (bool_stateIsSingleTarget == true) then
        --only a single target is on screen

        number_focalDistance = number_nearFocusTargetDistance;
        number_focalRangeOffset = number_focalRange;
        number_focalFarMax = number_currentCameraFarPlane / 2.0;
        number_focalNearMax = number_focalDistance / 2.0;
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
        number_focalDistance = number_averageFocalDistance;
        number_focalRangeOffset = number_focalRange + (number_absoluteDistanceDifference / 2.0);
        number_focalFarMax = number_currentCameraFarPlane / 2.0;
        number_focalNearMax = number_focalDistance / 2.0;
    elseif (bool_stateIsDisabled == true) then
        --disable DOF because neither targets are on screen
        number_focalDistance = 0;
        number_focalRangeOffset = 1000000;
        number_focalFarMax = 0;
        number_focalNearMax = 0;
    end

    -------------------------------------------------------------
    --assign our final calculated focusing values to the camera
    
    --get our current values
    number_currentNearFocusDistance = number_focalDistance - number_focalRangeOffset;
    number_currentNearFallof = number_focalNearFallof;
    number_currentNearMax = number_focalNearMax;
    number_currentFarFocusDistance = number_focalDistance + number_focalRangeOffset;
    number_currentFarFalloff = number_focalFarFallof;
    number_currentFarMax = number_focalFarMax;
    bool_currentEnabledDOF = not bool_stateIsDisabled;

    ApplyDepthOfFieldSettings();
end