local kScript = "ForestTile"
local kScene = "adv_forestTile"
local mbDebugText = false
local DebugPrint = function(mesg, verbosity, bError)
  if not mbDebugText then
    return
  end
  Print(mesg, verbosity, bError)
end
local OnKeyChange = function(key, value)
  if key == "AI Player - Interaction Enable" and AgentGetProperty("James", "AI Agent - AI Agent Enable") then
    DebugPrint("setting James pathing to " .. tostring(value))
    AgentSetProperty("James", "AI Agent - Pathing Enable", value)
  end
end
local OnLogicReady = function()
  PropertyAddKeyCallback(AgentGetProperties("Clementine"), "AI Player - Interaction Enable", OnKeyChange)
  if Game_GetLoaded() then
    return
  end
  Episode_SetAbelArm()
  AgentSetProperty("James", "Current State", "headMask")
  local debugID = LogicGet("Debug ID")
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_postKick")
  elseif debugID == 2 then
    Game_SetSceneDialogNode("cs_lost")
  end
end
function ForestTile()
  DlgPreloadAll(Game_GetPlayerDialog(), false)
end
function ForestTile_SpawnJames()
  local PositionIsValid = function()
    if AgentIsOnScreen("James") then
      DebugPrint("invalid: James is on-screen")
      return false
    elseif AgentDistanceToAgent("Clementine", "James") < 6 or AgentDistanceToAgent("Clementine", "James") > 10 then
      DebugPrint("invalid: James is too close to Clem")
      return false
    end
    DebugPrint("position OK")
    return true
  end
  local i = 0
  while not PositionIsValid() do
    local multipliers = {1, -1}
    local requestedPos = Vector(0, 0, 0)
    requestedPos.x = RandomInt(6, 15) * multipliers[RandomInt(1, 2)]
    requestedPos.z = RandomInt(6, 15) * multipliers[RandomInt(1, 2)]
    local pos = WalkBoxesPosOnWalkBoxes(AgentLocalToWorld("Clementine", requestedPos), 0, "adv_forestTile.wbox")
    DebugPrint("trying to spawn James at " .. tostring(pos))
    AgentSetWorldPos("James", pos)
    i = i + 1
    if i >= 30 then
      DebugPrint("couldn't find a good position after " .. i .. " tries; giving up :(")
      break
    end
  end
  AgentFacePos("James", AgentGetWorldPos("Clementine"))
  AgentSetProperty("James", "AI Agent - AI Agent Enable", true)
  AgentHide("James", false)
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
