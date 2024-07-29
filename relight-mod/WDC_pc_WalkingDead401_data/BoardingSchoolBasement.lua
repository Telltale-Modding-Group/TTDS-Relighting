local kScript = "BoardingSchoolBasement"
local kScene = "adv_boardingSchoolBasement"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("use_flashlight")
  end
end
function BoardingSchoolBasement()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
