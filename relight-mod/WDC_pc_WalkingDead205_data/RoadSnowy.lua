local kScript = "RoadSnowy"
local kScene = "adv_roadSnowy205"
function RoadSnowy()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if Game_GetDebug() and LogicGet("1 - Saved Alvie") then
    Game_SetSceneDialogNode("cs_janeReturns")
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingCredits")
