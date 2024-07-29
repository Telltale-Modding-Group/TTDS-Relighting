local kScript = "FlagshipInteriorEscape"
local kScene = "adv_flagshipInterior"
local OnLogicReady = function()
  Game_SetSceneDialog("env_flagshipInterior_escape_102.dlog")
end
function FlagshipInteriorEscape()
  Game_NewScene(kScene, kScript)
  if LogicGet("Episode 101 - Zach is Dead") then
    ShaderOverrideTexture("Zachary", "sk54_zachary_head.d3dtx", "sk54_zachary_headGunshot.d3dtx")
    ShaderOverrideTexture("Samantha", "sk55_samantha_BodyUpper.d3dtx", "sk55_samantha_bodyUpperGregSplatter.d3dtx")
    ShaderOverrideTexture("Samantha", "sk55_samantha_head.d3dtx", "sk55_samantha_headGregSplatter.d3dtx")
  elseif LogicGet("Episode 101 - Punched Zach") then
    ShaderOverrideTexture("Zachary", "sk54_zachary_head.d3dtx", "sk54_zachary_headBruised.d3dtx")
  end
  AgentSetProperty("Greg", "Mesh sk54_greg_head - Visible", false)
  AgentSetProperty("Greg", "Mesh sk54_greg_eyesMouth - Visible", false)
  AgentSetProperty("Greg", "Mesh sk54_greg_bodyUpper - Visible", false)
  AgentSetProperty("Greg", "Mesh sk54_greg_bodyUpperZombie - Visible", true)
  ShaderOverrideTexture("Greg", "sk54_greg_bodyUpperZombie.d3dtx", "sk54_gregZombie_bodyUpperZombieBrained.d3dtx")
  if LogicGet("Episode 101 - Weapon") == "screwdriver" then
    AgentSetProperty("Greg", "Mesh sk54_greg_headZombieScrewdriver - Visible", true)
    local punchCount = LogicGet("Episode 101 - Greg Punch Count")
    if punchCount == "one" then
      ShaderOverrideTexture("Greg", "sk54_greg_headZombieScrewdriver.d3dtx", "sk54_greg_headZombieScrewdriverBeatenPunchB.d3dtx")
    elseif punchCount == "two" then
      ShaderOverrideTexture("Greg", "sk54_greg_headZombieScrewdriver.d3dtx", "sk54_greg_headZombieScrewdriverBeatenPunchC.d3dtx")
    else
      ShaderOverrideTexture("Greg", "sk54_greg_headZombieScrewdriver.d3dtx", "sk54_greg_headZombieScrewdriverBeatenPunchA.d3dtx")
    end
  else
    AgentSetProperty("Greg", "Mesh sk54_greg_headZombieDamagedB - Visible", true)
  end
  Game_StartScene(true)
end
Callback_OnLogicReady:Add(OnLogicReady)
SceneOpen(kScene, kScript)
