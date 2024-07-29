local kScript = "BoardingSchoolDorm"
local kScene = "adv_boardingSchoolDorm"
function BoardingSchoolDorm()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalkHall", false)
  end
end
function BoardingSchoolDorm_EndEpisode()
  WDAchievements_Unlock("achievement_23")
  Menu_EndEpisode("404", false)
  Menu_EndEpisode_CheckUpsell("404")
end
Game_SceneOpen(kScene, kScript)
