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

local numberPropertyFieldAdjustmentValue = 1;

local ModifiyNumberPropertyValueOnAgent = function(string_property, number_adjustment, bool_multiplyByFrameTime)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, string_property)) then
            local number_originalValue = AgentGetProperty(agent_currentSelectedAgent, string_property);

            if(bool_multiplyByFrameTime) then
                number_originalValue = number_originalValue + (number_adjustment * GetFrameTime());
            else
                number_originalValue = number_originalValue + number_adjustment;
            end

            AgentSetProperty(agent_currentSelectedAgent, string_property, number_originalValue);
        end
    end
end

local ModifiyBooleanPropertyValueOnAgent = function(string_property)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, string_property)) then
            local number_originalValue = AgentGetProperty(agent_currentSelectedAgent, string_property);

            number_originalValue = not number_originalValue;

            AgentSetProperty(agent_currentSelectedAgent, string_property, number_originalValue);
        end
    end
end

local ModifiyVector3PropertyValueOnAgent = function(string_property, number_component, number_adjustment)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, string_property)) then
            local vector_originalValue = AgentGetProperty(agent_currentSelectedAgent, string_property);

            if(number_component == 0) then
                vector_originalValue.x = vector_originalValue.x + number_adjustment;
            elseif(number_component == 1) then
                vector_originalValue.y = vector_originalValue.y + number_adjustment;
            elseif(number_component == 2) then
                vector_originalValue.z = vector_originalValue.z + number_adjustment;
            end

            AgentSetProperty(agent_currentSelectedAgent, string_property, vector_originalValue);
        end
    end
end

local ModifiyColorPropertyValueOnAgent = function(string_property, number_channel, number_adjustment, bool_clamp01)
    if(agent_currentSelectedAgent ~= nil) then
        if(AgentHasProperty(agent_currentSelectedAgent, string_property)) then
            local color_originalValue = AgentGetProperty(agent_currentSelectedAgent, string_property);

            if(number_channel == 0) then
                color_originalValue.r = color_originalValue.r + number_adjustment;
            elseif(number_channel == 1) then
                color_originalValue.g = color_originalValue.g + number_adjustment;
            elseif(number_channel == 2) then
                color_originalValue.b = color_originalValue.b + number_adjustment;
            elseif(number_channel == 3) then
                color_originalValue.a = color_originalValue.a + number_adjustment;
            end

            if(bool_clamp01) then
                color_originalValue = TLSE_ColorClamp01(color_originalValue);
            end

            AgentSetProperty(agent_currentSelectedAgent, string_property, color_originalValue);
        end
    end
end

TLSE_TabRender_OnIncrease_FogMeshColor_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Mesh Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnIncrease_FogMeshColor_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Mesh Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnIncrease_FogMeshColor_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Mesh Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnIncrease_FogMeshColor_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Mesh Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnDecrease_FogMeshColor_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Mesh Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnDecrease_FogMeshColor_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Mesh Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnDecrease_FogMeshColor_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Mesh Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnDecrease_FogMeshColor_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Mesh Color", 3, -numberPropertyFieldAdjustmentValue, true); end

TLSE_TabRender_OnIncrease_RenderDiffuseColor_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Render Diffuse Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnIncrease_RenderDiffuseColor_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Render Diffuse Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnIncrease_RenderDiffuseColor_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Render Diffuse Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnIncrease_RenderDiffuseColor_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Render Diffuse Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnDecrease_RenderDiffuseColor_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Render Diffuse Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnDecrease_RenderDiffuseColor_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Render Diffuse Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnDecrease_RenderDiffuseColor_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Render Diffuse Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabRender_OnDecrease_RenderDiffuseColor_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Render Diffuse Color", 3, -numberPropertyFieldAdjustmentValue, true); end

TLSE_TabRender_OnIncrease_ExtentsMin_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Min", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnIncrease_ExtentsMin_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Min", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnIncrease_ExtentsMin_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Min", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnDecrease_ExtentsMin_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Min", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnDecrease_ExtentsMin_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Min", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnDecrease_ExtentsMin_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Min", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnIncrease_ExtentsMax_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Max", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnIncrease_ExtentsMax_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Max", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnIncrease_ExtentsMax_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Max", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnDecrease_ExtentsMax_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Max", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnDecrease_ExtentsMax_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Max", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabRender_OnDecrease_ExtentsMax_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Extents Max", 2, -numberPropertyFieldAdjustmentValue); end

