local kScript = "StashHouseExteriorNight"
local kScene = "adv_stashHouseExteriorNight"
local PreloadAssets = function()
  local kPreLoadList = {
    "env_stashHouseExteriorNight_CS_Enter_2.chore",
    "sk56_idle_clem204SleepNearFire.chore",
    "clementine200_eyes_lookAtsOff.chore",
    "sk56_clem204SleepNearFire_toTense.chore",
    "sk56_clementine200_toFearA.chore",
    "sk56_clementine200_toAngryA.chore",
    "fol_window_bump_1.wav",
    "fol_window_bump_2.wav",
    "fol_window_bump_3.wav",
    "sk56_idle_clementine200NormalA.chore",
    "sk56_idle_clementine200.chore",
    "amb_winter_wind_calm.wav",
    "sk56_idle_clementine200FearA.chore",
    "sk56_clementine200FearA.ptable",
    "sk56_idle_clementine200AngryA.chore",
    "sk56_clementine200AngryA.ptable",
    "fs_snow_fast_01.wav",
    "fs_snow_fast_02.wav",
    "fs_snow_fast_03.wav",
    "fs_snow_fast_04.wav",
    "fs_snow_fast_05.wav"
  }
  for _, item in ipairs(kPreLoadList) do
    PreLoad(item)
  end
end
function StashHouseExteriorNight()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if not Game_GetLoaded() then
    if LogicGet("1 - Kenny Returned") then
      AgentSetProperty("Arvo", "Current State", "beatUp")
    else
      AgentSetProperty("Arvo", "Current State", "beatUpWhipped")
    end
  end
  PreloadAssets()
  Game_StartScene()
end
SceneOpen(kScene, kScript)
