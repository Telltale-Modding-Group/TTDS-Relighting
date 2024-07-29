local kScript = "BoardingSchoolInteriorNight"
local kScene = "adv_boardingSchoolInteriorNight"
local OnLogicReady = function()
  if IsPlatformNX() then
    Episode_SetFireShadows()
  end
  if Game_GetLoaded() then
    return
  end
  Episode_SetAbelArm()
  Episode_SetAJShirt()
  Episode_SetLouisDamage()
  if LogicGet("3 - Entered BoardingSchoolExteriorGateNight") then
    Game_SetSceneDialog("env_boardingSchoolInteriorNight_act3Fight.dlog")
  end
end
function BoardingSchoolInteriorNight()
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
