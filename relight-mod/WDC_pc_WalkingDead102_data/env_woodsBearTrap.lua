local kScript = "WoodsBearTrap"
local kScene = "adv_woodsBearTrap"
local kPreloadableAssets = {
  "obj_axefireblood.d3dtx",
  "obj_axefireblood_spec.d3dtx",
  "obj_axefireblood_nm.d3dtx",
  "obj_axefirebloodB.d3dtx",
  "obj_axefirebloodB_spec.d3dtx",
  "fx_bloodspurtradb2.d3dtx",
  "fx_bloodSpurtDirNrwB2.d3dtx",
  "fx_bloodSpurtDirWdeC2.d3dtx",
  "fx_bloodspurtradahigh.d3dtx",
  "fx_bloodspurtrada2high.d3dtx",
  "fx_bloodSplatDirWdeB2.d3dtx",
  "fx_bloodSplatRadD3.d3dtx",
  "fx_bloodSpurtDirWdeA2.d3dtx",
  "fx_bloodspurtradc2.d3dtx",
  "fx_bloodspurtdiravgd2.d3dtx",
  "fx_bloodSpurtDirNrwA2.d3dtx",
  "fx_bloodspurtrada2.d3dtx",
  "fx_bloodspurtradb2high.d3dtx",
  "fx_bloodSpurtDirAvgA2.d3dtx",
  "fx_bloodSpurtDirAvgB2.d3dtx",
  "fx_bloodspurtdirwdeb2.d3dtx",
  "fx_bloodSpurtDirAvgC2.d3dtx"
}
local mControllerBackgroundChore, mControllerWalkAndTalk, mDlgIDBenFreakOut, mDlgIDChatter, mDlgIDDavidAmbient
function WoodsBearTrap()
  for i, asset in ipairs(kPreloadableAssets) do
    LoadAsync(asset)
  end
  if LangGetCurLanguage() == "german" and Platform_IsVita() then
    AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
  end
  Mode(mode_Main)
  Main_AllowMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Bear Trap")
      DlgPreload("env_forestBearTrap.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  else
    if Platform_IsWiiU() then
      print("Dialog Preloading start2: Bear Trap cutscene skip")
      DlgPreload("env_forestBearTrap.dlog", "logic_zombieKill", 0, 15, 0, false)
    end
    Dialog_Play("logic_zombieKill")
  end
end
function WoodsBearTrap_StartBackgroundChore(chore)
  if mControllerBackgroundChore then
    return
  end
  mControllerBackgroundChore = ChorePlay(chore, kBGChorePriority)
  ControllerSetLooping(mControllerBackgroundChore, true)
end
function WoodsBearTrap_StopBackgroundChore()
  if not mControllerBackgroundChore then
    return
  end
  ControllerKill(mControllerBackgroundChore)
  mControllerBackgroundChore = nil
end
function WoodsBearTrap_StartBenFreakOut()
  if mDlgIDBenFreakOut then
    return
  end
  mDlgIDBenFreakOut = Dialog_Play("ambient_benFreakOut")
end
function WoodsBearTrap_StopBenFreakOut()
  if not mDlgIDBenFreakOut then
    return
  end
  DlgStop(mDlgIDBenFreakOut)
  mDlgIDBenFreakOut = nil
end
function WoodsBearTrap_StartChatter()
  if mDlgIDChatter then
    return
  end
  mDlgIDChatter = Dialog_Play("ambient_chatter")
end
function WoodsBearTrap_StopChatter()
  if not mDlgIDChatter then
    return
  end
  DlgStop(mDlgIDChatter)
  mDlgIDChatter = nil
end
function WoodsBearTrap_StartDavidAmbient()
  if mDlgIDDavidAmbient then
    return
  end
  mDlgIDDavidAmbient = Dialog_Play("ambient_davidLegInTrap")
end
function WoodsBearTrap_StopDavidAmbient()
  if not mDlgIDDavidAmbient then
    return
  end
  DlgStop(mDlgIDDavidAmbient)
  mDlgIDDavidAmbient = nil
end
function WoodsBearTrap_StartWalkAndTalk()
  if not mControllerWalkAndTalk then
    mControllerWalkAndTalk = ChorePlay("bg_forestBearTrap_markLeeWalkAndTalkTrack")
  end
end
function WoodsBearTrap_StopWalkAndTalk()
  if not mControllerWalkAndTalk then
    return
  end
  ControllerKill(mControllerWalkAndTalk)
  mControllerWalkAndTalk = nil
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingcredits102")
