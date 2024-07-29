local kScript = "Road"
local kScene = "adv_roadTile"
local mIDKatjaaAmbient, mThreadKatjaaAmbient, mThreadNightmareStruggle
local KatajaAmbient = function()
  local waitRange = Range(10, 15)
  while true do
    Sleep(RangeRandom(waitRange))
    mIDKatjaaAmbient = Dialog_Play("ambient_katjaa")
    while mIDKatjaaAmbient and DlgIsRunning(mIDKatjaaAmbient) do
      Sleep(1)
    end
  end
end
local NightmareStruggle = function()
  local kMashPercent = "Button Mash - Current Percentage"
  local kMashRate = "Button Mash - Rate of Increase"
  local kMashDecay = "Button Mash - Rate of Decay"
  local struggleProps = AgentGetRuntimeProperties(Struggle_GetAgent())
  while true do
    Yield()
    local mashPercent = struggleProps[kMashPercent]
    struggleProps[kMashRate] = math.max((1 - mashPercent) * 3, 0.85)
    if mashPercent > 0.9 then
      struggleProps[kMashDecay] = mashPercent * 3
      return
    end
  end
end
function Road_HitZombiePreLoad()
end
function Road()
  Mode(mode_Main)
  Main_AllowMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide(Logic["DougCarley Saved"], false)
  if Logic["2Road - Talked To Katjaa"] then
    Dialog_Play("cs_nightmare")
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Road (RV)")
      DlgPreload("env_road.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function Road_StartKatjaaAmbient()
  if mThreadKatjaaAmbient then
    return
  end
  mThreadKatjaaAmbient = ThreadStart(KatajaAmbient)
end
function Road_StopKatjaaAmbient()
  if mThreadKatjaaAmbient then
    ThreadKill(mThreadKatjaaAmbient)
    mThreadKatjaaAmbient = nil
    DlgStop(mIDKatjaaAmbient)
  end
end
function Road_StartNightmareStruggle()
  if mThreadNightmareStruggle then
    ThreadKill(mThreadNightmareStruggle)
  end
  Dialog_Play("ambient_struggle")
  Struggle_Start(AgentFind("struggle_clementine"))
  mThreadNightmareStruggle = ThreadStart(NightmareStruggle)
end
function Road_StopNightmareStruggle()
  if mThreadNightmareStruggle then
    ThreadKill(mThreadNightmareStruggle)
  end
  Struggle_End()
  Dialog_Interruption()
  ChorePlay("env_roadTile_lightswitch")
end
SceneOpen(kScene, kScript)
