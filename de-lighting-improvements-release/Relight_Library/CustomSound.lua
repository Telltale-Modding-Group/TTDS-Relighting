local ambient_prop_kEnabled = "Ambient Sound - Enabled"
local ambient_prop_kFile = "Ambient Sound - File"
local ambient_prop_kPitch = "Ambient Sound - Pitch"
local ambient_prop_kFadeTime = "Ambient Sound - Fade Time"
local ambient_prop_kControllerScene = "Ambient Sound - Controller Scene"
local ambient_prop_kPreviousFile = "Ambient Sound - Previous File"
local ambient_prop_kDelay = "Ambient Sound - Initial Delay"

CustomSound_Ambient_Setup = function(agentName, scene)
    ResourceSetEnable("ProjectSeason1")
    local propFile = "sound_ambient.prop"
    local agent_agent = AgentCreate(agentName, propFile, Vector(0,0,0), Vector(0,0,0), scene, false, false)
end

CustomSound_Ambient_SetProperties = function(agentName, soundFile, fadeTime, pitch, scene)
    local agent = AgentFindInScene(agentName, scene)
    PropertySet(agent.mProps, ambient_prop_kEnabled, true)
    PropertySet(agent.mProps, ambient_prop_kFile, soundFile)
    PropertySet(agent.mProps, ambient_prop_kPreviousFile, soundFile)
    PropertySet(agent.mProps, ambient_prop_kFadeTime, fadeTime)
    PropertySet(agent.mProps, ambient_prop_kPitch, pitch)
end

CustomSound_Ambient_Play = function(agentName, volume, scene)
    local agent = AgentFindInScene(agentName, scene)

    agent.ambientController = SoundPlay((agent.mProps)[ambient_prop_kFile], nil, nil, scene, true)
    local agent_controller = agent.ambientController

    SoundSetPitch(agent_controller, (agent.mProps)[ambient_prop_kPitch])
    
    ControllerSetScene(agent_controller, scene)
    ControllerSetTimeScale(agent_controller, SceneGetTimeScale(scene))
    ControllerDisableTimeSync(agent_controller, false)
    ControllerSetTime(agent_controller, 0.0)
    ControllerDrift(agent_controller, true)
    ControllerSetAmbient(agent_controller, true)
    ControllerSetName(agent_controller, AgentGetName(agent))
    ControllerFadeIn(agent_controller, agent.mProps[ambient_prop_kFadeTime])
    ControllerDisableTimeSync(agent_controller, true)
    ControllerSetLooping(agent_controller, true)
    ControllerSetSoundVolume(agent_controller, volume)
end