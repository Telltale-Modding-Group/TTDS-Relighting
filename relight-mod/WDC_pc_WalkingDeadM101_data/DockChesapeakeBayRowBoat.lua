local kScript = "DockChesapeakeBayRowBoat"
local kScene = "adv_shorelineApproachFerry"
function DockChesapeakeBayRowBoat()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
