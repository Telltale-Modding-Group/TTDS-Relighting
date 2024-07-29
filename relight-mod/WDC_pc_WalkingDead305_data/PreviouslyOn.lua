local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOnRichmondSquareDawn304"
function PreviouslyOn()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if not Game_GetDebug() then
    PersistentLogic_SetGameLogic()
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_previouslyOn")
if not IsPlatformTouch(true) then
  SceneAdd("ui_letterbox")
end
