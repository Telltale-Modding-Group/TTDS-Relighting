local kScript = "RestStop"
local kScene = "adv_restStop"
local mZombieHeads
local ZombieMonitor = function()
  local worldPos = AgentGetWorldPos(Game_GetPlayer())
  for _, head in ipairs(mZombieHeads) do
    if AgentGetProperty(head, kGameSelectable) then
      local distance = VectorDistance(AgentGetWorldPos(head), worldPos)
      AgentHide(head, distance > 5)
    else
      AgentHide(head, true)
    end
  end
end
local PreloadAssets = function()
  local kPreLoadList = {
    "env_restStop_cs_enterSnowstorm_1.chore",
    "NV_Clem_Breathing_Shivering_Lp_02.wav",
    "sk56_clem204WalkSnowStormHoldGun_sheltersArmRight.chore",
    "clementine200_eyes_lookAtsOff.chore",
    "clementine_face_blinkPainA.chore",
    "sk56_clem204WalkSnowStormHoldGun_sheltersArmRight_add.chore",
    "amb_wind_gust_01.wav",
    "sk56_move_clem204WalkSnowStormHoldGun.chore",
    "adv_restStop_clemColdInSnowstorm.chore",
    "sk56_idle_clementine200PainA.chore",
    "sk56_idle_clementine200.chore",
    "amb_winter_wind_gusty.wav",
    "mus_loop_Ominous_04.wav",
    "vox_zomb_group_idol_lp_2.wav",
    "trigger_chorebox_snowstorm_depth.chore",
    "trigger_chorebox_snowstorm_width.chore",
    "sk56_clementine200PainA.ptable",
    "FS_Player_Snow_Walk_01.wav",
    "FS_Player_Snow_Walk_02.wav",
    "FS_Player_Snow_Walk_03.wav",
    "FS_Player_Snow_Walk_04.wav",
    "FS_Player_Snow_Walk_05.wav",
    "fs_concrete_light_grit_01.wav",
    "fs_concrete_light_grit_02.wav",
    "fs_concrete_light_grit_03.wav",
    "fs_concrete_light_grit_04.wav",
    "fs_concrete_light_grit_05.wav",
    "adv_restStop_zombieSnowstorm1Wandering.chore",
    "adv_restStop_zombieSnowstorm2Wandering.chore",
    "adv_restStop_zombieSnowstorm3Wandering.chore",
    "adv_restStop_zombieSnowstorm4Wandering.chore",
    "adv_restStop_zombieSnowstorm5Wandering.chore",
    "sk55_zombie200_torsoLongSleeveAwarmGrey.d3dtx",
    "sk55_zombie200_legsShortShortsAblueDenim.d3dtx",
    "sk55_zombie200_hairStraggleyBlack.d3dtx",
    "sk55_zombie200_hairStraggleyBlackAlpha.d3dtx",
    "sk54_zombie200_shirtAwhite.d3dtx",
    "sk54_zombie200_summerShirtPlaid.d3dtx",
    "sk54_zombie200_jacketABrownLeather.d3dtx",
    "sk54_zombie200_shortsAafrican.d3dtx",
    "sk54_zombie200_pantsAgreenTrack.d3dtx",
    "sk54_zombie200_faceCafrican.d3dtx",
    "sk54_zombie200_faceBafrican.d3dtx",
    "sk54_zombie200_headAafrican.d3dtx",
    "sk54_zombie200_fullArmsAfrican.d3dtx",
    "sk54_zombie200_stragglyHairAgreyAlpha.d3dtx",
    "sk54_zombie200_spikeyHairAgrey.d3dtx",
    "sk54_zombie200_spikeyHairAgreyAlpha.d3dtx",
    "sk54_zombie200_armStumpAfrican.d3dtx",
    "sk54_zombie200_foreArmChopAfrican.d3dtx",
    "sk54_zombie200_headEafrican.d3dtx",
    "sk54_zombie200_shirtAwhite_nm.d3dtx",
    "sk54_zombie200_shirtAwhite_detail.d3dtx",
    "sk54_zombie200_faceBafrican_detail.d3dtx",
    "sk54_zombie200_headAafrican_detail.d3dtx",
    "sk55_zombie200_legsBareAafrican.d3dtx",
    "sk55_zombie200_headBafrican.d3dtx",
    "sk55_zombie200_headAafrican.d3dtx",
    "sk55_zombie200_fullArmsAfrican.d3dtx",
    "sk55_zombie200_armStumpAfrican.d3dtx",
    "sk55_zombie200_foreArmChopAfrican.d3dtx",
    "sk55_zombie200_hairCurlyBlack.d3dtx",
    "sk55_zombie200_hairCurlyBlackAlpha.d3dtx",
    "sk54_zombie200_summerShirtBlue.d3dtx",
    "sk54_zombie200_jacketBbrownLeather.d3dtx",
    "sk54_zombie200_longHairAgrey.d3dtx",
    "sk54_zombie200_longHairAgreyAlpha.d3dtx",
    "sk54_zombie200_jacketBgreenTrack.d3dtx"
  }
  for _, item in ipairs(kPreLoadList) do
    PreLoad(item)
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "326")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_TOON_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_ENV_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_ENV_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_DTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_QLo.t3fxb", "455")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "3")
  end
end
function RestStop()
  Game_NewScene(kScene, kScript)
  local bFightStarted = LogicGet("3 - Fight Started")
  if Game_GetLoaded() and bFightStarted then
    Navigate_Enable(false)
  end
  if Game_GetDebug() and bFightStarted then
    Game_SetSceneDialog("env_restStop_fight")
    if LogicGet("3 - Fight Stage") == 1 then
      Game_SetSceneDialogNode("cs_fightStarts")
    else
      Navigate_Enable(false)
      AgentHide("Jane", false)
      AgentHide("Kenny", false)
      AgentSetProperty("group_restStop", "Group - Visible", true)
      AgentSetProperty("group_snowstorm", "Group - Visible", false)
      Game_SetSceneDialogNode("cs_grabGun")
    end
    Yield()
  end
  PreloadAssets()
  Game_StartScene()
end
function RestStop_FaceZombie(zombieNum)
  PathAgentFacePos(Game_GetPlayer(), AgentGetSelectionCenter("ZombieSnowstorm" .. zombieNum, true))
end
function RestStop_DisableZombieWalkBoxes(zombieNum)
  WalkBoxesDisableAreaAroundAgent(kScene, "ZombieSnowstorm" .. zombieNum)
end
function RestStop_ResetZombies()
  if mZombieHeads then
    for _, zombieHead in ipairs(mZombieHeads) do
      AgentSetSelectable(zombieHead, true)
    end
  end
  WalkBoxesEnableAll(kScene)
end
function RestStop_ZombieMonitor(bStart)
  if bStart then
    mZombieHeads = {
      AgentFind("obj_zombieSnowstormHead1"),
      AgentFind("obj_zombieSnowstormHead2"),
      AgentFind("obj_zombieSnowstormHead3"),
      AgentFind("obj_zombieSnowstormHead4"),
      AgentFind("obj_zombieSnowstormHead5")
    }
    Callback_OnPostUpdate:Add(ZombieMonitor)
  else
    Callback_OnPostUpdate:Remove(ZombieMonitor)
    if mZombieHeads then
      for _, zombieHead in ipairs(mZombieHeads) do
        AgentHide(zombieHead, true)
      end
      mZombieHeads = nil
    end
  end
end
SceneOpen(kScene, kScript)
