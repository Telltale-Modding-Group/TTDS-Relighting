local kScript = "BoardingSchoolExterior"
local kScene = "adv_boardingSchoolExterior"
function BoardingSchoolExterior()
  if Game_GetLoaded() then
    return
  end
  AgentSetState("Clementine", "bodyLowerLegMissing")
  AgentSetState("Omar", "bodyLowerShotDried")
  Episode_SetClemState()
end
Game_SceneOpen(kScene, kScript)
