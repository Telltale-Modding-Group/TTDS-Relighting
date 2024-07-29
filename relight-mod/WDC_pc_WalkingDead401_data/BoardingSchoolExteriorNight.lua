local kScript = "BoardingSchoolExteriorNight"
local kScene = "adv_boardingSchoolExteriorNight"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  local act = LogicGet(kAct)
  if act == 2 then
    Game_SetSceneDialog("env_boardingSchoolExteriorNight_act2")
  elseif act == 3 then
    Game_SetSceneDialog("env_boardingSchoolExteriorNight_act3")
  end
end
function BoardingSchoolExteriorNight()
  if Game_GetSkipEnterCutscenes() and LogicGet(kAct) ~= 2 then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  if not Game_GetLoaded() and LogicGet(kAct) > 1 then
    AgentHide("obj_flowersMeadowCranesbill", true)
    PropertyRemove(AgentGetProperties("group_freewalkADVManager"), "Group - Idle")
    local characters = {
      "Clementine",
      "AJ",
      "Aasim",
      "Brody",
      "Louis",
      "Marlon",
      "Mitch",
      "Omar",
      "Rosie",
      "Ruby",
      "Tennyson",
      "Violet",
      "Willy"
    }
    for _, character in ipairs(characters) do
      PropertyRemove(AgentGetProperties(character), kIdleAnim)
      AgentDetach(character)
    end
  end
end
function BoardingSchoolExteriorNight_EnableCollision(bEnable)
  local kCollisionsEnabled = "Collisions Enabled"
  local characters = {
    "AJ",
    "Aasim",
    "Brody",
    "Louis",
    "Marlon",
    "Omar",
    "Ruby",
    "Tennyson",
    "Violet"
  }
  for _, character in ipairs(characters) do
    local props = AgentGetProperties(character)
    if bEnable then
      PropertySet(props, kCollisionsEnabled, true)
    else
      PropertyRemove(props, kCollisionsEnabled)
    end
  end
end
function BoardingSchoolExteriorNight_EndEpisode()
  WDAchievements_Unlock("achievement_20")
  Menu_EndEpisode("401", false)
  Menu_EndEpisode_CheckUpsell("401")
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
