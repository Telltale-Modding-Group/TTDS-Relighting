local label_infoText = nil;

local vectorField_extentsMin = nil; --(Vector3) Extents Min
local vectorField_extentsMax = nil; --(Vector3) Extents Max
local boolField_renderCull = nil; --(boolean) Render Cull
local boolField_renderStatic = nil; --(boolean) Render Static
local boolField_renderDepthTest = nil; --(boolean) Render Depth Test
local numberField_renderDepthTestFunction = nil; --(number) Render Depth Test Function
local boolField_renderDepthWrite = nil; --(boolean) Render Depth Write
local boolField_renderDepthWriteAlpha = nil; --(boolean) Render Depth Write Alpha
local boolField_render3DAlpha = nil; --(boolean) Render 3D Alpha
local numberField_renderConstantAlpha = nil; --(number) Render Constant Alpha
local numberField_renderConstantAlphaMultiply = nil; --(number) Render Constant Alpha Multiply
local boolField_renderColorWrite = nil; --(boolean) Render Color Write
local boolField_renderForceAsAlpha = nil; --(boolean) Render Force As Alpha
local boolField_renderShadowForceVisible = nil; --(boolean) Render Shadow Force Visible
local boolField_renderEnlightenForceVisible = nil; --(boolean) Render Enlighten Force Visible
local boolField_renderLightShadowCastEnable = nil; --(boolean) Render EnvLight Shadow Cast Enable
local boolField_renderRecieveShadows = nil; --(boolean) Recieve Shadows
local boolField_renderFXColorEnabled = nil; --(boolean) Render FX Color Enabled
local colorField_renderDiffuseColor = nil; --(Color) Render Diffuse Color
local numberField_renderLayer = nil; --(number) Render Layer
local numberField_renderMaterialTime = nil; --(number) Render Material Time
local boolField_renderAutoFocusEnable = nil; --(boolean) Render Auto Focus Enable
local boolField_renderAfterAntiAliasing = nil; --(boolean) Render After Anti-Aliasing
local stringField_renderCinLightRig = nil; --(Symbol/string) Render CinLight Rig
local stringField_renderShareSkeletonWithAgent = nil; --(string) Render Share Skeleton With Agent
local containerField_renderTextureOverrides = nil; --(ContainerInterface) Render Texture Overrides
local containerField_renderLightingGroups = nil; --(ContainerInterface) Render Lighting Groups
local boolField_cameraFacing = nil; --(boolean) Camera Facing
local numberField_cameraFacingType = nil; --(number) Camera Facing Type
local boolField_motionBlurEnabled = nil; --(boolean) Motion Blur Enabled
local boolField_fogOverrideSettings = nil; --(boolean) Fog Override settings
local boolField_fogMeshEnabled = nil; --(boolean) Fog Mesh Enabled
local colorField_fogMeshColor = nil; --(Color) Fog Mesh Color
local numberField_fogMeshNearPlane = nil; --(number) Fog Mesh Near Plane
local numberField_fogMeshFarPlane = nil; --(number) Fog Mesh Far Plane 
local containerField_D3DMeshList = nil; --(ContainerInterface) D3D Mesh List

