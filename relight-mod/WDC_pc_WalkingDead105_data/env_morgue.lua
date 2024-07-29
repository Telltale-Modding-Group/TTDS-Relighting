local kScript = "Morgue"
local kScene = "adv_cancerGroupHideout105"
local kCredits = "ui_openingcredits"
local kOverlay = "fx_overlayEyesBlink"
local mDangleAmbientThread, mDangleAmbientID
local PlayDangleAmbient = function()
  local waitRange = Range(1, 3)
  while true do
    Sleep(RangeRandom(waitRange))
    mDangleAmbientID = Dialog_Play("ambient_danglingByLeg")
    while mDangleAmbientID and DlgIsRunning(mDangleAmbientID) do
      Sleep(1)
    end
  end
end
function Morgue()
  if LangGetCurLanguage() == "german" and Platform_IsVita() then
    AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
  end
  Mode(mode_Main)
  if Platform_IsIOS() then
    AgentFind("obj_lightBeamcancerGroupHideout105A").mProps["D3D Mesh"] = ""
    AgentFind("obj_lightBeamcancerGroupHideout105B").mProps["D3D Mesh"] = ""
    AgentFind("obj_lightBeamcancerGroupHideout105C").mProps["D3D Mesh"] = ""
    AgentHide("fx_lightBeamsShadowed", true)
    for i = 1, 5 do
      AgentHide("fx_lightBeamsShadowed0" .. i, true)
    end
  end
  SceneHide(kCredits, true)
  AgentHide(SceneGetSceneAgent(kOverlay), true)
  SceneHide(kOverlay, true)
  local bMorgueComplete = Logic["1Morgue - Complete"]
  if not bMorgueComplete then
    if Logic["With Ben"] == "true" then
      for i = 116, 118 do
        WalkBoxesDisableTri(kScene, i)
      end
    end
    if Logic["With Christa And Omid"] == "true" then
      for i = 97, 115 do
        WalkBoxesDisableTri(kScene, i)
      end
    end
  elseif SaveLoad_IsFromLoad() then
    Mode_Push(mode_NoMovement)
    Navigate_Enable(false)
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState()
  if Logic["1Morgue - Passed Out"] then
    Dialog_Play("cs_enterSawStation")
    return
  end
  if bMorgueComplete then
    AgentSetProperty(SceneGetSceneAgent(kScene), "Dialog Agent - File Primary", "env_elevatorShaft.dlog")
    Dialog_Play("cs_enterShaft")
    return
  end
  local props = AgentGetRuntimeProperties("Lee")
  if Logic["Hid Bite"] == "true" then
    props["Mesh sk54_lee105_armLBite - Visible"] = false
    props["Mesh sk54_lee105_armLSleeveDown - Visible"] = true
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function Morgue_StartDangleAmbient()
  if mDangleAmbientThread then
    return
  end
  mDangleAmbientThread = ThreadStart(PlayDangleAmbient)
end
function Morgue_StopDangleAmbient()
  if not mDangleAmbientThread then
    return
  end
  ThreadKill(mDangleAmbientThread)
  mDangleAmbientThread = nil
  DlgStop(mDangleAmbientID)
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
SceneAdd(kCredits)
SceneAdd(kOverlay)
