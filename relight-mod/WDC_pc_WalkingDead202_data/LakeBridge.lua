local kScript = "LakeBridge"
local kScene = "adv_lakeBridge"
local kLukeFallDelay = 5
local multiAgents = {}
multiAgents.machete = {}
multiAgents.machete.agents = {
  "obj_machetteWD",
  "obj_machetteWD_clementine",
  "obj_machetteWD_luke",
  "obj_machetteWD_zombiePoleHead"
}
multiAgents.machete.agentCallbacks = {}
multiAgents.machete.charProps = {}
multiAgents.machete.charProps.Luke = {}
multiAgents.machete.charProps.Luke.agent = "Luke"
multiAgents.machete.charProps.Luke.props = {
  "Mesh sk54_luke_machete - Visible"
}
multiAgents.machete.charProps.Luke.callbacks = {}
multiAgents.machete.lastUpdateTime = -1
multiAgents.hammer = {}
multiAgents.hammer.agents = {
  "obj_hammerCabin_clementine",
  "obj_hammerCabin_zombieBrokenJawJaw"
}
multiAgents.hammer.agentCallbacks = {}
multiAgents.hammer.charProps = {}
multiAgents.hammer.lastUpdateTime = -1
multiAgents.pipe = {}
multiAgents.pipe.agents = {
  "obj_barRodBridge_clementine",
  "obj_barRodBridge_clementineWristL",
  "obj_barRodBridge_luke",
  "obj_barRodBridge_zombiePole",
  "obj_barRodBridge"
}
multiAgents.pipe.agentCallbacks = {}
multiAgents.pipe.charProps = {}
multiAgents.pipe.lastUpdateTime = -1
local PreloadAssets = function()
  PreLoad("env_lakeBridge_cs_matthewArrives_1.chore")
  PreLoad("env_lakeBridge_cs_lukeFalls_1.chore")
  PreLoad("amb_vox_zomb_tvGang_lp.wav")
  PreLoad("cam_lukeFalls_horizontal_adv_lakeBridge.chore")
  PreLoad("cam_lukeFalls_vertical_adv_lakeBridge.chore")
  PreLoad("clementine200_eyes_lookUpRight_add.anm")
  PreLoad("clementine200_headGesture_lookLeftQuick_add.anm")
  PreLoad("clementine200_headGesture_lookLeftQuick_add.chore")
  PreLoad("clementine200_headGesture_lookUpRight_add.chore")
  PreLoad("clementine200_phoneme_AA_fearCX.anm")
  PreLoad("clementine200_phoneme_default_fearCX.anm")
  PreLoad("clementine200_phoneme_EE_fearCX.anm")
  PreLoad("clementine200_phoneme_FV_fearCX.anm")
  PreLoad("clementine200_phoneme_I_fearCX.anm")
  PreLoad("clementine200_phoneme_LL_fearCX.anm")
  PreLoad("clementine200_phoneme_MM_fearCX.anm")
  PreLoad("clementine200_phoneme_NN_fearCX.anm")
  PreLoad("clementine200_phoneme_O_fearCX.anm")
  PreLoad("clementine200_phoneme_SH_fearCX.anm")
  PreLoad("clementine200_phoneme_TH_fearCX.anm")
  PreLoad("clementine200_phoneme_U_fearCX.anm")
  PreLoad("default.save")
  PreLoad("fol_gun_from_holster.wav")
  PreLoad("fol_machette_unsheath.wav")
  PreLoad("luke_eyes_left_add.anm")
  PreLoad("luke_eyes_up_add.anm")
  PreLoad("luke_headGesture_lookDownQuick_add.anm")
  PreLoad("luke_headGesture_lookDownQuick_add.chore")
  PreLoad("luke_headGesture_lookLeftQuick_add.chore")
  PreLoad("luke_headGesture_lookUp_add.anm")
  PreLoad("luke_headGesture_lookUp_add.chore")
  PreLoad("luke_phoneme_AA_surpriseB.anm")
  PreLoad("luke_phoneme_AA_thinkingB.anm")
  PreLoad("luke_phoneme_default_surpriseB.anm")
  PreLoad("luke_phoneme_default_thinkingB.anm")
  PreLoad("luke_phoneme_EE_surpriseB.anm")
  PreLoad("luke_phoneme_EE_thinkingB.anm")
  PreLoad("luke_phoneme_FV_surpriseB.anm")
  PreLoad("luke_phoneme_FV_thinkingB.anm")
  PreLoad("luke_phoneme_I_surpriseB.anm")
  PreLoad("luke_phoneme_I_thinkingB.anm")
  PreLoad("luke_phoneme_LL_surpriseB.anm")
  PreLoad("luke_phoneme_LL_thinkingB.anm")
  PreLoad("luke_phoneme_MM_surpriseB.anm")
  PreLoad("luke_phoneme_MM_thinkingB.anm")
  PreLoad("luke_phoneme_NN_surpriseB.anm")
  PreLoad("luke_phoneme_NN_thinkingB.anm")
  PreLoad("luke_phoneme_O_surpriseB.anm")
  PreLoad("luke_phoneme_O_thinkingB.anm")
  PreLoad("luke_phoneme_SH_surpriseB.anm")
  PreLoad("luke_phoneme_SH_thinkingB.anm")
  PreLoad("luke_phoneme_TH_surpriseB.anm")
  PreLoad("luke_phoneme_TH_thinkingB.anm")
  PreLoad("luke_phoneme_U_surpriseB.anm")
  PreLoad("luke_phoneme_U_thinkingB.anm")
  PreLoad("metadata_slot.prop")
  PreLoad("mus_loop_Action_09b.wav")
  PreLoad("mus_loop_Action_09c.wav")
  PreLoad("obj_bridgeBeamBloodyA.d3dtx")
  PreLoad("obj_machetteWDLakeBridgeBlood.d3dtx")
  PreLoad("saveslot3.bundle")
  PreLoad("SceneGlowAlphaTest_1SKN_QHi.t3fxb")
  PreLoad("SceneToonOutline2_GBuffer_1SKN_QHi.t3fxb")
  PreLoad("SceneVelocityAlpha_1SKN_QHi.t3fxb")
  PreLoad("sk54_idle_lukeSurpriseB.anm")
  PreLoad("sk54_idle_lukeSurpriseB.chore")
  PreLoad("sk54_idle_lukeThinkingB.anm")
  PreLoad("sk54_idle_lukeThinkingB.chore")
  PreLoad("sk54_lukeSurpriseB.ptable")
  PreLoad("sk54_lukeThinkingB.ptable")
  PreLoad("sk54_luke_headBridgeCut.d3dtx")
  PreLoad("sk54_luke_toThinkingB.chore")
  PreLoad("sk54_wd200GM_lookBehindLeft_add.anm")
  PreLoad("sk54_zombieAverage_walkB200.anm")
  PreLoad("sk56_clementine200FearCX.ptable")
  PreLoad("sk56_clementine200Tense_toClementine200.anm")
  PreLoad("sk56_clementine200Tense_weightShiftCShort_add.anm")
  PreLoad("sk56_clementine200_lookBehindRight_add.anm")
  PreLoad("sk56_clementine200_toFearCX.chore")
  PreLoad("sk56_clementine200_turnLeft90.anm")
  PreLoad("sk56_idle_clem200FearCX.anm")
  PreLoad("sk56_idle_clementine200.anm")
  PreLoad("sk56_idle_clementine200.chore")
  PreLoad("sk56_idle_clementine200FearCX.chore")
  PreLoad("sk56_idle_clementine200HurtHoldHammer.anm")
  PreLoad("vox_zomb_EricP_idol_3.wav")
  PreLoad("wd200GM_headGesture_lookUpRight_add.anm")
  PreLoad("_agents.amap")
  PreLoad("ui_vignette_hide.chore")
  PreLoad("env_lakeBridge_cs_lukeFalls_2.chore")
  PreLoad("adv_lakeBridge_clemReachesForLuke.chore")
  PreLoad("sk56_idle_clementine200LookDownHole.chore")
  PreLoad("sk56_idle_clementine200LookDownHole.anm")
  PreLoad("adv_lakeBridge_clemReachesForLuke_zombieFalls.chore")
  PreLoad("adv_lakeBridge_lukeUnderBridge.chore")
  PreLoad("adv_lakeBridge_clemReachesForLuke_luke.chore")
  PreLoad("ui_notification.prop")
  PreLoad("ui_notification_text.prop")
  PreLoad("ui_notification_background.prop")
  PreLoad("ui_notification_exclamation.prop")
  PreLoad("ui_notification_question.prop")
  PreLoad("ui_notification_saving.prop")
  PreLoad("ui_notification.scene")
  PreLoad("metadata_slot.prop")
  PreLoad("ui_notification_saving.chore")
  PreLoad("ui_notification_saving.d3dmesh")
  PreLoad("ui_notification_saving1.d3dtx")
  PreLoad("ui_notification_background.d3dmesh")
  PreLoad("ui_notification_exclamation.d3dmesh")
  PreLoad("ui_notification_question.d3dmesh")
  PreLoad("ui_notification_background.d3dtx")
  PreLoad("ui_notification_exclamation.d3dtx")
  PreLoad("ui_notification_question.d3dtx")
  PreLoad("ui_notification_saving2.d3dtx")
  PreLoad("ui_notification_saving3.d3dtx")
  PreLoad("ui_notification_saving4.d3dtx")
  PreLoad("ui_notification_saving5.d3dtx")
  PreLoad("ui_notification_saving6.d3dtx")
  PreLoad("ui_notification_saving7.d3dtx")
  PreLoad("ui_notification_saving8.d3dtx")
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
  end
