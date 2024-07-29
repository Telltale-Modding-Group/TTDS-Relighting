local kScript = "JunkyardDay"
local kScene = "adv_junkyardDay"
function JunkyardDay()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if Game_GetDebug() then
    LogicSet("Episode 301 - Stayed with Clementine", true)
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
