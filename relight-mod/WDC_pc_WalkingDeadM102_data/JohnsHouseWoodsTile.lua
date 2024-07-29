local kScript = "JohnsHouseWoodsTile"
local kScene = "adv_johnsHouseWoodsTile"
function JohnsHouseWoodsTile_Discovered()
  print("Hit Discovered Script")
  Game_RunDialog("cs_peekDiscovered")
end
function JohnsHouseWoodsTile()
  Game_NewScene(kScene, kScript)
  SceneAdd("ui_struggle.scene")
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
