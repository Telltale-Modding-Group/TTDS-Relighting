--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY DISK INTERSECTION ||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY DISK INTERSECTION ||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY DISK INTERSECTION ||||||||||||||||||||||||||||||||||||||

--Reference - https://iquilezles.org/articles/intersectors/
TLSE_RayIntersectDiskDistance = function(vector_rayOrigin, vector_rayDirection, vector_diskCenter, vector_diskNormal, number_diskRadius, bool_hitBackface)
    if (bool_hitBackface == false) then
        if (VectorDot(vector_diskNormal, vector_rayDirection) > 0.0) then
            return -1.0;
        end
    end

    local vector_o = VectorSubtract(vector_rayOrigin, vector_diskCenter);
    local number_t = -VectorDot(vector_diskNormal, vector_o) / VectorDot(vector_rayDirection, vector_diskNormal);
    local vector_q = VectorAdd(vector_o, VectorScale(vector_rayDirection, number_t));

    if (VectorDot(vector_q, vector_q) < number_diskRadius * number_diskRadius) then
        return number_t;
    else
        return -1.0;
    end
end

TLSE_CheckRayIntersectsDisk = function(vector_rayOrigin, vector_rayDirection, vector_diskCenter, vector_diskNormal, number_diskRadius, bool_hitBackface)
    return TLSE_RayIntersectDiskDistance(vector_rayOrigin, vector_rayDirection, vector_diskCenter, vector_diskNormal, number_diskRadius, bool_hitBackface) >= 0; --if we are at 0 or greater then we have a hit
end

TLSE_GetRayIntersectsDiskHitPoint = function(vector_rayOrigin, vector_rayDirection, vector_diskCenter, vector_diskNormal, number_diskRadius, bool_hitBackface)
    local number_distance = TLSE_RayIntersectDiskDistance(vector_rayOrigin, vector_rayDirection, vector_diskCenter, vector_diskNormal, number_diskRadius, bool_hitBackface);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));
    end
end

TLSE_GetRayIntersectsDiskHitPointNullable = function(vector_rayOrigin, vector_rayDirection, vector_diskCenter, vector_diskNormal, number_diskRadius, bool_hitBackface)
    local number_distance = TLSE_RayIntersectDiskDistance(vector_rayOrigin, vector_rayDirection, vector_diskCenter, vector_diskNormal, number_diskRadius, bool_hitBackface);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return nil;
    end
end

--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY SPHERE INTERSECTION ||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY SPHERE INTERSECTION ||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY SPHERE INTERSECTION ||||||||||||||||||||||||||||||||||||||

--Reference (Robust Method) - https://www.shadertoy.com/view/WdXfR2
TLSE_RayIntersectsSphereDistance = function(vector_rayOrigin, vector_rayDirection, vector_spherePosition, number_sphereRadius)
    local vector_oc = VectorSubtract(vector_rayOrigin, vector_spherePosition);
    local number_b = VectorDot(vector_oc, vector_rayDirection);
    local number_r2 = number_sphereRadius * number_sphereRadius;

    --robust method
    local vector_fbd = VectorSubtract(vector_oc, VectorScale(vector_rayDirection, number_b));
    local number_d = number_r2 - VectorDot(vector_fbd, vector_fbd);

    if (number_d > 0.0) then
        return -number_b - math.sqrt(number_d);
    end

    return -1.0;
end

TLSE_CheckRayIntersectsSphere = function(vector_rayOrigin, vector_rayDirection, vector_spherePosition, number_sphereRadius)
    return TLSE_RayIntersectsSphereDistance(vector_rayOrigin, vector_rayDirection, vector_spherePosition, number_sphereRadius) >= 0; --if we are at 0 or greater then we have a hit
end

TLSE_GetRayIntersectsSphereHitPoint = function(vector_rayOrigin, vector_rayDirection, vector_spherePosition, number_sphereRadius)
    local number_distance = TLSE_RayIntersectsSphereDistance(vector_rayOrigin, vector_rayDirection, vector_spherePosition, number_sphereRadius);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));
    end
end

TLSE_GetRayIntersectsSphereHitPointNullable = function(vector_rayOrigin, vector_rayDirection, vector_spherePosition, number_sphereRadius)
    local number_distance = TLSE_RayIntersectsSphereDistance(vector_rayOrigin, vector_rayDirection, vector_spherePosition, number_sphereRadius);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return nil;
    end
