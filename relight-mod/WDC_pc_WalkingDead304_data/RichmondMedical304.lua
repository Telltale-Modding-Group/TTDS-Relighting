local kScript = "RichmondMedical304"
local kScene = "adv_richmondMedical304"
local OnLogicReady = function()
  if Game_GetDebug() and LogicGet("bEnteredVirginiaForestBus304") then
    Game_SetSceneDialogNode("cs_lingard")
  end
end
function RichmondMedical304()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
