local kScript = "HardwareStoreExteriorYardAfternoon"
local kScene = "adv_hardwareStoreExteriorYardAfternoon"
local kStruggleAgents = {
  "struggle_sarita"
}
local kStruggleConsoleDecayMulti = 2.75
local kSaritaStruggleWin = 0.8
local kSaritaStruggleWinConsoles = 0.75
local mbIsConsole = IsPlatformPS3() or IsPlatformXbox360()
local mSaritaStruggleControllerIdle
local mSaritaStruggleWin = kSaritaStruggleWin
local PreloadAssets = function()
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_groupRoundedUp_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_kennyBeaten_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_kennyBeaten_2.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_kennyBeaten_3.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_kennyBeaten_7.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_scrubChore_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_chores_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_chores_2.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_chores_3.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_1.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_2.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_3.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_4.chore")
  PreLoad("env_hardwareStoreExteriorYardAfternoon_cs_bonnieIntervenes_5.chore")
  if Platform_NeedShaderPreload() then
    print(">>>>>>>>> PRELOADING SHADERS: " .. kScene)
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_QLo.t3fxb", "263")
  end
end
local ConsoleStruggleBoost = function()
  if mbIsConsole then
    print(">>> Adjusting struggle values for console <<<")
    local decay = 0
    for key, value in pairs(kStruggleAgents) do
      decay = AgentGetProperty(value, "Button Mash - Rate of Decay")
      decay = decay * kStruggleConsoleDecayMulti
      AgentSetProperty(value, "Button Mash - Rate of Decay", decay)
    end
  end
end
function HardwareStoreExteriorYardAfternoon()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  PreloadAssets()
  if IsPlatformAndroid() then
    AgentSetProperty("cam_cutsceneChore", "Clip Plane - Near", 0.2)
  end
  Game_StartScene()
  if mbIsConsole then
    mSaritaStruggleWin = kSaritaStruggleWinConsoles
  end
  if not Game_GetLoaded() then
    ConsoleStruggleBoost()
  end
end
function HardwareStoreExteriorYardAfternoon_SaritaStruggleStart()
  print("Sarita struggle >>> STARTED <<<")
  mSaritaStruggleControllerIdle = ChorePlay("env_hardwareStoreExteriorYardAfternoon_struggle_sarita_chores_1.chore")
  ControllerSetLooping(mSaritaStruggleControllerIdle, true)
  Struggle_Enter("struggle_sarita")
end
function HardwareStoreExteriorYardAfternoon_SaritaStruggleWinCheck()
  if not AgentGetProperty("struggle_sarita", "Struggle - Complete") then
    local curStrugValue = AgentGetProperty("struggle_sarita", "Button Mash - Current Percentage")
    if curStrugValue > mSaritaStruggleWin then
      LogicSet("3 - Stopped Sarita", true)
    end
    Yield()
    Struggle_Exit()
  end
  ControllerKill(mSaritaStruggleControllerIdle)
end
function HardwareStoreExteriorYardAfternoon_SaritaStruggleLoseBreakout()
  print("Sarita struggle LOST!!!")
  while Subtitle_GetCurrentID() ~= -1 do
    Yield()
  end
  Dialog_StopAll()
  Game_RunDialog("cs_bonnieIntervenes", true)
end
SceneOpen(kScene, kScript)
