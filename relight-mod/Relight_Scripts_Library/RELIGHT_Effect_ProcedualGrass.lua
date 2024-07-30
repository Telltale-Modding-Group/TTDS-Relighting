local string_grassElementName = "RELIGHT_ProcedualGrassElement";
local string_grassGroupName = "RELIGHT_ProcedualGrass";

RELIGHT_ProcedualGrass_PropFile = "";
RELIGHT_ProcedualGrass_CountX = 35;
RELIGHT_ProcedualGrass_CountZ = 35;
RELIGHT_ProcedualGrass_PositionIncrement = 0.3;
RELIGHT_ProcedualGrass_GrassScale = 0.45;

RELIGHT_ProcedualGrass_Initalize = function()
    local vector_startPosition = Vector(0, 0, 0);
    vector_startPosition.x = -(RELIGHT_ProcedualGrass_CountX / 2) * RELIGHT_ProcedualGrass_PositionIncrement;
    vector_startPosition.y = -0.05;
    vector_startPosition.z = -(RELIGHT_ProcedualGrass_CountZ / 2) * RELIGHT_ProcedualGrass_PositionIncrement;

    local agent_grassGroup = AgentCreate(string_grassGroupName, "group.prop", Vector(0,0,0), Vector(0,0,0), RELIGHT_kScene, false, false);
  
    for x = 1, RELIGHT_ProcedualGrass_CountX, 1 do 
        local number_grassPositionX = vector_startPosition.x + (x * RELIGHT_ProcedualGrass_PositionIncrement);
      
        for z = 1, RELIGHT_ProcedualGrass_CountZ, 1 do 
            local string_grassElementName = string_grassElementName .. "_x_" .. tostring(x) .. "_z_" .. tostring(z);

            local number_grassPositionZ = vector_startPosition.z + (z * RELIGHT_ProcedualGrass_PositionIncrement);
            local number_grassRotationY = math.random(0, 180);
          
            local vector_grassPosition = Vector(number_grassPositionX, vector_startPosition.y, number_grassPositionZ);
            local vector_grassRotation = Vector(0, number_grassRotationY, 0);

            --avoid placing grass on the following objects
            local object1_distance = VectorDistance(newPosition, Vector(-0.05, 0, 5.41)) --license plate
            local object2_distance = VectorDistance(newPosition, Vector(0, 0, 2.3)) --campfire
            local object3_distance = VectorDistance(newPosition, Vector(4.3, 0, 4.4)) --clem backpack
            local case1 = object1_distance > 0.6
            local case2 = object2_distance > 1.1
            local case3 = object3_distance > 0.6

            --if these cases are met, we can place grass
            if case1 and case2 and case3 then
                --place grass
                local agent_grassElement = AgentCreate(string_grassElementName, RELIGHT_ProcedualGrass_PropFile, vector_grassPosition, vector_grassRotation, RELIGHT_kScene, false, false);
                AgentSetProperty(agent_grassElement, "Render Global Scale", RELIGHT_ProcedualGrass_GrassScale);
                AgentSetProperty(agent_grassElement, "Render Cull", true);
                AgentAttach(agent_grassElement, agent_grassGroup);
            end
        end
    end
  
    AgentSetWorldPos(agent_grassGroup, Vector(0, 0, 0));
end
