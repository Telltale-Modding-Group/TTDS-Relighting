local kScript = "BoardingSchoolDormNight"
local kScene = "adv_boardingSchoolDormNight"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet(kAct) == 3 then
    Game_SetSceneDialog("env_boardingSchoolDormNight_act3")
  end
end
function BoardingSchoolDormNight()
  if Game_GetSkipEnterCutscenes() and LogicGet(kAct) == 3 then
    Game_RunSceneDialog("logic_freeWalkRoom", false)
  end
  if not Game_GetLoaded() then
    PropertyRemove(AgentGetProperties("Clementine"), kIdleAnim)
    PropertyRemove(AgentGetProperties("AJ"), kIdleAnim)
  end
  if IsToolBuild() then
    Collectible_ResetEpisode(401, false, true)
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
