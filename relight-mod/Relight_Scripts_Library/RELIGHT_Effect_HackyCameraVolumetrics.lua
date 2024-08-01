--[[
Developer Notes: 
Yes. I am very very very very very well aware that this is not an ideal implementation.
However, given the circumstances at the time of writing we have no access or no knowledge of how to extract and decompile the game shaders yet.
Trust me, if we had the access and the tools I wouldn't have done it this way. 
There are alot of issues doing it this way, but I did it this way both out of experimentation but also (and mostly) by complete accident :P
As a result of the experiment led to something that works suprisingly ok roughly 40% of the time.

The issues...
1. When the the camera view direction starts to become parallel with a given light direction the "effect" disappears so to speak. 
This is because the current material being used for the "volumetric" planes still have the classic NdotL lighting on them.
So when the surface of the material is oriented away towards the light, it falls in shadow and the light no longer affects the plane.
This can be sort of fixed and alleviated by changing the light wrap modifier on light sources to its max but this causes obvious shading issues with other objects...
Ideally the material for the volumetric plane is one that is not affected by NdotL and can recieve shadows from light sources regardless of angle.
NOTE: One idea is to utilize the built in "lighting groups" that the tool has, and create duplicate meshes in the scene that are only affected by that lighting group.
Then what we do is on all regular cameras in the scene, there is a "Exclude Agents" which is a container and we just include the duplicated "shadow casting" agents for the volumetric lighting.
In theory this should be the perfect way to go about lighting the scene... however it means having a duplicate set of lights in the scene, and not only that a duplicate set of meshes... performance wise this sounds like it will be intensive...

2. Regular scene fog affects the result which skews the visuals of the effect quite a bit.

3. All scene lights affect the result, which is physically correct in theory but telltale often makes use of flat "ambient" lights which dramatically affect the result.
Ambient lights will contribute to the result and make the image appear VERY muddy if done incorrectly.

4. Another issue with this implementation is that there is no possible way to optimize this solution further by having it run mostly on the GPU.

5. In addition to issue #4 of the effect not being implemented as a shader, we can't apply noise or dithering to offset samples and reduce aliasing/stepping artifacts.
This would be a massive help to both improving quality and performance but unfortnautely we have to deal with brute force.

]]--

--[[
RELIGHT_SceneObject = kScene;
RELIGHT_HackyCameraVolumetrics_Settings = 
{
    Samples = 128,
    SampleOffset = 0.1,
    SampleStartOffset = 1.0,
    FogColor = Color(0.1, 0.1, 0.1, 0.1)
};
]]--

local RELIGHT_HackyCameraVolumetrics_AgentParentName = "VolumetricParentGroup";
local RELIGHT_HackyCameraVolumetrics_AgentParent = nil;
local RELIGHT_HackyCameraVolumetrics_AgentChildName = "Volumetric_";

