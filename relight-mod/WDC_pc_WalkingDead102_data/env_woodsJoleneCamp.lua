local kScript = "WoodsJoleneCamp"
local kScene = "adv_woodsJoleneCamp"
function WoodsJoleneCamp()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    if IsToolBuild() and Logic["2Bandits - Jolene Entered"] then
      AgentHide("Jolene", false)
      Dialog_Play("cs_joleneEnters_start")
    else
      if Platform_IsWiiU() then
        print("Dialog Preloading start1: Jolene's Camp")
        DlgPreload("env_forestJolenesCamp.dlog", "cs_enter", 0, 15, 0, false)
      end
      Dialog_Play("cs_enter")
    end
  end
end
SceneOpen(kScene, kScript)
