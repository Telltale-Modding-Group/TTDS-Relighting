local kScript = "ManorExteriorDay"
local kScene = "adv_manorExterior_day"
function ManorExteriorDay_PreLoadZombieBite()
end
function ManorExteriorDay()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  local sceneAgent = SceneGetSceneAgent(kScene)
  if sceneAgent then
    if Logic["2ClemSearch - Found Boat"] then
      AgentSetProperty("trigger_cam_nearBoatHouse", "Trigger Enabled", false)
      AgentHide("Ben", Logic["3BellTower - Ben Dead"])
      ChorePlay("light_manorExteriorDay_discoverBoatSwitch.chore")
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_manorExterior_act4.dlog"
      SceneSetWalkBoxes(kScene, "adv_manorExterior_act4.wbox")
    elseif Logic["2ClemSearch - Entered Backyard"] then
      AgentSetProperty("trigger_cam_nearBoatHouse", "Trigger Enabled", false)
      ChorePlay("light_manorExteriorDay_discoverBoatSwitch.chore")
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_manorExterior_act2BoatDiscovery.dlog"
    elseif Logic["1ManorAttic - Zombie Boy Dead"] then
      AgentSetProperty("trigger_cam_nearBoatHouse", "Trigger Enabled", false)
      ChorePlay("light_manorExteriorDay_burialSwitch.chore")
      sceneAgent.mProps["Dialog Agent - File Primary"] = "env_manorExterior_act1Ending.dlog"
    end
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
local biteChore
function ManorExteriorDay_InitialBiteDecision(bSet)
  local onSelect = function(choice)
    local index = DlgGetObjUserPropsValue(choice.Dlog, choice["Choice Object ID"], "Preferred Button Assignment")
    Logic["4FindClem - Bite Decision Chore Currently Playing"] = true
    if index == 2 then
      Logic["4FindClem - Initially Chose To Reveal Bite"] = true
      biteChore = ChorePlay("env_manorexterior_act4_cs_leehidesorshowsbite_2.chore")
      ControllerSetPriority(biteChore, 9999)
      Print("Don't hide bite.")
      WDNotifyChoice("InitialBiteShow", 1, 5)
    elseif index == 3 then
      Logic["4FindClem - Hid Bite"] = true
      biteChore = ChorePlay("env_manorexterior_act4_cs_leehidesorshowsbite_1.chore")
      ControllerSetPriority(biteChore, 9999)
      Print("Hide bite.")
      WDNotifyChoice("InitialBiteHide", 1, 5)
    end
    local thread = function()
      while ControllerIsPlaying(biteChore) do
        Yield()
      end
      Print("done playing bite chore")
      Logic["4FindClem - Bite Decision Chore Currently Playing"] = false
    end
    ThreadStart(thread)
  end
  if bSet then
    Callback_OnChoiceInit:Add(onSelect)
  else
    ControllerKill(biteChore)
    biteChore = nil
    Callback_OnChoiceInit:Remove(onSelect)
  end
end
function ManorExteriorDay_KennyScore()
  local shawnDuck = Logic["ShawnDuck Choice"] == "duck" and 2 or 0
  local larryArgument = Logic["Sided With Kenny"] == "true" and 1.5 or 0
  local lillyArgument102 = not ChoiceTracker_ChoiceWasMade(102, "env_motorinn_backatthemotel_cs_argument_8") and 0.75 or 0
  local killLarry = Logic["Helped Kill Larry"] == "true" and 1.5 or 0
  local shootBeatrice = Logic["Shot Beatrice"] == "false" and 0.75 or 0
  local lillyArgument103 = not (ChoiceTracker_ChoiceWasMade(103, "env_motelroominterior_cs_argumentlilly_7") or ChoiceTracker_ChoiceWasMade(103, "env_motelroominterior_cs_argumentkenny_7")) and 0.75 or 0
  local killDuck = Logic["Kill Duck Choice"] ~= "kenny" and 2 or 0
  local zombieBoy = Logic["1ManorAttic - Lee Killed Zombie"] and 0.75 or 0
  local benChoices = 0
  if Logic["3BellTower - Ben Dead"] then
    if Logic["3BellTower - Told Kenny about Ben"] then
      benChoices = 2
    elseif not Logic["3Classroom - Supported Ben"] then
      benChoices = 1
    end
  end
  return shawnDuck + larryArgument + lillyArgument102 + killLarry + shootBeatrice + lillyArgument103 + killDuck + zombieBoy + benChoices
end
SceneOpen(kScene, kScript)