end
local LukeFallsTimer = function(fallDelay)
  if not fallDelay or type(fallDelay) ~= "number" then
    fallDelay = kLukeFallDelay
  end
  local curTime = GetTotalTime()
  local delay = curTime + fallDelay
  local inc = 0
  while curTime < delay do
    inc = GetFrameTime() * SceneGetTimeScale(kScene)
    curTime = curTime + inc
    Yield()
  end
  if not LogicGet("2Bridge - Luke Hanging") then
    ChoredMovement_Stop()
    Game_RunDialog("cs_lukeFalls", false)
  end
end
function LakeBridge()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if IsPlatformAndroid() then
    AgentSetProperty("cam_cutsceneChore", "Clip Plane - Near", 0.15)
  end
  if IsPlatformIOS() then
    AgentSetProperty("adv_lakeBridgeTracks_meshesA", "Render Cull", false)
    AgentSetProperty("adv_lakeBridgeTracks_meshesB", "Render Cull", false)
    AgentSetProperty("adv_lakeBridgeTracks_meshesC", "Render Cull", false)
  end
  Game_StartScene(true)
end
function LakeBridge_ApproachZombies(lukeFallDelay)
  Game_RunDialog("amb_lukeFalls", false)
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_lakeBridge_cMove_lukeFalls_1.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_lukeFalls")
  ThreadStart(LukeFallsTimer, lukeFallDelay)
  ChoredMovement_Start()
