local kScript = "StashHouseInterior"
local kScene = "adv_stashHouseInterior"
function StashHouseInterior()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if not Game_GetLoaded() and not LogicGet("1 - Kenny Returned") then
    AgentSetProperty("Arvo", "Current State", "pistolWhipped")
  end
  if Game_GetDebug() and not LogicGet("1 - Bonnie Dead") then
    LogicSet("1 - Got Wet", true)
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
