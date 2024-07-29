require("AI_PlayerProjectile.lua")
local kScript = "BoardingSchoolExteriorNight"
local kScene = "adv_boardingSchoolExteriorNight"
local OnLogicReady = function()
  if IsPlatformNX() then
    Episode_SetFireShadows()
  end
  if Game_GetLoaded() then
    return
  end
  Episode_SetAbelArm()
  Episode_SetAJShirt()
  Episode_SetZombieGrave()
  Episode_SetLouisDamage()
  AgentSetState("Horse01", "ReinsOff")
  AgentSetState("Horse02", "ReinsOff")
end
function BoardingSchoolExteriorNight()
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
