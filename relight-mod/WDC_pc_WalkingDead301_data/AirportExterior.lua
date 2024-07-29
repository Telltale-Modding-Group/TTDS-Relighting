local kScript = "AirportExterior"
local kScene = "adv_airportExterior"
local OnLogicReady = function()
  if not Game_GetLoaded() and LogicGet("bEnteredAirportHangar") then
    Game_SetSceneDialog("env_airportExterior_mainStreet")
    if LogicGet("2 - Betrayed Clementine") then
      Game_SetSceneDialogNode("cs_elleIntro")
    else
      Game_SetSceneDialogNode("cs_lockedUp")
    end
  end
end
function AirportExterior()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