TLSE_TabRender_OnIncrease_DepthTestFunction = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Depth Test Function", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnDecrease_DepthTestFunction = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Depth Test Function", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnIncrease_ConstantAlpha = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Constant Alpha", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnDecrease_ConstantAlpha = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Constant Alpha", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnIncrease_ConstantAlphaMultiply = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Constant Alpha Multiply", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnDecrease_ConstantAlphaMultiply = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Constant Alpha Multiply", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnIncrease_RenderLayer = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Layer", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnDecrease_RenderLayer = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Layer", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnIncrease_RenderMaterialTime = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Material Time", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnDecrease_RenderMaterialTime = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Render Material Time", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnIncrease_CameraFacingType = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Camera Facing Type", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnDecrease_CameraFacingType = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Camera Facing Type", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnIncrease_FogMeshNearPlane = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Mesh Near Plane", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnDecrease_FogMeshNearPlane = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Mesh Near Plane", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnIncrease_FogMeshFarPlane = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Mesh Far Plane", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabRender_OnDecrease_FogMeshFarPlane = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Mesh Far Plane", -numberPropertyFieldAdjustmentValue, false); end

TLSE_TabRender_OnToggle_Cull = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Cull"); end
TLSE_TabRender_OnToggle_Static = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Static"); end
TLSE_TabRender_OnToggle_DepthTest = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Depth Test"); end
TLSE_TabRender_OnToggle_DepthWrite = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Depth Write"); end
TLSE_TabRender_OnToggle_DepthWriteAlpha = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Depth Write Alpha"); end
TLSE_TabRender_OnToggle_3DAlpha = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render 3D Alpha"); end
TLSE_TabRender_OnToggle_ColorWrite = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Color Write"); end
TLSE_TabRender_OnToggle_ForceAsAlpha = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Force As Alpha"); end
TLSE_TabRender_OnToggle_ShadowForceVisible = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Shadow Force Visible"); end
TLSE_TabRender_OnToggle_EnlightenForceVisible = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Enlighten Force Visible"); end
TLSE_TabRender_OnToggle_LightShadowCastEnable = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render EnvLight Shadow Cast Enable"); end
TLSE_TabRender_OnToggle_FXColorEnabled = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render FX Color Enabled"); end
TLSE_TabRender_OnToggle_AutoFocusEnable = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render Auto Focus Enable"); end
TLSE_TabRender_OnToggle_AfterAntiAliasing = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Render After Anti-Aliasing"); end
TLSE_TabRender_OnToggle_CameraFacing = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Camera Facing"); end
TLSE_TabRender_OnToggle_MotionBlurEnabled = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Motion Blur Enabled"); end
TLSE_TabRender_OnToggle_FogOverrideSettings = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Fog Override settings"); end
TLSE_TabRender_OnToggle_FogMeshEnabled = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Fog Mesh Enabled"); end

