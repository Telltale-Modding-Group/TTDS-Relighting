local kScript = "Chapter5B"
local kScene = "adv_truckStopCh5"
function Chapter5B()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if Logic["5 - Killed Prisoner"] then
    for i = 21, 23 do
      WalkBoxesDisableTri(kScene, i)
    end
  end
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic["2 - Complete"] and not Logic["2 - Left Eddie"] then
    AgentHide("obj_carEddieLowPoly", false)
  end
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_choice", "Pan Cam - Enabled", false)
  end
  local SetFinale = function()
    Logic["5 - Done with Prisoner"] = true
    Logic["5 - Left RV"] = true
    AgentSetProperty(SceneGetSceneAgent(kScene), "Dialog Agent - File Primary", "env_truckStopCh5_finale.dlog")
    AgentSetProperty("Shel", kMesh, "sk55_shel.d3dmesh")
    AgentSetProperty("Becca", kMesh, "sk55_becca.d3dmesh")
  end
  if Logic["5 - Done with Prisoner"] then
    Dialog_Play("logic_startFinale")
    return
  end
  if Logic["5 - Left RV"] then
    SetFinale()
    Dialog_Play("cs_romanEnters3")
    return
  end
  if Logic["5 - Know About Stephanie"] then
    SetFinale()
    Dialog_Play("use_drawer")
    CameraActivate("cam_rv")
    return
  end
  if AllowIntroCutscenes() then
    RenderDelay(1)
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
SceneAdd("ui_chaptercredits")
