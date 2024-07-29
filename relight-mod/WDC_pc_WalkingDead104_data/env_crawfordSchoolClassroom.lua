local kScript = "CrawfordSchoolClassroom"
local kScene = "adv_crawfordSchoolClassroom"
function CrawfordSchoolClassroom()
  Mode(mode_Main)
  if Logic["3Battery - Entered Auto Shop"] then
    ShaderOverrideTexture("Molly", "sk55_molly_backpack", "sk55_molly_backpackDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_face", "sk55_molly_faceDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_bodyhoodup", "sk55_molly_bodyHoodUpDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_masks", "sk55_molly_masksDocsBloodHitB.d3dtx")
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  AgentHide("Clementine", not Logic["2CrawfordDiscussion - Bring Clementine"])
  local sceneAgent = SceneGetSceneAgent(kScene)
  if sceneAgent then
    if Logic["3Battery - Finished"] and Logic["3Fuel - Finished"] and Logic["3Medicine - Finished"] then
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_crawfordSchoolClassroom_act3Confrontation.dlog"
      AgentHide("Molly", Logic["3Hallway - Molly Dead"])
      ChorePlay("light_crawfordSchoolClassroom_sunrise.chore")
    elseif Logic["3Classroom - Entered Classroom"] then
      AgentHide("Kenny", not Logic["3Fuel - Finished"])
      AgentHide("Brie", not Logic["3Fuel - Finished"])
      AgentHide("Christa", not Logic["3Medicine - Finished"])
      AgentHide("Vernon", not Logic["3Medicine - Finished"])
    end
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
