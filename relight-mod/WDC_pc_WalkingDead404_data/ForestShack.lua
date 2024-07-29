local kScript = "ForestShack"
local kScene = "adv_forestShack"
function ForestShack()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
function ForestShack_StopHatDialog()
  local initialID = Subtitle_GetCurrentID()
  if initialID then
    while Subtitle_GetCurrentID() == initialID do
      WaitForNextFrame()
    end
  end
  Dialog_StopStringID("bg_hatStation")
end
Game_SceneOpen(kScene, kScript)
