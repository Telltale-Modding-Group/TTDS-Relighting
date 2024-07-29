local kScript = "Rooftop"
local kScene = "adv_cancerGroupHideoutRoof"
local mJumpAmbientThread, mJumpAmbientID
local OnMissedLedge = function(key, value)
  if not value or Logic["1Rooftop - Grabbed Ledge"] then
    return
  end
  Dialog_Interruption()
  Dialog_Play("cs_missLedge")
end
local PlayJumpAmbient = function()
  local waitRange = Range(2, 5)
  while true do
    Sleep(RangeRandom(waitRange))
    mJumpAmbientID = Dialog_Play("ambient_jump")
    while mJumpAmbientID and DlgIsRunning(mJumpAmbientID) do
      Sleep(1)
    end
  end
end
function Rooftop()
  if Platform_IsIOS() then
    AgentSetProperty("cam_leeTowerJump", "Pan Cam - Speed Vertical", 1)
  end
  Mode(mode_Main)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "1Rooftop - Missed Ledge", OnMissedLedge)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState()
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function Rooftop_ExitStationBen()
  Dialog_Play("cs_stationBenExit")
end
function Rooftop_ExitStationChrista()
  Dialog_Play("cs_stationChristaExit")
end
function Rooftop_ExitStationKenny()
  Dialog_Play("cs_stationKennyExit")
end
function Rooftop_ExitStationOmid()
  Dialog_Play("cs_stationOmidExit")
end
function Rooftop_StartJumpAmbient()
  if mJumpAmbientThread then
    return
  end
  mJumpAmbientThread = ThreadStart(PlayJumpAmbient)
end
function Rooftop_StopJumpAmbient()
  if not mJumpAmbientThread then
    return
  end
  ThreadKill(mJumpAmbientThread)
  mJumpAmbientThread = nil
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