RELIGHT_HackyCameraVolumetrics_Initalize = function()
    --local elementPropFile = "fx_candleFlameNoWickWD.prop"; -- in 201 data
    local elementPropFile = "fx_glowWhite.prop" -- in 201 data
    RELIGHT_HackyCameraVolumetrics_AgentParent = AgentCreate(RELIGHT_HackyCameraVolumetrics_AgentParentName, "group.prop", Vector(0,0,0), Vector(0,0,0), RELIGHT_SceneObject, false, false);

    for index = 1, RELIGHT_HackyCameraVolumetrics_Settings.Samples, 1 do 

      local currentPosition = Vector(0,0,(index * RELIGHT_HackyCameraVolumetrics_Settings.SampleOffset));
      local currentRotation = Vector(0,180,0);

      local currentElementAgentName = RELIGHT_HackyCameraVolumetrics_AgentChildName .. tostring(index);
      local currentElementAgent = AgentCreate(currentElementAgentName, elementPropFile, currentPosition, currentRotation, RELIGHT_SceneObject, false, false);

      AgentSetProperty(currentElementAgent, "Render Global Scale", 100.0)
      AgentSetProperty(currentElementAgent, "Render Cull", false)
      AgentSetProperty(currentElementAgent, "Render Layer", 25)
      AgentSetProperty(currentElementAgent, "Render Diffuse Color", RELIGHT_HackyCameraVolumetrics_Settings.FogColor)
      AgentSetProperty(currentElementAgent, "Render Constant Alpha Multiply", 1)
      AgentSetProperty(currentElementAgent, "Render After Anti-Aliasing", false)
      AgentSetProperty(currentElementAgent, "Render EnvLight Shadow Cast Enable", false)
      AgentSetProperty(currentElementAgent, "Motion Blur Enabled", false)
      AgentSetProperty(currentElementAgent, "Render Depth Test", true)
      AgentSetProperty(currentElementAgent, "Camera Facing", false)
      AgentSetProperty(currentElementAgent, "Render Static", false)
      AgentSetProperty(currentElementAgent, "Camera Facing Type", 0)
      AgentSetProperty(currentElementAgent, "Render Depth Write", false)
      AgentSetProperty(currentElementAgent, "Render Depth Write Alpha", false)
      AgentSetProperty(currentElementAgent, "Render 3D Alpha", false)
      AgentSetProperty(currentElementAgent, "Render Color Write", true)
      AgentSetProperty(currentElementAgent, "Render Force As Alpha", false)
      AgentSetProperty(currentElementAgent, "Render Depth Test Function", 4)
      AgentSetProperty(currentElementAgent, "Receive Shadows", true)
      AgentSetProperty(currentElementAgent, "Render FX Color Enabled", true)
      AgentSetProperty(currentElementAgent, "Render Shadow Force Visible", false)
      AgentSetProperty(currentElementAgent, "Render Enlighten Force Visible", false)

      AgentSetProperty(currentElementAgent, "fx_glowWhite - Texture", "color_fFFFFF")
      AgentSetProperty(currentElementAgent, "fx_glowWhite - Light Color Diffuse", RELIGHT_HackyCameraVolumetrics_Settings.FogColor);

        --[[
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "29917189130296323", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "337441776042619735", true, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "438000414546183936", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "1717554548013318519", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "3968320025434101793", true, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "4255471446328962866", true, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "6241934050521616540", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "7592540816388186066", true, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "9342519259510289425", true, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "11123420019994007728", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "11135290454403634481", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "12111892677656515207", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "12146612972960654343", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "13551425408333398071", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "13653337939902208949", true, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "13708738983771659377", true, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "14500962918222475984", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "15013745883174092217", true, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "15534494750857814442", false, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "16931290600450383317", false, RELIGHT_SceneObject)

        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "175974362136292770", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "1054157711913007758", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "1172836864953362732", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "1257070699733080104", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "2113086045989180411", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "2580150169153207299", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "3207112697218146358", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "3476438023795460075", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "3777130608026885374", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "4974401288743784843", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "5066756895947174386", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "5228041480347995870", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "5896821838924833897", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "7015250035810543342", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "7480742303957645383", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "7961783782750803347", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "8735055588785055762", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "8777722706473887450", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "9318400394721951400", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "9482770390863453857", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "9744484105360491661", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "9779227109534659805", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "9979872214271496197", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "10879226931621513095", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "11846756784333938959", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "11982405709027802459", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "11990377687850657584", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "13702207346332971943", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "13745441773436534127", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "13985869843448871498", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "14484707811718378985", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "14519789570618437401", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "14533182957841965371", 1.0, RELIGHT_SceneObject)
        --RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "14639541458681579632", 0.5, RELIGHT_SceneObject) --opaque mat alpha?
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "15223114978632247858", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "15598246489076376875", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "16059560486961196643", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "16490950358619660555", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "16974302554826177411", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "17811714305327045726", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "18017837635776104114", 1.0, RELIGHT_SceneObject)
        RELIGHT_AgentSetPropertyBySymbol(currentElementAgentName, "18181622419412755329", 1.0, RELIGHT_SceneObject)
        ]]--

        AgentSetProperty(currentElementAgent, "fx_candleFlameNoWickWD - Texture", "color_fFFFFF");
        AgentSetProperty(currentElementAgent, "fx_candleFlameNoWickWD - Light Color Diffuse", RELIGHT_HackyCameraVolumetrics_Settings.FogColor);

        AgentAttach(currentElementAgent, RELIGHT_HackyCameraVolumetrics_AgentParent);
    end
end

RELIGHT_HackyCameraVolumetrics_Update = function()
    local agent_currentCamera = SceneGetCamera(RELIGHT_SceneObject); --Agent type
    local vector_currentCameraPosition = AgentGetWorldPos(agent_currentCamera); --Vector type
    local vector_currentCameraForward = AgentGetForwardVec(agent_currentCamera); --Vector type
    local vector_currentCameraRotation = AgentGetWorldRot(agent_currentCamera); --Vector type

    local vector_volumetricGroupPosition = vector_currentCameraPosition + (vector_currentCameraForward * RELIGHT_HackyCameraVolumetrics_Settings.SampleStartOffset);

    AgentSetWorldPos(RELIGHT_HackyCameraVolumetrics_AgentParent, vector_volumetricGroupPosition);
    AgentSetRot(RELIGHT_HackyCameraVolumetrics_AgentParent, vector_currentCameraRotation);
end