--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "FrozenLake"
local kScene = "adv_frozenLake"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_FreecamUseFOVScale = false;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene .. ".scene";
RelightConfigLevel = RelightConfigData_Season2.Level_205_FrozenLake;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local PreloadAssets = function()
  local kPreLoadList = {
    "env_frozenLake_cs_zombieAttack_1.chore",
    "359055556.lang",
    "359055556.wav",
    "359055558.lang",
    "359055558.wav",
    "sk54_mike_walkHoldBaby.chore",
    "sk54_idle_mikeHoldBaby.chore",
    "mike_face_blink.chore",
    "mike_headGesture_lookUp_add.chore",
    "mike_headGesture_lookRight_add.chore",
    "mike_headturns_zero.chore",
    "mike_headGesture_lookLeft_add.chore",
    "mike_headGesture_lookDown_add.chore",
    "sk54_mike_toThinkingB.chore",
    "mike_headGesture_lookUpLeft_add.chore",
    "sk54_mike_toSadA.chore",
    "359055557.lang",
    "359055557.wav",
    "sk54_luke_toThinkingA.chore",
    "sk54_luke_toSadA.chore",
    "luke_headGesture_lookDownQuickLeft_add.chore",
    "luke_face_blink.chore",
    "luke_headturns_zero.chore",
    "luke_headGesture_lookRight_add.chore",
    "luke_headGesture_lookLeft_add.chore",
    "luke_headGesture_lookDown_add.chore",
    "alvin_headGesture_lookUp_add.chore",
    "sk54_luke_toThinkingB.chore",
    "sk54_luke_walkLegHurtWithAK47.chore",
    "359055361.lang",
    "359055361.wav",
    "359055363.lang",
    "359055363.wav",
    "sk54_kenny200_toDisgustA.chore",
    "sk54_kenny_walkPointGun.chore",
    "kenny200_headGesture_lookLeft_add.chore",
    "sk54_kenny200_toNormalA.chore",
    "kenny200_headGesture_lookRight_add.chore",
    "kenny200_face_blink.chore",
    "sk54_kenny200_toAngryB.chore",
    "359055362.lang",
    "359055362.wav",
    "359055383.lang",
    "359055383.wav",
    "sk54_arvo_walkBound.chore",
    "arvo_eyes_lookAtsOff.chore",
    "arvo_face_blink.chore",
    "sk54_arvo_toNormalA.chore",
    "sk54_arvo_toSadA.chore",
    "arvo_headGesture_lookLeft_add.chore",
    "arvo_headTurns_zero.chore",
    "arvo_headGesture_lookRight_add.chore",
    "arvo_headGesture_lookDown_add.chore",
    "arvo_headGesture_lookUp_add.chore",
    "sk54_arvo_toFearA.chore",
    "bonnie_face_blink.chore",
    "bonnie_eyes_dartDownL.chore",
    "bonnie_headgesture_lookDownQuickLeft_add.chore",
    "bonnie_headgesture_lookUpRight_add.chore",
    "bonnie_eyes_dartL.chore",
    "bonnie_eyes_dartR.chore",
    "bonnie_eyes_dartDown.chore",
    "bonnie_eyes_dartDownR.chore",
    "sk55_bonnie_toNormalA.chore",
    "bonnie_headgesture_lookDown_add.chore",
    "bonnie_headgesture_lookUpLeft_add.chore",
    "bonnie_headGesture_lookUpQuick_add.chore",
    "bonnie_headGesture_lookUp_add.chore",
    "bonnie_headgesture_lookRight_add.chore",
    "bonnie_headgesture_lookDownQuick_add.chore",
    "bonnie_headgesture_lookLeftQuick_add.chore",
    "bonnie_headGesture_lookRightQuick_add.chore",
    "bonnie_headgesture_lookDownQuickRight_add.chore",
    "bonnie_headgesture_lookLeft_add.chore",
    "clementine200_headGesture_lookUpLeft_add.chore",
    "jane_headgesture_lookLeft_add.chore",
    "jane_headgesture_lookRight_add.chore",
    "jane_face_blink.chore",
    "jane_eyes_dartDown.chore",
    "jane_eyes_dartR.chore",
    "jane_eyes_dartDownR.chore",
    "jane_eyes_dartL.chore",
    "jane_eyes_dartDownL.chore",
    "sk55_jane_toNormalA.chore",
    "jane_headGesture_lookUp_add.chore",
    "jane_headgesture_lookDown_add.chore",
    "jane_headgesture_lookDownQuick_add.chore",
    "jane_headGesture_lookUpQuick_add.chore",
    "jane_headgesture_lookDownQuickRight_add.chore",
    "jane_headgesture_lookUpLeft_add.chore",
    "jane_headGesture_lookRightQuick_add.chore",
    "jane_headgesture_lookDownQuickLeft_add.chore",
    "jane_headgesture_lookLeftQuick_add.chore",
    "jane_headgesture_lookUpRight_add.chore",
    "sk54_mike_walkHoldBaby2.chore",
    "vox_zomb_nat_oneshot_attack_7.wav",
    "SceneToonOutline2_1SKN_QHi.t3fxb",
    "Mesh_1SKN_BMP_QHi.t3fxb",
    "Mesh_1SKN_BMP_DTL_SDTL_QHi.t3fxb",
    "sk56_idle_clementine200SadA.chore",
    "sk56_idle_clementine200.chore",
    "sk54_idle_mikeSadA.chore",
    "sk54_idle_mikeDefaultC.chore",
    "sk54_idle_lukeThinkingB.chore",
    "sk55_idle_bonnieNormalA.chore",
    "sk55_idle_janeNormalA.chore",
    "sk55_idle_janeDefaultA.chore",
    "sk54_idle_kenny200NormalA.chore",
    "kenny200_eyes_default.chore",
    "sk54_idle_arvoNormalA.chore",
    "amb_cabin_exterior_forest_wind.wav",
    "snow_melt_forest_lp.wav",
    "snowy_forest2.reverb",
    "sk56_clementine200SadA.ptable",
    "sk54_nickSadA.ptable",
    "sk54_lukeThinkingB.ptable",
    "sk55_lillyNormalA.ptable",
    "fs_snow_wet_01.wav",
    "fs_snow_wet_02.wav",
    "fs_snow_wet_03.wav",
    "fs_snow_wet_04.wav",
    "fs_snow_wet_05.wav",
    "fs_ice_crack_16.wav",
    "fs_ice_crack_17.wav",
    "fs_ice_crack_18.wav",
    "fs_ice_crack_19.wav",
    "fs_ice_crack_23.wav",
    "fs_concrete_boot_dull_01.wav",
    "fs_concrete_boot_dull_02.wav",
    "fs_concrete_boot_dull_03.wav",
    "fs_concrete_boot_dull_04.wav",
    "fs_concrete_boot_dull_05.wav",
    "fs_snow_wet_11.wav",
    "fs_snow_wet_12.wav",
    "fs_snow_wet_13.wav",
    "fs_snow_wet_14.wav",
    "fs_snow_wet_15.wav",
    "fs_snow_wet_06.wav",
    "fs_snow_wet_07.wav",
    "fs_snow_wet_08.wav",
    "fs_snow_wet_09.wav",
    "fs_snow_wet_10.wav",
    "fs_snow_slow_06.wav",
    "fs_snow_slow_07.wav",
    "fs_snow_slow_08.wav",
    "fs_snow_slow_09.wav",
    "fs_snow_slow_10.wav",
    "sk54_idle_mikeThinkingB.chore",
    "sk54_nickThinkingB.ptable",
    "sk54_idle_lukeThinkingA.chore",
    "sk54_lukeThinkingA.ptable",
    "sk54_idle_arvoSadA.chore",
    "sk54_matthewSadA.ptable",
    "sk54_idle_lukeSadA.chore",
    "sk54_lukeSadA.ptable",
    "sk54_idle_kenny200AngryB.chore",
    "sk54_kenny202FearA.ptable",
    "sk54_idle_arvoFearA.chore",
    "sk54_matthewFearA.ptable",
    "sk54_idle_kenny200DisgustA.chore",
    "sk54_kenny202DisgustA.ptable",
    "mus_linear_Fight_05.wav",
    "vox_zomb_idol_Medium_lp.wav",
    "sk56_clementine200FearA.ptable",
    "sk55_lillyThinkingA.ptable",
    "sk54_nickThinkingA.ptable",
    "sk56_clementine200FearC.ptable",
    "fx_splashWaterRiverA.d3dtx",
    "fx_splashWaterRiverC.d3dtx",
    "fx_splashWaterRiverB.d3dtx",
    "sk54_nickSurpriseA.ptable",
    "fx_splashWaterRiverRingA.d3dtx",
    "fx_splashWaterRiverRingB.d3dtx",
    "fx_splashWaterRiverFoam.d3dtx",
    "mus_loop_Tense_38.wav",
    "sk54_nickFearB.ptable",
    "sk55_annieAngryB.ptable",
    "ui_dialog.scene",
    "env_frozenLake_cs_arvoBooksIt_6.chore",
    "359055468.lang",
    "359055468.wav",
    "kenny_eyes_lookAtsOff.chore",
    "sk54_idle_arvoStruggleWithLegInIce.chore",
    "fs_water_splash_06.wav",
    "fs_water_splash_07.wav",
    "fs_water_splash_08.wav",
    "fol_water_slosh_01.wav",
    "fol_water_slosh_02.wav",
    "fol_water_slosh_03.wav",
    "sk54_kenny202AngryC.ptable"
  }
  for _, item in ipairs(kPreLoadList) do
    PreLoad(item)
  end
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_ENV_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_ENV_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_VCOL_QLo.t3fxb", "76")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "3")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_ENV_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_ENV_DTL_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "323")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "256")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "140")
    RenderPreloadShader("Mesh_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_ENV_DTL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_ENV_DTL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_1SKN_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_ENV_DTL_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_VCOL_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_ENV_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_DTL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
    RenderPreloadShader("SceneToonOutline2_CC_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_1SKN_VCOL_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "195")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_QLo.t3fxb", "64")
    RenderPreloadShader("SceneToonOutline2_CC_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "323")
  end
end

function FrozenLake_ShootZombie(zombieNum)
  local zombieHead = AgentFind("obj_headZombieShoot" .. zombieNum)
  if zombieNum < 4 and not zombieHead.mbMissed then
    ChorePlay("env_frozenLake_missZombie_" .. zombieNum, 100)
    zombieHead.mbMissed = true
  else
    AgentSetSelectable(zombieHead, false)
    local zombie = AgentFind("ZombieShoot" .. zombieNum)
    AgentSetProperty(zombie, kIdleAnim, "adv_frozenLake_ZombieShoot" .. zombieNum .. "_deadOnIce.chore")
    ChorePlay("env_frozenLake_shootZombie_" .. zombieNum, 101)
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if not Game_GetLoaded() and not LogicGet("1 - Kenny Returned") then
    AgentSetProperty("Arvo", "Current State", "pistolWhipped")
  end
  if Game_GetDebug() and LogicGet("1 - Ice Cracked") then
    Game_SetSceneDialogNode("cs_lukeFallsIn")
  end
  PreloadAssets()
  Game_StartScene()
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function FrozenLake()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end
  
  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_OnPostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_OnPostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "205_";
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)
