local kScript = "FlagshipExteriorEscape"
local kScene = "adv_boatTownShoreLineView"
function FlagshipExteriorEscape()
  Game_NewScene(kScene, kScript)
  if LogicGet("3FlagShipExterior - Beat Norma And Randall") then
    Game_SetSceneDialogNode("cs_untiePete")
    WaitForNextFrame()
  end
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
