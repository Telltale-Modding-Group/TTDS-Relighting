local kScript = "ManorInterior"
local kScene = "adv_manorInterior105"
local ManorInterior_FireGun = function()
  if Logic["2ManorInt - Lone Zombie Ready"] == true then
    Logic["2ManorInt - Lee Shot Lone Zombie"] = true
  end
  if Logic["2ManorInt - Horde Ready"] == true then
  end
end
function ManorInterior_PreLoadGrabCleaver()
end
function ManorInterior_PreLoadSliceArms()
end
function ManorInterior_PreLoadDoorDestroyed()
end
function ManorInterior_ShootingReadyCallback(key, value)
  if value == true then
  else
  end
end
function ManorInterior_BloodyCleaver(key, value)
  if value == true then
    AgentSetProperty(AgentFind("obj_cleaver_lee"), "material_environment_diffuseTexture - Diffuse Texture", "obj_cleaverbloody.d3dtx")
  end
end
function ManorInterior()
  Mode(mode_Main)
  Mode_Push(mode_NoMovement)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "2ManorInt - Horde Ready", ManorInterior_ShootingReadyCallback)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "2ManorInt - Lone Zombie Ready", ManorInterior_ShootingReadyCallback)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "2ManorInt - Cleaver Bloodied", ManorInterior_BloodyCleaver)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState()
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function ManorInterior_OnADown(event)
  ManorInterior_FireGun()
end
function ManorInterior_OnR1Down(event)
  if not Platform_IsXbox360() then
    ManorInterior_FireGun()
  end
end
function ManorInterior_OnR2Down(event)
  if not Platform_IsPS3() and not Platform_IsVita() then
    ManorInterior_FireGun()
  end
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
