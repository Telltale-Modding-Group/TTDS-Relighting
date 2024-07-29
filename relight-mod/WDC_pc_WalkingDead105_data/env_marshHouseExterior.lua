local kScript = "MarshHouseExterior"
local kScene = "adv_marshHouseExterior"
local kOverlay = "fx_overlayEyesBlink"
local mAgentWithFocus
function MarshHouseExterior()
  Mode(mode_Main)
  Mode_Push(mode_NoMovement)
  Navigate_Enable(false)
  AgentHide(SceneGetSceneAgent(kOverlay), true)
  SceneHide(kOverlay, true)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic.nAct == 2 then
    Episode_SetLeeState(true, false, false, "A")
  else
    Episode_SetLeeState(true, true, true, "A")
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function RemapAttack(oldAgent, newAgent)
  Dialog_Interruption()
  local origAgent = newAgent
  AgentFind(newAgent).mProps["Game Selectable"] = false
  if not AgentExists(newAgent .. "_remapped") then
    AgentDuplicate(newAgent .. "_remapped", newAgent)
  end
  newAgent = newAgent .. "_remapped"
  AgentSetPos(newAgent, AgentGetPos(oldAgent))
  AgentDetach(newAgent)
  DlgSetExchangeChoreAgentRemap(oldAgent, newAgent)
  local thread = function()
    while not Dialog_CutsceneIsRunning() do
      Yield()
    end
    AgentImportAgentPropertyKeyValues(newAgent, origAgent)
    AgentDetach(newAgent)
    AgentFind(newAgent).mProps["Render Share Skeleton With Agent"] = ""
    while Dialog_CutsceneIsRunning() do
      Yield()
      AgentHide(oldAgent, true)
    end
    AgentHide(newAgent, true)
    AgentHide(oldAgent, true)
  end
  ThreadStart(thread)
end
function MarshHouseExterior_CleaverAllowed()
  return not Input_IsUsingTouch()
end
SceneOpen(kScene, kScript)
SceneAdd(kOverlay)
function SetZombie(agent)
  local props = AgentGetSceneProperties(agent)
  props["Extents Max"].x = 0.25
  props["Extents Max"].y = 1.67
  props["Extents Max"].z = 0.3
  props["Extents Min"].x = -0.25
  props["Extents Min"].y = 0
  props["Extents Min"].z = -0.5
  props["Game Selectable"] = false
  agent.mProps["Game Selectable"] = true
  props["WDUseable - Action Use Dialog Start Node"] = "use_" .. AgentGetName(agent)
  DlgAddNode("env_marshhouseexterior.dlog", "Gauntlet", "exchange", "use_" .. AgentGetName(agent))
  Save("env_marshhouseexterior.dlog")
end
local OnMarshHouseAgentCreate = function(agent)
  local name = string.sub(AgentGetName(agent), 0, 3)
  if name == "Zom" and AgentHasProperty(agent, "Game Selectable") then
    local onKeyChange = function()
      if agent.mProps["Game Selectable"] then
        local dot = "ui_" .. AgentGetName(agent) .. "_dot"
        while not AgentExists(dot) do
          Yield()
        end
        if AgentFind(dot).mProps["Scene: Transient"] then
          local sceneProps = AgentGetSceneProperties(dot)
          sceneProps["Scene: Transient"] = false
          AgentAttachToNode(dot, agent, "spine3")
          AgentSetPos(dot, Vector(0, 0, 0))
          SceneCaptureAgentInfo(AgentGetScene(dot), dot)
          Print("Fixing: " .. dot)
        end
        local sceneProps = AgentGetSceneProperties(agent)
        sceneProps["WDUseable - Icon Fade Distance"] = 7.5
      else
        PropertyRemove(agent.mProps, "WDUseable - Action Use Dialog Start Node")
      end
    end
    PropertyAddKeyCallback(AgentGetProperties(agent), "Game Selectable", onKeyChange)
  end
end
Callback_AgentCreated:Add(OnMarshHouseAgentCreate)
function PreloadShaders()
end
