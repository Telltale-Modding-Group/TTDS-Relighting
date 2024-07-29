local kScript = "RichmondOverpass"
local kScene = "adv_richmondOverpass"
function RichmondOverpass()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("cs_approachGap", false)
  end
end
SceneOpen(kScene, kScript)
