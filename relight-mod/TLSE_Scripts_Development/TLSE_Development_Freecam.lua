--[[
This script handles the logic for the "Free Camera".

This is a camera that can be spawned in a scene, and allows the user to fly around and explore.
This can be used by itself, but it is also used in the "editor" mode.

-------DEVELOPER NOTES-------

These variables are assumed to exist outside of this script...
1. TLSE_Development_SceneObject
2. TLSE_Development_SceneObjectAgentName
3. TLSE_Development_FreecamUseFOVScale
]]

--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here are GLOBAL variables declared that control the various properties of the camera upon creation, these can be configured by the user.

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

--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAM VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAM VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAM VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--Here are GLOBAL variables declared that handle various data used by the camera during updates. These should NOT be configured by the user.

TLSE_Development_Freecam_InputHorizontalValue = 0; --This holds the scaled left/right movement from user input * the movement speed.
TLSE_Development_Freecam_InputVerticalValue = 0; --This holds the scaled forward/backward movement from user input * the movement speed.
TLSE_Development_Freecam_InputHeightValue = 0; --This holds the scaled up/down movement from user input * the movement speed.
TLSE_Development_Freecam_PrevCamPos = Vector(0, 0, 0); --When snappy movement is disabled, this holds the previous position of the camera from the previous frame (NOTE: When snappy movement is enabled, this is the actual camera position)
TLSE_Development_Freecam_PrevCamRot = Vector(0, 0, 0); --When snappy rotation is disabled, this holds the previous rotation of the camera from the previous frame (NOTE: When snappy rotation is enabled, this is the actual camera rotation)
TLSE_Development_Freecam_PrevCursorPos = Vector(0, 0, 0); --This holds the Vector2D cursor position from the previous frame. This is important in order to get mouse movement delta for rotations.
TLSE_Development_Freecam_InputMouseAmountX = 0; --This holds the total accumulated scaled "rotation" of the camera horizontally. 
TLSE_Development_Freecam_InputMouseAmountY = 0; --This holds the total accumulated scaled "rotation" of the camera vertically. 
TLSE_Development_Freecam_PrevInputFieldOfViewAmount = 100; --When snappy zooming is disabled, this holds the previous fov value of the camera from the previous frame.
TLSE_Development_Freecam_InputFieldOfViewAmount = 100; --This is the actual camera fov.
TLSE_Development_Freecam_Frozen = false; --This controls whether or not the camera can be controlled or not.
TLSE_Development_Freecam_ForceDisableZoom = false; --This controls whether we can perform zooming in the camera or not.
TLSE_Development_Freecam_CameraName = "TLSE_Development_Freecamera"; --This is the raw name of the freecamera when created in the scene.
TLSE_Development_Freecam_Camera = nil; --This holds the actual Agent object reference of the camera upon creation.

--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAMERA SETUP ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAMERA SETUP ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAMERA SETUP ||||||||||||||||||||||||||||||||||||||||||||||||
--This is where we first create the camera in the scene, and set it up with the configuration that we want.

TLSE_Development_CreateFreeCamera = function()
    TLSE_Development_Freecam_Camera = AgentCreate(TLSE_Development_Freecam_CameraName, "module_camera.prop", Vector(0,0,0), Vector(0,0,0), TLSE_Development_SceneObject, false, false);
    AgentSetProperty(TLSE_Development_Freecam_Camera, "Clip Plane - Far", TLSE_Development_Freecam_FarPlane);
    AgentSetProperty(TLSE_Development_Freecam_Camera, "Clip Plane - Near", TLSE_Development_Freecam_NearPlane);
    AgentSetProperty(TLSE_Development_Freecam_Camera, "Lens - Current Lens", nil);

    --Unfortunately this is a requirement at the time of writing.
    --If the scene starts as normal, then cameras that are already in the scene tend to get chorelocked and will always have one rendering at a time.
    --So to circumvent all of those issues, we just go ahead and remove all of the original cameras in the scene.
    TLSE_RemoveSceneAgentsWithPrefix(TLSE_Development_SceneObject, "cam_");

    --Push our camera to the scene camera layer stack.
    CameraPush(TLSE_Development_Freecam_CameraName);
end

