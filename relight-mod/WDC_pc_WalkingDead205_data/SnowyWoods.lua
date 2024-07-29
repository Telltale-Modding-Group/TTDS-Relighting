local kScript = "SnowyWoods"
local kScene = "adv_snowyWoods"
function SnowyWoods()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if Game_GetDebug() and LogicGet("1 - Bandaged Kenny") then
    Game_SetSceneDialogNode("cs_bandageKennyEnd")
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