end

--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY CAPSULE INTERSECTION ||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY CAPSULE INTERSECTION ||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY CAPSULE INTERSECTION ||||||||||||||||||||||||||||||||||||||

--Reference - https://iquilezles.org/articles/intersectors/
--iq note: Note that only ONE of the two spherical caps is checked for intersections, which is a nice optimization
TLSE_RayIntersectsCapsuleDistance = function(vector_rayOrigin, vector_rayDirection, vector_capsulePointA, vector_capsulePointB, number_capsuleRadius)
    local vector_ba = VectorSubtract(vector_capsulePointB, vector_capsulePointA);
    local vector_oa = VectorSubtract(vector_rayOrigin, vector_capsulePointA);

    local number_baba = VectorDot(vector_ba, vector_ba);
    local number_bard = VectorDot(vector_ba, vector_rayDirection);
    local number_baoa = VectorDot(vector_ba, vector_oa);
    local number_rdoa = VectorDot(vector_rayDirection, vector_oa);
    local number_oaoa = VectorDot(vector_oa, vector_oa);
    local number_a = number_baba - number_bard * number_bard;
    local number_b = number_baba * number_rdoa - number_baoa * number_bard;
    local number_c = number_baba * number_oaoa - number_baoa * number_baoa - number_capsuleRadius * number_capsuleRadius * number_baba;
    local number_h = number_b * number_b - number_a * number_c;

    if (number_h >= 0.0) then
        local number_t = (-number_b - math.sqrt(number_h)) / number_a;
        local number_y = number_baoa + number_t * number_bard;

        --body
        if (number_y > 0.0 and number_y < number_baba) then
            return number_t;
        end

        --caps
        local vector_oc = Vector(0, 0, 0);

        if (number_y <= 0.0) then
            vector_oc = vector_oa;
        else
            vector_oc = VectorSubtract(vector_rayOrigin, vector_capsulePointB);
        end

        number_b = VectorDot(vector_rayDirection, vector_oc);
        number_c = VectorDot(vector_oc, vector_oc) - number_capsuleRadius * number_capsuleRadius;
        number_h = number_b * number_b - number_c;

        if (number_h > 0.0) then
            return -number_b - math.sqrt(number_h);
        end
    end

    return -1.0;
end

TLSE_CheckRayIntersectsCapsule = function(vector_rayOrigin, vector_rayDirection, vector_capsulePointA, vector_capsulePointB, number_capsuleRadius)
    return TLSE_RayIntersectsCapsuleDistance(vector_rayOrigin, vector_rayDirection, vector_capsulePointA, vector_capsulePointB, number_capsuleRadius) >= 0; --if we are at 0 or greater then we have a hit
end

TLSE_GetRayIntersectsCapsuleHitPoint = function(vector_rayOrigin, vector_rayDirection, vector_capsulePointA, vector_capsulePointB, number_capsuleRadius)
    local number_distance = TLSE_RayIntersectsCapsuleDistance(vector_rayOrigin, vector_rayDirection, vector_capsulePointA, vector_capsulePointB, number_capsuleRadius);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));
    end
end

TLSE_GetRayIntersectsCapsuleHitPointNullable = function(vector_rayOrigin, vector_rayDirection, vector_capsulePointA, vector_capsulePointB, number_capsuleRadius)
    local number_distance = TLSE_RayIntersectsCapsuleDistance(vector_rayOrigin, vector_rayDirection, vector_capsulePointA, vector_capsulePointB, number_capsuleRadius);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return nil;
    end
end

--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY CYLINDER INTERSECTION ||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY CYLINDER INTERSECTION ||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY CYLINDER INTERSECTION ||||||||||||||||||||||||||||||||||||||

