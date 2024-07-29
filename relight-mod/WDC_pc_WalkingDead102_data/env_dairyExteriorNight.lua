require("Rain.lua")
local kScript = "DairyExteriorNight"
local kScene = "adv_dairyExteriorNight"
local mThreadMovementMonitor
local PunchReticleUpdate = function()
  Print("Updating Reticle!")
  Reticle_Update(true)
end
local MovementMonitor = function()
  while true do
    Yield()
    if mode_Chored_Movement.bActive and ChoredMovement_GetMoveDir() ~= 0 then
      Dialog_Play("cs_brendaKillsLee", nil, nil, "dairyMainHouseInterior_lee_brenda")
      return
    end
  end
end
local OnPointGun = function(key, value)
  if mThreadMovementMonitor then
    ThreadKill(mThreadMovementMonitor)
    mThreadMovementMonitor = nil
  end
  if value then
    mThreadMovementMonitor = ThreadStart(MovementMonitor)
  end
end
function DairyExteriorNight()
  Mode(mode_Main)
  Main_AllowMovement(false)
  local logicProps = AgentGetProperties("logic_game")
  PropertyAddKeyCallback(logicProps, "3AndyFight - Left Punch Ready", PunchReticleUpdate)
  PropertyAddKeyCallback(logicProps, "3AndyFight - Right Punch Ready", PunchReticleUpdate)
  if not Logic["3Rescue - Complete"] then
    PropertyAddKeyCallback(logicProps, "3Rescue - Gun Pointed At Lee", OnPointGun)
  end
  Rain("fx_rainSphereWD")
  if not Platform_IsPC() then
    AgentSetProperty("fx_rainSphereWD", "fx_rainHeavyWD - Visible", false)
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  if IsToolBuild() then
    if Logic["3Rescue - Debug to Rescue"] then
      Dialog_Play("logic_selectablesOff")
      Dialog_Play("cs_runToHouse")
      return
    end
    if Logic["3AndyFight - DebugToKillChoice"] then
      Dialog_Play("logic_selectablesOff")
      Dialog_Play("choice_Setup")
      return
    end
  end
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Dairy Exterior Night")
      DlgPreload("env_dairyExterior_TrappingAndy.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
local kNoseDamage = {
  "Mesh sk54_andy_nose - Visible",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "Mesh sk54_andy_noseDamageA - Visible",
  "",
  "Mesh sk54_andy_noseDamageB - Visible",
  "",
  "Mesh sk54_andy_noseDamageC - Visible",
  "",
  ""
}
local kTeethDamage = {
  "Mesh sk54_andy_teeth - Visible",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "Mesh sk54_andy_teethDamaged - Visible"
}
local kLeftEyeDamage = {
  "Mesh sk54_andy_eyeLeft - Visible",
  "Mesh sk54_andy_eyeLeftDamageA - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_eyeLeftDamageB - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_eyeLeftDamageC - Visible",
  "",
  "",
  "",
  "",
  ""
}
local kLeftMouthDamage = {
  "Mesh sk54_andy_mouthLeft - Visible",
  "",
  "",
  "Mesh sk54_andy_mouthLeftDamageA - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_mouthLeftDamageB - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_mouthLeftDamageC - Visible",
  "",
  "",
  ""
}
local kRightEyeDamage = {
  "Mesh sk54_andy_eyeRight - Visible",
  "Mesh sk54_andy_eyeRightDamageA - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_eyeRightDamageB - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_eyeRightDamageC - Visible",
  "",
  "",
  "",
  "",
  ""
}
local kRightMouthDamage = {
  "Mesh sk54_andy_mouthRight - Visible",
  "",
  "",
  "Mesh sk54_andy_mouthRightDamageA - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_mouthRightDamageB - Visible",
  "",
  "",
  "",
  "Mesh sk54_andy_mouthRightDamageC - Visible",
  "",
  "",
  ""
}
local DamageFacePart = function(keyTable, punchNumber)
  if keyTable[punchNumber] == "" then
    return
  end
  for i = 1, punchNumber - 1 do
    if keyTable[i] ~= "" then
      AgentSetProperty("Andy", keyTable[i], false)
    end
  end
  AgentSetProperty("Andy", keyTable[punchNumber], true)
end
function AndyFight_DamageFace(bLeftSide)
  local totalPunches = Logic["3AndyFight - FacePunches"]
  DamageFacePart(kNoseDamage, totalPunches)
  DamageFacePart(kTeethDamage, totalPunches)
  if bLeftSide then
    local thisSidePunches = Logic["3AndyFight - FacePunchesLeft"]
    DamageFacePart(kRightEyeDamage, thisSidePunches)
    DamageFacePart(kRightMouthDamage, thisSidePunches)
  else
    local thisSidePunches = Logic["3AndyFight - FacePunchesRight"]
    DamageFacePart(kLeftEyeDamage, thisSidePunches)
    DamageFacePart(kLeftMouthDamage, thisSidePunches)
  end
end
SceneOpen(kScene, kScript)
