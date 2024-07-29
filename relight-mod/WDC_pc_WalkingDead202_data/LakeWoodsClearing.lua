local kScript = "LakeWoodsClearing"
local kScene = "adv_lakeWoodsTruckClearing"
local kPeteSearchSoundsInitDelay = 1.5
local kPeteSearchSoundsMinDelay = 3
local kPeteSearchSoundsMaxDelay = 8
local PreloadAssets = function()
  if LogicGet(kAct) == 2 then
    PreLoad("env_lakeWoodsTrail_cs_returnToClearing_4.chore")
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_QLo.t3fxb", "391")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_LGT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "256")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "67")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_LGT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_1SKN_DTL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_QLo.t3fxb", "270")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "334")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "8")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "266")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "263")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_QLo.t3fxb", "264")
    RenderPreloadShader("Mesh_QLo.t3fxb", "328")
  end
end
function LakeWoodsClearing()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if Game_GetDebug() then
    LogicSet("Episode 201 - Rescue Choice", "Pete")
    if LogicGet("1Clearing - Left Truck") then
      if SystemBoolDialogEx("Did Pete come with you?", "Got Pete?", true) then
        LogicSet("1Clearing - Asked Pete to Come", true)
      end
      Game_SetSceneDialogNode("cs_exitTruck")
    end
  end
  Game_StartScene(true)
end
function LakeWoodsClearing_HideZombies(bKillIdles)
  for i = 1, 8 do
    local zombie = "Zombie" .. i
    if AgentExists(zombie) then
      print("Hiding " .. zombie)
      if bKillIdles then
        AgentSetProperty(zombie, "Walk Animation - Idle", "")
      end
      AgentSetProperty(zombie, "Runtime: Visible", false)
    end
  end
end
function LakeWoodsClearing_FindPete()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_lakeWoodsTrail_cMove_findPete_1.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_trailToClearingFindPete")
  ChoredMovement_Start()
end
function LakeWoodsClearing_PeteSearchSounds()
  local PlaySearchSound = function()
    if not LogicGet("2WoodsTrail - Found Pete") then
      Dialog_Run("env_lakeWoodsTrail.dlog", "amb_peteSearch", true)
    end
  end
  local Timer = function(curTime, delay)
    local inc = 0
    while curTime < delay do
      inc = GetFrameTime() * SceneGetTimeScale(kScene)
      curTime = curTime + inc
      Yield()
    end
  end
  local curTime = GetTotalTime()
  local delay = curTime + kPeteSearchSoundsInitDelay
  Timer(curTime, delay)
  PlaySearchSound()
  if LogicGet("2WoodsTrail - Found Pete") then
    return
  end
  curTime = GetTotalTime()
  delay = curTime + math.random(kPeteSearchSoundsMinDelay, kPeteSearchSoundsMaxDelay)
  Timer(curTime, delay)
  PlaySearchSound()
  if LogicGet("2WoodsTrail - Found Pete") then
    return
  end
  curTime = GetTotalTime()
  delay = curTime + math.random(kPeteSearchSoundsMinDelay, kPeteSearchSoundsMaxDelay)
  Timer(curTime, delay)
  PlaySearchSound()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingCredits")
