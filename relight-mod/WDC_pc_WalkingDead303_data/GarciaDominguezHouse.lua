local kScript = "GarciaDominguezHouse"
local kScene = "adv_garciaDominguezHouse303"
function GarciaDominguezHouse()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("ui_fryingPan")
SceneAdd("ui_creditsOpening")