end
function LakeBridge_MultiAgents_Init()
  Sleep(0.25)
  local multiAgentKey, multiAgentValue
  local actionTime = 0
  for multiAgentKey, multiAgentValue in pairs(multiAgents) do
    for key, value in pairs(multiAgentValue.agents) do
      local agent = value
      local MultiAgentsVisCheck = function(propKey, bVisible)
        if bVisible then
          if multiAgentValue.lastUpdateTime == GetTotalTime() then
            return
          end
          for key, value in pairs(multiAgents[multiAgentKey].agents) do
            if value ~= agent then
              AgentHide(value, true)
            end
          end
          for characterKey, characterValue in pairs(multiAgentValue.charProps) do
            local character = characterValue.agent
            for key, value in pairs(characterValue.props) do
              AgentSetProperty(character, value, false)
            end
          end
          multiAgentValue.lastUpdateTime = GetTotalTime()
        end
      end
      table.insert(multiAgentValue.agentCallbacks, MultiAgentsVisCheck)
      PropertyAddKeyCallback(AgentGetProperties(agent), "Runtime: Visible", MultiAgentsVisCheck)
    end
    for characterKey, characterValue in pairs(multiAgentValue.charProps) do
      local character = characterValue.agent
      for charPropKey, charPropValue in pairs(characterValue.props) do
        local MultiAgentsCharPropVisCheck = function(propKey, bVisible)
          if bVisible then
            if multiAgentValue.lastUpdateTime == GetTotalTime() then
              return
            end
            for key, value in pairs(multiAgents[multiAgentKey].agents) do
              AgentHide(value, true)
            end
            for key, value in pairs(characterValue.props) do
              if value ~= charPropValue then
                AgentSetProperty(character, value, false)
              end
            end
            multiAgentValue.lastUpdateTime = GetTotalTime()
          end
        end
        table.insert(characterValue.callbacks, MultiAgentsCharPropVisCheck)
        PropertyAddKeyCallback(AgentGetProperties(character), charPropValue, MultiAgentsCharPropVisCheck)
      end
    end
  end
end
function LakeBridge_MultiAgents_Off()
  for multiAgentKey, multiAgentValue in pairs(multiAgents) do
    for key, value in pairs(multiAgentValue.agents) do
      PropertyRemoveKeyCallback(AgentGetProperties(value), "Runtime: Visible", multiAgentValue.agentCallbacks[key])
    end
    multiAgentValue.agentCallbacks = {}
    for characterKey, characterValue in pairs(multiAgentValue.charProps) do
      local character = characterValue.agent
      for key, value in pairs(characterValue.props) do
        PropertyRemoveKeyCallback(AgentGetProperties(character), value, characterValue.callbacks[key])
      end
      characterValue.callbacks = {}
    end
  end
end
function LakeBridge_IncreaseStruggleResistance(agent, incPerFrame, maxDecay, progressResetPoint)
  local gotAllArgs = agent and incPerFrame and maxDecay and progressResetPoint
  if not (gotAllArgs and AgentExists(agent)) or not AgentHasProperty(agent, "Struggle - Complete") then
    print("LakeBridge_IncreaseStruggleResistance() sez problem with arguments! bailing out")
    return
  end
  local decay = 0
  local decayInit = 0
  local progress = 0
  local okToReset = false
  decayInit = AgentGetProperty(agent, "Button Mash - Rate of Decay")
  decay = decayInit
  while not AgentGetProperty(agent, "Struggle - Complete") do
    if 0 < SceneGetTimeScale(kScene) then
      decay = decay + incPerFrame
    end
    if maxDecay < decay then
      decay = maxDecay
    end
    progress = AgentGetProperty(agent, "Button Mash - Current Percentage")
    if okToReset and progressResetPoint > progress then
      okToReset = false
      decay = decayInit
    end
    if progressResetPoint < progress then
      okToReset = true
    end
    AgentSetProperty(agent, "Button Mash - Rate of Decay", decay)
    Yield()
  end
end
SceneOpen(kScene, kScript)
