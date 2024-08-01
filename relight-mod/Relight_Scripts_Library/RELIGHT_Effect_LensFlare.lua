local LensFlareEffect_ElementPropFile = "fx_glowWhite.prop";

LensFlareEffect_SourcesCount = 1;
LensFlareEffect_Sources = 
{
  Source1 = 
  {
    LightAgentName = "light_d",
    LightType = "directional", --"spot", "directional", "point"
    LightOcclusionAngle = -0.25,
    LightIntensityModifier = 15.0,
  },
};

LensFlareEffect_FlareProfileElements = 1;
LensFlareEffect_FlareProfile = 
{
  Element1 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.5,
    ElementSize = 100,
    ElementTexture = "RELIGHT_Texture_LensFlare_burstA",
    ElementDistance = 0,
    ElementStickToLight = true,
  },
  --[[
  Element2 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.25,
    ElementSize = 3.5,
    ElementTexture = "default",
    ElementDistance = 1.5
    ElementStickToLight = false,
  },
  Element3 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.5,
    ElementSize = 4.5,
    ElementTexture = "bokeh_hex",
    ElementDistance = 1.35,
    ElementStickToLight = false,
  },
  Element4 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.75,
    ElementSize = 5.5,
    ElementTexture = "bokeh_circle",
    ElementDistance = 1.1,
    ElementStickToLight = false,
  },
  Element5 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.5,
    ElementSize = 7.5,
    ElementTexture = "bokeh_hex",
    ElementDistance = 0.75,
    ElementStickToLight = false,
  },
  Element6 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.2,
    ElementSize = 5.5,
    ElementTexture = "bokeh_circle",
    ElementDistance = 0.25,
    ElementStickToLight = false,
  },
  Element7 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.25,
    ElementSize = 9.0,
    ElementTexture = "bokeh_circle",
    ElementDistance = -0.25,
    ElementStickToLight = false,
  },
  Element8 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.35,
    ElementSize = 10.0,
    ElementTexture = "bokeh_circle",
    ElementDistance = -0.1,
    ElementStickToLight = false,
  },
  Element9 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.25,
    ElementSize = 9.0,
    ElementTexture = "bokeh_hex",
    ElementDistance = -0.15,
    ElementStickToLight = false,
  },
  Element10 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.35,
    ElementSize = 175.0,
    ElementTexture = "default",
    ElementDistance = -0.75,
    ElementStickToLight = false,
  }
  ]]
};

LensFlareEffect_FlareInstances = {};

local CreateLensFlareElement = function(string_elementName, flareElement_reference)
  local flareElement_newElement =
  {
    ElementAgent = AgentCreate(string_elementName, LensFlareEffect_ElementPropFile, Vector(0, 0, 0), Vector(0, 0, 0), RELIGHT_SceneObject, false, false),
    ElementColor = flareElement_reference["ElementColor"],
    ElementIntensity = flareElement_reference["ElementIntensity"],
    ElementSize = flareElement_reference["ElementSize"],
    ElementTexture = flareElement_reference["ElementTexture"],
    ElementDistance = flareElement_reference["ElementDistance"]
  };

  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Global Scale", flareElement_newElement["ElementSize"]);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Cull", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Layer", 75);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Constant Alpha Multiply", -1);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Constant Alpha", -1);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render After Anti-Aliasing", true);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render EnvLight Shadow Cast Enable", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Depth Test", false); --this must be disabled otherwise it intersects with scene geo.
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Static", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Depth Write", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Depth Write Alpha", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render 3D Alpha", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Color Write", true)
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Force As Alpha", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Depth Test Function", 4);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render FX Color Enabled", true);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Shadow Force Visible", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Enlighten Force Visible", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Camera Facing", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Camera Facing Type", 0);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Receive Shadows", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Motion Blur Enabled", false);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Fog Mesh Near Plane", -1000);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Fog Mesh Far Plane", -1000);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Fog Mesh Enabled", true);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Fog Override settings", true);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render Diffuse Color", flareElement_newElement["ElementColor"]);
  AgentSetProperty(flareElement_newElement["ElementAgent"], "fx_glowWhite - Light Color Diffuse", flareElement_newElement["ElementColor"]);

  if not (flareElement_newElement["ElementTexture"] == "default") then
    ShaderOverrideTexture(flareElement_newElement["ElementAgent"], "fx_glowWhite.d3dtx", flareElement_newElement["ElementTexture"]);
  end

  AgentAttach(flareElement_newElement["ElementAgent"], agent_elementGroup);

  return flareElement_newElement;
