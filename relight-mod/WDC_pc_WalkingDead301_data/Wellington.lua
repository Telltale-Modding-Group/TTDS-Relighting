local kScript = "Wellington"
local kScene = "adv_wellington301"
function Wellington()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
