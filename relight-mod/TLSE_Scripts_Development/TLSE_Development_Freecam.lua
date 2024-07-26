--[[
Custom Development Tools/Functions script

THIS SCRIPT IS FOR HANDLING FREECAM

This script also uses functions from the following lua scripts...
- TLSE_AgentExtensions.lua
- TLSE_Printing.lua

WHEN IMPLEMENTING THIS INTO A LEVEL, YOU MUST DO THE FOLLOWING...

1. At the top of the script, you must have a variable that is named
- TLSE_Development_SceneObject
This will just simply contain a reference to the kScene variable so the function can reference object from the scene.

2. At the top of the script, you must have a variable that is named
- TLSE_Development_SceneObjectAgentName
This will just simply contain a reference to the scene agent name.

3. In the main function of the level script you call this function before step 2
TLSE_Development_CreateFreeCamera()

4. Lastly, also in the main function of the level script you add the functionality like so...

Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera)
]]--

--TLSE_Development_SceneObject
--TLSE_Development_SceneObjectAgentName
--TLSE_Development_UseSeasonOneAPI
--TLSE_Development_FreecamUseFOVScale

--|||||||||||||||||||||||||||||||||||||||||||||||| USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
TLSE_Development_Freecam_SnappyZoom = false; --controls whether the zooming actions will be smoothed out over time, or instant
TLSE_Development_Freecam_SnappyMovement = false; --controls whether the movement actions will be smoothed out over time, or instant
TLSE_Development_Freecam_SnappyRotation = false; --controls whether the rotation/looking actions will be smoothed out over time, or instant
TLSE_Development_Freecam_PositionLerpFactor = 5.0; --(if snappy movement is disabled) lower values = more smoothing | higher values = less smoothing
TLSE_Development_Freecam_RotationLerpFactor = 10.0; --(if snappy rotation is disabled) lower values = more smoothing | higher values = less smoothing
TLSE_Development_Freecam_ZoomLerpFactor = 10.0; --(if snappy zooming is disabled) lower values = more smoothing | higher values = less smoothing
TLSE_Development_Freecam_PositionIncrementDefault = 0.025; --camera movement speed (lower values = slower | higher values = faster)
TLSE_Development_Freecam_PositionIncrementShift = 0.25; --camera movement speed when holding down shift (lower values = slower | higher values = faster)
TLSE_Development_Freecam_FovIncrement = 0.5; --camera zooming speed (lower values = slower | higher values = faster)
TLSE_Development_Freecam_FovMax = 179; --the maximum field of view for the camera when zooming out
TLSE_Development_Freecam_FovMin = 1; --the minimum field of view for the camera when zooming in
TLSE_Development_Freecam_NearPlane = 0.05; --the minimum near plane for the camera (lower values = can get closer to objects without clipping | higher vlaues = objects will clip when too close)
TLSE_Development_Freecam_FarPlane = 2500; --the maximum far plane for the camera (lower values = distant objects/sky will be clipped | higher vlaues = distant objects/sky will not be clipped)

--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FREECAM VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FREECAM VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| PUBLIC FREECAM VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
TLSE_Development_Freecam_InputHorizontalValue = 0;
TLSE_Development_Freecam_InputVerticalValue = 0;
TLSE_Development_Freecam_InputHeightValue = 0;
TLSE_Development_Freecam_PrevCamPos = Vector(0, 0, 0);
TLSE_Development_Freecam_PrevCamRot = Vector(0, 0, 0);
TLSE_Development_Freecam_PrevCursorPos = Vector(0, 0, 0);
TLSE_Development_Freecam_InputMouseAmountX = 0;
TLSE_Development_Freecam_InputMouseAmountY = 0;
TLSE_Development_Freecam_PrevInputFieldOfViewAmount = 100;
TLSE_Development_Freecam_InputFieldOfViewAmount = 100;
TLSE_Development_Freecam_PrevTime = 0;
TLSE_Development_Freecam_Frozen = false;
TLSE_Development_Freecam_ForceDisableZoom = false;
TLSE_Development_Freecam_CameraName = "TLSE_Development_Freecamera";
TLSE_Development_Freecam_Camera = nil;

