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

local CreateLensFlareElement = function(elementAgentName, elementGroupAgent, elementSize, elementColor, elementTexture)
  local lensFlareElement = AgentCreate(elementAgentName, "fx_glowWhite.prop", Vector(0,0,0), Vector(0,0,0), LensFlareEffect_kScene, false, false)
  local newElementColor = Color(elementColor.r, elementColor.g, elementColor.b, 1.0);

  --RELIGHT_PrintValidPropertyNames(AgentFindInScene(elementAgentName, LensFlareEffect_kScene));
  --RELIGHT_PrintProperties(AgentFindInScene(elementAgentName, LensFlareEffect_kScene));

  RELIGHT_AgentSetProperty(elementAgentName, "Render Global Scale", elementSize, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Cull", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Layer", 105, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Constant Alpha Multiply", -1, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Constant Alpha", -1, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render After Anti-Aliasing", true, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render EnvLight Shadow Cast Enable", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Depth Test", false, LensFlareEffect_kScene) --this must be disabled otherwise it intersects with scene geo.
  RELIGHT_AgentSetProperty(elementAgentName, "Render Static", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Depth Write", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Depth Write Alpha", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render 3D Alpha", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Color Write", true, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Force As Alpha", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Depth Test Function", 4, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render FX Color Enabled", true, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Shadow Force Visible", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Render Enlighten Force Visible", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Camera Facing", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Camera Facing Type", 0, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Receive Shadows", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Motion Blur Enabled", false, LensFlareEffect_kScene)

  RELIGHT_AgentSetProperty(elementAgentName, "Fog Mesh Near Plane", 0, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Fog Mesh Far Plane", 0.1, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Fog Mesh Color", newElementColor, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Fog Mesh Enabled", false, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "Fog Override settings", false, LensFlareEffect_kScene)
  
  RELIGHT_AgentSetProperty(elementAgentName, "Render Diffuse Color", newElementColor, LensFlareEffect_kScene)
  RELIGHT_AgentSetProperty(elementAgentName, "fx_glowWhite - Light Color Diffuse", newElementColor, LensFlareEffect_kScene)

  if not (elementTexture == "default") then
    RELIGHT_AgentSetProperty(elementAgentName, "fx_glowWhite - Texture", elementTexture, LensFlareEffect_kScene)
  end

  AgentAttach(lensFlareElement, elementGroupAgent);

  --[[
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - BOOLEANS |||||||||||||||||||||||||||||||
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - BOOLEANS |||||||||||||||||||||||||||||||
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - BOOLEANS |||||||||||||||||||||||||||||||
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "29917189130296323", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "337441776042619735", true, LensFlareEffect_kScene) --true
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "438000414546183936", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "1717554548013318519", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "3968320025434101793", true, LensFlareEffect_kScene) --true
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "4255471446328962866", true, LensFlareEffect_kScene) --true
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "6241934050521616540", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "7592540816388186066", true, LensFlareEffect_kScene) --true
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "9342519259510289425", true, LensFlareEffect_kScene) --true
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "11123420019994007728", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "11135290454403634481", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "12111892677656515207", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "12146612972960654343", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "13551425408333398071", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "13653337939902208949", true, LensFlareEffect_kScene) --true
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "13708738983771659377", true, LensFlareEffect_kScene) --true
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "14500962918222475984", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "15013745883174092217", true, LensFlareEffect_kScene) --true
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "15534494750857814442", false, LensFlareEffect_kScene) --false
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "16931290600450383317", false, LensFlareEffect_kScene) --false
  
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - TABLE |||||||||||||||||||||||||||||||
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - TABLE |||||||||||||||||||||||||||||||
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - TABLE |||||||||||||||||||||||||||||||
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "4586858520413531639", newElementColor, LensFlareEffect_kScene)
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "13633044676319598032", newElementColor, LensFlareEffect_kScene)
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "16257061689241178640", newElementColor, LensFlareEffect_kScene)
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "17878855090176314958", newElementColor, LensFlareEffect_kScene)
  
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - NUMBERS |||||||||||||||||||||||||||||||
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - NUMBERS |||||||||||||||||||||||||||||||
  --||||||||||||||||||||||||||||||| PROPERTY SYMBOLS - NUMBERS |||||||||||||||||||||||||||||||
  
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "175974362136292770", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "1054157711913007758", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "1172836864953362732", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "1257070699733080104", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "2113086045989180411", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "2580150169153207299", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "3207112697218146358", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "3476438023795460075", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "3777130608026885374", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "4974401288743784843", 25, LensFlareEffect_kScene) --25
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "5066756895947174386", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "5228041480347995870", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "5896821838924833897", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "7015250035810543342", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "7480742303957645383", -1, LensFlareEffect_kScene) ---1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "7961783782750803347", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "8735055588785055762", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "8777722706473887450", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "9318400394721951400", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "9482770390863453857", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "9744484105360491661", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "9779227109534659805", -1, LensFlareEffect_kScene) ---1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "9979872214271496197", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "10879226931621513095", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "11846756784333938959", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "11982405709027802459", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "11990377687850657584", 200, LensFlareEffect_kScene) --200
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "13702207346332971943", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "13745441773436534127", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "13985869843448871498", 0.5, LensFlareEffect_kScene) --0.5
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "14484707811718378985", 3, LensFlareEffect_kScene) --3
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "14519789570618437401", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "14533182957841965371", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "14639541458681579632", -1, LensFlareEffect_kScene) ---1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "15223114978632247858", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "15598246489076376875", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "16059560486961196643", 0.1, LensFlareEffect_kScene) --0.1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "16490950358619660555", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "16974302554826177411", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "17811714305327045726", 0, LensFlareEffect_kScene) --0
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "18017837635776104114", 1, LensFlareEffect_kScene) --1
  RELIGHT_AgentSetPropertyBySymbol(elementAgentName, "18181622419412755329", 1, LensFlareEffect_kScene) --1
  ]]--
