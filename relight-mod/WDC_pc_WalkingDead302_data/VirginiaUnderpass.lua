local kScript = "VirginiaUnderpass"
local kScene = "adv_virginiaUnderpass"
local OnLogicReady = function()
  if not Game_GetLoaded() then
    if LogicGet("2 - Winch Attached") then
      Game_SetSceneDialogNode("cs_moveWreck")
    elseif LogicGet("2 - Winch Powered") then
      Game_SetSceneDialog("env_virginiaUnderpass_roof")
      Game_SetSceneDialogNode("cs_upOnTheRoof")
    end
  end
end
function VirginiaUnderpass()
  Game_NewScene(kScene, kScript)
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  Game_StartScene()
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
SceneOpen(kScene, kScript)
