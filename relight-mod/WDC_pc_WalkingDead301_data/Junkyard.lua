local kScript = "Junkyard"
local kScene = "adv_junkyard"
function Junkyard()
  Game_NewScene(kScene, kScript)
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  Game_StartScene()
end
function Junkyard_EndDemo()
  Game_PushMode(eModeMenu)
  Menu_Upsell(true)
end
SceneOpen(kScene, kScript)
