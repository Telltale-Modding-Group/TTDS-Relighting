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

--references
--Unity3d Bounds C# - https://github.com/Unity-Technologies/UnityCsReference/blob/master/Runtime/Export/Geometry/Bounds.cs
--should note that this isnt a 1:1 implementation of the bounds class from unity, but it is very inspired by it.
--reason being that there are some things here in telltale that are done differently and need to be accounted for.

--|||||||||||||||||||||||||||||||||||||||||||||| TELLTALE BOUNDS ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| TELLTALE BOUNDS ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| TELLTALE BOUNDS ||||||||||||||||||||||||||||||||||||||||||||||
--The telltale tool appears to have a proper OBB implementation native within the engine that works well.
--In here are methods that help extend it.

--does an intersection test between two bounding boxes
--AgentCollide(agent1, agent2) returns bool

--AgentGetCorner(agent1, index) returns vector3
--if ( v2 & 1 )
--v5 = v4->mBoundingBox.mMin.x;
--else
--v5 = v4->mBoundingBox.mMax.x;
--vec.x = v5;
--if ( v2 & 2 )
--v6 = v4->mBoundingBox.mMin.y;
--else
--v6 = v4->mBoundingBox.mMax.y;
--vec.y = v6;
--if ( v2 & 4 )
--v7 = v4->mBoundingBox.mMin.z;
--else
--v7 = v4->mBoundingBox.mMax.z;

--Corrects the bounding box on an agent to factor in the objects scale.
TLSE_Bounds_AgentSetCorrectBounds = function(agent_object, number_scaleFactor)
    --we need to access the agent properties to get what we need
    local propertySet_agentProperties = AgentGetRuntimeProperties(agent_object);

    --get the native extents values that are already defined on these objects
    local vector_extentsMin = PropertyGet(propertySet_agentProperties, "Extents Min");
    local vector_extentsMax = PropertyGet(propertySet_agentProperties, "Extents Max");

    --now it's important to note that after some testing its apparent that these extents do not factor in scaling.
    --so we have to modify them to factor in scaling to ensure that they will work correctly for objects even if their scale changes.

    --store these in a new variable so we don't override the original value
    local vector_adjustedExtentsMin = vector_extentsMin;
    local vector_adjustedExtentsMax = vector_extentsMax;

    ---------------------------------------------------------
    --all that needs to be done is apply object scaling.
    
    --apply a user adjustale scale factor
    vector_adjustedExtentsMin = VectorScale(vector_adjustedExtentsMin, number_scaleFactor);
    vector_adjustedExtentsMax = VectorScale(vector_adjustedExtentsMax, number_scaleFactor);

    --get the render scaling values
    local number_renderGlobalScale = PropertyGet(propertySet_agentProperties, "Render Global Scale"); --single scalar value
    local vector_renderAxisScale = PropertyGet(propertySet_agentProperties, "Render Axis Scale"); --vector scale value

    --apply the render scalar value
    vector_adjustedExtentsMin = VectorScale(vector_adjustedExtentsMin, number_renderGlobalScale);
    vector_adjustedExtentsMax = VectorScale(vector_adjustedExtentsMax, number_renderGlobalScale);

    --apply the render axis scale vector
    vector_adjustedExtentsMin = TLSE_VectorMultiply(vector_adjustedExtentsMin, vector_renderAxisScale);
    vector_adjustedExtentsMax = TLSE_VectorMultiply(vector_adjustedExtentsMax, vector_renderAxisScale);

    --now apply the modified extents
    PropertySet(propertySet_agentProperties, "Extents Min", vector_adjustedExtentsMin);
    PropertySet(propertySet_agentProperties, "Extents Max", vector_adjustedExtentsMax);
end

--Corrects the bounding box on an agent to factor in the objects scale.
TLSE_Bounds_AgentSetBoundsWithScale = function(agent_object, number_scaleFactor)
    --we need to access the agent properties to get what we need
    local propertySet_agentProperties = AgentGetRuntimeProperties(agent_object);

    --get the native extents values that are already defined on these objects
    local vector_extentsMin = PropertyGet(propertySet_agentProperties, "Extents Min");
    local vector_extentsMax = PropertyGet(propertySet_agentProperties, "Extents Max");

    --now it's important to note that after some testing its apparent that these extents do not factor in scaling.
    --so we have to modify them to factor in scaling to ensure that they will work correctly for objects even if their scale changes.

    --store these in a new variable so we don't override the original value
    local vector_adjustedExtentsMin = vector_extentsMin;
    local vector_adjustedExtentsMax = vector_extentsMax;

    ---------------------------------------------------------
    --all that needs to be done is apply object scaling.
    
    --apply a user adjustale scale factor
    vector_adjustedExtentsMin = VectorScale(vector_adjustedExtentsMin, number_scaleFactor);
    vector_adjustedExtentsMax = VectorScale(vector_adjustedExtentsMax, number_scaleFactor);

    --now apply the modified extents
    PropertySet(propertySet_agentProperties, "Extents Min", vector_adjustedExtentsMin);
    PropertySet(propertySet_agentProperties, "Extents Max", vector_adjustedExtentsMax);
end

TLSE_Bounds_AgentSetCustomBounds = function(agent_object, vector_extentsMin, vector_extentsMax)
    --we need to access the agent properties to get what we need
    local propertySet_agentProperties = AgentGetRuntimeProperties(agent_object);

    --now apply the modified extents
    PropertySet(propertySet_agentProperties, "Extents Min", vector_adjustedExtentsMin);
    PropertySet(propertySet_agentProperties, "Extents Max", vector_adjustedExtentsMax);
end