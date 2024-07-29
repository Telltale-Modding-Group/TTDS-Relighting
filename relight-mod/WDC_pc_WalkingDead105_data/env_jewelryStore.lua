local kScript = "JewelryStore"
local kScene = "adv_jewelryStore"
local kCredits = "ui_closingcredits"
local kOverlay = "fx_overlayEyesBlink"
local kMashPercent = "Button Mash - Current Percentage"
local ClampStruggle = function(agentName, mashPercent)
  if mashPercent > 0.9 then
    AgentSetProperty(agentName, kMashPercent, 0.89)
  end
end
function JewelryStore()
  if Platform_IsIOS() then
    AgentSetProperty("cam_nav_ClemDecision", "Field of View", 41)
  end
  Mode(mode_Main)
  Mode_Push(mode_NoMovement)
  Navigate_Enable(false)
  SceneHide(kCredits, true)
  AgentHide(SceneGetSceneAgent(kOverlay), true)
  SceneHide(kOverlay, true)
  PropertyAddKeyCallback(AgentGetProperties("struggle_door"), kMashPercent, JewelryStore_ClampDoorStruggle)
  PropertyAddKeyCallback(AgentGetProperties("struggle_stand1"), kMashPercent, JewelryStore_ClampStandStruggle1)
  PropertyAddKeyCallback(AgentGetProperties("struggle_stand2"), kMashPercent, JewelryStore_ClampStandStruggle2)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState(true, true, true, "B")
  WDInventory_RemoveItem("Inventory - Cleaver")
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function JewelryStore_ClampDoorStruggle(key, value)
  ClampStruggle("struggle_door", value)
end
function JewelryStore_ClampStandStruggle1(key, value)
  ClampStruggle("struggle_stand1", value)
end
function JewelryStore_ClampStandStruggle2(key, value)
  ClampStruggle("struggle_stand2", value)
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
SceneAdd(kCredits)
SceneAdd(kOverlay)
