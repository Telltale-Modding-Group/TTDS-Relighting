local kScript = "RichmondMedical"
local kScene = "adv_richmondMedical"
local OnLogicReady = function()
  if not Game_GetLoaded() and LogicGet(kAct) == 3 then
    Game_SetSceneDialog("env_richmondMedical_return")
    Game_SetSceneDialogNode("cs_reunitedAgain")
  end
end
function RichmondMedical()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
