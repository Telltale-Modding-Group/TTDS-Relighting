--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) ICON VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) ICON VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) ICON VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_ObjectIcons_IconSize = 0.0035;
TLSE_Development_Editor_ObjectIcons_Visible = true;
TLSE_Development_Editor_ObjectIcons_Icons = {};

--|||||||||||||||||||||||||||||||||||||||||||||||||||| (LOCAL) ICON VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (LOCAL) ICON VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| (LOCAL) ICON VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||

local number_previousSceneAgentsSize = 0;

local string_envLightTypePropertyName = "EnvLight - Type";
local string_cameraFOVPropertyName = "Field of View";
local string_fogDensityPropertyName = "Env - Fog Density";

local string_texture_directional = "TLSE_Development_IconLightDirectional.d3dtx";
local string_texture_directionalAmbient = "TLSE_Development_IconLightDirectionalAmbient.d3dtx";
local string_texture_point = "TLSE_Development_IconLightPoint.d3dtx";
local string_texture_spot = "TLSE_Development_IconLightSpot.d3dtx";
local string_texture_ambient = "TLSE_Development_IconLightAmbient.d3dtx";
local string_texture_camera = "TLSE_Development_IconCamera.d3dtx";
local string_texture_fog = "TLSE_Development_IconFog.d3dtx";

--|||||||||||||||||||||||||||||||||||||||||||||||||||| LOCAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| LOCAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| LOCAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

--Get an icon texture from a given agent, if there are no properties that can be represented with an icon then it returns nil.
local GetIconTexture = function(agent_referenceAgent)
    --if there is no reference agent... what are we doing? don't continue!
    if(agent_referenceAgent == nil) then
        return nil;
    end

    local string_iconTexture = nil;
    local propertySet_referenceAgent = AgentGetRuntimeProperties(agent_referenceAgent);

    local number_lightEnvType = PropertyGet(propertySet_referenceAgent, string_envLightTypePropertyName);
    local number_cameraFOV = PropertyGet(propertySet_referenceAgent, string_cameraFOVPropertyName);
    local number_fogDensity = PropertyGet(propertySet_referenceAgent, string_fogDensityPropertyName);

    --check for light properties
    if(number_lightEnvType ~= nil) then
        --choose a different icon depending on the light type
        if(number_lightEnvType == 0) then --eLightEnvType_Point
            string_iconTexture = string_texture_point;
        elseif(number_lightEnvType == 1) then --eLightEnvType_Spot
            string_iconTexture = string_texture_spot;
        elseif(number_lightEnvType == 2) then --eLightEnvType_DirectionalKey
            string_iconTexture = string_texture_directional;
        elseif(number_lightEnvType == 3) then --eLightEnvType_Ambient
            string_iconTexture = string_texture_ambient;
        elseif(number_lightEnvType == 4) then --eLightEnvType_DirectionalAmbient
            string_iconTexture = string_texture_directionalAmbient;
        end
    end

    --check for a camera property
    if(number_cameraFOV ~= nil) then
        string_iconTexture = string_texture_camera;
    end

    --check for a camera property
    if(number_fogDensity ~= nil) then
        string_iconTexture = string_texture_fog;
    end

    return string_iconTexture;
end

--creates an "ObjectIcon" for a given agent IF it has properties that can be displayed with an icon.
local CreateNewObjectIconAgent = function(agent_referenceAgent)
    --attempt to choose a texture for the properties that are on the object
    local string_newIconTexture = GetIconTexture(agent_referenceAgent);

    --if the object does not have any properties that can be displayed with an icon then don't continue
    if(string_newIconTexture == nil) then
        return
    end

    --create the icon agent
    local string_referenceAgentName = AgentGetName(agent_referenceAgent);
    local string_newIconAgentName = "TLSE_Development_ICON_" .. string_referenceAgentName;
    local agent_newIconAgent = AgentCreate(string_newIconAgentName, TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);

    --set the properties on the icon so that its always visible and doesn't intersect with the scene
    AgentSetProperty(agent_newIconAgent, "Render Axis Scale", Vector(-1, 1, 1));
    AgentSetProperty(agent_newIconAgent, "Render Global Scale", TLSE_Development_Editor_ObjectIcons_IconSize);
    AgentSetProperty(agent_newIconAgent, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_newIconAgent, "Render Depth Test", false);
    AgentSetProperty(agent_newIconAgent, "Render Depth Write", false);
    AgentSetProperty(agent_newIconAgent, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_newIconAgent, "Render Layer", 75);

    --set the texture of the mesh to the chosen icon texture
    ShaderSwapTexture(agent_newIconAgent, TLSE_Development_FlatPlaneOriginalTexture, string_newIconTexture);

    --attach the icon agent to the reference agent
    AgentAttach(agent_newIconAgent, agent_referenceAgent);

    --make sure that the icon agent is centered right where the reference agent is
    AgentSetPos(agent_newIconAgent, Vector(0, 0, 0));

    --create a custom object so we can hold some additional data that we will definetly need later
    local objectIcon_newIcon = 
    {
        IconAgentReference = agent_newIconAgent,
        IconTexture = string_newIconTexture
    };

    --add it to the table
    table.insert(TLSE_Development_Editor_ObjectIcons_Icons, objectIcon_newIcon);
