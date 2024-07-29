local kScript = "SavannahRiverStreet"
local kScene = "adv_savannahRiverStreet"
function RiverStreet_ForceIceAxeSelectable()
  while SceneIsActive(kScene) and not Logic.Dying and not AgentIsHidden("obj_toolIceClimber_World") and not AgentGetProperty("struggle_ManholeCover", "Struggle Finished") do
    print("Grab the ice axe, Lee!")
    AgentSetProperty("obj_toolIceClimber_World", "Game Selectable", true)
    Yield()
  end
end
function RiverStreet_HideTelescopeScene()
  Yield()
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function SavannahRiverStreet_PreLoadLeeHit()
end
function SavannahRiverStreet_PreLoadYouHaveToHelpUs()
end
function SavannahRiverStreet()
  Mode(mode_Main)
  if not Logic["2StreetFight - Begun"] then
    if SaveLoad_IsFromLoad() then
      SceneAdd("ui_overlay_telescope.scene")
      if not Logic["2RiverStreet- Successfully Operated Telescope"] then
        Yield()
        Print("hide the scene")
        SceneHide("ui_overlay_telescope.scene", true)
      end
      return
    else
      SceneAdd("ui_overlay_telescope.scene", "RiverStreet_HideTelescopeScene")
    end
  end
  if Logic["2RiverStreet - Spotted Molly"] then
    local sceneAgent = SceneGetSceneAgent(kScene)
    if sceneAgent then
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_savannahRiverStreet_act2Fight.dlog"
    end
  end
end
function SavannahRiverStreet_EnterTelescope()
  Game_EnterCloseUp("cam_panningTelescope")
  local closeUpCam = AgentFind("cam_panningTelescope")
  local reticleCamH = AgentFind("reticleCamH")
  if not reticleCamH then
    return
  end
  local function OnAnimTime(key, value)
    if SceneGetCamera(kScene) ~= closeUpCam or closeUpCam.mProps["Pan Cam - Percentage Desired Horizontal"] >= 0 then
      return
    end
    local timePercent = value / reticleCamH.mProps["NavCam - Animation Max Time"]
    if timePercent < 0.1 then
      Dialog_Play("cs_telescopeLooksFarLeft")
      PropertyRemoveKeyCallback(reticleCamH.mProps, "NavCam - Animation Time", OnAnimTime)
      Game_ExitCloseUp("cam_panningTelescope")
    end
  end
  PropertyAddKeyCallback(reticleCamH.mProps, "NavCam - Animation Time", OnAnimTime)
end
function SavannahRiverStreet_OnSneakEnd()
  Dialog_Play("cs_leeApprochesNewsstand")
end
function SavannahRiverStreet_PeekUp()
  Dialog_Play("cs_newsstandEmpty")
end
SceneOpen(kScene, kScript)
