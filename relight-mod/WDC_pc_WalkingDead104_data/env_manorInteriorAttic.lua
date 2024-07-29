local kScript = "ManorInteriorAttic"
local kScene = "adv_manorInteriorAttic"
function ManorInteriorAttic_PreLoadShootZombie()
end
function ManorInteriorAttack_PreLoadBludgeonZombie()
end
function ManorInteriorAttack_PreLoadCrushZombieHead()
end
function ManorInteriorAttic()
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_nav_atticbed", "Pan Cam - Enabled", false)
  end
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
