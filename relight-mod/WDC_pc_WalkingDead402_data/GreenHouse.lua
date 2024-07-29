local kScript = "GreenHouse"
local kScene = "adv_greenHouse"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_openDoor")
  elseif LogicGet("Debug ID") == 2 then
    Game_SetSceneDialogNode("cs_inside")
  end
end
function GreenHouse()
  DlgPreloadAll(Game_GetPlayerDialog(), false)
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
function GreenHouse_KillZombatControllers(agent)
  local controllers = AgentGetControllers(agent)
  if controllers then
    for _, controller in ipairs(controllers) do
      local chore = ControllerGetChore(controller)
      if chore and StringStartsWith(ResourceGetName(chore), "zombat_") then
        ControllerKill(controller)
      end
    end
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
