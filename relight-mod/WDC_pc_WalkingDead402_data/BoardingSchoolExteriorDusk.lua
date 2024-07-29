require("AI_PlayerProjectile.lua")
local kScript = "BoardingSchoolExteriorDusk"
local kScene = "adv_boardingSchoolExteriorDusk"
local kWalkbox = "adv_boardingSchoolExteriorDusk.wbox"
local OnLogicReady = function()
  if IsPlatformNX() then
    Episode_SetFireShadows()
  end
  BoardingSchoolExteriorDusk_UpdateWalkbox()
  if Game_GetLoaded() then
    return
  end
  Episode_SetAJShirt()
  Episode_SetLouisDamage()
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_truthOrDare")
  end
end
function BoardingSchoolExteriorDusk()
  DlgPreloadAll(Game_GetPlayerDialog(), false)
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
function BoardingSchoolExteriorDusk_UpdateWalkbox()
  WalkBoxesEnableAll(kWalkbox)
  local idle = AgentGetProperty("Louis", "Walk Animation - Idle")
  idle = idle and ResourceGetName(idle)
  if not AgentIsHidden("Louis") then
    if idle == "adv_boardingSchoolExteriorDusk_louisShooting.chore" then
      WalkBoxesDisableAreaAroundAgent(kWalkbox, "dummy_louisWalkboxBlockerShooting", 0.01)
    elseif idle == "adv_boardingSchoolExteriorDusk_louisPickingUp.chore" then
      WalkBoxesDisableAreaAroundAgent(kWalkbox, "dummy_louisWalkboxBlockerStandingAround", 0.01)
    end
  end
  Episode_SetZombieGrave()
end
function BoardingSchoolExteriorDusk_CleanUpAuxiliaryChore()
  local controller = ControllerFind("zombat_clemStrafeBowNockedToDrawn.chore")
  while ControllerIsPlaying(controller) do
    WaitForNextFrame()
  end
  AgentSetProperty("Clementine", "Walk Animator - Auxiliary Chore", "")
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
