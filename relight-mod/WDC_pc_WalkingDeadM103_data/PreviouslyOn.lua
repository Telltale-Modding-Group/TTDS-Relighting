require("SceneLoader.lua")
local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOnWDM103"
local PreloadAssets = function()
end
function PreviouslyOn_RandallDamage()
  if AgentExists("Randall") then
    if not LogicGet("Episode 102 - Tightened Vice On Randall Hands Once") and not LogicGet("Episode 102 - Tightened Vice On Randall Hands Twice") then
      if AgentGetName(SceneGetSceneAgent(AgentGetScene("Randall"))) == "adv_johnsHouseGarage.scene" then
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_hands - Visible", true)
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_handsCrushedB - Visible", false)
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_handsCrushedC - Visible", false)
      end
      ShaderOverrideTexture("Randall", "sk54_randall_hands.d3dtx", "sk54_randall_headCrushedA.d3dtx")
      AgentSetProperty("Randall", "Mesh sk54_randall_hands - Visible", true)
      AgentSetProperty("Randall", "Mesh sk54_randall_handsCrushedB - Visible", false)
      AgentSetProperty("Randall", "Mesh sk54_randall_handsCrushedC - Visible", false)
    end
    if LogicGet("Episode 102 - Tightened Vice On Randall Hands Once") and not LogicGet("Episode 102 - Tightened Vice On Randall Hands Twice") then
      if AgentGetName(SceneGetSceneAgent(AgentGetScene("Randall"))) == "adv_johnsHouseGarage.scene" then
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_hands - Visible", false)
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_handsCrushedB - Visible", true)
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_handsCrushedC - Visible", false)
      end
      AgentSetProperty("Randall", "Mesh sk54_randall_hands - Visible", false)
      AgentSetProperty("Randall", "Mesh sk54_randall_handsCrushedB - Visible", true)
      AgentSetProperty("Randall", "Mesh sk54_randall_handsCrushedC - Visible", false)
    end
    if LogicGet("Episode 102 - Tightened Vice On Randall Hands Twice") then
      if AgentGetName(SceneGetSceneAgent(AgentGetScene("Pete"))) == "adv_johnsHouseGarage.scene" then
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_hands - Visible", false)
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_handsCrushedB - Visible", false)
        AgentSetProperty("Randall", "Mesh sk54_randallArmsRaised_handsCrushedC - Visible", true)
      end
      AgentSetProperty("Randall", "Mesh sk54_randall_hands - Visible", false)
      AgentSetProperty("Randall", "Mesh sk54_randall_handsCrushedB - Visible", false)
      AgentSetProperty("Randall", "Mesh sk54_randall_handsCrushedC - Visible", true)
    end
  end
  if AgentExists("Randall") and not AgentHasProperty("Randall", "Mesh sk54_randallArmsRaised_head - Visible") then
    if LogicGet("Episode 102 - Hit Randall With Wrench Once But Didn't Kill Him?") then
      ShaderOverrideTexture("Randall", "sk54_randall_head.d3dtx", "sk54_randall_headTableSlamWrench.d3dtx")
      ShaderOverrideTexture("Randall", "sk54_randall_hair.d3dtx", "sk54_randall_hairTableSlamWrench.d3dtx")
      ShaderOverrideTexture("Randall", "sk54_randall_bodyUpper.d3dtx", "sk54_randall_bodyUpperTableSlamWrench.d3dtx")
      ShaderOverrideTexture("Randall", "sk_wdSharedParts_eye_blueHazelMini.d3dtx", "sk_wdSharedParts_eye_blueHazelMiniBloodshot.d3dtx")
    else
      ShaderOverrideTexture("Randall", "sk54_randall_head.d3dtx", "sk54_randall_headTableSlam.d3dtx")
      ShaderOverrideTexture("Randall", "sk_wdSharedParts_mouth.d3dtx", "sk_wdSharedParts_mouthBloody.d3dtx")
      ShaderOverrideTexture("Randall", "sk_wdSharedParts_eye_blueHazelMini.d3dtx", "sk_wdSharedParts_eye_blueHazelMiniBloodshot.d3dtx")
    end
  end
end
function PreviouslyOn()
  Game_NewScene(kScene, kScript)
  SceneAdd("ui_previouslyOn.scene")
  Navigate_Enable(false)
  if not Game_GetDebug() then
    PersistentLogic_SetGameLogic()
  end
  PreloadAssets()
  SceneLoader_Init()
  Game_StartScene()
end
SceneOpen(kScene, kScript)
