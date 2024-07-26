--[[
    This script has functions to help with object bounding boxes.

    What are object bounding boxes? You can think of them as
    boxes that fully encompass whatever object you are messing with.

    Bounding Boxes are used to do MANY different things.
        1. Render Culling: 
            Rather than checking every polygon/vertex of the model,
            the bounds of the object is used as a simplified representation of the model.
            The bounds of that object is then checked against the camera frustum.
            If the bounds of the object is not inside the camera frustum then
            it is not in view and therefore culled (or hidden).
        2. Collision Detection: 
            For physics detection to check if two objects are intersecting eachothers bounds.
            If they are then that means a collision has occured.
        3. Trigger Detection:
            Similar to collision detection (though simpler), we can check if two objects are
            intersecting eachothers bounds, and from there we can trigger an event.
        4. Position Detection: 
            Similar to Trigger/Collision detection except we can check if a single point
            in space is inside the bounds of an object.

    There are more use cases for bounding boxes than I've listed here but that
    should give an idea on how useful bounding boxes are in development.
    They are a simplified representation of the object, which also makes
    them very fast especially when usually these operations need to be done
    multiple times over many frames.
]]

--|||||||||||||||||||||||||||||||||||||||||||||| ORIENTED BOUNDING BOX (OBB) ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| ORIENTED BOUNDING BOX (OBB) ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| ORIENTED BOUNDING BOX (OBB) ||||||||||||||||||||||||||||||||||||||||||||||
--this comes from - https://stackoverflow.com/questions/47866571/simple-oriented-bounding-box-obb-collision-detection-explaining
--NOTE: This is incomplete and doesn't work

--potential new refernece? - https://github.com/mrdoob/three.js/blob/master/examples/jsm/math/OBB.js

--[[
local BoundsOBB_Object = {
    center = Vector,
    size = Vector,
    extents = Vector,
    axisX = Vector,
    axisY = Vector,
    axisZ = Vector
};
--]]

TLSE_Bounds_GetAgentWorldBounds_OBB = function(agent_object)
    --we need to access the agent properties to get what we need
    local propertySet_agentProperties = AgentGetRuntimeProperties(agent_object);

    --get the native extents values that are already defined on these objects
    local vector_extentsMin = PropertyGet(propertySet_agentProperties, "Extents Min");
    local vector_extentsMax = PropertyGet(propertySet_agentProperties, "Extents Max");

    --now it's important to note that after some testing its apparent that these extents are only in "local" object space.
    --when any transformations are applied on the object (position, rotation, scale) these values are unaffected.
    --so in order to use them we need to adjust these values to work for world space.

    --store these in a new variable so we don't override the original value
    local vector_adjustedExtentsMin = vector_extentsMin;
    local vector_adjustedExtentsMax = vector_extentsMax;

    ---------------------------------------------------------
    --first step is to apply the object scaling, which is thankfully very simple to do
    
    --get the render scaling values
    local number_renderGlobalScale = PropertyGet(propertySet_agentProperties, "Render Global Scale"); --single scalar value
    local vector_renderAxisScale = PropertyGet(propertySet_agentProperties, "Render Axis Scale"); --vector scale value

    --apply the render scalar value
    vector_adjustedExtentsMin = VectorScale(vector_adjustedExtentsMin, number_renderGlobalScale);
    vector_adjustedExtentsMax = VectorScale(vector_adjustedExtentsMax, number_renderGlobalScale);

    --apply the render axis scale vector
    vector_adjustedExtentsMin = TLSE_VectorMultiply(vector_adjustedExtentsMin, vector_renderAxisScale);
    vector_adjustedExtentsMax = TLSE_VectorMultiply(vector_adjustedExtentsMax, vector_renderAxisScale);

    ---------------------------------------------------------
    --second step, apply object position and rotation

    --transform these local space vectors into world space (this will natrually apply position and rotation transformations)
    vector_adjustedExtentsMin = AgentLocalToWorld(agent_object, vector_adjustedExtentsMin);
    vector_adjustedExtentsMax = AgentLocalToWorld(agent_object, vector_adjustedExtentsMax);

    ---------------------------------------------------------
    --third step, get object axis

    --transform these local space vectors into world space (this will natrually apply position and rotation transformations)
    local vector_objectX = AgentLocalToWorld(agent_object, Vector(1, 0, 0));
    local vector_objectY = AgentLocalToWorld(agent_object, Vector(0, 1, 0));
    local vector_objectZ = AgentLocalToWorld(agent_object, Vector(0, 0, 1));

    ---------------------------------------------------------
    --calculate the following values that we can store in our new "Bounds" object.

    --calculate extents from min and max
    local vector_extents = VectorSubtract(vector_adjustedExtentsMax, vector_adjustedExtentsMin);
    vector_extents = VectorScale(vector_extents, 0.5);

    --calculate scale, which is just extents * 2
    local vector_scale = VectorScale(vector_extents, 2.0);

    --calculate the origin point of this bounds object
    local vector_center = VectorAdd(vector_adjustedExtentsMin, vector_extents);

    --build our bounds object and store the computed values
    local boundsOBB_newBoundsObject = {
        center = vector_center,
        size = vector_scale,
        extents = vector_extents,
        axisX = vector_objectX,
        axisY = vector_objectY,
        axisZ = vector_objectZ,
    };

    return boundsOBB_newBoundsObject;
