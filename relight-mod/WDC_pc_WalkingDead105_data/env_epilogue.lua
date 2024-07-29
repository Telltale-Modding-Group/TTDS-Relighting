require("ui_stats.lua")
local kScript = "Epilogue"
local kScene = "adv_epilogue105"
local mVisibilityThreshold
local OnCreditsComplete = function()
  if mVisibilityThreshold then
    RenderSetVisibilityThreshold(mVisibilityThreshold)
  end
  SubProject_Switch("MenuSeason1", "MainMenuNoStartPane")
end
function Epilogue()
  if rawget(_G, "RenderGetVisibilityThreshold") then
    mVisibilityThreshold = RenderGetVisibilityThreshold()
    RenderSetVisibilityThreshold(0)
  end
  Mode(mode_Main)
  DisableReticle(true)
  Persistent_Store()
  DataBackupManager_SubmitGameLogic(true)
  WDAchievements_Unlock("achievement_05")
  Callback_OnCreditsComplete:Add(OnCreditsComplete)
  SceneAdd("ui_stats", "UI_Stats_Open")
  Yield()
  AgentHide(SceneGetSceneAgent(kScene), true)
  if Platform_IsIOS() then
    while not AgentExists("ui_credits.scene") do
      Yield()
    end
    AgentFind("ui_credits.scene").mProps["Scene Render Priority"] = 9
  end
  if Platform_IsWiiU() then
    AgentHide("ui_menu_main.scene", true, true)
  end
end
function PreloadShaders()
end
if LangGetCurLanguage() == kEnglish then
end
SceneOpen(kScene, kScript)
