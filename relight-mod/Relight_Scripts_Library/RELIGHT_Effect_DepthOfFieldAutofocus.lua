--[[
Custom Depth of Field Autofocusing system.

This is a completely custom solution for doing depth of field within telltale.
It utilizes the oddly 3 different DOF tech that is implemented within the game (Legacy, Modern, Modern + Bokeh).
It's completely automated and designed mostly to implement DOF effects into Season 1/2 of the game since they don't utilize the tech.
Given the nature that its also automated, its not 100% perfect and there are some issues that might occur that are very hard to fix.

This script uses functions from the following lua scripts...
- RELIGHT_Core_AgentExtensions_Properties.lua
- RELIGHT_Core_AgentExtensions_Transform.lua
- RELIGHT_Core_AgentExtensions_Utillity.lua

WHEN IMPLEMENTING THIS INTO A LEVEL, YOU HAVE THE FOLLOWING

--relighting dof autofocus variables
RELIGHT_DOF_AUTOFOCUS_SceneObject = kScene;
RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName = kScene .. ".scene";
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

--previous variable values
local prev_cameraName = nil;
local prev_state_isDisabled = false;
local prev_nearFocusDistance = 0;
local prev_nearFallof = 0;
local prev_nearMax = 0;
local prev_farFocusDistance = 0;
local prev_farFalloff = 0;
local prev_farMax = 0;

--fix 1: this will try to keep the DOF turned on with the previous values if there are no longer valid targets in frame despite there being before while on the same camera.
local enable_fix1 = true; 

--disables cel shaded outlines in a scene
RELIGHT_Camera_DepthOfFieldAutofocus_SetupDOF = function(relightConfigLevel)
    local configDOF_state = relightConfigLevel.EnableDepthOfField;

    if(configDOF_state == false) then
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
end

RELIGHT_Camera_DepthOfFieldAutofocus_PerformAutofocus = function()
    --FUTURE ADDITION: would be nice to add smooth interpolation to the DOF so focus doesn't snap constantly if an object appears/dissapears offscreen

    -------------------------------------------------------------
    --get the current camera, normally we would just cache this but scene cameras change all the time
    local currentCamera_agent = SceneGetCamera(RELIGHT_DOF_AUTOFOCUS_SceneObject); --Agent type
    local currentCamera_camera = AgentGetCamera(currentCamera_agent); --Camera type
    local currentCamera_name = tostring(AgentGetName(currentCamera_agent)); --String type
    local currentCamera_far_plane = RELIGHT_AgentGetProperty(currentCamera_name, "Clip Plane - Far", RELIGHT_DOF_AUTOFOCUS_SceneObject); --Number type
    local currentCamera_near_plane = RELIGHT_AgentGetProperty(currentCamera_name, "Clip Plane - Near", RELIGHT_DOF_AUTOFOCUS_SceneObject); --Number type
    local currentCamera_position_vector = AgentGetWorldPos(currentCamera_agent); --Vector type
    local currentCamera_forward_vector = AgentGetForwardVec(currentCamera_agent); --Vector type
    
    --create our near target variables that will be filled with data later 
    local nearFocusTarget1_agent = nil; --Agent type (nil until it's assigned)
    local nearFocusTarget1_position_vector = nil; --Vector type (nil until it's assigned)
    local nearFocusTarget1_forward_vector = nil; --Vector type (nil until it's assigned)
    local nearFocusTarget1_vector_dot = nil; --Number type (nil until it's assigned)
    local nearFocusTarget1_distance = nil; --Number type (nil until it's assigned)
    
    --create our far target variables that will be filled with data later 
    local farFocusTarget2_agent = nil; --Agent type (nil until it's assigned)
    local farFocusTarget2_position_vector = nil; --Vector type (nil until it's assigned)
    local farFocusTarget2_forward_vector = nil; --Vector type (nil until it's assigned)
    local farFocusTarget2_vector_dot = nil; --Number type (nil until it's assigned)
    local farFocusTarget2_distance = nil; --Number type (nil until it's assigned)
    
    -------------------------------------------------------------
    --start by finding all of the valid targets within the scene
    
    --if the dot product is greater than the defined angle then they are not facing camera
    local rejectionAngle = RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_RejectionAngle"]; --goes from -1 to 1 (less than 0 is within the 180 forward facing fov of the given object)
    local rejectionDistance = RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_RejectionDistance"]; --the max distance before the agent is too far from camera to do autofocus
    
    --list of valid target agents
    local validAgentsArray = {}; --Agent array
    
    --find all of the valid target objects in the scene
    for i, objectName in ipairs(RELIGHT_DOF_AUTOFOCUS_ObjectEntries) do
        --initaliez our variables first (but don't assign them yet until we find out if the given object exists)
        local object_agent = nil; --Agent type
        local object_isOnScreen = nil; --bool type
        local object_isVisible = nil; --bool type
        local object_distance = nil; --number type
        local object_position_vector = nil; --Vector type
        local object_forward_vector = nil; --Vector type
        local object_vector_dot = nil; --number type
        
        --find the given object in the current scene
        object_agent = AgentFindInScene(objectName, RELIGHT_DOF_AUTOFOCUS_SceneObject); --Agent type
        
        --if the object exists
        if (object_agent) then
            --assign our variables
            object_isOnScreen = AgentIsOnScreen(object_agent);
            object_isVisible = RELIGHT_AgentGetProperty(objectName, "Runtime: Visible", RELIGHT_DOF_AUTOFOCUS_SceneObject);
            object_distance = AgentDistanceToAgent(object_agent, currentCamera_agent);
            object_position_vector = AgentGetWorldPos(object_agent);
            object_forward_vector = AgentGetForwardVec(object_agent);
            object_vector_dot = VectorDot(currentCamera_forward_vector, object_forward_vector);

            --variable to determine whether the given object is a valid target for autofocusing
            local isValidTarget = true;

            --check if the target is on the screen
            if (isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsOnScreen"]) and (object_isOnScreen == false) then isValidTarget = false; end
            
            --check if the target's visibillity is disabled
            if (isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsVisible"]) and (object_isVisible == false) then isValidTarget = false; end
            
            --check if the target is too far from camera
            if (isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsWithinDistance"]) and (object_distance > rejectionDistance) then isValidTarget = false; end

            --check if the target is not within the rejection angle relative to the camera
            if (isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsFacingCamera"]) and (object_vector_dot > rejectionAngle) then isValidTarget = false; end
            
            --perform a raycast, if the ray intersects with the scene then the target is occluded and therefore, not valid.
            if (isValidTarget == true) and (RELIGHT_DOF_AUTOFOCUS_Settings["TargetValidation_IsOccluded"]) and (RELIGHT_RaycastFromAgentToAgent(object_agent, currentCamera_agent) == true) then isValidTarget = false; end
            
            --if the target is valid and passed all of our checks
            if (isValidTarget == true) then
                --add it to the array of valid agents
                table.insert(validAgentsArray, object_agent);
            end
        end
    end
    
    -------------------------------------------------------------
    --once we have our valid agents, filter through that list to obtain the nearest/farthest targets
    
    --go through the array of valid agents
    for x, validAgent in ipairs(validAgentsArray) do
        --get the nearest agent
        if (nearFocusTarget1_agent) then
            --if our near target is assigned, then compare it with the next valid agent in the scene and return the closest one.
            nearFocusTarget1_agent = RELIGHT_GetNearestAgent(currentCamera_agent, nearFocusTarget1_agent, validAgent);
        else
            nearFocusTarget1_agent = validAgent;
        end
        
        --get the farthest agent
        if (farFocusTarget2_agent) then
            --if our near target is assigned, then compare it with the next valid agent in the scene and return the farthest one.
            farFocusTarget2_agent = RELIGHT_GetFarthestAgent(currentCamera_agent, farFocusTarget2_agent, validAgent);
        else
            farFocusTarget2_agent = validAgent;
        end
    end
    
    --make sure that both the near and far targets don't reference the same agent
    if (AgentGetName(farFocusTarget2_agent) == AgentGetName(nearFocusTarget1_agent)) then
        farFocusTarget2_agent = nil;
    end

    -------------------------------------------------------------
    --create our states
    local state_isMultiTarget = false; --bool type
    local state_isSingleTarget = false; --bool type
    local state_isDisabled = false; --bool type
    
    if (nearFocusTarget1_agent) and (not farFocusTarget2_agent) then
        --if our near target is assigned but our far target is nil
        state_isMultiTarget = false;
        state_isSingleTarget = true;
        state_isDisabled = false;
    elseif (nearFocusTarget1_agent) and (farFocusTarget2_agent) then
        --if both our near and far targets are assigned
        state_isMultiTarget = true;
        state_isSingleTarget = false;
        state_isDisabled = false;
    else
        --disable DOF because no targets are in the frame currently
        state_isMultiTarget = false;
        state_isSingleTarget = false;
        state_isDisabled = true;
    end
   
    -------------------------------------------------------------
    --disable DOF when a gameplay camera is in use
    --if the current active camera is a gameplay camera so to speak, then don't enable DOF

    --loop through all of the gameplay camera names that are defined in a scene
    for i, name in ipairs(RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames) do
        --if the current camera is infact a gameplay camera
        if (currentCamera_name == RELIGHT_DOF_AUTOFOCUS_GameplayCameraNames[i]) then
            --disable DOF, even if there are valid targets since currently we are on a gameplay camera
            state_isDisabled = true;
            
            break
        end
    end

    -------------------------------------------------------------
    --if we have our targets and they aren't nil, then we need to then recalculate the vectors we will need
    
    --if we have a near target assigned, get the data we need
    if (nearFocusTarget1_agent) then
        nearFocusTarget1_position_vector = AgentGetWorldPos(nearFocusTarget1_agent);
        nearFocusTarget1_forward_vector = AgentGetForwardVec(nearFocusTarget1_agent);
        nearFocusTarget1_vector_dot = VectorDot(currentCamera_forward_vector, nearFocusTarget1_forward_vector);
        nearFocusTarget1_distance = AgentDistanceToAgent(nearFocusTarget1_agent, currentCamera_agent);
    end
    
    --if we have a far target assigned, get the data we need
    if (farFocusTarget2_agent) then
        farFocusTarget2_position_vector = AgentGetWorldPos(farFocusTarget2_agent);
        farFocusTarget2_forward_vector = AgentGetForwardVec(farFocusTarget2_agent);
        farFocusTarget2_vector_dot = VectorDot(currentCamera_forward_vector, farFocusTarget2_forward_vector);
        farFocusTarget2_distance = AgentDistanceToAgent(farFocusTarget2_agent, currentCamera_agent);
    end
    
    -------------------------------------------------------------
    --main DOF autofocus calculation
    
    --main focus variables
    local focalRange = RELIGHT_DOF_AUTOFOCUS_FocalRange --USER ADJUSTABLE (the bigger in range, the more in focus)
    
    local focalDistance = 0 --dont touch
    local focalRangeOffset = focalRange --dont touch
    local focalFarMax = 0 --dont touch
    local focalNearMax = 0 --dont touch
    local focalFarFallof = 4 
    local focalNearFallof = 4
    
    --calculate focal distances
    if (state_isSingleTarget == true) then
        --only a single target is on screen

        focalDistance = nearFocusTarget1_distance
        focalRangeOffset = focalRange
        focalFarMax = currentCamera_far_plane / 2.0
        focalNearMax = focalDistance / 2.0
    elseif (state_isMultiTarget == true) then
        --both focus targets are on screen
        
        --average both of their positions
        local a_x = nearFocusTarget1_position_vector.x
        local a_y = nearFocusTarget1_position_vector.y
        local a_z = nearFocusTarget1_position_vector.z
        
        local b_x = farFocusTarget2_position_vector.x
        local b_y = farFocusTarget2_position_vector.y
        local b_z = farFocusTarget2_position_vector.z
        
        local averaged_x = (a_x + b_x) / 2.0
        local averaged_y = (a_y + b_y) / 2.0
        local averaged_z = (a_z + b_z) / 2.0
        
        local averagePosition = Vector(averaged_x, averaged_y, averaged_z)
        
        --get the distance of the newly calculated average distance relative to the camera
        local averageFocalDistance = VectorDistance(averagePosition, currentCamera_position_vector)
        
        --get the distance difference between the two focus targets
        local distanceDifference = nearFocusTarget1_distance - farFocusTarget2_distance
        local absoluteDistanceDifference = math.abs(distanceDifference) --get the absolute value
        
        --add the distance difference to extend the depth of field so both the nearest and farthest targets are in focus
        focalDistance = averageFocalDistance
        focalRangeOffset = focalRange + (absoluteDistanceDifference / 2.0)
        focalFarMax = currentCamera_far_plane / 2.0
        focalNearMax = focalDistance / 2.0
    elseif (state_isDisabled == true) then
        --disable DOF because neither christa nor clem are on screen
        focalDistance = 0
        focalRangeOffset = 1000000
        focalFarMax = 0
        focalNearMax = 0
    end

    -------------------------------------------------------------
    --assign our final calculated focusing values to the camera
    
    --get our current values
    local current_nearFocusDistance = focalDistance - focalRangeOffset;
    local current_nearFallof = focalNearFallof;
    local current_nearMax = focalNearMax;
    local current_farFocusDistance = focalDistance + focalRangeOffset;
    local current_farFalloff = focalFarFallof;
    local current_farMax = focalFarMax;
    local current_enabledDOF = not state_isDisabled;

    --perform fix 1
    if (enable_fix1 == true) then
        --if we are on the same camera as the previous frame
        if (currentCamera_name == prev_cameraName) then
            --if currently DOF is disabled but wasn't before, then enable it
            if (current_enabledDOF == false) and (prev_state_isDisabled == false) then
                current_nearFocusDistance = prev_nearFocusDistance;
                current_nearFallof = prev_nearFallof;
                current_nearMax = prev_nearMax;
                current_farFocusDistance = prev_farFocusDistance;
                current_farFalloff = prev_farFalloff;
                current_farMax = prev_farMax;
                current_enabledDOF = true;
            end
        end
    end

    if (RELIGHT_DOF_AUTOFOCUS_UseCameraDOF == true) then
        --Use the DOF properties on the camera itself
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field Enabled", current_enabledDOF, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(currentCamera_name, "Use High Quality DOF", true, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field Type", 1, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field Blur Strength", 3, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field Coverage Boost", 1, RELIGHT_DOF_AUTOFOCUS_SceneObject)

        if(RELIGHT_DOF_AUTOFOCUS_UseHighQualityDOF == true) then
            RELIGHT_AgentSetProperty(currentCamera_name, "Use Bokeh", true, RELIGHT_DOF_AUTOFOCUS_SceneObject)

            RELIGHT_AgentSetProperty(currentCamera_name, "Bokeh Brightness Delta Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBrightnessDeltaThreshold, RELIGHT_DOF_AUTOFOCUS_SceneObject)
            RELIGHT_AgentSetProperty(currentCamera_name, "Bokeh Brightness Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBrightnessThreshold, RELIGHT_DOF_AUTOFOCUS_SceneObject)
            RELIGHT_AgentSetProperty(currentCamera_name, "Bokeh Blur Threshold", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehBlurThreshold, RELIGHT_DOF_AUTOFOCUS_SceneObject)
            RELIGHT_AgentSetProperty(currentCamera_name, "Bokeh Min Size", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehMinSize, RELIGHT_DOF_AUTOFOCUS_SceneObject)
            RELIGHT_AgentSetProperty(currentCamera_name, "Bokeh Max Size", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehMaxSize, RELIGHT_DOF_AUTOFOCUS_SceneObject)
            RELIGHT_AgentSetProperty(currentCamera_name, "Bokeh Falloff", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehFalloff, RELIGHT_DOF_AUTOFOCUS_SceneObject)
            RELIGHT_AgentSetProperty(currentCamera_name, "Max Bokeh Buffer Amount", RELIGHT_DOF_AUTOFOCUS_BokehSettings.MaxBokehBufferAmount, RELIGHT_DOF_AUTOFOCUS_SceneObject)
            RELIGHT_AgentSetProperty(currentCamera_name, "Bokeh Pattern Texture", RELIGHT_DOF_AUTOFOCUS_BokehSettings.BokehPatternTexture, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        else
            RELIGHT_AgentSetProperty(currentCamera_name, "Use Bokeh", false, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        end

        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field - Far", current_farFocusDistance, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field Fall Off - Far", current_farFalloff, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field Max - Far", current_farMax, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field - Near", current_nearFocusDistance, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field Fall Off - Near", current_nearFallof, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(currentCamera_name, "Depth Of Field Max - Near", current_nearMax, RELIGHT_DOF_AUTOFOCUS_SceneObject)
    else
        --Use the DOF properties on the scene post processing itself
        RELIGHT_AgentSetProperty(RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName, "FX DOF Enabled", current_enabledDOF, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        
        RELIGHT_AgentSetProperty(RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName, "FX DOF Far", current_farFocusDistance, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName, "FX DOF Far Falloff", current_farFalloff, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName, "FX DOF Far Max", current_farMax, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        
        RELIGHT_AgentSetProperty(RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName, "FX DOF Near", current_nearFocusDistance, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName, "FX DOF Near Falloff", current_nearFallof, RELIGHT_DOF_AUTOFOCUS_SceneObject)
        RELIGHT_AgentSetProperty(RELIGHT_DOF_AUTOFOCUS_SceneObjectAgentName, "FX DOF Near Max", current_nearMax, RELIGHT_DOF_AUTOFOCUS_SceneObject)
    end
    
    --assign previous values
    prev_cameraName = currentCamera_name;
    prev_state_isDisabled = state_isDisabled;
    prev_nearFocusDistance = current_nearFocusDistance;
    prev_nearFallof = current_nearFallof;
    prev_nearMax = current_nearMax;
    prev_farFocusDistance = current_farFocusDistance;
    prev_farFalloff = current_farFalloff;
    prev_farMax = current_farMax;
end