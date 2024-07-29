local kScript = "ManorInteriorAfterCrawford"
local kScene = "adv_manorInterior_afterCrawford"
function ManorInteriorAfterCrawford()
  Mode(mode_Main)
  DoManorVisibilityManagement()
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide("Molly", Logic["3Hallway - Molly Dead"])
  AgentHide("Ben", Logic["3BellTower - Ben Dead"])
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
