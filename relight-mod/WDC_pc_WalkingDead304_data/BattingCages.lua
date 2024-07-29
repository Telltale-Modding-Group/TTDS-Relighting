local kScript = "BattingCages"
local kScene = "adv_battingCages"
function BattingCages()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_fryingPan.scene")
