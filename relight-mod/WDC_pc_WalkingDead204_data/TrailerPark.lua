local kScript = "TrailerPark"
local kScene = "adv_trailerPark"
local kJaneClemMoveBodySFXDelayMax = 1.5
local kJaneClemMoveBodySFXDelayMin = 0.75
local mTruckPickupOutsideUseables = {
  "obj_truckPickupWindowUsePoint",
  "obj_truckPickupBedUsePoint"
}
local mTruckPickupInsideUseables = {
  "obj_truckPickupHornUsePoint",
  "obj_truckPickupIgnitionUsePoint"
}
local mMobileHomeDoorDialogTimerID, mLukeAndSarahPerilDialogID, mLukeSarahVolumeManagerThreadID, mZombieTrailerBGBlockingDialogID
local mRollTargetForSarahPerilVoice = 0.5
local mLukeAndSarahPerilDelayMin = 6
local mLukeAndSarahPerilDelayMax = 10
local mLukeSarahPerilVolumeCurrent = "full"
local mLukeSarahPerilVolumeChangeTo = "full"
local mClemAndJaneMoveBodySoundsDialogID
local mClemAndJaneMoveBodyProgressLast = 0
local PreloadAssets = function()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_VCOL_CC_TINT_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_VCOL_CC_TINT_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "256")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_ENV_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_TOON_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_ENV_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_TOON_CC_TINT_QLo.t3fxb", "70")
  end
end
local CombatReticleOnNav = function()
  while Game_GetMode() ~= eModeNavigate do
    Yield()
  end
  Reticle_EnableCombatMode()
end
local LukeSarahVolumeManager = function()
end
local tsBasedTimer = function(delayTime)
  if not delayTime or type(delayTime) ~= "number" then
    return
  end
  local curTime = GetTotalTime()
  local delay = curTime + delayTime
  local inc = 0
  while curTime < delay do
    inc = GetFrameTime() * SceneGetTimeScale(kScene)
    curTime = curTime + inc
    Yield()
  end
end
function TrailerPark()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if not Game_GetLoaded() and Game_GetDebug() then
    if LogicGet("2 - Went Through Trailer") then
      TrailerPark_LukeSarahInPerilBGDialog()
      Inventory_AddItem("glassesSarah")
      AgentSetProperty("Jane", "Mesh sk55_jane_gunBelt - Visible", true)
      AgentSetProperty("Jane", "Mesh sk55_jane_gunGlock - Visible", true)
      LogicSet("2 - Reached Trailer Park", true)
      LogicSet("2 - Killed ZombieFence", true)
      LogicSet("2 - Barricade Zombies Cleared", true)
      LogicSet("2 - Active Trailer Park Station", "freewalk")
      AgentSetProperty("dummy_zombiesBarricadeADVManager", "Walk Animation - Idle", "")
      AgentSetProperty("ZombieTrailer2", "Runtime: Visible", true)
      AgentSetProperty("ZombieBackground1", "Runtime: Visible", true)
      AgentSetProperty("ZombieBackground2", "Runtime: Visible", true)
      AgentSetProperty("ZombieBackground4", "Runtime: Visible", true)
      AgentSetProperty("ZombieTrailer1", "Walk Animation - Idle", "adv_trailerPark_zombieTrailer1Dead.chore")
      AgentSetProperty("ZombieTrailer3", "Walk Animation - Idle", "adv_trailerPark_zombieTrailer3Dead.chore")
      Game_SetSceneDialogNode("cs_phase2")
    elseif LogicGet("2 - Killed ZombieFence") then
      LogicSet("2 - Reached Trailer Park", true)
      Inventory_AddItem("glassesSarah")
      AgentSetProperty("Jane", "Mesh sk55_jane_gunBelt - Visible", true)
      AgentSetProperty("Jane", "Mesh sk55_jane_gunGlock - Visible", true)
      ThreadStart(CombatReticleOnNav)
      Game_SetSceneDialogNode("cs_enterPark")
    elseif LogicGet("2 - Reached Trailer Park") then
      Game_SetSceneDialogNode("cs_arriveTrailerPark")
    end
  end
  if Game_GetLoaded() then
    if LogicGet("2 - Reached Trailer Park") and not LogicGet("2 - Went Through Trailer") then
      print("restart Luke'n Sarah BG VO")
      TrailerPark_LukeSarahInPerilBGDialog()
    end
    if LogicGet("2 - Examined Truck Bed") then
      TrailerPark_TruckOutsideUsedBed()
    end
    if LogicGet("2 - Examined Truck Ignition") then
      TrailerPark_TruckInsideUsedIgnition()
    end
  end
  if LogicGet("2 - Active Trailer Park Station") == "freewalk" then
    Navigate_Enable(true)
  else
    Navigate_Enable(false)
  end
  Game_StartScene()
