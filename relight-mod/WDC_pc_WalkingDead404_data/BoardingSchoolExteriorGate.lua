local kScript = "BoardingSchoolExteriorGate"
local kScene = "adv_boardingSchoolExteriorGate"
function BoardingSchoolExteriorGate()
  if Game_GetLoaded() then
    return
  end
  AgentSetState("Abel", "footStabCompoundFracture")
  AgentSetState("Abel", "noseBloody")
  if LogicGet("Episode 401 - Attacked Abel") then
    AgentSetState("Abel", "bodyUpperArmMissing")
  end
  if LogicGet("Episode 403 - Killed Abel") then
    AgentSetState("Abel", "headStabbed")
    if LogicGet("Episode 403 - Burned Abel") then
      AgentSetState("Abel", "headCigarette")
    end
  else
    AgentSetState("Abel", "zombie")
    if LogicGet("Episode 403 - Burned Abel") then
      AgentSetState("Abel", "headZombieCigarette")
    end
  end
  AgentSetState("Omar", "bodyLowerShotDried")
end
Game_SceneOpen(kScene, kScript)
