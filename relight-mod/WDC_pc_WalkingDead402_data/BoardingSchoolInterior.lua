local kScript = "BoardingSchoolInterior"
local kScene = "adv_boardingSchoolInterior"
local OnLogicReady = function()
  AgentSetState("AJ", "bodyBuckshotB")
  Episode_SetLouisDamage()
end
function BoardingSchoolInterior()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