TLSE_Development_GUI_TabMeshInitalize = function()
    label_infoText = TLSE_Development_Editor_GUI_CreateLabel("No Agent selected...", Vector(0.685, 0.515, 0.0));

    vectorField_extentsMin = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Extents Min", "Extents Min", Vector(0.685, 0.515, 0.0), true, nil, nil, nil, nil, nil, nil);
    vectorField_extentsMax = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Extents Min", "Extents Max", Vector(0.685, 0.545, 0.0), true, nil, nil, nil, nil, nil, nil);
    boolField_renderCull = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Cull", "Render Cull", Vector(0.685, 0.575, 0.0), nil);
    boolField_renderStatic = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Static", "Render Static", Vector(0.685, 0.585, 0.0), nil);
    boolField_renderDepthTest = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Depth Test", "Render Depth Test", Vector(0.685, 0.595, 0.0), nil);
    numberField_renderDepthTestFunction = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Depth Test Function", Vector(0.685, 0.605, 0.0), false, nil, nil);
    boolField_renderDepthWrite = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Depth Write", "Render Depth Write", Vector(0.685, 0.615, 0.0), nil);
    boolField_renderDepthWriteAlpha = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Depth Write Alpha", "Render Depth Write Alpha", Vector(0.685, 0.625, 0.0), nil);
    boolField_render3DAlpha = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render 3D Alpha", "Render 3D Alpha", Vector(0.685, 0.635, 0.0), nil);
    numberField_renderConstantAlpha = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Constant Alpha", Vector(0.685, 0.645, 0.0), true, nil, nil);
    numberField_renderConstantAlphaMultiply = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Constant Alpha Multiply", Vector(0.685, 0.655, 0.0), true, nil, nil);
    boolField_renderColorWrite = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Color Write", "Render Color Write", Vector(0.685, 0.665, 0.0), nil);
    boolField_renderForceAsAlpha = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Force As Alpha", "Render Force As Alpha", Vector(0.685, 0.675, 0.0), nil);
    boolField_renderShadowForceVisible = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Shadow Force Visible", "Render Shadow Force Visible", Vector(0.685, 0.685, 0.0), nil);
    boolField_renderEnlightenForceVisible = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Enlighten Force Visible", "Render Enlighten Force Visible", Vector(0.685, 0.695, 0.0), nil);
    boolField_renderLightShadowCastEnable = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render EnvLight Shadow Cast Enable", "Render EnvLight Shadow Cast Enable", Vector(0.685, 0.705, 0.0), nil);
    boolField_renderRecieveShadows = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Recieve Shadows", "Render Recieve Shadows", Vector(0.685, 0.715, 0.0), nil);
    boolField_renderFXColorEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render FX Color Enabled", "Render FX Color Enabled", Vector(0.685, 0.725, 0.0), nil);
    colorField_renderDiffuseColor = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Render Diffuse Color", "Render Diffuse Color", Vector(0.685, 0.735, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    numberField_renderLayer = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Layer", Vector(0.685, 0.775, 0.0), true, nil, nil);
    numberField_renderMaterialTime = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Material Time", Vector(0.685, 0.785, 0.0), true, nil, nil);
    boolField_renderAutoFocusEnable = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Auto Focus Enable", "Render Auto Focus Enable", Vector(0.685, 0.795, 0.0), nil);
    boolField_renderAfterAntiAliasing = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render After Anti-Aliasing", "Render After Anti-Aliasing", Vector(0.685, 0.805, 0.0), nil);
    stringField_renderCinLightRig = TLSE_Development_Editor_GUI_CreateLabel("Render CinLight Rig", Vector(0.685, 0.815, 0.0));
    stringField_renderShareSkeletonWithAgent = TLSE_Development_Editor_GUI_CreateLabel("Render Share Skeleton With Agent", Vector(0.685, 0.825, 0.0));
    containerField_renderTextureOverrides = TLSE_Development_Editor_GUI_CreateLabel("Render Texture Overrides", Vector(0.685, 0.835, 0.0));
    containerField_renderLightingGroups = TLSE_Development_Editor_GUI_CreateLabel("Render Lighting Groups", Vector(0.685, 0.845, 0.0));
    boolField_cameraFacing = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Camera Facing", "Camera Facing", Vector(0.685, 0.855, 0.0), nil);
    numberField_cameraFacingType = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Camera Facing Type", Vector(0.685, 0.865, 0.0), true, nil, nil);
    boolField_motionBlurEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Motion Blur Enabled", "Motion Blur Enabled", Vector(0.685, 0.875, 0.0), nil);
    boolField_fogOverrideSettings = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Fog Override settings", "Fog Override settings", Vector(0.685, 0.885, 0.0), nil);
    boolField_fogMeshEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Fog Mesh Enabled", "Fog Mesh Enabled", Vector(0.685, 0.895, 0.0), nil);
    colorField_fogMeshColor = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Fog Mesh Color", "Fog Mesh Color", Vector(0.685, 0.905, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    numberField_fogMeshNearPlane = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Mesh Near Plane", Vector(0.685, 0.945, 0.0), true, nil, nil);
    numberField_fogMeshFarPlane = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Mesh Far Plane", Vector(0.685, 0.955, 0.0), true, nil, nil);
    containerField_D3DMeshList = TLSE_Development_Editor_GUI_CreateLabel("D3D Mesh List", Vector(0.685, 0.965, 0.0));