end

--This updates a single icon
local UpdateObjectIcon = function(objectIcon_icon)
    --if the agent reference does not exist, or there is no icon agent reference then don't continue, (this will be deleted later)
    if(objectIcon_icon["IconAgentReference"] == nil) then
        return
    end

    local agent_iconParent = AgentGetParent(objectIcon_icon["IconAgentReference"]);

    --update the icon texture to match the underlying properties
    objectIcon_icon["IconTexture"] = GetIconTexture(agent_iconParent);

    --if there are no properties that can be "icon-ized" then don't continue (this will be deleted later)
    if(objectIcon_icon["IconTexture"] == nil) then
        return
    end

    --get the camera position/rotation so we can do some stuff with it
    local agent_sceneCamera = SceneGetCamera(TLSE_Development_SceneObject);
    local vector_sceneCameraPosition = AgentGetWorldPos(agent_sceneCamera);
    local vector_sceneCameraRotation = AgentGetWorldRot(agent_sceneCamera);

    --calculate the scale of the object based on the distance to camera
    local vector_currentIconPosition = AgentGetWorldPos(agent_iconParent);
    local number_distanceToCamera = VectorDistance(vector_currentIconPosition, vector_sceneCameraPosition);
    local number_newGlobalScale = number_distanceToCamera * TLSE_Development_Editor_ObjectIcons_IconSize;

    --NOTE: Since the icon agent is attached to another agent, we want to make sure that it is always in the center of the parent object.
    AgentSetPos(objectIcon_icon["IconAgentReference"], Vector(0, 0, 0));
    AgentSetWorldRot(objectIcon_icon["IconAgentReference"], vector_sceneCameraRotation); --Set the rotation to match the cameras (effectively making it always look at the camera)
    AgentSetProperty(objectIcon_icon["IconAgentReference"], "Runtime: Visible", TLSE_Development_Editor_ObjectIcons_Visible); 
    AgentSetProperty(objectIcon_icon["IconAgentReference"], "Render Global Scale", number_newGlobalScale);

    --Update the texture on the icon (incase any underlying properties change)
    ShaderOverrideAllTextures(objectIcon_icon["IconAgentReference"], objectIcon_icon["IconTexture"]);
end

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_ObjectIcons_Update = function()  
    --get all agents in the scene
    local agentTable_sceneAgents = TLSE_Development_SceneAgentsList;

    --check if the size is consistent, if it isn't then we need to rebuild the icons
    if not (#agentTable_sceneAgents == number_previousSceneAgentsSize) then
        for number_index1, agent_sceneAgent in ipairs(agentTable_sceneAgents) do
            CreateNewObjectIconAgent(agent_sceneAgent);
        end
    end

    --iterate through the icons and check if the agent they are supposed to be tied to are still there, if not then we need to remove them.
    for key, value in pairs(TLSE_Development_Editor_ObjectIcons_Icons) do
        --icons are attached to their parent upon creation
        local agent_iconParent = AgentGetParent(value["IconAgentReference"]);

        --if the parent if the icon no logner exists... or the underlying properties of the object has changed (and an icon can't represent it)...
        if(agent_iconParent == nil) or (value["IconTexture"] == nil) then
            --destroy the icon agent
            AgentDestroy(value["IconAgentReference"]);

            --remove the item
            value["IconAgentReference"] = nil;
            value["IconTexture"] = nil;
            value = nil; --NOTE: according to online, in lua setting the value of an object in a table of objects to nil is how you delete objects from a table.
        end
    end

    --iterate through all of the icons that we have and update them!
    for key, value in pairs(TLSE_Development_Editor_ObjectIcons_Icons) do
        UpdateObjectIcon(value);
    end

    --make sure we keep count of the agents that are in the scene
    number_previousSceneAgentsSize = #agentTable_sceneAgents;
end