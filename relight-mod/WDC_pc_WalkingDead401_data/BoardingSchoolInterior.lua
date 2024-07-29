local kScript = "BoardingSchoolInterior"
local kScene = "adv_boardingSchoolInterior"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet(kAct) == 2 then
    Game_SetSceneDialog("env_boardingSchoolInterior_act2")
  end
end
function BoardingSchoolInterior()
  if not Game_GetLoaded() then
    AgentRestore("obj_backpackClem400", 1)
  end
  if Game_GetSkipEnterCutscenes() and LogicGet(kAct) == 1 then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
