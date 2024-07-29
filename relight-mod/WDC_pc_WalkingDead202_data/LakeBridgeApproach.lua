local kScript = "LakeBridgeApproach"
local kScene = "adv_lakeBridgeApproach"
local kBinocsOverlay = "fx_overlayTelescope.scene"
local kWalkerApproachCMoveChore = "env_lakeBridgeApproach_cs_approachZombies_1.chore"
local PreloadAssets = function()
  PreLoad("env_lakeBridgeApproach_CS_Enter_1.chore")
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_ENV_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
  end
end
function LakeBridgeApproach()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene(true)
end
function LakeBridgeApproach_SuppressBinocs()
  while SceneIsActive(kScene) do
    if not SceneIsHidden(kBinocsOverlay) then
      SceneHide(kBinocsOverlay, true)
    end
    if not AgentIsHidden(kBinocsOverlay) then
      AgentHide(kBinocsOverlay, true)
    end
    Yield()
  end
end
function LakeBridgeApproach_ApproachZombies()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", kWalkerApproachCMoveChore)
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "amb_timerChooseZombie")
  ChoredMovement_Start()
end
function LakeBridgeApproach_TooCloseToRun()
  LogicSet("2BridgeApproach - Run to Walkers", false)
  print("Clem's gonna sneak all the way up!")
end
function LakeBridgeApproach_FinishSneak(walkerPick)
  Navigate_Enable(false)
  Reticle_Enable(false)
  Yield()
  local timeChoredIn = ChoredMovement_GetTimePercent() * ChoreGetLength(kWalkerApproachCMoveChore)
  ChoredMovement_Stop()
  local controller = ChorePlayAndAdvance(kWalkerApproachCMoveChore, timeChoredIn)
  while ControllerIsPlaying(controller) do
    Yield()
  end
  RenderDelay(10)
  if walkerPick == "shorty" then
    Game_RunDialog("use_zombieShorty1", false)
  elseif walkerPick == "standingLeg" then
    Game_RunDialog("use_zombieStandingLeg1", false)
  elseif walkerPick == "standingHead" then
    Game_RunDialog("use_zombieStandingHead1", false)
  end
  Reticle_Enable(true)
  Yield()
end
function LakeBridgeApproach_SuppressVerbUI(hideTime)
  hideTime = hideTime or 0.25
  local nounScale = AgentGetProperty("ui_reticle_textNoun", "Text Scale")
  local verbScale = AgentGetProperty("ui_reticle_textVerb", "Text Scale")
  AgentSetProperty("ui_reticle_textNoun", "Text Scale", 0)
  AgentSetProperty("ui_reticle_textVerb", "Text Scale", 0)
  local curTime = GetTotalTime()
  local delay = curTime + hideTime
  local inc = 0
  while curTime < delay do
    print("no text dammit")
    inc = GetFrameTime() * SceneGetTimeScale(kScene)
    curTime = curTime + inc
    Yield()
  end
  AgentSetProperty("ui_reticle_textNoun", "Text Scale", nounScale)
  AgentSetProperty("ui_reticle_textVerb", "Text Scale", verbScale)
end
function LakeBridgeApproach_AmbientLineDelay(lookAt)
  if IsPlatformXbox360() or IsPlatformPS3() or IsPlatformVita() then
    ChorePlay("ui_reticle_textHide.chore")
  end
  while Subtitle_GetCurrentID() ~= -1 do
    Yield()
  end
  if lookAt == "bridge" then
    Game_RunDialog("cs_lookAtBridge", false)
  elseif lookAt == "lift" then
    Game_RunDialog("cs_lookAtLift", false)
  elseif lookAt == "stationHouse" then
    Game_RunDialog("cs_lookAtStationHouse", false)
  else
    Game_RunDialog("cs_lookAtLodge", false)
  end
end
SceneOpen(kScene, kScript)
