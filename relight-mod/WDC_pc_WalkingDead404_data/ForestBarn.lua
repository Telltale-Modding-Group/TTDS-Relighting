local kScript = "ForestBarn"
local kScene = "adv_forestBarn"
local kWalkbox = "adv_forestBarn.wbox"
local mDisableTriZombies = {}
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  local debugID = LogicGet("Debug ID")
  if debugID == 0 then
    return
  end
  if debugID > 1 then
    Dialog_Run("env_forestBarn_act2", "logic_setPlayer", false)
  end
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_shutIn")
  elseif debugID == 2 then
    Game_SetSceneDialogNode("cs_slowEmDown")
  else
    Game_SetSceneDialogNode("cs_endOfTheLine")
  end
end
function ForestBarn()
  Episode_SetClemState()
end
function ForestBarn_DisableZombieTri(zombie)
  if table.contains(mDisableTriZombies, zombie) then
    TableRemove(mDisableTriZombies, zombie)
    WaitForNextFrame()
    Print([[
Zombie was already in table

]])
  end
  WalkBoxesDisableAreaAroundAgent(kWalkbox, zombie)
  table.insert(mDisableTriZombies, zombie)
end
function ForestBarn_EnableZombieTri(zombie)
  if #mDisableTriZombies == 0 then
    Print([[
The table is empty!

]])
    return
  end
  if zombie then
    if table.contains(mDisableTriZombies, zombie) then
      Print([[
Stunning an already stunned zombie.

]])
      WalkBoxesEnableAreaAroundAgent(kWalkbox, zombie)
    else
      Print(zombie .. [[
 isn't in the table yet!

]])
      return
    end
  else
    WalkBoxesEnableAreaAroundAgent(kWalkbox, mDisableTriZombies[1])
    table.remove(mDisableTriZombies, 1)
    Print([[
Index 1 has been removed from the table!

]])
  end
end
function ForestBarn_EnableDeadZombieTri(zombie)
  if zombie then
    WalkBoxesEnableAreaAroundAgent(kWalkbox, zombie)
    TableRemove(mDisableTriZombies, zombie)
    Print(zombie .. [[
 has been removed from the table!

]])
  end
end
function ForestBarn_KillZombieBG(agent)
  if not agent then
    return
  end
  WaitForNextFrame()
  for _, controller in ipairs(AgentGetControllers(agent)) do
    local chore = ControllerGetChore(controller)
    if chore and StringStartsWith(ResourceGetName(chore), "zombat_bgSweepedAJZombie") then
      ControllerFadeOut(controller, 0.5, true)
      while ControllerGetContribution(controller) > 0 do
        WaitForNextFrame()
      end
      ControllerKill(controller)
    end
  end
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
