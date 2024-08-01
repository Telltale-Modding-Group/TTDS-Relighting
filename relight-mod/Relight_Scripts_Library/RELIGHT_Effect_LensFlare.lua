local LensFlareEffect_ElementPropFile = "fx_glowWhite.prop";

LensFlareEffect_SourcesCount = 1;
LensFlareEffect_Sources = 
{
  Source1 = 
  {
    LightAgentName = "light_d",
    LightOcclusionAngle = -0.25,
    LightIntensityModifier = 1.0,
  },
};

LensFlareEffect_FlareProfileElements = 10;
LensFlareEffect_FlareProfile = 
{
  Element1 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 1,
    ElementSize = 100,
    ElementDistance = 0,
    ElementTexture = "RELIGHT_Texture_LensFlare_BurstA",
  },
  Element2 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.25,
    ElementSize = 100,
    ElementDistance = 0,
    ElementTexture = "RELIGHT_Texture_LensFlare_GlowA",
  },
  Element3 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.5,
    ElementSize = 4.5,
    ElementDistance = 1,
    ElementTexture = "bokeh_hex",
  },
  Element4 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.75,
    ElementSize = 5.5,
    ElementDistance = 1.1,
    ElementTexture = "bokeh_circle",
  },
  Element5 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.5,
    ElementSize = 7.5,
    ElementDistance = 0.75,
    ElementTexture = "bokeh_hex",
  },
  Element6 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.2,
    ElementSize = 5.5,
    ElementDistance = 0.25,
    ElementTexture = "bokeh_circle",
  },
  Element7 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.25,
    ElementSize = 9.0,
    ElementDistance = -0.25,
    ElementTexture = "bokeh_circle",
  },
  Element8 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.35,
    ElementSize = 10.0,
    ElementDistance = 4.5,
    ElementTexture = "bokeh_circle",
  },
  Element9 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.25,
    ElementSize = 9.0,
    ElementDistance = 3.25,
    ElementTexture = "bokeh_hex",
  },
  Element10 = 
  {
    ElementAgent = nil,
    ElementColor = Color(1, 1, 1, 1),
    ElementIntensity = 0.35,
    ElementSize = 175.0,
    ElementDistance = -0.75,
    ElementTexture = "default",
  },
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
  AgentSetProperty(flareElement_newElement["ElementAgent"], "Render After Anti-Aliasing", false);
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
    local number_lightSourceOcclusionAngle = source_lightSourceReference["LightOcclusionAngle"];
    local number_lightSourceIntensityModifier = source_lightSourceReference["LightIntensityModifier"];
    local agent_lightSourceAgent = AgentFindInScene(string_lightSourceAgentName, RELIGHT_SceneObject);
    local number_lightSourceIntensity = AgentGetProperty(agent_lightSourceAgent, "EnvLight - Intensity");
    local color_lightSourceColor = AgentGetProperty(agent_lightSourceAgent, "EnvLight - Color");

    local vector_lightSourceDirection = nil;

    if(AgentGetProperty(agent_lightSourceAgent, "EnvLight - Type") == 2) then
      vector_lightSourceDirection = AgentGetForwardVec(agent_lightSourceAgent);
    else
      vector_lightSourceDirection = VectorNormalize(VectorSubtract(vector_currentCameraPosition, AgentGetWorldPos(agent_lightSourceAgent)));
    end

    for index = 1, LensFlareEffect_FlareProfileElements, 1 do 
      local string_elementName = "Element" .. tostring(index);
      local flareElement_element = flare_instance[string_elementName];
      local vector_elementPosition = Vector(0, 0, 0);

      vector_elementPosition = VectorSubtract(vector_currentCameraPosition, VectorScale(vector_lightSourceDirection, number_elementDistanceToCamera));
      vector_elementPosition = VectorSubtract(vector_elementPosition, VectorScale(VectorSubtract(vector_lightSourceDirection, vector_currentCameraForward), flareElement_element["ElementDistance"] * number_elementDistanceToCamera));

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