--Reference - https://iquilezles.org/articles/intersectors/
TLSE_RayIntersectsCylinderDistance = function(vector_rayOrigin, vector_rayDirection, vector_cylinderPointA, vector_cylinderPointB, number_cylinderRadius)
    local vector_ba = VectorSubtract(vector_cylinderPointB, vector_cylinderPointA);
    local vector_oc = VectorSubtract(vector_rayOrigin, vector_cylinderPointA);
    local number_baba = VectorDot(vector_ba, vector_ba);
    local number_bard = VectorDot(vector_ba, vector_rayDirection);
    local number_baoc = VectorDot(vector_ba, vector_oc);
    local number_k2 = number_baba - number_bard * number_bard;
    local number_k1 = number_baba * VectorDot(vector_oc, vector_rayDirection) - number_baoc * number_bard;
    local number_k0 = number_baba * VectorDot(vector_oc, vector_oc) - number_baoc * number_baoc - number_cylinderRadius * number_cylinderRadius * number_baba;
    local number_h = number_k1 * number_k1 - number_k2 * number_k0;

    if (number_h < 0.0) then
        return -1.0; --no intersection
    end

    number_h = math.sqrt(number_h);

    local number_t = (-number_k1 - number_h) / number_k2;

    --body
    local number_y = number_baoc + number_t * number_bard;

    if (number_y > 0.0 and number_y < number_baba) then
        return number_t;
    end

    --caps
    if (number_y < 0.0) then
        number_t = 0.0;
    else
        number_t = number_baba;
    end

    number_t = (number_t - number_baoc) / number_bard;

    if (math.abs(number_k1 + number_k2 * number_t) < number_h) then
        return number_t;
    end

    return -1.0; --no intersection
end

TLSE_CheckRayIntersectsCylinder = function(vector_rayOrigin, vector_rayDirection, vector_cylinderPointA, vector_cylinderPointB, number_cylinderRadius)
    return TLSE_RayIntersectsCylinderDistance(vector_rayOrigin, vector_rayDirection, vector_cylinderPointA, vector_cylinderPointB, number_cylinderRadius) >= 0; --if we are at 0 or greater then we have a hit
end

TLSE_GetRayIntersectsCylinderHitPoint = function(vector_rayOrigin, vector_rayDirection, vector_cylinderPointA, vector_cylinderPointB, number_cylinderRadius)
    local number_distance = TLSE_RayIntersectsCylinderDistance(vector_rayOrigin, vector_rayDirection, vector_cylinderPointA, vector_cylinderPointB, number_cylinderRadius);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));
    end
end

TLSE_GetRayIntersectsCylinderHitPointNullable = function(vector_rayOrigin, vector_rayDirection, vector_cylinderPointA, vector_cylinderPointB, number_cylinderRadius)
    local number_distance = TLSE_RayIntersectsCylinderDistance(vector_rayOrigin, vector_rayDirection, vector_cylinderPointA, vector_cylinderPointB, number_cylinderRadius);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return nil;
    end
end

--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY TRIANGLE INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY TRIANGLE INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY TRIANGLE INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||
--Reference - https://iquilezles.org/articles/intersectors/
TLSE_RayIntersectsTriangleDistance = function(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, bool_hitBackface)
    if (bool_hitBackface == false) then
        local vector_triangleNormal = VectorNormalize(VectorCross(VectorSubtract(vector_vertex2, vector_vertex1), VectorSubtract(vector_vertex3, vector_vertex1)));

        if (VectorDot(vector_triangleNormal, vector_rayDirection) > 0) then
            return -1.0;
        end
    end

    local vector_v1v0 = VectorSubtract(vector_vertex2, vector_vertex1);
    local vector_v2v0 = VectorSubtract(vector_vertex3, vector_vertex1);
    local vector_rov0 = VectorSubtract(vector_rayOrigin, vector_vertex1);
    local vector_n = VectorCross(vector_v1v0, vector_v2v0);
    local vector_q = VectorCross(vector_rov0, vector_rayDirection);
    local number_d = 1.0 / VectorDot(vector_rayDirection, vector_n);
    local number_u = number_d * VectorDot(-vector_q, vector_v2v0);
    local number_v = number_d * VectorDot(vector_q, vector_v1v0);
    local number_t = number_d * VectorDot(-vector_n, vector_rov0);

    if (number_u < 0.0 or number_v < 0.0 or (number_u + number_v) > 1.0) then
        number_t = -1.0;
    end

    return number_t;
end

TLSE_CheckRayIntersectsTriangle = function(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, bool_hitBackface)
    return TLSE_RayIntersectsTriangleDistance(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, bool_hitBackface) >= 0; --if we are at 0 or greater then we have a hit
end

TLSE_GetRayIntersectsTriangleHitPoint = function(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, bool_hitBackface)
    local number_distance = TLSE_RayIntersectsTriangleDistance(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, bool_hitBackface);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));
    end
end

