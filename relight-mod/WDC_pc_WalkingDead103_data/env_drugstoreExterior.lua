local kScript = "DrugstoreExterior"
local kScene = "adv_drugstoreExteriorCrashed"
function DrugstoreExterior_PreLoadIntro()
end
function DrugstoreExterior_PreLoadAfterGoingStaying()
end
function DrugstoreExterior_PreloadShootBeatrice()
end
function DrugstoreExterior_HideSniperScene()
  Yield()
  Print("** Hiding Sniper Scene")
  SceneHide("ui_sniper.scene", true)
end
function DrugstoreExterior()
  if LangGetCurLanguage() == "german" and Platform_IsVita() then
    AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
  end
  if LangGetCurLanguage() == "french" and Platform_IsVita() then
    AgentSetProperty("ui_openingcredits_episodename", "Text Scale", 1.15)
  end
  if LangGetCurLanguage() == "spanish" then
    if Platform_IsVita() then
      AgentSetProperty("ui_openingcredits_episodename", "Text Scale", 0.95)
    else
      AgentSetProperty("ui_openingcredits_episodename", "Text Scale", 1.25)
    end
  end
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_nav_jeepwinch", "Pan Cam - Enabled", false)
  end
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  SceneAdd("ui_sniper.scene", "DrugstoreExterior_HideSniperScene")
  if Logic["Helped Kill Larry"] == "false" then
    Logic["1Drugstore - Kenny Mad"] = true
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Drugstore Exterior / drugstoreExteriorCrashed")
      DlgPreload("env_drugstoreExteriorCrashed.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingcredits")
