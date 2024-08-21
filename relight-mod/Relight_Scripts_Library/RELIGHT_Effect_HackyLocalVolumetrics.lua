local string_elementPropFile = "fx_glowWhite.prop" -- in 201 data
local string_volumeAgentGroupName = "RELIGHT_LocalVolumetricParentGroup";
local string_planeAgentName = "RELIGHT_LocalVolumetricPlane_";
local number_volumeCount = 0;
local localVolume_volumes = {};

RELIGHT_HackyLocalVolumetrics_Add = function(vector_position, number_size, number_samples, number_samplesOffset, color_fogColor)
    number_volumeCount = number_volumeCount + 1;

    local agent_localVolumeGroup = AgentCreate(string_volumeAgentGroupName .. tostring(number_volumeCount), "group.prop", Vector(0,0,0), Vector(0,0,0), RELIGHT_SceneObject, false, false);

    for index = 1, number_samples, 1 do 
        local vector_planePosition = Vector(0, 0, index * number_samplesOffset);
        vector_planePosition.z = vector_planePosition.z - ((number_samples * number_samplesOffset) * 0.5);

        local vector_planeRotation = Vector(0, 180, 0);

        local agent_volumePlaneName = string_planeAgentName .. tostring(index);
        local agent_volumePlane = AgentCreate(agent_volumePlaneName, string_elementPropFile, vector_planePosition, vector_planeRotation, RELIGHT_SceneObject, false, false);

        --NOTE: If scale is too small, when the volumetric planes are placed at a great distance from camera you will see a sort of "clipping" of the volumetric lighting which looks awkward.
        AgentSetProperty(agent_volumePlane, "Render Global Scale", number_size);
        AgentSetProperty(agent_volumePlane, "Render Cull", false);
        AgentSetProperty(agent_volumePlane, "Render Layer", 25);
        AgentSetProperty(agent_volumePlane, "Render Diffuse Color", color_fogColor);
        AgentSetProperty(agent_volumePlane, "Render Constant Alpha Multiply", 1);
        AgentSetProperty(agent_volumePlane, "Render After Anti-Aliasing", false);
        AgentSetProperty(agent_volumePlane, "Render EnvLight Shadow Cast Enable", false);
        AgentSetProperty(agent_volumePlane, "Motion Blur Enabled", false);
        AgentSetProperty(agent_volumePlane, "Render Depth Test", true);
        AgentSetProperty(agent_volumePlane, "Camera Facing", false);
        AgentSetProperty(agent_volumePlane, "Render Static", false);
        AgentSetProperty(agent_volumePlane, "Camera Facing Type", 0);
        AgentSetProperty(agent_volumePlane, "Render Depth Write", false);
        AgentSetProperty(agent_volumePlane, "Render Depth Write Alpha", false);
        AgentSetProperty(agent_volumePlane, "Render 3D Alpha", false);
        AgentSetProperty(agent_volumePlane, "Render Color Write", true);
        AgentSetProperty(agent_volumePlane, "Render Force As Alpha", false);
        AgentSetProperty(agent_volumePlane, "Render Depth Test Function", 4);
        AgentSetProperty(agent_volumePlane, "Receive Shadows", true);
        AgentSetProperty(agent_volumePlane, "Render FX Color Enabled", true);
        AgentSetProperty(agent_volumePlane, "Render Shadow Force Visible", false);
        AgentSetProperty(agent_volumePlane, "Render Enlighten Force Visible", false);
        AgentSetProperty(agent_volumePlane, "fx_glowWhite - Light Color Diffuse", color_fogColor);

        AgentAttach(agent_volumePlane, agent_localVolumeGroup);
    end

    AgentSetWorldPos(agent_localVolumeGroup, vector_position);
    
    local localVolume_newVolume = 
    {
        GroupAgent = agent_localVolumeGroup,
    };

    table.insert(localVolume_volumes, localVolume_newVolume);
end

RELIGHT_HackyLocalVolumetrics_Update = function()
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject);
    local vector_currentCameraRotation = AgentGetWorldRot(agent_currentCamera);

    for index, localVolume_volume in pairs(localVolume_volumes) do
        AgentSetRot(localVolume_volume["GroupAgent"], vector_currentCameraRotation);
    end
end