--input workaround because season one has different input API
local TLSE_InputKeyPress = function(keyCode)
    if(TLSE_Development_UseSeasonOneAPI == true) then
        return Input_IsPressed(keyCode);
    else
        return Input_IsVKeyPressed(keyCode);
    end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA SETUP ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA SETUP ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA SETUP ||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_CreateFreeCamera = function()
    TLSE_Development_Freecam_Camera = AgentCreate(TLSE_Development_Freecam_CameraName, "module_camera.prop", Vector(0,0,0), Vector(0,0,0), TLSE_Development_SceneObject, false, false);
    AgentSetProperty(TLSE_Development_Freecam_Camera, "Clip Plane - Far", TLSE_Development_Freecam_FarPlane);
    AgentSetProperty(TLSE_Development_Freecam_Camera, "Clip Plane - Near", TLSE_Development_Freecam_NearPlane);
    AgentSetProperty(TLSE_Development_Freecam_Camera, "Lens - Current Lens", nil);

    TLSE_RemoveSceneAgentsWithPrefix(TLSE_Development_SceneObject, "cam_");

    CameraPush(TLSE_Development_Freecam_CameraName);
end

--|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_UpdateFreeCamera = function()
    local number_frameTime = GetFrameTime();

    --NOTE: Leaving this here, but even with setting all properties (including transient ones) it's not possible to modify the camera stack
    --This would be nice as it would allow freecamera during native game/cutscenes without removing cameras (but however at the time of writing still haven't found a way to get it to work).
    --TLSE_AgentNameRemoveTransientProperty(TLSE_Development_SceneObjectAgentName, "Scene - Last Camera", TLSE_Development_SceneObject);
    --TLSE_AgentNameRemoveTransientProperty(TLSE_Development_SceneObjectAgentName, "Scene - Current Camera", TLSE_Development_SceneObject);
    --TLSE_AgentNameRemoveTransientProperty(TLSE_Development_SceneObjectAgentName, "Active Camera", TLSE_Development_SceneObject);
    --TLSE_AgentNameForceSetProperty(TLSE_Development_SceneObjectAgentName, "Scene - Last Camera", TLSE_Development_Freecam_CameraName, TLSE_Development_SceneObject);
    --TLSE_AgentNameForceSetProperty(TLSE_Development_SceneObjectAgentName, "Scene - Current Camera", TLSE_Development_Freecam_CameraName, TLSE_Development_SceneObject);
    --TLSE_AgentNameForceSetProperty(TLSE_Development_SceneObjectAgentName, "Active Camera", TLSE_Development_Freecam_CameraName, TLSE_Development_SceneObject);

    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA FREEZING ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA FREEZING ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA FREEZING ||||||||||||||||||||||||||||||||||||||||||||||||
    if(TLSE_InputKeyPress(TLSE_Keycodes_R)) then
        TLSE_Development_Freecam_Frozen = false;
    elseif(TLSE_InputKeyPress(TLSE_Keycodes_F)) then
        TLSE_Development_Freecam_Frozen = true;
    end

    if(TLSE_Development_FreezeEditor) then
        TLSE_Development_Freecam_Frozen = true;
    end

    --hide/show the cursor when frozen
    if(TLSE_Development_Freecam_Frozen == true) then
        CursorHide(false);
        CursorEnable(true);

        TLSE_Development_Freecam_InputHeightValue = 0;
        TLSE_Development_Freecam_InputVerticalValue = 0;

        return
    else
        CursorHide(true);
        CursorEnable(true);
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOVEMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOVEMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOVEMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    local number_positionIncrement = TLSE_Development_Freecam_PositionIncrementDefault;

    if(TLSE_InputKeyPress(TLSE_Keycodes_LeftShift)) then --speedup
        number_positionIncrement = TLSE_Development_Freecam_PositionIncrementShift;
    end
    
    if(TLSE_InputKeyPress(TLSE_Keycodes_Q)) then --move down
        TLSE_Development_Freecam_InputHeightValue = -number_positionIncrement;
    elseif(TLSE_InputKeyPress(TLSE_Keycodes_E)) then --move up
        TLSE_Development_Freecam_InputHeightValue = number_positionIncrement;
    else
        TLSE_Development_Freecam_InputHeightValue = 0;
    end
    
    if(TLSE_InputKeyPress(TLSE_Keycodes_W)) then --move forward
        TLSE_Development_Freecam_InputVerticalValue = number_positionIncrement;
    elseif(TLSE_InputKeyPress(TLSE_Keycodes_S)) then --move back
        TLSE_Development_Freecam_InputVerticalValue = -number_positionIncrement;
    else
        TLSE_Development_Freecam_InputVerticalValue = 0;
    end
    
    if(TLSE_InputKeyPress(TLSE_Keycodes_A)) then --move left
        TLSE_Development_Freecam_InputHorizontalValue = number_positionIncrement;
    elseif(TLSE_InputKeyPress(TLSE_Keycodes_D)) then --move right
        TLSE_Development_Freecam_InputHorizontalValue = -number_positionIncrement;
    else
        TLSE_Development_Freecam_InputHorizontalValue = 0;
    end
    
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ZOOMING ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ZOOMING ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ZOOMING ||||||||||||||||||||||||||||||||||||||||||||||||
    local number_fovIncrement = TLSE_Development_Freecam_FovIncrement;

    if(TLSE_Development_Freecam_ForceDisableZoom == false) then
        if(TLSE_InputKeyPress(TLSE_Keycodes_LeftMouse)) then --zoom out
            TLSE_Development_Freecam_InputFieldOfViewAmount = TLSE_Development_Freecam_InputFieldOfViewAmount - number_fovIncrement;
        elseif(TLSE_InputKeyPress(TLSE_Keycodes_RightMouse)) then --zoom in
            TLSE_Development_Freecam_InputFieldOfViewAmount = TLSE_Development_Freecam_InputFieldOfViewAmount + number_fovIncrement;
        end

        TLSE_Development_Freecam_InputFieldOfViewAmount = TLSE_NumberClamp(TLSE_Development_Freecam_InputFieldOfViewAmount, TLSE_Development_Freecam_FovMin, TLSE_Development_Freecam_FovMax);
    
        if(TLSE_Development_Freecam_SnappyZoom == false) then
            TLSE_Development_Freecam_PrevInputFieldOfViewAmount = TLSE_NumberLerp(TLSE_Development_Freecam_PrevInputFieldOfViewAmount, TLSE_Development_Freecam_InputFieldOfViewAmount, number_frameTime * TLSE_Development_Freecam_ZoomLerpFactor);
        end
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOUSELOOK ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOUSELOOK ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOUSELOOK ||||||||||||||||||||||||||||||||||||||||||||||||
    --This implementation is a bit awkward since the engine does not expose a direct way of getting the "delta axis" of the mouse position.
    --So we have to do it manually, luckily the engine provides us with being able to get the cursor position, and also being able to set the position (which comes in handy later).

    --get the current cursor position
    local vector_cursorPos = CursorGetPos();
    
    --the cursor position is a float value between 0..1
    --so the limits here need to be a little less than 0 and a little less than 1
    --when the cursor passes either limit, it will trigger a cursor position reset later.
    local number_minThreshold = 0.01;
    local number_maxThreshold = 0.99;
    
    --reset the cursor pos to the center of the screen when they get near the edges of the screen
    --this is important as it makes looking around in either direction feel seamless and continous compared to being limited by the edges of the screen.
    if(vector_cursorPos.x > number_maxThreshold) or (vector_cursorPos.x < number_minThreshold) or (vector_cursorPos.y > number_maxThreshold) or (vector_cursorPos.y < number_minThreshold) then
        CursorSetPos(Vector(0.5, 0.5, 0));
    end
    
    --calculate the difference between the current cursor position and the one from the previous frames.
    --using that we can calculate the delta axis for determining camera rotation.
    local vector_cursorDifference = Vector(vector_cursorPos.x - TLSE_Development_Freecam_PrevCursorPos.x, vector_cursorPos.y - TLSE_Development_Freecam_PrevCursorPos.y, 0);
    
    --scale the cursor position values to 180 (so the user can look 180 degrees back from left to right)
    local number_sensitivity = 180.0;
    TLSE_Development_Freecam_InputMouseAmountX = TLSE_Development_Freecam_InputMouseAmountX - (vector_cursorDifference.x * number_sensitivity);
    TLSE_Development_Freecam_InputMouseAmountY = TLSE_Development_Freecam_InputMouseAmountY + (vector_cursorDifference.y * number_sensitivity);

    --construct the final camera rotation vector based on the cursor movement between frames.
    --NOTE: need to offset the X rotation axis so by default we are looking straight on and not start by looking up 90 degrees
    local vector_newRotation = Vector(TLSE_Development_Freecam_InputMouseAmountY - 90, TLSE_Development_Freecam_InputMouseAmountX, 0);
    
    --clamp the vertical rotation so we don't look past 90 degrees
    if(vector_newRotation.x > 90) then
        vector_newRotation.x = 90;
    elseif(vector_newRotation.x < -90) then
        vector_newRotation.x = -90;
    end
    
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA BUILDING FINAL POSITION/ROTATION/ZOOM ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA BUILDING FINAL POSITION/ROTATION/ZOOM ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA BUILDING FINAL POSITION/ROTATION/ZOOM ||||||||||||||||||||||||||||||||||||||||||||||||
    local vector_newPosition = Vector(TLSE_Development_Freecam_InputHorizontalValue, TLSE_Development_Freecam_InputHeightValue, TLSE_Development_Freecam_InputVerticalValue);

    if(TLSE_Development_Freecam_SnappyMovement == true) then
        TLSE_Development_Freecam_PrevCamPos = vector_newPosition;
    else
        TLSE_Development_Freecam_PrevCamPos = TLSE_VectorLerp(TLSE_Development_Freecam_PrevCamPos, vector_newPosition, number_frameTime * TLSE_Development_Freecam_PositionLerpFactor);
    end
    
    if(TLSE_Development_Freecam_SnappyRotation == true) then
        TLSE_Development_Freecam_PrevCamRot = vector_newRotation;
    else
        TLSE_Development_Freecam_PrevCamRot = TLSE_VectorLerp(TLSE_Development_Freecam_PrevCamRot, vector_newRotation, number_frameTime * TLSE_Development_Freecam_RotationLerpFactor);
    end
    
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ASSIGNMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ASSIGNMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ASSIGNMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    local vector_cameraPosition = AgentLocalToWorld(TLSE_Development_Freecam_Camera, TLSE_Development_Freecam_PrevCamPos);
    
    AgentSetWorldPos(TLSE_Development_Freecam_Camera, vector_cameraPosition);
    AgentSetWorldRot(TLSE_Development_Freecam_Camera, TLSE_Development_Freecam_PrevCamRot);

    if(TLSE_Development_FreecamUseFOVScale == true) then
        local number_fovScale = TLSE_Development_Freecam_InputFieldOfViewAmount / 50.0;

        if(TLSE_Development_Freecam_SnappyZoom == false) then
            number_fovScale = TLSE_Development_Freecam_PrevInputFieldOfViewAmount / 50.0;
        end

        AgentSetProperty(TLSE_Development_Freecam_Camera, "Field of View Scale", number_fovScale);
    else
        if(TLSE_Development_Freecam_SnappyZoom == true) then
            AgentSetProperty(TLSE_Development_Freecam_Camera, "Field of View", TLSE_Development_Freecam_InputFieldOfViewAmount);
        else
            AgentSetProperty(TLSE_Development_Freecam_Camera, "Field of View", TLSE_Development_Freecam_PrevInputFieldOfViewAmount);
        end
    end

    TLSE_Development_Freecam_PrevCursorPos = CursorGetPos();
    TLSE_Development_Freecam_PrevTime = GetFrameTime();
end