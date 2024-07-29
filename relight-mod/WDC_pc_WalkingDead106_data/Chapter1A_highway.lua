local kScript = "Chapter1A"
local kScene = "adv_ruralHighwayCh1"
local SetBennettDead = function()
  Logic["1 - Bennett Dead"] = true
  AgentHide("obj_shotgunWD_vince", false)
  AgentSetProperty("Bennett", kIdleAnim, "adv_ruralHighwayCh1_bennettDead.chore")
end
function Chapter1A()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_choice", "Pan Cam - Enabled", false)
  end
  if Logic["1 - Left Alley"] then
    Dialog_Play("cs_busIntro")
    return
  end
  if Logic["1 - Met Prisoners"] then
    Dialog_Play("cs_jerryMurdered")
    return
  end
  if Logic["1 - Bennett Dead"] then
    Dialog_Play("cs_guardBitten")
    return
  end
  if Logic["1 - Killed Zombie Jerry"] then
    SetBennettDead()
    Dialog_Play("cs_killZombieJerry")
    return
  end
  if Logic["1 - Zombies on Board"] then
    SetBennettDead()
    Logic["1 - Killed Zombie Jerry"] = true
    Dialog_Play("cs_bigChoice")
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_chaptercredits")
