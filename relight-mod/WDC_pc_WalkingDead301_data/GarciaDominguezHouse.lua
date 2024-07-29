local kScript = "GarciaDominguezHouse"
local kScene = "adv_garciaDominguezHouse"
local OnLogicReady = function()
  if not Game_GetLoaded() and LogicGet("bEnteredGarciaDominguezHouse") then
    Game_SetSceneDialog("env_garciaDominguezHouse_credits")
    Game_SetSceneDialogNode("cs_montage")
  end
end
function GarciaDominguezHouse()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if not Game_GetDebug() then
    PersistentLogic_SetGameLogic()
  end
  Game_StartScene()
end
if IsToolBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_fryingPan")
SceneAdd("ui_creditsOpening")
