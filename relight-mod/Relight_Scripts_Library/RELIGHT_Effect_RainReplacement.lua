local string_grassElementName = "RELIGHT_ProcedualGrassElement";
local string_grassGroupName = "RELIGHT_ProcedualGrass";
local agent_grassGroup = nil;

RELIGHT_ProcedualGrass_PropFile = "";
RELIGHT_ProcedualGrass_DensityPerUnit = 1;
RELIGHT_ProcedualGrass_GrassScale = 0.45;

RELIGHT_ProcedualGrass_IgnoreZones = {};

RELIGHT_ProcedualGrass_Initalize = function(vector_startPosition, vector_size)
    local number_elementsX = vector_size.x / RELIGHT_ProcedualGrass_DensityPerUnit;
    local number_elementsZ = vector_size.z / RELIGHT_ProcedualGrass_DensityPerUnit;
    local number_elementsOffsetX = vector_size.x / number_elementsX;
    local number_elementsOffsetZ = vector_size.z / number_elementsZ;
    local number_startPositionOffsetX = (number_elementsX / 2) * number_elementsOffsetX;
    local number_startPositionOffsetZ = (number_elementsZ / 2) * number_elementsOffsetZ;
    vector_startPosition = VectorSubtract(vector_startPosition, Vector(number_startPositionOffsetX, 0, number_startPositionOffsetZ));

    agent_grassGroup = AgentCreate(string_grassGroupName, "group.prop", Vector(0,0,0), Vector(0,0,0), RELIGHT_SceneObject, false, false);

    for x = 1, number_elementsX, 1 do 
        local number_grassPositionX = vector_startPosition.x + (x * number_elementsOffsetX);
      
        for z = 1, number_elementsZ, 1 do 
            local string_grassElementName = string_grassElementName .. "_x_" .. tostring(x) .. "_z_" .. tostring(z);

            local number_grassPositionZ = vector_startPosition.z + (z * number_elementsOffsetZ);
            local number_grassRotationY = math.random(0, 180);
          
            local vector_grassPosition = Vector(number_grassPositionX, vector_startPosition.y, number_grassPositionZ);
            local vector_grassRotation = Vector(0, number_grassRotationY, 0);

            local agent_grassElement = AgentCreate(string_grassElementName, RELIGHT_ProcedualGrass_PropFile, vector_grassPosition, vector_grassRotation, RELIGHT_SceneObject, false, false);
            AgentSetProperty(agent_grassElement, "Render Global Scale", RELIGHT_ProcedualGrass_GrassScale);
            AgentSetProperty(agent_grassElement, "Render Cull", true);
            AgentAttach(agent_grassElement, agent_grassGroup);
        end
    end
  
    AgentSetWorldPos(agent_grassGroup, Vector(0, 0, 0));
end

RELIGHT_ProcedualGrass_Cleanup = function()
    if(agent_grassGroup == nil) then
        return;
    end

    local agentTable_attachments = AgentGetAttachments(agent_grassGroup);

    if(agentTable_attachments ~= nil) then
        for index, agent_attachedAgent in pairs(agentTable_attachments) do
            AgentDestroy(agent_attachedAgent);
        end
    end

    AgentDestroy(agent_grassGroup);
end