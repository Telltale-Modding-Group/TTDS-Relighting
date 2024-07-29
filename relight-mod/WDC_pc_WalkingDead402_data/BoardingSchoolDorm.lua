local kScript = "BoardingSchoolDorm"
local kScene = "adv_boardingSchoolDorm"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  Episode_SetUpCollectibles()
  AgentSetState("Clementine", "headHatless")
end
function BoardingSchoolDorm()
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
