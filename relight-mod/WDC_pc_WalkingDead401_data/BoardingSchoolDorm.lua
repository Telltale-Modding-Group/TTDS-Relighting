require("OpeningCredits.lua")
local kScript = "BoardingSchoolDorm"
local kScene = "adv_boardingSchoolDorm"
function BoardingSchoolDorm()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalkRoom", false)
  end
end
Game_SceneOpen(kScene, kScript)
