local kScript = "DairyExteriorFence"
local kScene = "adv_dairyExteriorFenceline"
function DairyExteriorFence_OnPeeking(key, value)
  if value then
    AgentSetProperty("timer_tractorPeekDeath", "Timer Speed Multiplier", 1)
    Dialog_Play("ambient_markWarning")
  else
    AgentSetProperty("timer_tractorPeekDeath", "Timer Speed Multiplier", -2)
  end
end
function DairyExteriorFence()
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "2Fence - TractorPeekingLeft", DairyExteriorFence_OnPeeking)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "2Fence - TractorPeekingRight", DairyExteriorFence_OnPeeking)
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "2Fence - TractorPeekingUp", DairyExteriorFence_OnPeeking)
  Mode(mode_Main)
  Main_AllowMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Exterior Fence")
      DlgPreload("env_dairyExterior_CheckingTheFence.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  else
  end
end
SceneOpen(kScene, kScript)