TLSE_GetRayIntersectsTriangleHitPointNullable = function(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, bool_hitBackface)
    local number_distance = TLSE_RayIntersectsTriangleDistance(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, bool_hitBackface);

    if (number_distance >= 0.0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return nil;
    end
end

--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY QUAD INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY QUAD INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY QUAD INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||

TLSE_RayIntersectsQuadDistance = function(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, vector_vertex4, bool_hitBackface)
    local number_triangleA = TLSE_RayIntersectsTriangleDistance(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, bool_hitBackface);
    local number_triangleB = TLSE_RayIntersectsTriangleDistance(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex3, vector_vertex4, bool_hitBackface);

    if (number_triangleA >= 0) then
        return number_triangleA;
    elseif (number_triangleB >= 0) then
        return number_triangleB;
    else
        return -1.0; --Distance should be absolute so a negative value works
    end
end

TLSE_CheckIntersectsQuad = function(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, vector_vertex4, bool_hitBackface)
    return TLSE_RayIntersectsQuadDistance(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, vector_vertex4, bool_hitBackface) >= 0; --if we are at 0 or greater then we have a hit
end

TLSE_GetRayIntersectsQuadHitPoint = function(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, vector_vertex4, bool_hitBackface)
    local number_distance = TLSE_RayIntersectsQuadDistance(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, vector_vertex4, bool_hitBackface);

    if (number_distance >= 0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));
    end
end

TLSE_GetRayIntersectsQuadHitPointNullable = function(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, vector_vertex4, bool_hitBackface)
    local number_distance = TLSE_RayIntersectsQuadDistance(vector_rayOrigin, vector_rayDirection, vector_vertex1, vector_vertex2, vector_vertex3, vector_vertex4, bool_hitBackface);

    if (number_distance >= 0) then
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, number_distance));
    else
        return nil;
    end
end

--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY BOX INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY BOX INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - RAY BOX INTERSECTION ||||||||||||||||||||||||||||||||||||||||||||

--assuming a quad constructed as such...
--frontTopRight =       Vector(1, 1, 1)
--frontTopLeft =        Vector(-1, 1, 1)
--frontBottomRight =    Vector(1, -1, 1) 
--frontBottomLeft =     Vector(-1, -1, 1) 
--backTopRight =        Vector(1, 1, -1) 
--backTopLeft =         Vector(-1, 1, -1)
--backBottomRight =     Vector(1, -1, -1) 
--backBottomLeft =      Vector(-1, -1, -1) 

TLSE_CheckRayIntersectsBox = function(vector_rayOrigin, vector_rayDirection, vector_frontTopRight, vector_frontTopLeft, vector_frontBottomRight, vector_frontBottomLeft, vector_backTopRight, vector_backTopLeft, vector_backBottomRight, vector_backBottomLeft)
    local bool_frontQuadHit = TLSE_CheckIntersectsQuad(vector_rayOrigin, vector_rayDirection, vector_frontTopRight, vector_frontTopLeft, vector_frontBottomLeft, vector_frontBottomRight, false);
    local bool_backQuadHit = TLSE_CheckIntersectsQuad(vector_rayOrigin, vector_rayDirection, vector_backTopLeft, vector_backTopRight, vector_backBottomRight, vector_backBottomLeft, false);
    local bool_leftQuadHit = TLSE_CheckIntersectsQuad(vector_rayOrigin, vector_rayDirection, vector_frontTopLeft, vector_backTopLeft, vector_backBottomLeft, vector_frontBottomLeft, false);
    local bool_rightQuadHit = TLSE_CheckIntersectsQuad(vector_rayOrigin, vector_rayDirection, vector_frontTopRight, vector_frontBottomRight, vector_backBottomRight, vector_backTopRight, false);
    local bool_topQuadHit = TLSE_CheckIntersectsQuad(vector_rayOrigin, vector_rayDirection, vector_backTopLeft, vector_frontTopLeft, vector_frontTopRight, vector_backTopRight, false);
    local bool_bottomQuadHit = TLSE_CheckIntersectsQuad(vector_rayOrigin, vector_rayDirection, vector_frontBottomLeft, vector_backBottomLeft, vector_backBottomRight, vector_frontBottomRight, false);

    return bool_frontQuadHit or bool_backQuadHit or bool_leftQuadHit or bool_rightQuadHit or bool_topQuadHit or bool_bottomQuadHit;
end

