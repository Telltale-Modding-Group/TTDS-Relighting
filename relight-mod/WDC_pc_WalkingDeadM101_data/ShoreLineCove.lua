local kScript = "ShoreLineCove"
local kScene = "adv_shoreLineCove"
local OnLogicReady = function()
  if LogicGet("1ShoreLineCove - Debug Jump To End Of Fight") then
    Game_SetSceneDialogNode("timer_beheadZombie4")
  end
end
function ShoreLineCove()
  Game_NewScene(kScene, kScript)
  SceneAdd("adv_openingCredits101.scene")
  WaitForNextFrame()
  SceneHide("adv_openingCredits101.scene", true)
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
