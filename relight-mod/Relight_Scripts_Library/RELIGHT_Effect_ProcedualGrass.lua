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
    local vector_startPositionOffset = Vector(vector_size.x / 2, 0, vector_size.z / 2);

    agent_grassGroup = AgentCreate(string_grassGroupName, "group.prop", Vector(0, 0, 0), Vector(0, 0, 0), RELIGHT_SceneObject, false, false);

    for x = 1, number_elementsX, 1 do 
        local number_grassPositionX = x * number_elementsOffsetX;
      
        for z = 1, number_elementsZ, 1 do 
            local string_grassElementName = string_grassElementName .. "_x_" .. tostring(x) .. "_z_" .. tostring(z);

            local number_grassPositionZ = z * number_elementsOffsetZ;
            local number_grassRotationY = math.random(0, 180);
          
            local vector_grassPosition = Vector(number_grassPositionX, 0, number_grassPositionZ);
            local vector_grassRotation = Vector(0, number_grassRotationY, 0);

            local agent_grassElement = AgentCreate(string_grassElementName, RELIGHT_ProcedualGrass_PropFile, vector_grassPosition, vector_grassRotation, RELIGHT_SceneObject, false, false);
            AgentSetProperty(agent_grassElement, "Render Global Scale", RELIGHT_ProcedualGrass_GrassScale);

            --performance properties
            AgentSetProperty(agent_grassElement, "Render Cull", true); --make sure the grass gets culled when out of view
            AgentSetProperty(agent_grassElement, "Render EnvLight Shadow Cast Enable", false); --force shadows off, don't want to add draw calls
            AgentSetProperty(agent_grassElement, "Render Shadow Force Visible", false); --force shadows off, don't want to add draw calls
            AgentSetProperty(agent_grassElement, "Render Enlighten Force Visible", false); --force shadows off, don't want to add draw calls
            AgentSetProperty(agent_grassElement, "Render Static", true); --the grass doesn't move (other than shader animations on it) so might as well make it static

            AgentAttach(agent_grassElement, agent_grassGroup);
        end
    end
  
    AgentSetWorldPos(agent_grassGroup,  VectorSubtract(vector_startPosition, vector_startPositionOffset));
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