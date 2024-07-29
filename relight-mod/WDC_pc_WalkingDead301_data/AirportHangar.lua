local kScript = "AirportHangar"
local kScene = "adv_airportHangar"
function AirportHangar()
  Game_NewScene(kScene, kScript)
  if not Game_GetLoaded() and math.random() >= 0.5 then
    LogicSet("2 - Fran Won", true)
  end
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
