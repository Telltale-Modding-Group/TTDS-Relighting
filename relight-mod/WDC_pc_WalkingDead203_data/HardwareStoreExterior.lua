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

local kScript = "HardwareStoreExterior"
local kScene = "adv_hardwareStoreExterior"

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
RelightConfigLevel = RelightConfigData_Season2.Level_203_HardwareStoreExterior;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kShoeStoreZombieHitSoundChores = {
  "env_shoeStoreInterior_use_zombie1_1a.chore",
  "env_shoeStoreInterior_use_zombie1_1b.chore",
  "env_shoeStoreInterior_use_zombie1_1c.chore"
}

local kClemShelfMoveDeathTime = 1.5
local kClemShelfMoveZombieKillTriggerDelay = 1
local kClemBackAwayTimeLimit = 4
local kScrewdriverStruggleMinMashToStartCheck = 0.2
local kScrewdriverStruggleMashFailDelta = 0.05
local kCableStruggleInitDecay = 0.3
local kCableStruggleDecayBoost = 5.0E-4
local kCableStruggleDecayBoostKeyboard = 0.0025
local kCableStruggleDecayBoostVitaTouch = 0.005
local kCableStruggleDecayBoostVitaController = 0.0033
local kCableStruggleDecayBoostMulti = 5
local kCableStruggleDecayBoostMultiThreshold = 0.6
local kCableStruggleInitIncrease = 4.5
local kCableStruggleIncreaseBoost = -0.005
local kCableStruggleIncreaseMin = 0.75
local kCableStruggleMaxPercent = 0.9
local kCableStruggleMaxMashTimeInt = 0.6
local kCableStruggleVictoryEndPercent = 0.005
local kCableStruggleVictoryLastDelay = 0
local kCableStruggleDelayBeforeAdjusting = 0
local kCableStruggleAdjustInterval = 0.03
local kComicStoreLookats = {
  forwardNavCam = {
    "obj_beddingUsePoint",
    "obj_bloodstainUsePoint",
    "obj_boxPileUsePoint",
    "obj_cabinetUsePoint",
    "obj_counterUsePoint",
    "obj_doorComicShopUsePoint",
    "obj_shelvesUsePoint",
    "obj_tableFallenUsePoint",
    "obj_tablesUsePoint"
  },
  unseen = {
    "obj_bathroomUsePoint",
    "obj_counterBackUsePoint",
    "obj_ventCornerUsePoint",
    "obj_ventUsePoint"
  }
}

local kCableStruggleConsoleMulti = 4.5
local kScrewdriverStruggleConsoleMulti = 1.3333
local kShoeStoreSoundEmitters = {
  "sound_fight_foley_1",
  "sound_zombie_1",
  "sound_zombie_2",
  "sound_zombie_3",
  "sound_zombie_group"
}

local mbIsConsole = IsPlatformPS3() or IsPlatformXbox360()
local mControllerClemBacksAwayFromZombie
local mControllerTimeClemBacksAwayFromZombie = 0
local mControllerStruggleCableLightChore, mShelfSqueezeKillWatchThread, mControllerTroyTimer, mDialogTroyTimer
local mShoeStoreZombieHitSoundsActive = {}