end

-- check if there's a separating plane in between the selected axes
TLSE_Bounds_OBB_GetSeparatingPlane = function(vector_rpos, vector_plane, boundsOBB_1, boundsOBB_2)
    local term1 = math.abs(VectorDot(vector_rpos, vector_plane));
    local term2 = math.abs(VectorDot(boundsOBB_1["axisX"] * boundsOBB_1["extents"].x, vector_plane));
    local term3 = math.abs(VectorDot(boundsOBB_1["axisY"] * boundsOBB_1["extents"].y, vector_plane));
    local term4 = math.abs(VectorDot(boundsOBB_1["axisZ"] * boundsOBB_1["extents"].z, vector_plane));
    local term5 = math.abs(VectorDot(boundsOBB_2["axisX"] * boundsOBB_2["extents"].x, vector_plane));
    local term6 = math.abs(VectorDot(boundsOBB_2["axisY"] * boundsOBB_2["extents"].y, vector_plane));
    local term7 = math.abs(VectorDot(boundsOBB_2["axisZ"] * boundsOBB_2["extents"].z, vector_plane));

    return (term1 > (term2 + term3 + term4 + term5 + term6 + term7));
end

-- test for separating planes in all 15 axes
TLSE_Bounds_OBB_IntersectTest = function(boundsOBB_1, boundsOBB_2)
    local vector_rpos = VectorSubtract(boundsOBB_2["center"], boundsOBB_1["center"]);

    return (TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, boundsOBB_1["axisX"], boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, boundsOBB_1["axisY"], boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, boundsOBB_1["axisZ"], boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, boundsOBB_2["axisX"], boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, boundsOBB_2["axisY"], boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, boundsOBB_2["axisZ"], boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisX"], boundsOBB_2["axisX"]), boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisX"], boundsOBB_2["axisY"]), boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisX"], boundsOBB_2["axisZ"]), boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisY"], boundsOBB_2["axisX"]), boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisY"], boundsOBB_2["axisY"]), boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisY"], boundsOBB_2["axisZ"]), boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisZ"], boundsOBB_2["axisX"]), boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisZ"], boundsOBB_2["axisY"]), boundsOBB_1, boundsOBB_2) or
        TLSE_Bounds_OBB_GetSeparatingPlane(vector_rpos, VectorCross(boundsOBB_1["axisZ"], boundsOBB_2["axisZ"]), boundsOBB_1, boundsOBB_2));
end