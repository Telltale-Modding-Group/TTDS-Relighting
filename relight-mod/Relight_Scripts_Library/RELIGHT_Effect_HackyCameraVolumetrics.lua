--[[
Developer Notes: 
Yes. I am very very very very very well aware that this is not an ideal implementation.
However, given the circumstances at the time of writing we have no access or no knowledge of how to extract and decompile the game shaders yet.
Trust me, if we had the access and the tools I wouldn't have done it this way. 
There are alot of issues doing it this way, but I did it this way both out of experimentation but also (and mostly) by complete accident :P
As a result of the experiment led to something that works suprisingly ok roughly 60% of the time.

This works by using an object with a semi-transparent material that recieve shadows, many are spawned in front of the camera at a specific step distance, for X amount of samples.
Very similar to raymarching where we step into the scene, but these planes will automatically recieve shadows from oncoming lightsources that intersects the volumetric planes.
This works rather well, however due to this setup this introduces alot of issues and drawbacks...

The issues...
1. When the the camera view direction starts to become parallel with a given light direction, the "effect" disappears for that light. 
This is because the current material being used for the "volumetric" planes still have the classic NdotL lighting on them.
So when the surface of the material is oriented away towards the light, it falls in shadow and the light no longer affects the plane.
This can be sort of fixed and alleviated by changing the light wrap modifier on light sources to its max but this causes obvious shading issues with other objects...
Ideally the material for the volumetric plane is one that is not affected by NdotL and can recieve shadows from light sources regardless of angle.

NOTE: One idea is to utilize the built in "lighting groups" that the tool has, and create duplicate meshes in the scene that are only affected by that lighting group.
Then what we do is on all regular cameras in the scene, there is a "Exclude Agents" which is a container and we just include the duplicated "shadow casting" agents for the volumetric lighting.
In theory this should be the perfect way to go about lighting the scene... however it means having a duplicate set of lights in the scene, and not only that a duplicate set of meshes... performance wise this sounds like it will be intensive...

2. Regular scene fog affects the volumetric lighting which muddies up the visuals quite a bit. 
The planes can still be affected by scene/environment fog so then you get doubled up fog which looks bad. 
Any other fog effects in the scene must be disabled for this to be unpolluted and look correct, especially since this effect is supposed to be "fog" itself.

3. All scene lights affect the result, which is physically correct in theory, but in practice due to lighting setups in telltale it looks off.
- eLightEnvType_Ambient (3): Ambient light being light that is completely flat and brightens everything with no directional information, this muddies up the visuals of the fog quite a bit.
- eLightEnvType_DirectionalAmbient (4): Like the ambient light, this will brighten everything in the scene. This has more directional information than the ambient but it still uniformly affects everything.

4. Another issue with this implementation is that there is no possible way to optimize this solution further by having it run mostly on the GPU.

5. In addition to issue #4 of the effect not being implemented as a shader, we can't apply noise or dithering to offset samples and reduce aliasing/stepping artifacts.
This would be a massive help to both improving quality and performance but unfortnautely we have to deal with brute force.

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
    local elementPropFile = "fx_glowWhite.prop" -- in 201 data
    RELIGHT_HackyCameraVolumetrics_AgentParent = AgentCreate(RELIGHT_HackyCameraVolumetrics_AgentParentName, "group.prop", Vector(0,0,0), Vector(0,0,0), RELIGHT_SceneObject, false, false);

    for index = 1, RELIGHT_HackyCameraVolumetrics_Settings.Samples, 1 do 

        local currentPosition = Vector(0,0,(index * RELIGHT_HackyCameraVolumetrics_Settings.SampleOffset));
        local currentRotation = Vector(0,180,0);

        local currentElementAgentName = RELIGHT_HackyCameraVolumetrics_AgentChildName .. tostring(index);
        local currentElementAgent = AgentCreate(currentElementAgentName, elementPropFile, currentPosition, currentRotation, RELIGHT_SceneObject, false, false);

        --NOTE: If scale is too small, when the volumetric planes are placed at a great distance from camera you will see a sort of "clipping" of the volumetric lighting which looks awkward.
        AgentSetProperty(currentElementAgent, "Render Global Scale", 1000.0);
        AgentSetProperty(currentElementAgent, "Render Cull", false);
        AgentSetProperty(currentElementAgent, "Render Layer", 25);
        AgentSetProperty(currentElementAgent, "Render Diffuse Color", RELIGHT_HackyCameraVolumetrics_Settings.FogColor);
        AgentSetProperty(currentElementAgent, "Render Constant Alpha Multiply", 1);
        AgentSetProperty(currentElementAgent, "Render After Anti-Aliasing", false);
        AgentSetProperty(currentElementAgent, "Render EnvLight Shadow Cast Enable", false);
        AgentSetProperty(currentElementAgent, "Motion Blur Enabled", false);
        AgentSetProperty(currentElementAgent, "Render Depth Test", true);
        AgentSetProperty(currentElementAgent, "Camera Facing", false);
        AgentSetProperty(currentElementAgent, "Render Static", false);
        AgentSetProperty(currentElementAgent, "Camera Facing Type", 0);
        AgentSetProperty(currentElementAgent, "Render Depth Write", false);
        AgentSetProperty(currentElementAgent, "Render Depth Write Alpha", false);
        AgentSetProperty(currentElementAgent, "Render 3D Alpha", false);
        AgentSetProperty(currentElementAgent, "Render Color Write", true);
        AgentSetProperty(currentElementAgent, "Render Force As Alpha", false);
        AgentSetProperty(currentElementAgent, "Render Depth Test Function", 4);
        AgentSetProperty(currentElementAgent, "Receive Shadows", true);
        AgentSetProperty(currentElementAgent, "Render FX Color Enabled", true);
        AgentSetProperty(currentElementAgent, "Render Shadow Force Visible", false);
        AgentSetProperty(currentElementAgent, "Render Enlighten Force Visible", false);
        AgentSetProperty(currentElementAgent, "fx_glowWhite - Texture", "color_fFFFFF");
        AgentSetProperty(currentElementAgent, "fx_glowWhite - Light Color Diffuse", RELIGHT_HackyCameraVolumetrics_Settings.FogColor);
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