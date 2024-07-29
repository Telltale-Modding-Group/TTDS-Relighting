local kScript = "RoadTruckSnowstorm"
local kScene = "adv_roadTruckSnowstorm"
function RoadTruckSnowstorm()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if not Game_GetLoaded() and LogicGet("Episode 102 - Stole Food From Car") then
    AgentSetProperty("ClementineFlashback", "Mesh sk56_clementineFlashback205_body - Visible", false)
    AgentSetProperty("ClementineFlashback", "Mesh sk56_clementineFlashback205_bodyHoody - Visible", true)
  end
  if Game_GetDebug() and LogicGet("3 - Woke Up") then
    Game_SetSceneDialogNode("cs_wakeUp")
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
SceneAdd("fx_overlayEyesBlink")
