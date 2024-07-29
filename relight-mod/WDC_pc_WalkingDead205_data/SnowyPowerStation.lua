local kScript = "SnowyPowerStation"
local kScene = "adv_snowyPowerStation"
local kPreLoadList = {
  "env_snowyPowerStation_CS_Enter_1.chore",
  "359067760.lang",
  "359067760.wav",
  "359067763.lang",
  "359067763.wav",
  "sk54_idle_kennyHoldBaby.chore",
  "kenny200_face_blink.chore",
  "sk54_kenny200_toAngryB.chore",
  "kenny200_headGesture_lookUpQuick_add.chore",
  "kenny200_headGesture_lookRightQuick_add.chore",
  "sk54_move_kennyWalkHoldBabyPointGunRelaxed.chore",
  "359067765.lang",
  "359067765.wav",
  "arvo_headGesture_lookLeft_add.chore",
  "arvo_face_blink.chore",
  "sk54_arvo_toSadA.chore",
  "arvo_headGesture_lookDown_add.chore",
  "clementine200_headGesture_lookUpRight_add.chore",
  "bonnie_face_blink.chore",
  "bonnie_eyes_dartR.chore",
  "bonnie_eyes_dartDownR.chore",
  "bonnie_eyes_dartDownL.chore",
  "bonnie_eyes_dartL.chore",
  "bonnie_eyes_dartDown.chore",
  "bonnie_headGesture_lookUpQuick_add.chore",
  "bonnie_headgesture_lookDownQuickLeft_add.chore",
  "bonnie_headgesture_lookDownQuick_add.chore",
  "bonnie_headgesture_lookUpRight_add.chore",
  "bonnie_headGesture_lookUp_add.chore",
  "bonnie_headgesture_lookUpLeft_add.chore",
  "bonnie_headgesture_lookRight_add.chore",
  "bonnie_headGesture_lookRightQuick_add.chore",
  "bonnie_headgesture_lookLeft_add.chore",
  "bonnie_headgesture_lookLeftQuick_add.chore",
  "bonnie_headgesture_lookDown_add.chore",
  "bonnie_headgesture_lookDownQuickRight_add.chore",
  "sk54_mike_walkHelpLukeWithAK47.chore",
  "fs_tiny_tim_1.wav",
  "fs_tiny_tim_2.wav",
  "fs_tiny_tim_3.wav",
  "fs_tiny_tim_4.wav",
  "fs_tiny_tim_5.wav",
  "fs_tiny_tim_6.wav",
  "sk56_idle_clementine200SadA.chore",
  "sk56_idle_clementine200.chore",
  "sk55_idle_bonnieNormalA.chore",
  "sk54_idle_kenny200NormalA.chore",
  "kenny200_eyes_default.chore",
  "sk54_idle_arvoNormalA.chore",
  "amb_winter_night_owl_lp.wav",
  "amb_winter_wind_forest_creaky.wav",
  "sk56_clementine200SadA.ptable",
  "sk55_lillyNormalA.ptable",
  "fs_snow_fast_dull_06.wav",
  "fs_snow_fast_dull_07.wav",
  "fs_snow_fast_dull_08.wav",
  "fs_snow_fast_dull_10.wav",
  "fs_snow_slow_01.wav",
  "fs_snow_slow_02.wav",
  "fs_snow_slow_03.wav",
  "fs_snow_slow_04.wav",
  "fs_snow_slow_05.wav",
  "fs_snow_fast_dull_11.wav",
  "fs_snow_fast_dull_12.wav",
  "fs_snow_fast_dull_13.wav",
  "fs_snow_fast_dull_14.wav",
  "fs_snow_fast_dull_15.wav",
  "fs_snow_slow_06.wav",
  "fs_snow_slow_07.wav",
  "fs_snow_slow_08.wav",
  "fs_snow_slow_09.wav",
  "fs_snow_slow_10.wav",
  "sk54_idle_kenny200AngryB.chore",
  "sk54_kenny202FearA.ptable",
  "fs_snow_fast_06.wav",
  "fs_snow_fast_07.wav",
  "fs_snow_fast_08.wav",
  "fs_snow_fast_09.wav",
  "fs_snow_fast_10.wav",
  "fs_snow_fast_01.wav",
  "fs_snow_fast_02.wav",
  "fs_snow_fast_03.wav",
  "fs_snow_fast_04.wav",
  "fs_snow_fast_05.wav",
  "sk54_idle_arvoSadA.chore",
  "sk54_matthewSadA.ptable",
  "fs_snow_fast_dull_01.wav",
  "fs_snow_fast_dull_02.wav",
  "fs_snow_fast_dull_03.wav",
  "fs_snow_fast_dull_04.wav",
  "fs_snow_fast_dull_05.wav"
}
local PreloadAssets = function()
  for _, item in ipairs(kPreLoadList) do
    PreLoad(item)
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
  end
end
function SnowyPowerStation()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  Game_StartScene()
end
SceneOpen(kScene, kScript)