local PreloadAssets = function()
  PreLoad("clementine_face_default.chore")
  if LogicGet(kAct) == 2 then
    print("preloading ACT **2** chores!")
    PreLoad("env_shoeStoreInterior_cs_aMove_dodgeUnderShelf_1.chore")
    PreLoad("env_shoeStoreInterior_cs_shoeStoreHellBreaksLoose_1.chore")
    PreLoad("env_shoeStoreInterior_use_zombie1_1.chore")
    PreLoad("env_shoeStoreInterior_use_zombie1_1a.chore")
    PreLoad("env_shoeStoreInterior_use_zombie1_1b.chore")
    PreLoad("env_shoeStoreInterior_use_zombie1_1c.chore")
    PreLoad("env_shoeStoreInterior_bg_backAwayFromZombie1_1b.chore")
    PreLoad("env_shoeStoreInterior_bg_backAwayFromZombie_finale_1.chore")
    PreLoad("env_shoeStoreInterior_choredMove_backAwayFromZombie1_1.chore")
    PreLoad("env_shoeStoreInterior_cs_shelfSqueezeSuccess_1.chore")
    PreLoad("env_shoeStoreInterior_cs_clemSpotsMoreZombies_1.chore")
    PreLoad("env_shoeStoreInterior_cs_fail_struggleCable_1.chore")
    PreLoad("env_shoeStoreInterior_cs_troySavesClem_1.chore")
    PreLoad("env_shoeStoreInterior_cs_troySavesClem_2.chore")
    PreLoad("env_shoeStoreInterior_cs_troySavesClem_3.chore")
    PreLoad("env_comicStoreInterior_cs_grabbed_1.chore")
    PreLoad("env_comicStoreInterior_struggle_luke_scrubChore_1.chore")
    PreLoad("env_comicStoreInterior_struggle_luke_chores_1.chore")
    PreLoad("trigger_chore_light_shoeStore_clementine_behindShelf.chore")
    PreLoad("ui_notification_tutorialOn.chore")
    PreLoad("cam_shelfSqueeze_horizontal_adv_hardwareStoreExterior.chore")
    PreLoad("cam_shelfSqueeze_vertical_adv_hardwareStoreExterior.chore")
    PreLoad("env_hardwareStoreExterior_struggle_screwdriver_chores_1.chore")
    PreLoad("env_hardwareStoreExterior_struggle_screwdriver_chores_2.chore")
    PreLoad("env_hardwareStoreExterior_struggle_screwdriver_chores_3.chore")
    PreLoad("sk56_idle_clem200StruggleZombieScrewdriverStage1.chore")
    PreLoad("sk56_idle_clem200StruggleZombieScrewdriverStage2.chore")
    PreLoad("sk56_idle_clem200StruggleZombieScrewdriverStage3.chore")
    PreLoad("env_hardwareStoreExterior_struggle_screwdriver_scrubChore_1.chore")
    PreLoad("env_shoeStoreInterior_bg_struggleScrewdriver_fx_1.chore")
    PreLoad("env_shoeStoreInterior_bg_struggleScrewdriver_fx_1.chore")
    PreLoad("fx_bloodSpurtDirAvgA_spurt.chore")
    PreLoad("fx_bloodSpurtDirAvgC_spurt.chore")
    PreLoad("fx_bloodSpurtDirWdeA_spurt.chore")
    PreLoad("fx_bloodSpurtDirWdeC_spurt.chore")
    PreLoad("fx_bloodSpurtDirWdeB_spurt.chore")
    PreLoad("sk56_idle_clementine200AngryC.chore")
  else
    print("preloading ACT --3-- chores!")
    PreLoad("env_hardwareStoreExterior_cs_dayThreeBegin_1.chore")
    PreLoad("env_comicStoreInterior_cs_lukeMissing_1.chore")
    PreLoad("env_comicStoreInterior_cs_clemLeavesEarly_1.chore")
    PreLoad("env_comicStoreInterior_cs_waitedForLuke_1.chore")
  end
  if Platform_NeedShaderPreload() then
    print(">>>>>>>>> PRELOADING SHADERS: " .. kScene)
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_ENV_LGT_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("SceneToonOutline2_TONE_QLo.t3fxb", "0")
    RenderPreloadShader("SceneToonOutline2_1SKN_TONE_QLo.t3fxb", "64")
    RenderPreloadShader("SceneToonOutline2_TONE_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_DTL_TONE_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_ENV_LGT_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_TONE_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_ENV_TONE_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_VCOL_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_ENV_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_ENV_VCOL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("SceneToonOutline2_TONE_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_1SKN_DTL_TONE_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_VCOL_TONE_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_ENV_TONE_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_TOON_TONE_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_TONE_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "266")
    RenderPreloadShader("SceneToonOutline2_TONE_QLo.t3fxb", "256")
    RenderPreloadShader("Mesh_DTL_TONE_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_TONE_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_TOON_TONE_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "72")
    RenderPreloadShader("Mesh_LGT_DTL_TONE_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_TONE_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_ENV_VCOL_TONE_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_VCOL_TONE_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "327")
    RenderPreloadShader("SceneToonOutline2_CC_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "70")
    RenderPreloadShader("SceneToonOutline2_1SKN_CC_QLo.t3fxb", "64")
    RenderPreloadShader("SceneToonOutline2_CC_QLo.t3fxb", "320")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_DTL_CC_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_TOON_CC_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_CC_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "202")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_ENV_LGT_VCOL_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_ENV_VCOL_CC_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_DTL_CC_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_QLo.t3fxb", "71")
  end
end

local ConsoleStruggleBoost = function()
  if mbIsConsole then
    print(">>> Adjusting struggle values for console - CABLE <<<")
    kCableStruggleInitDecay = kCableStruggleInitDecay * kCableStruggleConsoleMulti
    kCableStruggleDecayBoost = kCableStruggleDecayBoost * kCableStruggleConsoleMulti
  end
  if mbIsConsole or IsPlatformVita() or IsPlatformAndroid() then
    print(">>> Adjusting struggle values for console - SCREWDRIVER <<<")
    kScrewdriverStruggleMashFailDelta = kScrewdriverStruggleMashFailDelta * kScrewdriverStruggleConsoleMulti
  end
end

local function CheckFirstZombieSelectability(propertyKey, bPropertyValue)
  if bPropertyValue then
    AgentSetProperty("ZombieShoeStore", "Game Selectable", false)
    Yield()
    if Reticle_IsEnabled() then
      Reticle_Enable(false)
    end
    Yield()
    LogicRemoveKeyCallback(propertyKey, CheckFirstZombieSelectability)
  end
end

local CableStruggleIncreaseZombieStrength = function()
  AgentSetProperty("struggle_cable", "Button Mash - Max Percentage", kCableStruggleMaxPercent)
  AgentSetProperty("struggle_cable", "Struggle - Max Time Between Mashes", kCableStruggleMaxMashTimeInt)
  local decay = kCableStruggleInitDecay
  local decayMulti = 1
  local increase = kCableStruggleInitIncrease
  local decayBoost = kCableStruggleDecayBoost
  local vk_q = tonumber("51", 16)
  AgentSetProperty("struggle_cable", "Button Mash - Rate of Decay", decay)
  AgentSetProperty("struggle_cable", "Button Mash - Rate of Increase", increase)
  Sleep(kCableStruggleDelayBeforeAdjusting)
  while SceneIsActive(kScene) and not AgentGetProperty("struggle_cable", "Struggle - Complete") do
    if AgentGetProperty("struggle_cable", "Button Mash - Current Percentage") > kCableStruggleDecayBoostMultiThreshold then
      decayMulti = kCableStruggleDecayBoostMulti
    else
      decayMulti = 1
    end
    if not mbIsConsole then
      if (IsPlatformPC() or IsPlatformMac()) and Input_UseCursor() and Input_IsVKeyPressed(vk_q) or IsPlatformIOS() and Input_UseCursor() then
        decayBoost = kCableStruggleDecayBoostKeyboard
      elseif (IsPlatformVita() or IsPlatformAndroid()) and Input_UseTouch() then
        decayBoost = kCableStruggleDecayBoostVitaTouch
      elseif IsPlatformVita() or IsPlatformAndroid() then
        decayBoost = kCableStruggleDecayBoostVitaController
      else
        decayBoost = kCableStruggleDecayBoost
      end
    end
    decay = decay + decayBoost * decayMulti
    AgentSetProperty("struggle_cable", "Button Mash - Rate of Decay", decay)
    increase = increase + kCableStruggleIncreaseBoost
    if increase > kCableStruggleIncreaseMin then
      AgentSetProperty("struggle_cable", "Button Mash - Rate of Increase", increase)
    else
      increase = kCableStruggleIncreaseMin
    end
    Sleep(kCableStruggleAdjustInterval)
    Yield()
  end
end

local TimedDelay = function(delay)
  if not delay or type(delay) ~= "number" then
    delay = 3
  end
  local curTime = GetTotalTime()
  local delayTime = curTime + delay
  local inc = 0
  while curTime < delayTime do
    inc = GetFrameTime() * SceneGetTimeScale(kScene)
    curTime = curTime + inc
    Yield()
  end
end

function HardwareStoreExterior_ShoeStoreZombieHit()
  local numActiveChores = #mShoeStoreZombieHitSoundsActive
  if numActiveChores == 0 then
    for key, value in pairs(kShoeStoreZombieHitSoundChores) do
      table.insert(mShoeStoreZombieHitSoundsActive, key, value)
    end
  end
  local index = 1
  local numChores = #mShoeStoreZombieHitSoundsActive
  local chore = ""
  if numChores > 0 then
    index = math.random(1, numChores)
    chore = mShoeStoreZombieHitSoundsActive[index]
    ChorePlay(chore, -1000)
    table.remove(mShoeStoreZombieHitSoundsActive, index)
    print("BONK! playing sound chore " .. tostring(chore))
  end
end

function HardwareStoreExterior_StartComicStoreTroyTimer()
  mDialogTroyTimer = Game_RunDialog("bg_timerTroyArrival", false)
  mControllerTroyTimer = Dialog_GetController(mDialogTroyTimer)
end

function HardwareStoreExterior_KillComicStoreExitTrigger()
  AgentSetProperty("trigger_dialog_tryToLeaveComicShop", "Trigger Enabled", false)
  if Game_GetMode() == eModeCutscene then
    ControllerPause(mControllerTroyTimer)
    while Game_GetMode() == eModeCutscene do
      Yield()
    end
    ControllerPlay(mControllerTroyTimer)
  end
end

function HardwareStoreExterior_ShelfSqueezeTriggeredClemDeath()
  Game_RunDialog("logic_shelfSqueezeDeath", false)
end

function HardwareStoreExterior_EnableComicStoreLookats(bEnable, subset)
  if bEnable == nil then
    bEnable = true
  end
  if subset then
    for key, value in pairs(kComicStoreLookats[subset]) do
      AgentSetProperty(value, "Game Selectable", bEnable)
    end
  else
    for key, value in pairs(kComicStoreLookats) do
      for key, value in pairs(value) do
        AgentSetProperty(value, "Game Selectable", bEnable)
      end
    end
  end
end

function HardwareStoreExterior_ShowShelfSqueezeHint()
  Notification_ShowTutorial("tut_shoeStoreShelfSqueeze", 0, 4.5)
end

function HardwareStoreExterior_MoveBehindShelf()
  local lastMoveTime = 0
  local curMoveTime = 0
  local curIdleTime = 0
  local inc = 0
  local panicTime = 0
  local panicRampDownInc = 0.01
  local bClemIsIdle = false
  local ZombieKillTriggerOn = function(delay)
    TimedDelay(delay)
    if Game_IsPlayMode() then
      AgentSetProperty("trigger_dialog_underShelfDeath_zombieShoeStore", "Trigger Enabled", true)
      print("** ZOMBIE KILL TRIGGER ON **")
    end
  end
  local PanicRampDown = function()
    local curPanicMeter = AgentGetProperty("logic_panicMeter", "Panic Meter - Timer")
    while not bClemIsIdle and curPanicMeter > 0 do
      AgentSetProperty("logic_panicMeter", "Panic Meter - Timer", curPanicMeter)
      curPanicMeter = curPanicMeter - panicRampDownInc
      Yield()
    end
    if not bClemIsIdle then
      AgentSetProperty("logic_panicMeter", "Panic Meter - Enabled", false)
    end
  end
  local KillWatch = function()
    while ChoredMovement_IsActive() do
      curMoveTime = ChoredMovement_GetTimePercent()
      while curMoveTime <= lastMoveTime do
        bClemIsIdle = true
        inc = GetFrameTime() * SceneGetTimeScale(kScene)
        curIdleTime = curIdleTime + inc
        panicTime = curIdleTime / kClemShelfMoveDeathTime
        AgentSetProperty("logic_panicMeter", "Panic Meter - Enabled", true)
        AgentSetProperty("logic_panicMeter", "Panic Meter - Timer", panicTime)
        if curIdleTime > kClemShelfMoveDeathTime then
          Game_RunDialog("logic_shelfSqueezeDeath", false)
          break
        end
        curMoveTime = ChoredMovement_GetTimePercent()
        Yield()
      end
      if bClemIsIdle then
        bClemIsIdle = false
        ThreadStart(PanicRampDown)
      end
      curIdleTime = 0
      lastMoveTime = curMoveTime
      Yield()
    end
  end
  Game_RunDialog("bg_backAwayFromZombie1", false)
  ThreadStart(ZombieKillTriggerOn, kClemShelfMoveZombieKillTriggerDelay)
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_shoeStoreInterior_choredMove_backAwayFromZombie1_1.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_clemGetsCaught")
  ChoredMovement_Start()
  Yield()
  mShelfSqueezeKillWatchThread = ThreadStart(KillWatch)
end

function HardwareStoreExterior_MoveBehindShelf_Abort()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "")
  Yield()
  ThreadKill(mShelfSqueezeKillWatchThread)
  ChoredMovement_Stop()
end

function HardwareStoreExterior_ClemBackingUpChorePlay(bPause, bInit)
  if bInit then
    mControllerClemBacksAwayFromZombie = ChorePlay("env_shoeStoreInterior_bg_clemBacksUp_1.chore")
  elseif bPause then
    ControllerPause(mControllerClemBacksAwayFromZombie)
    mControllerTimeClemBacksAwayFromZombie = ControllerGetTime(mControllerClemBacksAwayFromZombie)
  else
    ControllerPlay(mControllerClemBacksAwayFromZombie)
  end
end

function HardwareStoreExterior_ClemBackingUpHitWallCheck()
  return mControllerTimeClemBacksAwayFromZombie > kClemBackAwayTimeLimit
end

function HardwareStoreExterior_StruggleScrewdriverLoseOnPushback()
  local lastCheckMashPercent = 0
  local curCheckMashPercent = 0.5
  while Game_GetMode() == eModeStruggle do
    curCheckMashPercent = AgentGetProperty("struggle_screwdriver", "Button Mash - Current Percentage")
    if curCheckMashPercent > kScrewdriverStruggleMinMashToStartCheck and lastCheckMashPercent > curCheckMashPercent + kScrewdriverStruggleMashFailDelta then
      if Game_GetMode() == eModeStruggle then
        Struggle_Exit()
      end
    else
      lastCheckMashPercent = curCheckMashPercent
    end
    Sleep(0.1)
  end
  print("Screwdriver struggle -- IT'S OVER")
end

function HardwareStoreExterior_StruggleCableTimedWin(winDelay)
  local StruggleEndWatch = function()
    local winPercent = kCableStruggleVictoryEndPercent
    local curPercent = 1
    while Game_GetMode() == eModeStruggle do
      curPercent = AgentGetProperty("struggle_cable", "Button Mash - Current Percentage")
      if winPercent > curPercent then
        print("victory!")
        AgentSetProperty("struggle_cable", "Struggle - Won", true)
        Sleep(kCableStruggleVictoryLastDelay)
        if Game_GetMode() == eModeStruggle then
          Struggle_Exit()
        end
      end
      Yield()
    end
  end
  ThreadStart(CableStruggleIncreaseZombieStrength)
  mControllerStruggleCableLightChore = ChorePlay("env_shoeStoreInterior_bg_struggleCable_lighting_1.chore", -2000)
  ControllerSetLooping(mControllerStruggleCableLightChore, true)
  TimedDelay(winDelay)
  print(">>> moment of truth - struggle_cable - Troy's on his way! <<<")
  LogicSet("2 - Survived Cable Struggle", true)
  ThreadStart(StruggleEndWatch)
end

function HardwareStoreExterior_StruggleCableKillLighting()
  ControllerKill(mControllerStruggleCableLightChore)
end

function HardwareStoreExterior_StruggleLukeTimer(delay)
  TimedDelay(delay)
  if Game_GetMode() == eModeStruggle then
    Struggle_Exit()
  end
end

function HardwareStoreExterior_FakeStruggle(duration)
  AgentSetProperty("struggleFake", "Struggle - Complete", false)
  AgentSetProperty("struggleFake", "Struggle - Won", false)
  Struggle_Enter("struggleFake")
  TimedDelay(duration)
  Struggle_Exit()
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  local bRestoreNode = false
  if Game_GetDebug() then
    if LogicGet(kAct) == 2 then
      if LogicGet("2 - Entered Shoe Store") then
        Game_SetSceneDialog("env_shoeStoreInterior.dlog")
        bRestoreNode = true
        Yield()
      elseif LogicGet("2 - Trapped Behind Shelf") then
        LogicSet("2 - Entered Shoe Store", true)
        Game_SetSceneDialog("env_shoeStoreInterior.dlog")
        Game_SetSceneDialogNode("cs_clemSpotsMoreZombies")
        bRestoreNode = true
        Yield()
        Reticle_EnableCombatMode()
        AgentHide("Zombie1", false)
        AgentHide("Zombie2", false)
        AgentHide("Zombie3", false)
        AgentHide("ZombieArrow", false)
        AgentHide("obj_bucketNails_clementine", true)
      elseif LogicGet("2 - Grabbed at Comic Store") then
        LogicSet("2 - Entered Shoe Store", true)
        Game_SetSceneDialogNode("cs_exitShoreStore")
        bRestoreNode = true
        Yield()
        AgentHide("obj_bucketNails_clementine", true)
      end
    else
      Game_SetSceneDialog("env_comicStoreInterior")
      Game_SetSceneDialogNode("cs_lukeMissing")
      bRestoreNode = true
      Yield()
    end
  end
  Game_StartScene()
  ConsoleStruggleBoost()
  if IsPlatformIOS() or Input_UseTouch() then
    AgentSetProperty("cam_closeUp_grabSomething", "Pan Cam - Reticle Position Horizontal", 0.5)
    AgentSetProperty("cam_closeUp_grabSomething", "Pan Cam - Reticle Position Vertical", 0.5)
  else
    PropertyRemove(AgentGetProperties("cam_closeUp_grabSomething"), "Pan Cam - Reticle Position Horizontal")
    PropertyRemove(AgentGetProperties("cam_closeUp_grabSomething"), "Pan Cam - Reticle Position Vertical")
  end
  if bRestoreNode then
    Game_SetSceneDialogNode("cs_enter")
  end
  if LogicGet(kAct) == 2 then
    LogicAddKeyCallback("2 - Zombie Shoe Store 1 Too Close For Another Hit", CheckFirstZombieSelectability)
  elseif LogicGet(kAct) == 3 then
    for key, value in pairs(kShoeStoreSoundEmitters) do
      AgentSetProperty(value, "Sound - Volume", 0)
    end
  end
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function HardwareStoreExterior()
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
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "203_";
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