end

TLSE_Development_GUI_TabMeshUpdate = function()
    local bool_propertiesActive = TLSE_Development_GUI_MeshTabActive;

    label_infoText["Visible"] = TLSE_Development_GUI_MeshTabActive;

    if(agent_currentSelectedAgent == nil) then
        label_infoText["Text"] = "No Agent selected...";
        bool_propertiesActive = false;
    elseif(agent_currentSelectedAgent ~= nil) and (TLSE_AgentIsMesh(agent_currentSelectedAgent) == false) then
        label_infoText["Text"] = "Agent Selected, but no Mesh properties were found...";
        bool_propertiesActive = false;
    else
        label_infoText["Text"] = "";
        label_infoText["Visible"] = false;
    end

    vectorField_extentsMin["Visible"] = bool_propertiesActive;
    vectorField_extentsMax["Visible"] = bool_propertiesActive;
    boolField_renderCull["Visible"] = bool_propertiesActive;
    boolField_renderStatic["Visible"] = bool_propertiesActive;
    boolField_renderDepthTest["Visible"] = bool_propertiesActive;
    numberField_renderDepthTestFunction["Visible"] = bool_propertiesActive;
    boolField_renderDepthWrite["Visible"] = bool_propertiesActive;
    boolField_renderDepthWriteAlpha["Visible"] = bool_propertiesActive;
    boolField_render3DAlpha["Visible"] = bool_propertiesActive;
    numberField_renderConstantAlpha["Visible"] = bool_propertiesActive;
    numberField_renderConstantAlphaMultiply["Visible"] = bool_propertiesActive;
    boolField_renderColorWrite["Visible"] = bool_propertiesActive;
    boolField_renderForceAsAlpha["Visible"] = bool_propertiesActive;
    boolField_renderShadowForceVisible["Visible"] = bool_propertiesActive;
    boolField_renderEnlightenForceVisible["Visible"] = bool_propertiesActive;
    boolField_renderLightShadowCastEnable["Visible"] = bool_propertiesActive;
    boolField_renderRecieveShadows["Visible"] = bool_propertiesActive;
    boolField_renderFXColorEnabled["Visible"] = bool_propertiesActive;
    colorField_renderDiffuseColor["Visible"] = bool_propertiesActive;
    numberField_renderLayer["Visible"] = bool_propertiesActive;
    numberField_renderMaterialTime["Visible"] = bool_propertiesActive;
    boolField_renderAutoFocusEnable["Visible"] = bool_propertiesActive;
    boolField_renderAfterAntiAliasing["Visible"] = bool_propertiesActive;
    boolField_cameraFacing["Visible"] = bool_propertiesActive;
    numberField_cameraFacingType["Visible"] = bool_propertiesActive;
    boolField_motionBlurEnabled["Visible"] = bool_propertiesActive;
    boolField_fogOverrideSettings["Visible"] = bool_propertiesActive;
    boolField_fogMeshEnabled["Visible"] = bool_propertiesActive;
    colorField_fogMeshColor["Visible"] = bool_propertiesActive;
    numberField_fogMeshNearPlane["Visible"] = bool_propertiesActive;
    numberField_fogMeshFarPlane["Visible"] = bool_propertiesActive;
    stringField_renderCinLightRig["Visible"] = bool_propertiesActive;
    stringField_renderShareSkeletonWithAgent["Visible"] = bool_propertiesActive;
    containerField_renderTextureOverrides["Visible"] = bool_propertiesActive;
    containerField_renderLightingGroups["Visible"] = bool_propertiesActive;
    containerField_D3DMeshList["Visible"] = bool_propertiesActive;

    if(bool_propertiesActive == false) then
        return
    end

    vectorField_extentsMin["ReferenceAgent"] = agent_currentSelectedAgent;
    vectorField_extentsMax["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderCull["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderStatic["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderDepthTest["ReferenceAgent"] = agent_currentSelectedAgent;
    numberField_renderDepthTestFunction["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderDepthWrite["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderDepthWriteAlpha["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_render3DAlpha["ReferenceAgent"] = agent_currentSelectedAgent;
    numberField_renderConstantAlpha["ReferenceAgent"] = agent_currentSelectedAgent;
    numberField_renderConstantAlphaMultiply["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderColorWrite["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderForceAsAlpha["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderShadowForceVisible["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderEnlightenForceVisible["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderLightShadowCastEnable["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderRecieveShadows["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderFXColorEnabled["ReferenceAgent"] = agent_currentSelectedAgent;
    colorField_renderDiffuseColor["ReferenceAgent"] = agent_currentSelectedAgent;
    numberField_renderLayer["ReferenceAgent"] = agent_currentSelectedAgent;
    numberField_renderMaterialTime["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderAutoFocusEnable["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_renderAfterAntiAliasing["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_cameraFacing["ReferenceAgent"] = agent_currentSelectedAgent;
    numberField_cameraFacingType["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_motionBlurEnabled["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_fogOverrideSettings["ReferenceAgent"] = agent_currentSelectedAgent;
    boolField_fogMeshEnabled["ReferenceAgent"] = agent_currentSelectedAgent;
    colorField_fogMeshColor["ReferenceAgent"] = agent_currentSelectedAgent;
    numberField_fogMeshNearPlane["ReferenceAgent"] = agent_currentSelectedAgent;
    numberField_fogMeshFarPlane["ReferenceAgent"] = agent_currentSelectedAgent;






    if(agent_currentSelectedAgent ~= nil) then
        --stringField_renderCinLightRig
        if(AgentHasProperty(agent_currentSelectedAgent, "Render CinLight Rig")) then
            stringField_renderCinLightRig["Text"] = "Render CinLight Rig: " .. tostring(AgentGetProperty(agent_currentSelectedAgent, "Render CinLight Rig"));
        else
            stringField_renderCinLightRig["Text"] = "Render CinLight Rig: nil";
        end

        --stringField_renderShareSkeletonWithAgent
        if(AgentHasProperty(agent_currentSelectedAgent, "Render Share Skeleton With Agent")) then
            stringField_renderShareSkeletonWithAgent["Text"] = "Render Share Skeleton With Agent: " .. tostring(AgentGetProperty(agent_currentSelectedAgent, "Render Share Skeleton With Agent"));
        else
            stringField_renderShareSkeletonWithAgent["Text"] = "Render Share Skeleton With Agent: nil";
        end

        --containerField_renderLightingGroups
        if(AgentHasProperty(agent_currentSelectedAgent, "Render Lighting Groups")) then
            local string_lightingGroupsTest = "";
            local container_lightingGroups = AgentGetProperty(agent_currentSelectedAgent, "Render Lighting Groups");

            string_lightingGroupsTest = "Render Lighting Groups: ";

            if(container_lightingGroups == nil) then
                string_lightingGroupsTest = string_lightingGroupsTest .. "nil";
            else
                string_lightingGroupsTest = string_lightingGroupsTest .. TLSE_ContainerToString(container_lightingGroups, false);
            end

            containerField_renderLightingGroups["Text"] = string_lightingGroupsTest;
        else
            containerField_renderLightingGroups["Text"] = "Render Lighting Groups: nil";
        end

        --containerField_D3DMeshList
        if(AgentHasProperty(agent_currentSelectedAgent, "D3D Mesh List")) then
            local string_d3dMeshList = "";
            local container_d3dMeshList = AgentGetProperty(agent_currentSelectedAgent, "D3D Mesh List");

            string_d3dMeshList = "D3D Mesh List: ";

            if(container_d3dMeshList == nil) then
                string_d3dMeshList = string_d3dMeshList .. "nil";
            else
                string_d3dMeshList = string_d3dMeshList .. TLSE_ContainerToString(container_d3dMeshList, false);
            end

            containerField_D3DMeshList["Text"] = string_d3dMeshList;
        else
            containerField_D3DMeshList["Text"] = "D3D Mesh List: nil";
        end
    else
        stringField_renderCinLightRig["Text"] = "Render CinLight Rig: nil";
        stringField_renderShareSkeletonWithAgent["Text"] = "Render Share Skeleton With Agent: nil";
        containerField_renderLightingGroups["Text"] = "Render Lighting Groups: nil";
    end
end