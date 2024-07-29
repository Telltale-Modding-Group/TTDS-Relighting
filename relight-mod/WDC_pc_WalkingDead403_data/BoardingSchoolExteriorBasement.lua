require("OpeningCredits.lua")
local kScript = "BoardingSchoolExteriorBasement"
local kScene = "adv_boardingSchoolExteriorBasement"
function BoardingSchoolExteriorBasement()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_enterBasement")
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  if not Game_GetLoaded() and LogicGet("Episode 401 - Attacked Abel") then
    AgentSetState("Abel", "bodyUpperArmMissing")
  end
  AgentSetState("Abel", "footStabCompoundFracture")
  AgentSetState("Abel", "noseBloody")
end
function BoardingSchoolExteriorBasement_AbelZombieEnable()
  AgentSetState("Abel", "zombie")
  if LogicGet("1 - Burned Abel") then
    AgentSetState("Abel", "headZombieCigarette")
  end
end
Game_SceneOpen(kScene, kScript)
