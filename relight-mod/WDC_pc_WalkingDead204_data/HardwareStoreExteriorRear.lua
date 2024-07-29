local kScript = "HardwareStoreExteriorRear"
local kScene = "adv_hardwareStoreExteriorRear204"
local mChoredMoveThread, mDialogId, mTriggerChoreController, mChoredMoveController
local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "194")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "322")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
  end
end
function HardwareStoreExteriorRear204_GetTriggerController()
  local trigger = AgentFind("trigger_chorebox_hardwareStoreExteriorRear204_followJane_Jane")
  Yield()
  if not trigger then
    print([[
ERROR -- Trigger is not initialized!


]])
    return
  end
  mTriggerChoreController = trigger.mChoreController
end
function HardwareStoreExteriorRear()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  Game_StartScene()
end
function HardwareStoreRear204_ManageClemSpeed()
  print([[
FUNCTION START!

]])
  mChoredMoveController = ChoredMovement_GetForwardController()
  print([[
did it even get here?

]])
  HardwareStoreExteriorRear204_GetTriggerController()
  print([[
Controllers initialized!!

]])
  if not mChoredMoveController or not mTriggerChoreController then
    print([[
ERROR -- mTriggerChore or mChoredMove controller is NIL!!

]])
    return
  end
  print([[
Starting loop!

]])
  while ChoredMovement_IsActive() do
    local choreBoxPercentage = ControllerGetTime(mTriggerChoreController)
    Yield()
    print("ChBox == " .. tostring(choreBoxPercentage) .. [[
 

]])
    ControllerSetTimeScale(mChoredMoveController, choreBoxPercentage)
    Yield()
    print([[
Time scale set!

]])
  end
  print([[
Pre-Controller Kill!

]])
  ControllerKill(mChoredMoveController)
  ControllerKill(mTriggerChoreController)
  print([[
FUNCTION END!! WOOT!

]])
end
function HardwareStoreExteriorRear_DlgRun(dlgNode)
  if Game_DialogExists(dlgNode) then
    mDialogId = Game_RunSceneDialog(dlgNode, false)
  else
    Print("WARNING: -- " .. tostring(dlgNode) .. " -- does not Exist!!")
    return
  end
end
function HardwareStoreExteriorRear_DlgPause()
  if not mDialogId then
    Print("WARNING: mDialogId == " .. tostring(mDialogId) .. " for DlgPause.")
    return
  end
  DlgPause(mDialogId)
end
function HardwareStoreExteriorRear_DlgResume()
  if not mDialogId then
    Print("WARNING: mDialogId == " .. tostring(mDialogId) .. " for DlgResume.")
    return
  end
  DlgResume(mDialogId)
end
function HardwareStoreExteriorRear_DlgStop()
  if not mDialogId then
    Print("WARNING: mDialogId == " .. tostring(mDialogId) .. " for DlgStop.")
    return
  end
  DlgStop(mDialogId, false)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingCredits")