end

local CreateFlareForLightSource = function()
  local flare_newInstance = {};

  for index = 1, LensFlareEffect_FlareProfileElements, 1 do 
    local string_newElementName = "Element" .. tostring(index);
    local string_referenceElementName = "Element" .. tostring(index);
    local flareElement_referenceElement = LensFlareEffect_FlareProfile[string_referenceElementName];

    flare_newInstance[string_newElementName] = CreateLensFlareElement(string_newElementName, flareElement_referenceElement);
  end

  table.insert(LensFlareEffect_FlareInstances, flare_newInstance);
end

RELIGHT_LensFlareEffect_Initalize = function()
  for index = 1, LensFlareEffect_SourcesCount, 1 do 
    CreateFlareForLightSource();
  end
end

RELIGHT_LensFlareEffect_Update = function()
  local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject); --Agent type
  local vector_currentCameraPosition = AgentGetWorldPos(agent_currentCamera); --Vector type
  local vector_currentCameraForward = AgentGetForwardVec(agent_currentCamera); --Vector type
  local vector_currentCameraRotation = AgentGetWorldRot(agent_currentCamera); --Vector type

  local number_elementDistanceToCamera = 50;
  local number_lightSourceReferenceIndex = 1;

  for key, flare_instance in pairs(LensFlareEffect_FlareInstances) do
    local string_lightSourceReferenceName = "Source" .. tostring(number_lightSourceReferenceIndex);
    local source_lightSourceReference = LensFlareEffect_Sources[string_lightSourceReferenceName];
    local string_lightSourceAgentName = source_lightSourceReference["LightAgentName"];
    local string_lightSourceType = source_lightSourceReference["LightType"];
    local number_lightSourceOcclusionAngle = source_lightSourceReference["LightOcclusionAngle"];
    local number_lightSourceIntensityModifier = source_lightSourceReference["LightIntensityModifier"];
    local agent_lightSourceAgent = AgentFindInScene(string_lightSourceAgentName, RELIGHT_SceneObject);
    local number_lightSourceIntensity = AgentGetProperty(agent_lightSourceAgent, "EnvLight - Intensity");
    local color_lightSourceColor = AgentGetProperty(agent_lightSourceAgent, "EnvLight - Color");

    local vector_lightSourceDirection = nil;

    if(string_lightSourceType == "directional") then
      vector_lightSourceDirection = AgentGetForwardVec(agent_lightSourceAgent);
    else
      vector_lightSourceDirection = VectorNormalize(VectorSubtract(vector_currentCameraPosition, AgentGetWorldPos(agent_lightSourceAgent)));
    end

    for index = 1, LensFlareEffect_FlareProfileElements, 1 do 
      local string_elementName = "Element" .. tostring(index);
      local flareElement_element = flare_instance[string_elementName];
      local vector_elementPosition = Vector(0, 0, 0);

      if(flareElement_element["ElementStickToLight"] == true) then
        --vector_elementPosition = VectorSubtract(vector_currentCameraPosition, VectorScale(vector_lightSourceDirection, number_elementDistanceToCamera));
        --vector_elementPosition = vector_currentCameraPosition - vector_lightSourceDirection * number_elementDistanceToCamera;
      else
        --vector_elementPosition = vector_currentCameraPosition - ((vector_lightSourceDirection * flareElement_element["ElementDistance"]) - vector_currentCameraForward) * number_elementDistanceToCamera;
      end

      vector_elementPosition = VectorSubtract(vector_currentCameraPosition, VectorScale(vector_lightSourceDirection, number_elementDistanceToCamera));

      local vector_elementRotation = Vector(vector_currentCameraRotation.x + 180, vector_currentCameraRotation.y, vector_currentCameraRotation.z);
      local bool_occlusionTest = VectorDot(vector_currentCameraForward, vector_lightSourceDirection) < number_lightSourceOcclusionAngle;

      local color_newColor = TLSE_MultiplyRGBColor(color_lightSourceColor, number_lightSourceIntensity);
      color_newColor = TLSE_MultiplyRGBColor(color_newColor, number_lightSourceIntensityModifier);
      color_newColor = TLSE_MultiplyRGBColor(color_newColor, flareElement_element["ElementIntensity"]);
      color_newColor = TLSE_MultiplyColorWithColorRGB(color_newColor, flareElement_element["ElementColor"]);

      AgentSetWorldPos(flareElement_element["ElementAgent"], vector_elementPosition);
      AgentSetWorldRot(flareElement_element["ElementAgent"], vector_elementRotation);
      AgentSetProperty(flareElement_element["ElementAgent"], "Runtime: Visible", bool_occlusionTest);
      AgentSetProperty(flareElement_element["ElementAgent"], "Fog Mesh Color", color_newColor);
    end

    number_lightSourceReferenceIndex = number_lightSourceReferenceIndex + 1;
  end
