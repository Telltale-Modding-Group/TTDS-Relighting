local kScript = "HardwareStoreExteriorRear"
local kScene = "adv_hardwareStoreExteriorRear"
local kMinAvgFrameTimeForFinalStruggleDeathBlow = 0.05
local mbToStopActive = false
local mChoredMoveController, mStopController, mTriggerChoreController, mDialogId
local PreloadAssets = function()
  PreLoad("env_hardwareStoreExteriorRear_cs_carlosDies_2.chore")
  if IsPlatformIOS() then
    PreLoad("env_hardwareStoreExteriorRear_cs_carlosDies_3.chore")
    PreLoad("env_hardwareStoreExteriorRear_cs_carlosDies_4.chore")
    PreLoad("env_hardwareStoreExteriorRear_cs_carlosDies_5.chore")
    PreLoad("env_hardwareStoreExteriorRear_cs_carlosDies_7.chore")
    PreLoad("env_hardwareStoreExteriorRear_cs_carlosDies_8.chore")
  end
  if Platform_NeedShaderPreload() then
    print(">>>>>>>>> PRELOADING SHADERS: " .. kScene)
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "256")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "8")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "8")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "320")
  end
end
local WhilePausedChoredMove = function()
  mbToStopActive = false
  while ChoredMovement_GetMoveDir() ~= 1 and ChoredMovement_IsActive() do
    print("Chore Controller: " .. tostring(ControllerIsPlaying(mTriggerChoreController)) .. [[

 Stop Active: ]] .. tostring(mbToStopActive))
    if ControllerIsPlaying(mTriggerChoreController) and not mbToStopActive then
      print([[

Play Chore!
]])
      mStopController = ChorePlay("adv_hardwareStoreExteriorRear_agents_toIdle.chore")
      mbToStopActive = true
    end
    Yield()
  end
end
local WhilePlayingChoredMove = function()
  mbToStopActive = false
  while ChoredMovement_GetMoveDir() == 1 and ChoredMovement_IsActive() do
    if ControllerIsPlaying(mStopController) and not mbToStopActive then
      print([[

Fade Out Chore!
]])
      ControllerFadeOut(mStopController, 1.5)
      mbToStopActive = true
    end
    Yield()
  end
end
function HardwareStoreExteriorRear_RunHerdWalkBG(dNode)
  if Game_DialogExists(dNode) then
    mDialogId = Game_RunSceneDialog(dNode, false)
  else
    Print("Input: " .. dNode .. " does not exist!")
    return
  end
end
function HardwareStoreExteriorRear_PauseHerdWalkBG()
  if not mDialogId then
    Print("Ah ah ah, mDialogId is: " .. tostring(mDialogId))
    return
  else
    DlgPause(mDialogId)
    Print("Herd walk paused!")
  end
end
function HardwareStoreExteriorRear_ResumeHerdWalkBG()
  if not mDialogId then
    Print("Tsk tsk tsk, mDialogId is: " .. tostring(mDialogId))
    return
  else
    ChoredMovement_SetJoystickDirection(0)
    DlgResume(mDialogId)
    Print("Herd walk resumed!")
  end
end
function HardwareStoreExteriorRear_GetTriggerController()
  local trigger = AgentFind("trigger_chore_carlosAndSarahWalk")
  Yield()
  if not trigger then
    Print([[
Trigger is not initialized!


]])
    return
  end
  mTriggerChoreController = trigger.mChoreController
end
function HerdChoredMovement()
  mChoredMoveController = ChoredMovement_GetForwardController()
  HardwareStoreExteriorRear_GetTriggerController()
  if not mChoredMoveController then
    print("ERROR -- mChoredMoveController is NIL!!!!!")
    return
  end
  if not mTriggerChoreController then
    print("ERROR -- mTriggerChoreController is NIL!!!!!")
    return
  end
  print("Loop for FREEEEEEDOM!!!")
  while ChoredMovement_IsActive() do
    WhilePausedChoredMove()
    Yield()
    print("Switch! - 1")
    WhilePlayingChoredMove()
    Yield()
    print("Switch! - 0")
  end
  print([[

-- Killing Controllers! --
]])
  ControllerKill(mChoredMoveController)
  ControllerKill(mTriggerChoreController)
  ControllerKill(mStopController)
end
function HardwareStoreExteriorRear()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  if Game_GetDebug() and LogicGet("3 - Zombie Walk") then
    Game_SetSceneDialogNode("cs_troyGetsIt")
  end
  Game_StartScene()
end
function HardwareStoreExteriorRear_FinalStruggleFPSCheck()
  local frameTime = GetAverageFrameTime()
  if frameTime > kMinAvgFrameTimeForFinalStruggleDeathBlow then
    print("Herd Walk Final Struggle <<<< NO DEATH BLOW >>>>")
    AgentSetProperty("struggle_hatchetZombie3", "Struggle - Death Blow Required", false)
  else
    print("Herd Walk Final Struggle **** ok for death blow ****")
  end
  print("average frame time was " .. tostring(frameTime))
end
SceneOpen(kScene, kScript)
