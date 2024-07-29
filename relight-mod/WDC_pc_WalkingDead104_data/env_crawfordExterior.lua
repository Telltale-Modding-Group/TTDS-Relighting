local kScript = "CrawfordExterior"
local kScene = "adv_crawfordExterior"
function CrawfordExterior_PeekUp()
  Mode_Pop(mode_peek)
  Dialog_Play("cs_climbOut")
end
function CrawfordExterior_PreLoadAxeZombie()
end
function CrawfordExterior()
  if Input_IsUsingTouch() then
    local rot = AgentGetRot("cam_nav_shackInterior_parent")
    rot.x = -7
    AgentSetRot("cam_nav_shackInterior_parent", rot)
  end
  Mode(mode_Main)
  if Logic["3Battery - Entered Auto Shop"] then
    ShaderOverrideTexture("Molly", "sk55_molly_backpack", "sk55_molly_backpackDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_face", "sk55_molly_faceDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_bodyhoodup", "sk55_molly_bodyHoodUpDocsBloodHitB.d3dtx")
    ShaderOverrideTexture("Molly", "sk55_molly_masks", "sk55_molly_masksDocsBloodHitB.d3dtx")
  end
  if Logic["3Classroom - Entered Classroom"] then
    if SaveLoad_IsFromLoad() then
      return
    end
    local sceneAgent = SceneGetSceneAgent(kScene)
    if sceneAgent then
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_crawfordExterior_act3Alleyway.dlog"
    end
  else
    if SaveLoad_IsFromLoad() then
      return
    end
    AgentHide("Clementine", not Logic["2CrawfordDiscussion - Bring Clementine"])
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
