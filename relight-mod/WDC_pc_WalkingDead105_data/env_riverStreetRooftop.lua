local kScript = "RiverStreetRooftop"
local kScene = "adv_savannahRiverStreetRooftop"
local mAmbientThread, mAmbientID, mKennyThread, mKennyController
local KennyFightsBack = function()
  mKennyController = ChorePlay("bg_kenny_duringChristaLift")
  ControllerWait(mKennyController)
  AgentSetProperty("Zombie2", kIdleAnim, "kennyFightDone.chore")
end
local PlayAmbient = function()
  local waitRange = Range(10, 30)
  while true do
    Sleep(RangeRandom(waitRange))
    mAmbientID = Dialog_Play("ambient_christaStuck")
    while mAmbientID and DlgIsRunning(mAmbientID) do
      Sleep(1)
    end
  end
end
function RiverStreetRooftop()
  Mode(mode_Main)
  if Platform_IsIPhone() or Platform_IsAndroid() then
    AgentFind("fx_dirtDustEmitterA").mProps["Emitter - Number of Particles"] = 1
    AgentFind("fx_dirtDustEmitterC").mProps["Emitter - Number of Particles"] = 1
    AgentFind("obj_lightBeamsWDCam").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD01").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD02").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD03").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD04").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD05").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD06").mProps["D3D Mesh"] = ""
    AgentFind("fx_dustCloudHerdWD07").mProps["D3D Mesh"] = ""
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState(true, false, false, "A")
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function Rooftop_StartAmbient()
  if mAmbientThread then
    return
  end
  mAmbientThread = ThreadStart(PlayAmbient)
end
function Rooftop_StopAmbient()
  if not mAmbientThread then
    return
  end
  ThreadKill(mAmbientThread)
  mAmbientThread = nil
  DlgStop(mAmbientID)
end
function Rooftop_StartKennyFightsBack()
  if mKennyThread then
    return
  end
  mKennyThread = ThreadStart(KennyFightsBack)
end
function Rooftop_StopKennyFightsBack()
  if not mKennyThread then
    return
  end
  ThreadKill(mKennyThread)
  mKennyThread = nil
  if mKennyController then
    ControllerKill(mKennyController)
    mKennyController = nil
  end
  AgentSetProperty("Zombie2", kIdleAnim, "sk54_idle_zombieAverageStandA.anm")
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
