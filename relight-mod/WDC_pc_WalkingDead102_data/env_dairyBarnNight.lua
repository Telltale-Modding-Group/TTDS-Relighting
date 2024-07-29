local kScript = "DairyBarnNight"
local kScene = "adv_dairyBarnInteriorNight"
local kAmbientDelayMin = {ambient_danny = 3, ambient_kennyStall = 5}
local mAmbientDelayMax = {ambient_danny = 10, ambient_kennyStall = 12}
local kPreloadableAssets = {
  "sk54_kennyAltShirt_bodyShot.d3dtx",
  "fx_bloodspurtradahigh.d3dtx",
  "fx_bloodspurtrada2high.d3dtx",
  "fx_bloodspurtrada2.d3dtx",
  "ui_useIcon_shotgun.d3dtx",
  "fx_bloodspurtradc2.d3dtx"
}
local mThreadAmbient, mDlgIDAmbient
local PlayAmbient = function(nodeName)
  local delayMin = kAmbientDelayMin[nodeName]
  local delayMax = mAmbientDelayMax[nodeName]
  Wait(delayMin)
  while true do
    mDlgIDAmbient = Dialog_Play(nodeName)
    while mDlgIDAmbient and DlgIsRunning(mDlgIDAmbient) do
      Wait(1)
    end
    Wait(math.random(delayMin, delayMax))
  end
end
local OnPeek = function(key, value)
  if value then
    Logic["3Barn - Peeked"] = true
    if Logic["3Barn - Danny Out Of View"] then
      Mode_Pop(mode_peek)
      Checkpoint("cs_dannyAims")
      Dialog_Play("cs_dannyAims")
    end
  end
end
function DairyBarnNight()
  for i, asset in ipairs(kPreloadableAssets) do
    LoadAsync(asset)
  end
  Mode(mode_Main)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "3Barn - Peeking Up", OnPeek)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Barn Night / dairyBarnInterior_escape")
      DlgPreload("env_dairyBarnInterior_escape.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function DairyBarnNight_OnEndChoredMovement()
  Dialog_Play("cs_approachBarnDoors")
end
function DairyBarnNight_StartAmbient(nodeName)
  if mThreadAmbient then
    return
  end
  mThreadAmbient = ThreadStart(PlayAmbient, nodeName)
end
function DairyBarnNight_StopAmbient()
  if mThreadAmbient then
    ThreadKill(mThreadAmbient)
    mThreadAmbient = nil
    DlgStop(mDlgIDAmbient)
  end
end
SceneOpen(kScene, kScript)