end

LensFlareEffect_Initalize = function()
  for index = 1, LensFlareEffect_SourcesCount, 1 do 
    local lensFlareSourceGroup = LensFlareEffect_Sources["Source" .. tostring(index)];
    local lensFlareSourceAgentName = lensFlareSourceGroup.LightAgentName;
    local lensFlareLightIntensityModifier = lensFlareSourceGroup.LightIntensityModifier;

    LensFlareEffect_CreateFlareForLightSource(lensFlareSourceAgentName, lensFlareLightIntensityModifier);
  end
end

LensFlareEffect_CreateFlareForLightSource = function(lightSourceAgentName, intensityModifer)
  local flareGroupName = "LENSFLARE_GROUP_" .. lightSourceAgentName;
  local flareElementName = "LENSFLARE_GROUP_" .. lightSourceAgentName .. "_ELEMENT";

  local flareGroup = AgentCreate(flareGroupName, "group.prop", Vector(0,0,0), Vector(0,0,0), LensFlareEffect_kScene, false, false)

  local lightColor = AgentGetProperty(lightSourceAgentName, "EnvLight - Color");
  local lightIntensity = AgentGetProperty(lightSourceAgentName, "EnvLight - Intensity");
  
  --lightColor.r = lightColor.r * lightIntensity * intensityModifer;
  --lightColor.g = lightColor.g * lightIntensity * intensityModifer;
  --lightColor.b = lightColor.b * lightIntensity * intensityModifer;
  --lightColor.a = lightColor.a * lightIntensity * intensityModifer;

  --lightColor.r = lightColor.r * intensityModifer;
  --lightColor.g = lightColor.g * intensityModifer;
  --lightColor.b = lightColor.b * intensityModifer;

  CreateLensFlareElement(flareElementName .. "1", flareGroup, 100.0, Multiplier_RGBColor(lightColor, 1), "default");
  CreateLensFlareElement(flareElementName .. "2", flareGroup, 3.5, Multiplier_RGBColor(lightColor, 0.25), "default");
  CreateLensFlareElement(flareElementName .. "3", flareGroup, 4.5, Multiplier_RGBColor(lightColor, 0.5), "bokeh_hex");
  CreateLensFlareElement(flareElementName .. "4", flareGroup, 5.5, Multiplier_RGBColor(lightColor, 0.75), "bokeh_circle");
  CreateLensFlareElement(flareElementName .. "5", flareGroup, 7.5, Multiplier_RGBColor(lightColor, 0.5), "bokeh_hex");
  CreateLensFlareElement(flareElementName .. "6", flareGroup, 5.5, Multiplier_RGBColor(lightColor, 0.2), "bokeh_circle");
  CreateLensFlareElement(flareElementName .. "7", flareGroup, 9.0, Multiplier_RGBColor(lightColor, 0.25), "bokeh_circle");
  CreateLensFlareElement(flareElementName .. "8", flareGroup, 10.0, Multiplier_RGBColor(lightColor, 0.35), "bokeh_circle");
  CreateLensFlareElement(flareElementName .. "9", flareGroup, 9.0, Multiplier_RGBColor(lightColor, 0.25), "bokeh_hex");
  CreateLensFlareElement(flareElementName .. "10", flareGroup, 175.0, Multiplier_RGBColor(lightColor, 0.35), "default");
end

