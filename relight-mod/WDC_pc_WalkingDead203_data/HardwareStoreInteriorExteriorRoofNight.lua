local kScript = "HardwareStoreInteriorExteriorRoofNight"
local kScene = "adv_hardwareStoreInteriorExteriorRoofNight"
local mDeathThread, mDialogID
local mbReaching = false
local mbTaviaLooking = false
local PreloadAssets = function()
  if IsPlatformIOS() then
    PreLoad("lightswitch_hardwareStoreInteriorExteriorRoofNightAct3.chore")
    PreLoad("env_hardwareStoreInteriorExteriorRoofNight_cs_enterOffice_1.chore")
    if not LogicGet("Episode 202 - Alvin Dead") then
      PreLoad("env_hardwareStoreInteriorExteriorRoofNight_cs_enterOffice_2.chore")
    else
      PreLoad("env_hardwareStoreInteriorExteriorRoofNight_cs_enterOffice_3.chore")
    end
  end
  if Platform_NeedShaderPreload() then
    print(">>>>>>>>> PRELOADING SHADERS: " .. kScene)
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
  end
end
local DuckCheck = function()
  if mbReaching and mbTaviaLooking then
    Drag_Exit()
    Game_RunSceneDialog("cs_duckBackDown", false)
  end
end
local OnReach = function(key, value)
  mbReaching = value
  DuckCheck()
end
local OnTaviaLooking = function(key, value)
  mbTaviaLooking = value
  DuckCheck()
end
function HardwareStoreInteriorExteriorRoofNight()
  Game_NewScene(kScene, kScript)
  Episode_BandageKenny()
  if LogicGet(kAct) == 2 then
    LogicAddKeyCallback("2 - Reaching for Walkie", OnReach)
    LogicAddKeyCallback("2 - Tavia Looking", OnTaviaLooking)
  end
  PreloadAssets()
  if IsPlatformAndroid() then
    AgentSetProperty("cam_cutsceneChore", "Clip Plane - Near", 0.2)
  end
  if Game_GetDebug() and LogicGet("3 - Escaped Office") then
    Game_SetSceneDialogNode("cs_carverBelow")
  end
  Game_StartScene()
end
function RoofNight_TaviaDialogStart()
  if not mDialogID then
    mDialogID = Game_RunSceneDialog("bg_taviaTalks", false)
  end
end
function RoofNight_TaviaDialogStop()
  if mDialogID then
    local controller = Dialog_GetController(mDialogID)
    if controller then
      local subtitleID = Subtitle_GetCurrentID()
      if subtitleID ~= -1 then
        while Subtitle_GetCurrentID() == subtitleID do
          Yield()
        end
      end
    end
    DlgStop(mDialogID)
    mDialogID = nil
  end
end
SceneOpen(kScene, kScript)