TLSE_GetRayIntersectsBoxHitPointNullable = function(vector_rayOrigin, vector_rayDirection, vector_frontTopRight, vector_frontTopLeft, vector_frontBottomRight, vector_frontBottomLeft, vector_backTopRight, vector_backTopLeft, vector_backBottomRight, vector_backBottomLeft)
    local vector_frontQuadHit = TLSE_GetRayIntersectsQuadHitPointNullable(vector_rayOrigin, vector_rayDirection, vector_frontTopRight, vector_frontTopLeft, vector_frontBottomLeft, vector_frontBottomRight, false);
    local vector_backQuadHit = TLSE_GetRayIntersectsQuadHitPointNullable(vector_rayOrigin, vector_rayDirection, vector_backTopLeft, vector_backTopRight, vector_backBottomRight, vector_backBottomLeft, false);
    local vector_leftQuadHit = TLSE_GetRayIntersectsQuadHitPointNullable(vector_rayOrigin, vector_rayDirection, vector_frontTopLeft, vector_backTopLeft, vector_backBottomLeft, vector_frontBottomLeft, false);
    local vector_rightQuadHit = TLSE_GetRayIntersectsQuadHitPointNullable(vector_rayOrigin, vector_rayDirection, vector_frontTopRight, vector_frontBottomRight, vector_backBottomRight, vector_backTopRight, false);
    local vector_topQuadHit = TLSE_GetRayIntersectsQuadHitPointNullable(vector_rayOrigin, vector_rayDirection, vector_backTopLeft, vector_frontTopLeft, vector_frontTopRight, vector_backTopRight, false);
    local vector_bottomQuadHit = TLSE_GetRayIntersectsQuadHitPointNullable(vector_rayOrigin, vector_rayDirection, vector_frontBottomLeft, vector_backBottomLeft, vector_backBottomRight, vector_frontBottomRight, false);

    if(vector_frontQuadHit ~= nil) then
        return vector_frontQuadHit;
    elseif(vector_backQuadHit ~= nil) then
        return vector_backQuadHit;
    elseif(vector_leftQuadHit ~= nil) then
        return vector_leftQuadHit;
    elseif(vector_rightQuadHit ~= nil) then
        return vector_rightQuadHit;
    elseif(vector_topQuadHit ~= nil) then
        return vector_topQuadHit;
    elseif(vector_bottomQuadHit ~= nil) then
        return vector_bottomQuadHit;
    else
        return nil;
    end
end

TLSE_GetRayIntersectsBoxHitPoint = function(vector_rayOrigin, vector_rayDirection, vector_frontTopRight, vector_frontTopLeft, vector_frontBottomRight, vector_frontBottomLeft, vector_backTopRight, vector_backTopLeft, vector_backBottomRight, vector_backBottomLeft)
    local vector_hitPoint = TLSE_GetRayIntersectsBoxHitPointNullable(vector_rayOrigin, vector_rayDirection, vector_frontTopRight, vector_frontTopLeft, vector_frontBottomRight, vector_frontBottomLeft, vector_backTopRight, vector_backTopLeft, vector_backBottomRight, vector_backBottomLeft);

    if(vector_hitPoint ~= nil) then
        return vector_hitPoint;
    else
        return VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));
    end
end