TLSE_Development_MainGUI_TabRenderInitalize = function()
    vectorField_extentsMin = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Extents Min", "Extents Min", Vector(0.685, 0.515, 0.0), true, TLSE_TabRender_OnIncrease_ExtentsMin_X, TLSE_TabRender_OnIncrease_ExtentsMin_Y, TLSE_TabRender_OnIncrease_ExtentsMin_Z, TLSE_TabRender_OnDecrease_ExtentsMin_X, TLSE_TabRender_OnDecrease_ExtentsMin_Y, TLSE_TabRender_OnDecrease_ExtentsMin_Z);
    vectorField_extentsMax = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Extents Min", "Extents Max", Vector(0.685, 0.545, 0.0), true, TLSE_TabRender_OnIncrease_ExtentsMax_X, TLSE_TabRender_OnIncrease_ExtentsMax_Y, TLSE_TabRender_OnIncrease_ExtentsMax_Z, TLSE_TabRender_OnDecrease_ExtentsMax_X, TLSE_TabRender_OnDecrease_ExtentsMax_Y, TLSE_TabRender_OnDecrease_ExtentsMax_Z);
    boolField_renderCull = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Cull", "Render Cull", Vector(0.685, 0.575, 0.0), TLSE_TabRender_OnToggle_Cull);
    boolField_renderStatic = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Static", "Render Static", Vector(0.685, 0.585, 0.0), TLSE_TabRender_OnToggle_Static);
    boolField_renderDepthTest = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Depth Test", "Render Depth Test", Vector(0.685, 0.595, 0.0), TLSE_TabRender_OnToggle_DepthTest);
    numberField_renderDepthTestFunction = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Depth Test Function", Vector(0.685, 0.605, 0.0), false, TLSE_TabRender_OnIncrease_DepthTestFunction, TLSE_TabRender_OnDecrease_DepthTestFunction);
    boolField_renderDepthWrite = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Depth Write", "Render Depth Write", Vector(0.685, 0.615, 0.0), TLSE_TabRender_OnToggle_DepthWrite);
    boolField_renderDepthWriteAlpha = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Depth Write Alpha", "Render Depth Write Alpha", Vector(0.685, 0.625, 0.0), TLSE_TabRender_OnToggle_DepthWriteAlpha);
    boolField_render3DAlpha = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render 3D Alpha", "Render 3D Alpha", Vector(0.685, 0.635, 0.0), TLSE_TabRender_OnToggle_3DAlpha);
    numberField_renderConstantAlpha = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Constant Alpha", Vector(0.685, 0.645, 0.0), true, TLSE_TabRender_OnIncrease_ConstantAlpha, TLSE_TabRender_OnDecrease_ConstantAlpha);
    numberField_renderConstantAlphaMultiply = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Constant Alpha Multiply", Vector(0.685, 0.655, 0.0), true, TLSE_TabRender_OnIncrease_ConstantAlphaMultiply, TLSE_TabRender_OnDecrease_ConstantAlphaMultiply);
    boolField_renderColorWrite = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Color Write", "Render Color Write", Vector(0.685, 0.665, 0.0), TLSE_TabRender_OnToggle_ColorWrite);
    boolField_renderForceAsAlpha = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Force As Alpha", "Render Force As Alpha", Vector(0.685, 0.675, 0.0), TLSE_TabRender_OnToggle_ForceAsAlpha);
    boolField_renderShadowForceVisible = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Shadow Force Visible", "Render Shadow Force Visible", Vector(0.685, 0.685, 0.0), TLSE_TabRender_OnToggle_ShadowForceVisible);
    boolField_renderEnlightenForceVisible = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Enlighten Force Visible", "Render Enlighten Force Visible", Vector(0.685, 0.695, 0.0), TLSE_TabRender_OnToggle_EnlightenForceVisible);
    boolField_renderLightShadowCastEnable = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render EnvLight Shadow Cast Enable", "Render EnvLight Shadow Cast Enable", Vector(0.685, 0.705, 0.0), TLSE_TabRender_OnToggle_LightShadowCastEnable);
    boolField_renderFXColorEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render FX Color Enabled", "Render FX Color Enabled", Vector(0.685, 0.715, 0.0), TLSE_TabRender_OnToggle_FXColorEnabled);
    colorField_renderDiffuseColor = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Render Diffuse Color", "Render Diffuse Color", Vector(0.685, 0.725, 0.0), true, TLSE_TabRender_OnIncrease_RenderDiffuseColor_R, TLSE_TabRender_OnIncrease_RenderDiffuseColor_G, TLSE_TabRender_OnIncrease_RenderDiffuseColor_B, TLSE_TabRender_OnIncrease_RenderDiffuseColor_A, TLSE_TabRender_OnDecrease_RenderDiffuseColor_R, TLSE_TabRender_OnDecrease_RenderDiffuseColor_G, TLSE_TabRender_OnDecrease_RenderDiffuseColor_B, TLSE_TabRender_OnDecrease_RenderDiffuseColor_A);
    numberField_renderLayer = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Layer", Vector(0.685, 0.765, 0.0), true, TLSE_TabRender_OnIncrease_RenderLayer, TLSE_TabRender_OnDecrease_RenderLayer);
    numberField_renderMaterialTime = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Render Material Time", Vector(0.685, 0.775, 0.0), true, TLSE_TabRender_OnIncrease_RenderMaterialTime, TLSE_TabRender_OnDecrease_RenderMaterialTime);
    boolField_renderAutoFocusEnable = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render Auto Focus Enable", "Render Auto Focus Enable", Vector(0.685, 0.785, 0.0), TLSE_TabRender_OnToggle_AutoFocusEnable);
    boolField_renderAfterAntiAliasing = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Render After Anti-Aliasing", "Render After Anti-Aliasing", Vector(0.685, 0.795, 0.0), TLSE_TabRender_OnToggle_AfterAntiAliasing);

    stringField_renderCinLightRig = TLSE_Development_Editor_GUI_CreateLabel("Render CinLight Rig", Vector(0.685, 0.805, 0.0));
    stringField_renderShareSkeletonWithAgent = TLSE_Development_Editor_GUI_CreateLabel("Render Share Skeleton With Agent", Vector(0.685, 0.815, 0.0));
    containerField_renderTextureOverrides = TLSE_Development_Editor_GUI_CreateLabel("Render Texture Overrides", Vector(0.685, 0.825, 0.0));
    containerField_renderLightingGroups = TLSE_Development_Editor_GUI_CreateLabel("Render Lighting Groups", Vector(0.685, 0.835, 0.0));

    boolField_cameraFacing = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Camera Facing", "Camera Facing", Vector(0.685, 0.845, 0.0), TLSE_TabRender_OnToggle_CameraFacing);
    numberField_cameraFacingType = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Camera Facing Type", Vector(0.685, 0.855, 0.0), true, TLSE_TabRender_OnIncrease_CameraFacingType, TLSE_TabRender_OnDecrease_CameraFacingType);
    boolField_motionBlurEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Motion Blur Enabled", "Motion Blur Enabled", Vector(0.685, 0.865, 0.0), TLSE_TabRender_OnToggle_MotionBlurEnabled);
    boolField_fogOverrideSettings = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Fog Override settings", "Fog Override settings", Vector(0.685, 0.875, 0.0), TLSE_TabRender_OnToggle_FogOverrideSettings);
    boolField_fogMeshEnabled = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Fog Mesh Enabled", "Fog Mesh Enabled", Vector(0.685, 0.885, 0.0), TLSE_TabRender_OnToggle_FogMeshEnabled);
    colorField_fogMeshColor = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Fog Mesh Color", "Fog Mesh Color", Vector(0.685, 0.895, 0.0), true, TLSE_TabRender_OnIncrease_FogMeshColor_R, TLSE_TabRender_OnIncrease_FogMeshColor_G, TLSE_TabRender_OnIncrease_FogMeshColor_B, TLSE_TabRender_OnIncrease_FogMeshColor_A, TLSE_TabRender_OnDecrease_FogMeshColor_R, TLSE_TabRender_OnDecrease_FogMeshColor_G, TLSE_TabRender_OnDecrease_FogMeshColor_B, TLSE_TabRender_OnDecrease_FogMeshColor_A);
    numberField_fogMeshNearPlane = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Mesh Near Plane", Vector(0.685, 0.935, 0.0), true, TLSE_TabRender_OnIncrease_FogMeshNearPlane, TLSE_TabRender_OnDecrease_FogMeshNearPlane);
    numberField_fogMeshFarPlane = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Mesh Far Plane", Vector(0.685, 0.945, 0.0), true, TLSE_TabRender_OnIncrease_FogMeshFarPlane, TLSE_TabRender_OnDecrease_FogMeshFarPlane);

    containerField_D3DMeshList = TLSE_Development_Editor_GUI_CreateLabel("D3D Mesh List", Vector(0.685, 0.955, 0.0));
