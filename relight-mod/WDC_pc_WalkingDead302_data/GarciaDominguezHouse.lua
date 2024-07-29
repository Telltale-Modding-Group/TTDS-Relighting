local kScript = "GarciaDominguezHouse"
local kScene = "adv_garciaDominguezHouse"
function GarciaDominguezHouse()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if not Game_GetDebug() then
    PersistentLogic_SetGameLogic()
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_fryingPan")
