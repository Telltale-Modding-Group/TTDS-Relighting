--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - VECTOR ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - VECTOR ||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||| MATH FUNCTIONS - VECTOR ||||||||||||||||||||||||||||||||||||||||||||

TLSE_VectorMultiply = function(vector_a, vector_b)
    local number_newX = vector_a.x * vector_b.x;
    local number_newY = vector_a.y * vector_b.y;
    local number_newZ = vector_a.z * vector_b.z;

    return Vector(number_newX, number_newY, number_newZ);
end

-- Returns a vector that is made from the smallest components of two vectors.
TLSE_VectorMin = function(vector_a, vector_b)
    local number_newX = math.min(vector_a.x, vector_b.x);
    local number_newY = math.min(vector_a.y, vector_b.y);
    local number_newZ = math.min(vector_a.z, vector_b.z);

    return Vector(number_newX, number_newY, number_newZ);
end

-- Returns a vector that is made from the largest components of two vectors.
TLSE_VectorMax = function(vector_a, vector_b)
    local number_newX = math.max(vector_a.x, vector_b.x);
    local number_newY = math.max(vector_a.y, vector_b.y);
    local number_newZ = math.max(vector_a.z, vector_b.z);

    return Vector(number_newX, number_newY, number_newZ);
end

TLSE_VectorLerp = function(vector_a, vector_b, number_transition)
    local number_newX = TLSE_NumberLerp(vector_a.x, vector_b.x, number_transition);
    local number_newY = TLSE_NumberLerp(vector_a.y, vector_b.y, number_transition);
    local number_newZ = TLSE_NumberLerp(vector_a.z, vector_b.z, number_transition);
    
    return Vector(number_newX, number_newY, number_newZ);
end

TLSE_VectorSmoothstep = function(a, b, t)
    local number_newX = TLSE_NumberSmoothstep(a.x, b.x, t);
    local number_newY = TLSE_NumberSmoothstep(a.y, b.y, t);
    local number_newZ = TLSE_NumberSmoothstep(a.z, b.z, t);
    
    return Vector(number_newX, number_newY, number_newZ);
end

--Reflects a vector off the plane defined by a normal.
TLSE_VectorReflect = function(vector_inDirection, vector_inNormal)
    local number_factor = -2 * VectorDot(vector_inNormal, vector_inDirection);

    local number_result_x = number_factor * vector_inNormal.x + vector_inDirection.x;
    local number_result_y = number_factor * vector_inNormal.y + vector_inDirection.y;
    local number_result_z = number_factor * vector_inNormal.z + vector_inDirection.z;

    return Vector(number_result_x, number_result_y, number_result_z);
end

--Returns the angle in degrees between /from/ and /to/. This is always the smallest
TLSE_VectorAngle = function(vector_from, vector_to)
    local sqrMagnitude_from = VectorLengthSq(vector_from);
    local sqrMagnitude_to = VectorLengthSq(vector_to);

    local denominator = math.sqrt(sqrMagnitude_from * sqrMagnitude_to);

    local vector_dot = VectorDot(vector_from, vector_to);

    local dot_product = TLSE_NumberClamp(vector_dot / denominator, -1, 1);

    local result = math.acos(dot_product) * TLSE_Math_Rad2Deg;

    return result;
end

--Returns the closest of the two vectors relative to the origin vector.
TLSE_VectorClosest = function(vector_origin, vector_a, vector_b)
    local number_distanceToA = VectorDistance(vector_origin, vector_a);
    local number_distanceToB = VectorDistance(vector_origin, vector_b);

    if(number_distanceToA < number_distanceToB) then
        return vector_a;
    else
        return vector_b;
    end
end

--The smaller of the two possible angles between the two vectors is returned, therefore the result will never be greater than 180 degrees or smaller than -180 degrees.
--If you imagine the from and to vectors as lines on a piece of paper, both originating from the same point, then the /axis/ vector would point up out of the paper.
--The measured angle between the two vectors would be positive in a clockwise direction and negative in an anti-clockwise direction.
TLSE_VectorSignedAngle = function(vector_from, vector_to, vector_axis)
    local unsignedAngle = TLSE_VectorAngle(vector_from, vector_to);

    local cross_x = vector_from.y * vector_to.z - vector_from.z * vector_to.y;
    local cross_y = vector_from.z * vector_to.x - vector_from.x * vector_to.z;
    local cross_z = vector_from.x * vector_to.y - vector_from.y * vector_to.x;
    local total_cross = axis.x * cross_x + axis.y * cross_y + axis.z * cross_z;

    local sign = TLSE_NumberSign(total_cross);

    return unsignedAngle * sign;
end

TLSE_VectorAverage = function(vector_a, vector_b)
    local averaged_x = (vector_a.x + vector_b.x) / 2.0;
    local averaged_y = (vector_a.y + vector_b.y) / 2.0;
    local averaged_z = (vector_a.z + vector_b.z) / 2.0;
    return Vector(averaged_x, averaged_y, averaged_z);
end