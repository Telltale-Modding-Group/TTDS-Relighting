local kScript = "TrainAfterStop"
local kScene = "adv_trainTile_afterStop"
local kClemShotX = "3Train2 - Clementine Shot X"
local kClemShotY = "3Train2 - Clementine Shot Y"
function TrainAfterStop_PreLoadClemShoots()
end
function TrainAfterStop_PreLoadBottleHit()
end
function TrainAfterStop()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if IsEnginePS3() or IsEngineXbox360() then
    AgentSetProperty("dummy_camShakeManager", kIdleAnim, "")
  end
  Episode_SetFightTextures(true)
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Train After Stop")
      DlgPreload("env_trainAfterStop.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
function TrainAfterStop_SetClemShotCoordinates()
  local x = 0
  local y = 0
  if Logic["3Train2 - Clementine Bottles Hit"] < 2 then
    x = math.random(-1, 1)
    y = math.random(-1, 1)
    if x == 0 and y == 0 then
      return TrainAfterStop_SetClemShotCoordinates()
    end
  end
  Print("Shot X = " .. x .. ", Shot Y = " .. y)
  Logic[kClemShotX] = x
  Logic[kClemShotY] = y
end
function TrainAfterStop_SetClemShotDeltaX(delta)
  local x = Clamp(Logic[kClemShotX] + delta, -1, 1)
  Logic[kClemShotX] = x
  Print("Shot X = " .. x)
end
function TrainAfterStop_SetClemShotDeltaY(delta)
  local y = Clamp(Logic[kClemShotY] + delta, -1, 1)
  Logic[kClemShotY] = y
  Print("Shot Y = " .. y)
end
SceneOpen(kScene, kScript)
