require("OpeningCredits.lua")
local kScript = "BoardingSchoolExterior"
local kScene = "adv_boardingSchoolExterior"
local OnLogicReady = function()
  AgentSetState("Clementine", "headHatless")
end
function BoardingSchoolExterior()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  Load("env_boardingSchoolExterior_act1_amb_ajWalk_1.chore")
  Load("sk61_fingers_batmanGM200SplayA.anm")
  Load("env_boardingSchoolExterior_act1_cs_funerals_1.chore")
  Load("sk62_clementine400Walk_turnLeft90ToStandA.anm")
  Load("sk62_wd400GMStandA_lookBehindLeft_add.anm")
  Load("ruby_headEyeGesture_lookAwayLeftLong_add.anm")
  Load("sk35_idle_rosieSit.anm")
  Load("sk61_louisStandA_weightShiftB_add.anm")
  Load("sk62_violetArmsX_quickBreath_add.anm")
  Load("sk62_clementine400StandA_weightShiftD_add.anm")
  Load("tennyson_headEyeGesture_lookAwayLeftLong_add.anm")
  Load("violet_phoneme_SH_sadA.anm")
  Load("env_boardingSchoolExterior_act1_bg_funeral_1.chore")
  Load("sk62_clementine400StandA_coupleStepsForward.anm")
  Load("violet_headEyeGesture_lookAwayRightLong_add.anm")
  Load("violet_headEyeGesture_eyeDartGlanceRight_add.anm")
  Load("violet_headGesture_nodYesQuick_add.anm")
  Load("ruby_headEyeGesture_eyeDartGlanceRight_add.anm")
  Load("sk61_louisStandA_lookBehindLeft_add.anm")
  Load("sk61_louisStandA_weightShiftDShort_add.anm")
  Load("violet_headEyeGesture_lookAwayLeftLong_add.anm")
  Load("sk62_clementine400StandA_normalBreath_add.anm")
end
function BoardingSchoolExterior_WaitForLine()
  local initialID = Subtitle_GetCurrentID()
  if initialID == -1 then
    return
  end
  while initialID == Subtitle_GetCurrentID() do
    WaitForNextFrame()
  end
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