end

TLSE_Development_MainGUI_TabRenderUpdate = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_renderTabActive = TLSE_Development_MainGUI_BottomRightWindowTab == "Render";

    vectorField_extentsMin["Vector3FieldVisible"] = bool_renderTabActive;
    vectorField_extentsMax["Vector3FieldVisible"] = bool_renderTabActive;
    boolField_renderCull["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderStatic["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderDepthTest["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    numberField_renderDepthTestFunction["NumberPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderDepthWrite["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderDepthWriteAlpha["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_render3DAlpha["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    numberField_renderConstantAlpha["NumberPropertyFieldVisible"] = bool_renderTabActive;
    numberField_renderConstantAlphaMultiply["NumberPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderColorWrite["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderForceAsAlpha["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderShadowForceVisible["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderEnlightenForceVisible["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderLightShadowCastEnable["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderFXColorEnabled["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    colorField_renderDiffuseColor["ColorFieldVisible"] = bool_renderTabActive;
    numberField_renderLayer["NumberPropertyFieldVisible"] = bool_renderTabActive;
    numberField_renderMaterialTime["NumberPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderAutoFocusEnable["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_renderAfterAntiAliasing["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_cameraFacing["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    numberField_cameraFacingType["NumberPropertyFieldVisible"] = bool_renderTabActive;
    boolField_motionBlurEnabled["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_fogOverrideSettings["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    boolField_fogMeshEnabled["BooleanPropertyFieldVisible"] = bool_renderTabActive;
    colorField_fogMeshColor["ColorFieldVisible"] = bool_renderTabActive;
    numberField_fogMeshNearPlane["NumberPropertyFieldVisible"] = bool_renderTabActive;
    numberField_fogMeshFarPlane["NumberPropertyFieldVisible"] = bool_renderTabActive;

    stringField_renderCinLightRig["LabelVisible"] = bool_renderTabActive;
    stringField_renderShareSkeletonWithAgent["LabelVisible"] = bool_renderTabActive;
    containerField_renderTextureOverrides["LabelVisible"] = bool_renderTabActive;
    containerField_renderLightingGroups["LabelVisible"] = bool_renderTabActive;
    containerField_D3DMeshList["LabelVisible"] = bool_renderTabActive;

    if(bool_renderTabActive == false) then
        return
    end

    vectorField_extentsMin["Vector3PropertyFieldAgent"] = agent_currentSelectedAgent;
    vectorField_extentsMax["Vector3PropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderCull["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderStatic["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderDepthTest["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberField_renderDepthTestFunction["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderDepthWrite["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderDepthWriteAlpha["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_render3DAlpha["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberField_renderConstantAlpha["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberField_renderConstantAlphaMultiply["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderColorWrite["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderForceAsAlpha["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderShadowForceVisible["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderEnlightenForceVisible["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderLightShadowCastEnable["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderFXColorEnabled["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    colorField_renderDiffuseColor["ColorPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberField_renderLayer["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberField_renderMaterialTime["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderAutoFocusEnable["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_renderAfterAntiAliasing["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_cameraFacing["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberField_cameraFacingType["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_motionBlurEnabled["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_fogOverrideSettings["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolField_fogMeshEnabled["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    colorField_fogMeshColor["ColorPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberField_fogMeshNearPlane["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberField_fogMeshFarPlane["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;






    if(agent_currentSelectedAgent ~= nil) then
        --stringField_renderCinLightRig
        if(AgentHasProperty(agent_currentSelectedAgent, "Render CinLight Rig")) then
            stringField_renderCinLightRig["LabelText"] = "Render CinLight Rig: " .. tostring(AgentGetProperty(agent_currentSelectedAgent, "Render CinLight Rig"));
        else
            stringField_renderCinLightRig["LabelText"] = "Render CinLight Rig: nil";
        end

        --stringField_renderShareSkeletonWithAgent
        if(AgentHasProperty(agent_currentSelectedAgent, "Render Share Skeleton With Agent")) then
            stringField_renderShareSkeletonWithAgent["LabelText"] = "Render Share Skeleton With Agent: " .. tostring(AgentGetProperty(agent_currentSelectedAgent, "Render Share Skeleton With Agent"));
        else
            stringField_renderShareSkeletonWithAgent["LabelText"] = "Render Share Skeleton With Agent: nil";
        end

        --containerField_renderLightingGroups
        if(AgentHasProperty(agent_currentSelectedAgent, "Render Lighting Groups")) then
            local string_lightingGroupsTest = "";
            local container_lightingGroups = AgentGetProperty(agent_currentSelectedAgent, "Render Lighting Groups");

            string_lightingGroupsTest = "Render Lighting Groups: ";

            if(container_lightingGroups == nil) then
                string_lightingGroupsTest = string_lightingGroupsTest .. "nil";
            else
                local number_containerElements = ContainerGetNumElements(container_lightingGroups);
                string_lightingGroupsTest = string_lightingGroupsTest .. "(" .. tostring(number_containerElements) .. ") ";

                
            end

            containerField_renderLightingGroups["LabelText"] = string_lightingGroupsTest;
        else
            containerField_renderLightingGroups["LabelText"] = "Render Lighting Groups: nil";
        end




        --containerField_D3DMeshList
        if(AgentHasProperty(agent_currentSelectedAgent, "D3D Mesh List")) then
            local string_d3dMeshList = "";
            local container_d3dMeshList = AgentGetProperty(agent_currentSelectedAgent, "D3D Mesh List");
            --local container_d3dMeshList = TLSE_AgentGetRuntimeProperty(agent_currentSelectedAgent, "D3D Mesh List");

            string_d3dMeshList = "D3D Mesh List: ";

            if(container_d3dMeshList == nil) then
                string_d3dMeshList = string_d3dMeshList .. "nil";
            else
                local number_containerElements = ContainerGetNumElements(container_d3dMeshList);
                string_d3dMeshList = string_d3dMeshList .. "(" .. tostring(number_containerElements) .. ") ";

                
            end

            containerField_D3DMeshList["LabelText"] = string_d3dMeshList;
        else
            containerField_D3DMeshList["LabelText"] = "D3D Mesh List: nil";
        end
    else
        stringField_renderCinLightRig["LabelText"] = "Render CinLight Rig: nil";
        stringField_renderShareSkeletonWithAgent["LabelText"] = "Render Share Skeleton With Agent: nil";
        containerField_renderLightingGroups["LabelText"] = "Render Lighting Groups: nil";
    end
end