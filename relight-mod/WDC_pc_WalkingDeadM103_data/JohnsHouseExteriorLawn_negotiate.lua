local kScript = "JohnsHouseExteriorLawn_Negotiate"
local kScene = "adv_johnsHouseExteriorLawn103"
local mKeepJonasDeadController, mKeepGabbyDeadController, mGateSoundThread, mGateSoundController
local SceneInit = function()
  if LogicGet("2JohnsHouseExteriorRetreat - Begun Retreat") then
    Game_SetSceneDialog("env_johnsHouseExterior_retreat.dlog")
  else
    Game_SetSceneDialog("env_johnsHouseExterior_negotiate.dlog")
  end
end
local JohnsHouseExteriorLawn_Negotiate_GateSoundThread = function()
  while true do
    local theDir = ChoredMovement_GetMoveDir()
    if theDir == 0 then
      if mGateSoundController and not ControllerIsPaused(mGateSoundController) then
        ControllerPause(mGateSoundController)
      end
    elseif not mGateSoundController then
      mGateSoundController = SoundPlayEventByName("/103/103 SFX/07_johnsHouseExterior_negotiate/sfx_gate_metal_open_long")
    elseif ControllerIsPaused(mGateSoundController) then
      ControllerPlay(mGateSoundController)
    end
    WaitForNextFrame()
  end
end
function JohnsHouseExteriorLawn_Negotiate_KeepJonasDead()
  mKeepJonasDeadController = ChorePlay("adv_johnsHouseExterior103_jonasDead.chore", 99999)
  ControllerSetLooping(mKeepJonasDeadController, true)
  AgentHide("obj_gunGlock_jonas", true)
end
function JohnsHouseExteriorLawn_Negotiate_KeepGabbyDead()
  mKeepGabbyDeadController = ChorePlay("adv_johnsHouseExterior103_gabbyDead.chore", 99999)
  ControllerSetLooping(mKeepGabbyDeadController, true)
  AgentHide("obj_rifleSniperGabby", true)
end
function JohnsHouseExteriorLawn_Negotiate_GatePushSound()
  mGateSoundThread = ThreadStart(JohnsHouseExteriorLawn_Negotiate_GateSoundThread)
end
function JohnsHouseExteriorLawn_Negotiate_KillGatePushSoundThread()
  ThreadKill(mGateSoundThread)
end
function JohnsHouseExteriorLawn_Negotiate()
  Game_NewScene(kScene, kScript, SceneInit)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
