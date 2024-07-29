local kScript = "CabinShedInterior"
local kScene = "adv_cabinShedInterior"
local PreloadAssets = function(bAct3)
  if bAct3 then
    if not LogicGet("3Shed - Bandaged Arm") then
      PreLoad("env_cabinShedInteriorAct3_drag_needle_1_chores_4.chore")
      PreLoad("env_cabinShedInteriorAct3_drag_needle_2_chores_3.chore")
      PreLoad("env_cabinShedInteriorAct3_drag_needle_3_chores_3.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_putDownNeedle_2.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_stitch_finisher_1.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_stitch_finisher_2.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_stitch_finisher_3.chore")
      PreLoad("env_cabinShedInteriorAct3_cs_putDownNeedle_2_finalStitch.chore")
    end
    PreLoad("env_cabinShedInteriorAct3_cs_zombieAttacks_1.chore")
    PreLoad("env_cabinShedInteriorAct3_timer_ZombieInHole_1.chore")
    PreLoad("env_cabinShedInteriorAct3_cs_zombieBreaksFree_1.chore")
    PreLoad("env_cabinShedInteriorAct3_cs_zombieBreaksFree_2.chore")
    PreLoad("env_cabinShedInteriorAct3_timer_freeZombieLegGrabbed_1.chore")
    PreLoad("struggle_ZombieBraceFootClose.chore")
    PreLoad("struggle_ZombieBraceFootMed.chore")
    PreLoad("struggle_ZombieBraceFootFar.chore")
    PreLoad("sk56_idle_clementine200ZombieRakeStruggleCloseRight.chore")
    PreLoad("sk56_idle_clementine200ZombieRakeStruggleMedRight.chore")
    PreLoad("sk56_idle_clementine200ZombieRakeStruggleFarRight.chore")
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_SCM_CC_TINT_QLo.t3fxb", "264")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "258")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "258")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "2")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "130")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "258")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "264")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "263")
  end
end
function CabinShedInterior()
  Game_NewScene(kScene, kScript)
  local bAct3 = LogicGet("Act") == 3
  if bAct3 then
    Navigate_Enable(false)
    if IsPlatformIOS() then
      AgentSetProperty("cam_fightStage5", "Pan Cam - Percentage Initial Vertical", 0.2)
    end
    if IsPlatformAndroid() then
      AgentSetProperty("cam_closeUp_needle", "Clip Plane - Near", 0.1)
      AgentSetProperty("cam_closeUp_finalStitch", "Clip Plane - Near", 0.04)
    end
  end
  PreloadAssets(bAct3)
  if Game_GetDebug() then
    LogicSet("bEnteredCabinExterior", true)
    if not bAct3 then
      Inventory_AddItem("knifePocket")
    else
      local sceneAgent = SceneGetSceneAgent(kScene)
      AgentSetProperty(sceneAgent, "Scene - Dialog", "env_cabinShedInteriorAct3.dlog")
      Yield()
      if LogicGet("3Shed - Bandaged Arm") then
        LogicSet("3Shed - Cleaned Arm", true)
        LogicSet("3Shed - Stitched Arm", true)
        Game_RunSceneDialog("logic_act2ObjectsOff")
        Game_SetSceneDialogNode("cs_zombieAttacks")
      end
    end
  end
  Game_StartScene(true)
end
function CabinShedInterior_SuppressPointer()
  while not LogicGet("3Shed - Stitched Arm") do
    if LogicGet("3Shed - About to Stitch") or LogicGet("3Shed - Did Intro Stitch") then
      Reticle_HidePointer(true)
    end
    Yield()
  end
end
SceneOpen(kScene, kScript)
