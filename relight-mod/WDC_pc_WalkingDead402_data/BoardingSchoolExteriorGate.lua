local kScript = "BoardingSchoolExteriorGate"
local kScene = "adv_boardingSchoolExteriorGate"
local mTimerThread
local OnLogicReady = function()
  AgentSetState("AJ", "bodyBuckshotB")
  Episode_SetLouisDamage()
end
function BoardingSchoolExteriorGate()
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