LensFlareEffect_Update = function()
  local currentCamera_agent = SceneGetCamera(LensFlareEffect_kScene); --Agent type
  local currentCamera_position_vector = AgentGetWorldPos(currentCamera_agent); --Vector type
  local currentCamera_forward_vector = AgentGetForwardVec(currentCamera_agent); --Vector type
  local currentCamera_rotation_vector = AgentGetWorldRot(currentCamera_agent); --Vector type

  for index = 1, LensFlareEffect_SourcesCount, 1 do 
    local lensFlareSourceGroup = LensFlareEffect_Sources["Source" .. tostring(index)];
    local lensFlareSourceAgentName = lensFlareSourceGroup.LightAgentName;
    local lensFlareSourceLightType = lensFlareSourceGroup.LightType;
    local lensFlareSourceOcclusionAngle = lensFlareSourceGroup.LightOcclusionAngle;

    local property_distanceToCamera = 50;

    local lightSourceAgent = AgentFindInScene(lensFlareSourceAgentName, LensFlareEffect_kScene);
    local lightSourceDirectionVector = nil;

    if(lensFlareSourceLightType == "directional") then
      lightSourceDirectionVector = AgentGetForwardVec(lightSourceAgent);
    else
      lightSourceDirectionVector = VectorNormalize(currentCamera_position_vector - AgentGetWorldPos(lightSourceAgent));
    end

    local flareElementName = "LENSFLARE_GROUP_" .. lensFlareSourceAgentName .. "_ELEMENT";

    local elementAgent1 = AgentFindInScene(flareElementName .. "1", LensFlareEffect_kScene);
    local elementAgent2 = AgentFindInScene(flareElementName .. "2", LensFlareEffect_kScene);
    local elementAgent3 = AgentFindInScene(flareElementName .. "3", LensFlareEffect_kScene);
    local elementAgent4 = AgentFindInScene(flareElementName .. "4", LensFlareEffect_kScene);
    local elementAgent5 = AgentFindInScene(flareElementName .. "5", LensFlareEffect_kScene);
    local elementAgent6 = AgentFindInScene(flareElementName .. "6", LensFlareEffect_kScene);
    local elementAgent7 = AgentFindInScene(flareElementName .. "7", LensFlareEffect_kScene);
    local elementAgent8 = AgentFindInScene(flareElementName .. "8", LensFlareEffect_kScene);
    local elementAgent9 = AgentFindInScene(flareElementName .. "9", LensFlareEffect_kScene);
    local elementAgent10 = AgentFindInScene(flareElementName .. "10", LensFlareEffect_kScene);

    local elementPos1 = currentCamera_position_vector - lightSourceDirectionVector * property_distanceToCamera;
    local elementPos2 = currentCamera_position_vector - ((lightSourceDirectionVector * 1.5) - currentCamera_forward_vector) * property_distanceToCamera;
    local elementPos3 = currentCamera_position_vector - ((lightSourceDirectionVector * 1.35) - currentCamera_forward_vector) * property_distanceToCamera;
    local elementPos4 = currentCamera_position_vector - ((lightSourceDirectionVector * 1.1) - currentCamera_forward_vector) * property_distanceToCamera;
    local elementPos5 = currentCamera_position_vector - ((lightSourceDirectionVector * 0.75) - currentCamera_forward_vector) * property_distanceToCamera;
    local elementPos6 = currentCamera_position_vector - ((lightSourceDirectionVector * 0.25) - currentCamera_forward_vector) * property_distanceToCamera;
    local elementPos7 = currentCamera_position_vector - ((lightSourceDirectionVector * -0.25) - currentCamera_forward_vector) * property_distanceToCamera;
    local elementPos8 = currentCamera_position_vector - ((lightSourceDirectionVector * -0.1) - currentCamera_forward_vector) * property_distanceToCamera;
    local elementPos9 = currentCamera_position_vector - ((lightSourceDirectionVector * -0.15) - currentCamera_forward_vector) * property_distanceToCamera;
    local elementPos10 = currentCamera_position_vector - ((lightSourceDirectionVector * -0.75) - currentCamera_forward_vector) * property_distanceToCamera;

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

    local elementRotation = Vector(currentCamera_rotation_vector.x + 180, currentCamera_rotation_vector.y, currentCamera_rotation_vector.z);

    AgentSetRot(elementAgent1, elementRotation);
    AgentSetRot(elementAgent2, elementRotation);
    AgentSetRot(elementAgent3, elementRotation);
    AgentSetRot(elementAgent4, elementRotation);
    AgentSetRot(elementAgent5, elementRotation);
    AgentSetRot(elementAgent6, elementRotation);
    AgentSetRot(elementAgent7, elementRotation);
    AgentSetRot(elementAgent8, elementRotation);
    AgentSetRot(elementAgent9, elementRotation);
    AgentSetRot(elementAgent10, elementRotation);

    --occlusion by angle
    local occlusionTest1 = VectorDot(currentCamera_forward_vector, lightSourceDirectionVector) < lensFlareSourceOcclusionAngle;

    if occlusionTest1 then
      AgentSetProperty(flareElementName .. "1", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "2", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "3", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "4", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "5", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "6", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "7", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "8", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "9", "Runtime: Visible", true);
      AgentSetProperty(flareElementName .. "10", "Runtime: Visible", true);
    else
      AgentSetProperty(flareElementName .. "1", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "2", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "3", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "4", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "5", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "6", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "7", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "8", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "9", "Runtime: Visible", false);
      AgentSetProperty(flareElementName .. "10", "Runtime: Visible", false);
    end
  end
end