--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAMERA UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAMERA UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) FREECAMERA UPDATE ||||||||||||||||||||||||||||||||||||||||||||||||

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

    --NOTE TO SELF: Need to try having an update function that digs through all cameras currently in the scene, and set the following properties on them.
    --(bool) Runtime: Visible (should be false)
    --(bool) Camera Push (should be false)
    --(bool) Camera Blend Enable (should be false)
    --CameraPop(agent_camera)
    --CameraPush(agent_camera
    --CameraActivate(agent_camera)

    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA FREEZING ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA FREEZING ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA FREEZING ||||||||||||||||||||||||||||||||||||||||||||||||
    --Here we have logic for allowing the user to be able to freeze the camera in its current position/rotation.

    --User input to determine if the user wants to freeze the camera or not.
    if(TLSE_InputKeyPress(TLSE_Keycodes_R)) then
        TLSE_Development_Freecam_Frozen = false;
    elseif(TLSE_InputKeyPress(TLSE_Keycodes_F)) then
        TLSE_Development_Freecam_Frozen = true;
    end

    --If we are in editor mode, there are times where we want to freeze the camera during an action.
    if(TLSE_Development_FreezeEditor) then
        TLSE_Development_Freecam_Frozen = true;
    end

    --hide/show the cursor when frozen, and don't continue on with the rest of the camera logic if we are frozen.
    if(TLSE_Development_Freecam_Frozen == true) then
        CursorHide(false);
        CursorEnable(true);

        --remove any residual movement
        TLSE_Development_Freecam_InputHeightValue = 0;
        TLSE_Development_Freecam_InputVerticalValue = 0;
        TLSE_Development_Freecam_InputHorizontalValue = 0;

        --make sure we still track the previous cursor position even if we are frozen
        TLSE_Development_Freecam_PrevCursorPos = CursorGetPos();

        return --dont continue
    else
        CursorHide(true);
        CursorEnable(true);
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOVEMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOVEMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA MOVEMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --Here we have logic for capturing inputs from the user for movement.

    --This effectively controls the actual "speed" of the camera movement
    local number_positionIncrement = TLSE_Development_Freecam_PositionIncrementDefault;

    --If the user presses the following key, speed up the movement speed
    if(TLSE_InputKeyPress(TLSE_Keycodes_LeftShift)) then --speedup
        number_positionIncrement = TLSE_Development_Freecam_PositionIncrementShift;
    end
    
    --Capture Up/Down inputs for movement
    if(TLSE_InputKeyPress(TLSE_Keycodes_Q)) then --move down
        TLSE_Development_Freecam_InputHeightValue = -number_positionIncrement;
    elseif(TLSE_InputKeyPress(TLSE_Keycodes_E)) then --move up
        TLSE_Development_Freecam_InputHeightValue = number_positionIncrement;
    else
        TLSE_Development_Freecam_InputHeightValue = 0;
    end
    
    --Capture Forward/Back inputs for movement
    if(TLSE_InputKeyPress(TLSE_Keycodes_W)) then --move forward
        TLSE_Development_Freecam_InputVerticalValue = number_positionIncrement;
    elseif(TLSE_InputKeyPress(TLSE_Keycodes_S)) then --move back
        TLSE_Development_Freecam_InputVerticalValue = -number_positionIncrement;
    else
        TLSE_Development_Freecam_InputVerticalValue = 0;
    end
    
    --Capture Left/Right inputs for movement
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
    --Here we have logic for capturing input from the user for zooming.

    --This effectively controls the actual "speed" of the camera zooming
    local number_fovIncrement = TLSE_Development_Freecam_FovIncrement;

    --If we are able to zoom and it isn't disabled...
    if(TLSE_Development_Freecam_ForceDisableZoom == false) then

        --Capture In/Out inputs for zooming
        if(TLSE_InputKeyPress(TLSE_Keycodes_LeftMouse)) then --zoom out
            TLSE_Development_Freecam_InputFieldOfViewAmount = TLSE_Development_Freecam_InputFieldOfViewAmount - number_fovIncrement;
        elseif(TLSE_InputKeyPress(TLSE_Keycodes_RightMouse)) then --zoom in
            TLSE_Development_Freecam_InputFieldOfViewAmount = TLSE_Development_Freecam_InputFieldOfViewAmount + number_fovIncrement;
        end

        --Clamp the zoom so that it stays in a reasonable range.
        TLSE_Development_Freecam_InputFieldOfViewAmount = TLSE_NumberClamp(TLSE_Development_Freecam_InputFieldOfViewAmount, TLSE_Development_Freecam_FovMin, TLSE_Development_Freecam_FovMax);
    
        --If we want smooth zoom, then gradually transition to the actual zoom value over time.
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
    --Here we construct and have additional logic for the camera position/rotation that will eventually be applied to the camera.

    --Construct the camera position based on our previous user input movements
    local vector_newPosition = Vector(TLSE_Development_Freecam_InputHorizontalValue, TLSE_Development_Freecam_InputHeightValue, TLSE_Development_Freecam_InputVerticalValue);

    if(TLSE_Development_Freecam_SnappyMovement == true) then
        TLSE_Development_Freecam_PrevCamPos = vector_newPosition; --snappy
    else
        TLSE_Development_Freecam_PrevCamPos = TLSE_VectorLerp(TLSE_Development_Freecam_PrevCamPos, vector_newPosition, number_frameTime * TLSE_Development_Freecam_PositionLerpFactor); --smooth
    end
    
    if(TLSE_Development_Freecam_SnappyRotation == true) then
        TLSE_Development_Freecam_PrevCamRot = vector_newRotation; --snappy
    else
        TLSE_Development_Freecam_PrevCamRot = TLSE_VectorLerp(TLSE_Development_Freecam_PrevCamRot, vector_newRotation, number_frameTime * TLSE_Development_Freecam_RotationLerpFactor); --smooth
    end
    
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ASSIGNMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ASSIGNMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||| FREECAMERA ASSIGNMENT ||||||||||||||||||||||||||||||||||||||||||||||||
    --Here we actually apply our capture data to the camera in the scene.

    --NOTE: This is CRITICAL. This is important as the final movement vector we constructed does not factor in orientation of the camera.
    --So we transform our vector from "local space" into actual "world space" of the camera object.
    --This means that whenever you move forward, you are moving forward in the direction that the object/camera is looking. (And this applies to all the other directions the user wants to move.)
    local vector_cameraPosition = AgentLocalToWorld(TLSE_Development_Freecam_Camera, TLSE_Development_Freecam_PrevCamPos);
    
    --Apply position/rotation to the actual camera agent in the scene
    AgentSetWorldPos(TLSE_Development_Freecam_Camera, vector_cameraPosition);
    AgentSetWorldRot(TLSE_Development_Freecam_Camera, TLSE_Development_Freecam_PrevCamRot);

    --NOTE: Since in later games/seasons cameras are fitted with a "lens" system, the only way to control FOV easily is with FOV scale.
    if(TLSE_Development_FreecamUseFOVScale == true) then
        --Transform our inital zoom FOV value into a scalar value.
        local number_fovScale = TLSE_Development_Freecam_InputFieldOfViewAmount / 50.0;

        --If smooth zooming is enabled then use the variable that gradually transitions into the desired FOV over time.
        if(TLSE_Development_Freecam_SnappyZoom == false) then
            number_fovScale = TLSE_Development_Freecam_PrevInputFieldOfViewAmount / 50.0;
        end

        --Apply our final FOV scale value to the agent.
        AgentSetProperty(TLSE_Development_Freecam_Camera, "Field of View Scale", number_fovScale);
    else
        if(TLSE_Development_Freecam_SnappyZoom == true) then
            AgentSetProperty(TLSE_Development_Freecam_Camera, "Field of View", TLSE_Development_Freecam_InputFieldOfViewAmount); --snappy
        else
            AgentSetProperty(TLSE_Development_Freecam_Camera, "Field of View", TLSE_Development_Freecam_PrevInputFieldOfViewAmount); --smooth
        end
    end

    --NOTE: This is important, after we are done with our logic we need to store the current cursor position so that we can check against it in the next frame (i.e. the next time update runs)
    --So that way we can create a "delta" vector for the cursor position and use that to derive mouse movement, and therefore camera rotation.
    TLSE_Development_Freecam_PrevCursorPos = CursorGetPos();
end