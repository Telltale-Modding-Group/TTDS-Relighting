require("SceneLoader.lua")
local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOnWDM102"
local PreloadAssets = function()
end
function PreviouslyOn()
  Game_NewScene(kScene, kScript)
  SceneAdd("ui_previouslyOn.scene")
  Navigate_Enable(false)
  if not Game_GetDebug() then
    PersistentLogic_SetGameLogic()
  end
  PreloadAssets()
  SceneLoader_Init()
  Game_StartScene()
end
SceneOpen(kScene, kScript)