end
function TrailerPark_LukeSarahInPerilBGDialog(bPause, bStop, actionDelay)
  if actionDelay and type(actionDelay) == "number" then
    tsBasedTimer(actionDelay)
  end
  if bStop then
    if mLukeAndSarahPerilDialogID then
      DlgStop(mLukeAndSarahPerilDialogID)
      mLukeAndSarahPerilDialogID = nil
    end
  elseif bPause then
    if mLukeAndSarahPerilDialogID then
      DlgPause(mLukeAndSarahPerilDialogID)
    end
  elseif mLukeAndSarahPerilDialogID then
    DlgResume(mLukeAndSarahPerilDialogID)
  else
    mLukeAndSarahPerilDialogID = Game_RunDialog("bg_lukeSarah", false)
  end
end
function TrailerPark_LukeSarahInPerilBGDialogSetChanceForSarah(newValue)
  if newValue and type(newValue) == "number" then
    mRollTargetForSarahPerilVoice = newValue
  end
end
function TrailerPark_LukeSarahInPerilBGDialogDelay(newMinDelay, newMaxDelay, bOnlyUpdateMinMax)
  local pickSpeaker = function()
    if math.random() < mRollTargetForSarahPerilVoice then
      LogicSet("2 - Trailer Park Peril BG Speaker", "Sarah")
      print("speaker is Sarah!")
    else
      LogicSet("2 - Trailer Park Peril BG Speaker", "Luke")
      print("speaker is Luke!")
    end
  end
  if newMinDelay and type(newMinDelay) == "number" then
    mLukeAndSarahPerilDelayMin = newMinDelay
  end
  if newMaxDelay and type(newMaxDelay) == "number" then
    mLukeAndSarahPerilDelayMax = newMaxDelay
  end
  if not bOnlyUpdateMinMax then
    local delayTime = math.random(mLukeAndSarahPerilDelayMin, mLukeAndSarahPerilDelayMax)
    tsBasedTimer(delayTime)
    pickSpeaker()
    print("-->Luke and Sarah panic now!!!<--")
  end
end
function TrailerPark_ClemJaneMoveBodyBGDialog(bPause, bStop)
  if bStop then
    if mClemAndJaneMoveBodySoundsDialogID then
      DlgStop(mClemAndJaneMoveBodySoundsDialogID)
      mClemAndJaneMoveBodySoundsDialogID = nil
    end
  elseif bPause then
    if mClemAndJaneMoveBodySoundsDialogID then
      DlgPause(mClemAndJaneMoveBodySoundsDialogID)
    end
  elseif mClemAndJaneMoveBodySoundsDialogID then
    DlgResume(mClemAndJaneMoveBodySoundsDialogID)
  else
    mClemAndJaneMoveBodySoundsDialogID = Game_RunDialog("bg_clemJaneMoveBody", false)
  end