TLSE_GetRayIntersectsAgentHitPointOBB = function(agent_object, vector_rayOrigin, vector_rayDirection)
    local vector_noHitPoint = VectorAdd(vector_rayOrigin, VectorScale(vector_rayDirection, TLSE_Math_MaxValue));    

    if(agent_object == nil) then
        return vector_noHitPoint;
    end

    --we need to access the agent properties to get what we need
    local propertySet_agentProperties = AgentGetRuntimeProperties(agent_object);

    --if the agent does not have these properties... then we are in trouble.
    if(PropertyExists(propertySet_agentProperties, "Extents Min") == false) or (PropertyExists(propertySet_agentProperties, "Extents Max") == false) then
        return vector_noHitPoint;
    end

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
    
    --if the agent has these properties, we need to apply these adjustments
    if(PropertyExists(propertySet_agentProperties, "Render Global Scale")) or (PropertyExists(propertySet_agentProperties, "Render Axis Scale")) then
        --get the render scaling values
        local number_renderGlobalScale = PropertyGet(propertySet_agentProperties, "Render Global Scale"); --single scalar value
        local vector_renderAxisScale = PropertyGet(propertySet_agentProperties, "Render Axis Scale"); --vector scale value

        --apply the render scalar value
        vector_adjustedExtentsMin = VectorScale(vector_adjustedExtentsMin, number_renderGlobalScale);
        vector_adjustedExtentsMax = VectorScale(vector_adjustedExtentsMax, number_renderGlobalScale);

        --apply the render axis scale vector
        vector_adjustedExtentsMin = TLSE_VectorMultiply(vector_adjustedExtentsMin, vector_renderAxisScale);
        vector_adjustedExtentsMax = TLSE_VectorMultiply(vector_adjustedExtentsMax, vector_renderAxisScale);
    end

    ---------------------------------------------------------
    --calculate the following values that we can store in our new "Bounds" object.

    --calculate extents from min and max
    local vector_objectExtents = VectorSubtract(vector_adjustedExtentsMax, vector_adjustedExtentsMin);
    vector_objectExtents = VectorScale(vector_objectExtents, 0.5);

    --calculate the origin point of this bounds object
    local vector_objectCenter = VectorAdd(vector_adjustedExtentsMin, vector_objectExtents);

    local frontTopRight = Vector(1, 1, 1);
    local frontTopLeft = Vector(-1, 1, 1);
    local frontBottomRight = Vector(1, -1, 1);
    local frontBottomLeft = Vector(-1, -1, 1);
    local backTopRight = Vector(1, 1, -1);
    local backTopLeft = Vector(-1, 1, -1);
    local backBottomRight = Vector(1, -1, -1);
    local backBottomLeft = Vector(-1, -1, -1);

    frontTopRight = TLSE_VectorMultiply(frontTopRight, vector_objectExtents);
    frontTopLeft = TLSE_VectorMultiply(frontTopLeft, vector_objectExtents);
    frontBottomRight = TLSE_VectorMultiply(frontBottomRight, vector_objectExtents);
    frontBottomLeft = TLSE_VectorMultiply(frontBottomLeft, vector_objectExtents);
    backTopRight = TLSE_VectorMultiply(backTopRight, vector_objectExtents);
    backTopLeft = TLSE_VectorMultiply(backTopLeft, vector_objectExtents);
    backBottomRight = TLSE_VectorMultiply(backBottomRight, vector_objectExtents);
    backBottomLeft = TLSE_VectorMultiply(backBottomLeft, vector_objectExtents);

    frontTopRight = VectorAdd(frontTopRight, vector_objectCenter);
    frontTopLeft = VectorAdd(frontTopLeft, vector_objectCenter);
    frontBottomRight = VectorAdd(frontBottomRight, vector_objectCenter);
    frontBottomLeft = VectorAdd(frontBottomLeft, vector_objectCenter);
    backTopRight = VectorAdd(backTopRight, vector_objectCenter);
    backTopLeft = VectorAdd(backTopLeft, vector_objectCenter);
    backBottomRight = VectorAdd(backBottomRight, vector_objectCenter);
    backBottomLeft = VectorAdd(backBottomLeft, vector_objectCenter);

    local transformed_frontTopRight = AgentLocalToWorld(agent_currentSelectedAgent, frontTopRight);
    local transformed_frontTopLeft = AgentLocalToWorld(agent_currentSelectedAgent, frontTopLeft);
    local transformed_frontBottomRight = AgentLocalToWorld(agent_currentSelectedAgent, frontBottomRight);
    local transformed_frontBottomLeft = AgentLocalToWorld(agent_currentSelectedAgent, frontBottomLeft);
    local transformed_backTopRight = AgentLocalToWorld(agent_currentSelectedAgent, backTopRight);
    local transformed_backTopLeft = AgentLocalToWorld(agent_currentSelectedAgent, backTopLeft);
    local transformed_backBottomRight = AgentLocalToWorld(agent_currentSelectedAgent, backBottomRight);
    local transformed_backBottomLeft = AgentLocalToWorld(agent_currentSelectedAgent, backBottomLeft);

    local vector_hitTest = TLSE_GetRayIntersectsBoxHitPoint(vector_rayOrigin, vector_rayDirection, transformed_frontTopRight, transformed_frontTopLeft, transformed_frontBottomRight, transformed_frontBottomLeft, transformed_backTopRight, transformed_backTopLeft, transformed_backBottomRight, transformed_backBottomLeft);

    return vector_hitTest;
end