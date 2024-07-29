local kScript = "RichmondSquareWallDusk"
local kScene = "adv_richmondSquareWallDusk"
local UpdateChoredMoveSFX = function()
  local kFadeTime = 0.5
  local sfxController = SoundPlayEventByName("/Common/305 Common/Bulldozer/Bulldozer_ChoredMove")
  ControllerSetLooping(sfxController, true)
  ControllerSetContribution(sfxController, 0)
  ControllerPause(sfxController)
  local moveDir = 0
  while ChoredMovement_IsActive() do
    WaitForNextFrame()
    if ChoredMovement_GetMoveDir() ~= moveDir then
      moveDir = ChoredMovement_GetMoveDir()
      if moveDir == 1 then
        ControllerFadeTo(sfxController, kFadeTime, 1)
        ControllerPlay(sfxController)
      else
        ControllerFadeTo(sfxController, kFadeTime, 0, true)
      end
    end
  end
  ControllerKill(sfxController)
end
function RichmondSquareWallDusk()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  Game_StartScene()
end
function RichmondSquareWallDusk_StartChoredMove()
  ChoredMovement_Start()
  WaitForNextFrame()
  ThreadStart(UpdateChoredMoveSFX)
end
SceneOpen(kScene, kScript)