end
function TrailerPark_ClemJaneMoveBodySfxDelay()
  Sleep(math.random(kJaneClemMoveBodySFXDelayMin, kJaneClemMoveBodySFXDelayMax))
  local moveBodyProgressCur = AgentGetProperty("struggle_zombieToPickupHorn", "Button Mash - Current Percentage")
  while not AgentGetProperty("struggle_zombieToPickupHorn", "Struggle - Complete") and (SceneGetTimeScale() < 1 or moveBodyProgressCur <= mClemAndJaneMoveBodyProgressLast) do
    Yield()
    mClemAndJaneMoveBodyProgressLast = moveBodyProgressCur
    moveBodyProgressCur = AgentGetProperty("struggle_zombieToPickupHorn", "Button Mash - Current Percentage")
  end
  mClemAndJaneMoveBodyProgressLast = moveBodyProgressCur
end
function TrailerPark_MakeAllObjsUnselectable()
  for key, value in pairs(SceneGetAgents(kScene)) do
    if Game_IsUseable(value) then
      AgentSetSelectable(value, false)
    end
  end
end
function TrailerPark_TruckInsideObjsMakeSelectable()
  for key, value in pairs(mTruckPickupInsideUseables) do
    AgentSetSelectable(value, true)
  end
end
function TrailerPark_TruckOutsideObjsMakeSelectable()
  for key, value in pairs(mTruckPickupOutsideUseables) do
    AgentSetSelectable(value, true)
  end
end
function TrailerPark_TruckInsideUsedIgnition()
  LogicSet("2 - Examined Truck Ignition", true)
  if #mTruckPickupInsideUseables > 1 then
    table.remove(mTruckPickupInsideUseables)
  end
end
function TrailerPark_TruckOutsideUsedBed()
  LogicSet("2 - Examined Truck Bed", true)
  if #mTruckPickupOutsideUseables > 1 then
    table.remove(mTruckPickupOutsideUseables)
  end
end
function TrailerPark_ZombieTrailerBGBlockingDialog(bPause, bStop)
  if bStop then
    if mZombieTrailerBGBlockingDialogID then
      DlgStop(mZombieTrailerBGBlockingDialogID)
      mZombieTrailerBGBlockingDialogID = nil
    end
  elseif bPause then
    if mZombieTrailerBGBlockingDialogID then
      DlgPause(mZombieTrailerBGBlockingDialogID)
    end
  elseif mZombieTrailerBGBlockingDialogID then
    DlgResume(mZombieTrailerBGBlockingDialogID)
  else
    mZombieTrailerBGBlockingDialogID = Game_RunDialog("bg_blockingZombieScare", false)
  end
end
function TrailerPark_MobileHomeDoorTimer(bStart)
  if bStart then
    print("Walkers advancing on Mobile Home door!")
    mMobileHomeDoorDialogTimerID = Game_RunDialog("bg_mobileHomeDoorZombieApproach", false)
  elseif mMobileHomeDoorDialogTimerID then
    print("DOOR IS BREACHED!")
    DlgStop(mMobileHomeDoorDialogTimerID)
    mMobileHomeDoorDialogTimerID = nil
  end
end
function TrailerPark_ActivateZombieFence1UsePoints()
  AgentSetProperty("obj_zombieFence1UsePoint_knee", "Game Selectable", true)
end
function TrailerPark_LockBreakBGDialog()
  local dialogID = Game_RunDialog("bg_struggle_lock", false)
  while DlgIsRunning(dialogID) do
    Yield()
  end
  AgentSetProperty("struggle_lock", "Button Mash - Max Percentage", 0)
end
function TrailerPark_ChoredMoveThroughTrailer()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_trailerPark_move_trailer.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_reachDoor")
  Yield()
  if not Navigate_IsEnabled() then
    Navigate_Enable(true)
  end
  ChoredMovement_Start()
end
function TrailerPark_NavOffAfterChoredMove()
  while Game_GetMode() ~= eModeNavigate do
    Yield()
  end
  local navOn = Navigate_IsEnabled()
  if navOn then
    Navigate_Enable(false)
  end
end
SceneOpen(kScene, kScript)