end

--[[
local CreateLensFlareElement = function(string_elementName, agent_elementGroup, number_elementSize, color_elementColor, string_elementTexture)
  local agent_flareElement = AgentCreate(string_elementName, "fx_glowWhite.prop", Vector(0, 0, 0), Vector(0, 0, 0), RELIGHT_SceneObject, false, false);
  local color_flareElementColor = Color(color_elementColor.r, color_elementColor.g, color_elementColor.b, 1.0);

  AgentSetProperty(agent_flareElement, "Render Global Scale", number_elementSize);
  AgentSetProperty(agent_flareElement, "Render Cull", false);
  AgentSetProperty(agent_flareElement, "Render Layer", 75);
  AgentSetProperty(agent_flareElement, "Render Constant Alpha Multiply", -1);
  AgentSetProperty(agent_flareElement, "Render Constant Alpha", -1);
  AgentSetProperty(agent_flareElement, "Render After Anti-Aliasing", true);
  AgentSetProperty(agent_flareElement, "Render EnvLight Shadow Cast Enable", false);
  AgentSetProperty(agent_flareElement, "Render Depth Test", false); --this must be disabled otherwise it intersects with scene geo.
  AgentSetProperty(agent_flareElement, "Render Static", false);
  AgentSetProperty(agent_flareElement, "Render Depth Write", false);
  AgentSetProperty(agent_flareElement, "Render Depth Write Alpha", false);
  AgentSetProperty(agent_flareElement, "Render 3D Alpha", false);
  AgentSetProperty(agent_flareElement, "Render Color Write", true)
  AgentSetProperty(agent_flareElement, "Render Force As Alpha", false);
  AgentSetProperty(agent_flareElement, "Render Depth Test Function", 4);
  AgentSetProperty(agent_flareElement, "Render FX Color Enabled", true);
  AgentSetProperty(agent_flareElement, "Render Shadow Force Visible", false);
  AgentSetProperty(agent_flareElement, "Render Enlighten Force Visible", false);
  AgentSetProperty(agent_flareElement, "Camera Facing", false);
  AgentSetProperty(agent_flareElement, "Camera Facing Type", 0);
  AgentSetProperty(agent_flareElement, "Receive Shadows", false);
  AgentSetProperty(agent_flareElement, "Motion Blur Enabled", false);

  AgentSetProperty(agent_flareElement, "Fog Mesh Near Plane", -1000);
  AgentSetProperty(agent_flareElement, "Fog Mesh Far Plane", -1000);
  AgentSetProperty(agent_flareElement, "Fog Mesh Color", color_flareElementColor);
  AgentSetProperty(agent_flareElement, "Fog Mesh Enabled", true);
  AgentSetProperty(agent_flareElement, "Fog Override settings", true);
  
  AgentSetProperty(agent_flareElement, "Render Diffuse Color", color_flareElementColor);
  AgentSetProperty(agent_flareElement, "fx_glowWhite - Light Color Diffuse", color_flareElementColor);

  if not (string_elementTexture == "default") then
    --AgentSetProperty(agent_flareElement, "fx_glowWhite - Texture", string_elementTexture);
    ShaderOverrideTexture(agent_flareElement, "fx_glowWhite.d3dtx", string_elementTexture);
  end

  AgentAttach(agent_flareElement, agent_elementGroup);
end

local CreateFlareForLightSource = function(string_lightSourceAgentName, number_intensityModifer)
  local string_flareGroupName = "LENSFLARE_GROUP_" .. string_lightSourceAgentName;
  local string_flareElementName = "LENSFLARE_GROUP_" .. string_lightSourceAgentName .. "_ELEMENT";

  local agent_flareGroup = AgentCreate(string_flareGroupName, "group.prop", Vector(0, 0, 0), Vector(0, 0, 0), RELIGHT_SceneObject, false, false)

  local color_lightColor = AgentGetProperty(string_lightSourceAgentName, "EnvLight - Color");
  local number_lightIntensity = AgentGetProperty(string_lightSourceAgentName, "EnvLight - Intensity");
  
  color_lightColor.r = color_lightColor.r * number_lightIntensity * number_intensityModifer;
  color_lightColor.g = color_lightColor.g * number_lightIntensity * number_intensityModifer;
  color_lightColor.b = color_lightColor.b * number_lightIntensity * number_intensityModifer;

  CreateLensFlareElement(string_flareElementName .. "1", agent_flareGroup, 100.0, TLSE_MultiplyRGBColor(color_lightColor, 0.5), "default");
  CreateLensFlareElement(string_flareElementName .. "2", agent_flareGroup, 3.5, TLSE_MultiplyRGBColor(color_lightColor, 0.25), "default");
  CreateLensFlareElement(string_flareElementName .. "3", agent_flareGroup, 4.5, TLSE_MultiplyRGBColor(color_lightColor, 0.5), "bokeh_hex");
  CreateLensFlareElement(string_flareElementName .. "4", agent_flareGroup, 5.5, TLSE_MultiplyRGBColor(color_lightColor, 0.75), "bokeh_circle");
  CreateLensFlareElement(string_flareElementName .. "5", agent_flareGroup, 7.5, TLSE_MultiplyRGBColor(color_lightColor, 0.5), "bokeh_hex");
  CreateLensFlareElement(string_flareElementName .. "6", agent_flareGroup, 5.5, TLSE_MultiplyRGBColor(color_lightColor, 0.2), "bokeh_circle");
  CreateLensFlareElement(string_flareElementName .. "7", agent_flareGroup, 9.0, TLSE_MultiplyRGBColor(color_lightColor, 0.25), "bokeh_circle");
  CreateLensFlareElement(string_flareElementName .. "8", agent_flareGroup, 10.0, TLSE_MultiplyRGBColor(color_lightColor, 0.35), "bokeh_circle");
  CreateLensFlareElement(string_flareElementName .. "9", agent_flareGroup, 9.0, TLSE_MultiplyRGBColor(color_lightColor, 0.25), "bokeh_hex");
  CreateLensFlareElement(string_flareElementName .. "10", agent_flareGroup, 175.0, TLSE_MultiplyRGBColor(color_lightColor, 0.35), "default");
end

RELIGHT_LensFlareEffect_Initalize = function()
  for index = 1, LensFlareEffect_SourcesCount, 1 do 
    local lensFlareSourceGroup = LensFlareEffect_Sources["Source" .. tostring(index)];
    local string_lensFlareSourceAgentName = lensFlareSourceGroup.LightAgentName;
    local number_lensFlareLightIntensityModifier = lensFlareSourceGroup.LightIntensityModifier;

    CreateFlareForLightSource(string_lensFlareSourceAgentName, number_lensFlareLightIntensityModifier);
  end
end

RELIGHT_LensFlareEffect_Update = function()
  local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject); --Agent type
  local vector_currentCameraPosition = AgentGetWorldPos(agent_currentCamera); --Vector type
  local vector_currentCameraForward = AgentGetForwardVec(agent_currentCamera); --Vector type
  local vector_currentCameraRotation = AgentGetWorldRot(agent_currentCamera); --Vector type

  for index = 1, LensFlareEffect_SourcesCount, 1 do 
    local lensFlareSourceGroup = LensFlareEffect_Sources["Source" .. tostring(index)];
    local string_lensFlareSourceAgentName = lensFlareSourceGroup.LightAgentName;
    local string_lensFlareSourceLightType = lensFlareSourceGroup.LightType;
    local number_lensFlareSourceOcclusionAngle = lensFlareSourceGroup.LightOcclusionAngle;

    local number_elementDistanceToCamera = 50;

    local agent_lightSource = AgentFindInScene(string_lensFlareSourceAgentName, RELIGHT_SceneObject);
    local vector_lightSourceDirection = nil;

    if(string_lensFlareSourceLightType == "directional") then
      vector_lightSourceDirection = AgentGetForwardVec(agent_lightSource);
    else
      vector_lightSourceDirection = VectorNormalize(vector_currentCameraPosition - AgentGetWorldPos(agent_lightSource));
    end

    local string_flareElementName = "LENSFLARE_GROUP_" .. string_lensFlareSourceAgentName .. "_ELEMENT";

    local elementAgent1 = AgentFindInScene(string_flareElementName .. "1", RELIGHT_SceneObject);
    local elementAgent2 = AgentFindInScene(string_flareElementName .. "2", RELIGHT_SceneObject);
    local elementAgent3 = AgentFindInScene(string_flareElementName .. "3", RELIGHT_SceneObject);
    local elementAgent4 = AgentFindInScene(string_flareElementName .. "4", RELIGHT_SceneObject);
    local elementAgent5 = AgentFindInScene(string_flareElementName .. "5", RELIGHT_SceneObject);
    local elementAgent6 = AgentFindInScene(string_flareElementName .. "6", RELIGHT_SceneObject);
    local elementAgent7 = AgentFindInScene(string_flareElementName .. "7", RELIGHT_SceneObject);
    local elementAgent8 = AgentFindInScene(string_flareElementName .. "8", RELIGHT_SceneObject);
    local elementAgent9 = AgentFindInScene(string_flareElementName .. "9", RELIGHT_SceneObject);
    local elementAgent10 = AgentFindInScene(string_flareElementName .. "10", RELIGHT_SceneObject);

    local elementPos1 = vector_currentCameraPosition - vector_lightSourceDirection * number_elementDistanceToCamera;
    local elementPos2 = vector_currentCameraPosition - ((vector_lightSourceDirection * 1.5) - vector_currentCameraForward) * number_elementDistanceToCamera;
    local elementPos3 = vector_currentCameraPosition - ((vector_lightSourceDirection * 1.35) - vector_currentCameraForward) * number_elementDistanceToCamera;
    local elementPos4 = vector_currentCameraPosition - ((vector_lightSourceDirection * 1.1) - vector_currentCameraForward) * number_elementDistanceToCamera;
    local elementPos5 = vector_currentCameraPosition - ((vector_lightSourceDirection * 0.75) - vector_currentCameraForward) * number_elementDistanceToCamera;
    local elementPos6 = vector_currentCameraPosition - ((vector_lightSourceDirection * 0.25) - vector_currentCameraForward) * number_elementDistanceToCamera;
    local elementPos7 = vector_currentCameraPosition - ((vector_lightSourceDirection * -0.25) - vector_currentCameraForward) * number_elementDistanceToCamera;
    local elementPos8 = vector_currentCameraPosition - ((vector_lightSourceDirection * -0.1) - vector_currentCameraForward) * number_elementDistanceToCamera;
    local elementPos9 = vector_currentCameraPosition - ((vector_lightSourceDirection * -0.15) - vector_currentCameraForward) * number_elementDistanceToCamera;
    local elementPos10 = vector_currentCameraPosition - ((vector_lightSourceDirection * -0.75) - vector_currentCameraForward) * number_elementDistanceToCamera;

    AgentSetWorldPos(elementAgent1, elementPos1);
    AgentSetWorldPos(elementAgent2, elementPos2);
    AgentSetWorldPos(elementAgent3, elementPos3);
    AgentSetWorldPos(elementAgent4, elementPos4);
    AgentSetWorldPos(elementAgent5, elementPos5);
    AgentSetWorldPos(elementAgent6, elementPos6);
    AgentSetWorldPos(elementAgent7, elementPos7);
    AgentSetWorldPos(elementAgent8, elementPos8);
    AgentSetWorldPos(elementAgent9, elementPos9);
    AgentSetWorldPos(elementAgent10, elementPos10);

    local elementRotation = Vector(vector_currentCameraRotation.x + 180, vector_currentCameraRotation.y, vector_currentCameraRotation.z);

    AgentSetWorldRot(elementAgent1, elementRotation);
    AgentSetWorldRot(elementAgent2, elementRotation);
    AgentSetWorldRot(elementAgent3, elementRotation);
    AgentSetWorldRot(elementAgent4, elementRotation);
    AgentSetWorldRot(elementAgent5, elementRotation);
    AgentSetWorldRot(elementAgent6, elementRotation);
    AgentSetWorldRot(elementAgent7, elementRotation);
    AgentSetWorldRot(elementAgent8, elementRotation);
    AgentSetWorldRot(elementAgent9, elementRotation);
    AgentSetWorldRot(elementAgent10, elementRotation);

    --occlusion by angle
    local occlusionTest1 = VectorDot(vector_currentCameraForward, vector_lightSourceDirection) < number_lensFlareSourceOcclusionAngle;

    AgentSetProperty(string_flareElementName .. "1", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "2", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "3", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "4", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "5", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "6", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "7", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "8", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "9", "Runtime: Visible", occlusionTest1);
    AgentSetProperty(string_flareElementName .. "10", "Runtime: Visible", occlusionTest1);
  end
end
]]