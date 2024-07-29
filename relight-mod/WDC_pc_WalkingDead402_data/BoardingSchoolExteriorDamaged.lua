require("AI_PlayerProjectile.lua")
local kScript = "BoardingSchoolExteriorDamaged"
local kScene = "adv_boardingSchoolExteriorDamaged"
local mbAnimatingTextColors = false
local mbClementineWillBurn = false
local OnLogicReady = function()
  if IsPlatformNX() then
    for _, agentName in ipairs(SceneGetAgentNames(Game_GetScene())) do
      if StringStartsWith(agentName, "Zombie") then
        AgentSetProperty(agentName, "Render EnvLight Shadow Cast Enable", false)
      elseif StringStartsWith(agentName, "light_ENV_P_fire") or StringStartsWith(agentName, "light_ENV_P_torch") or StringStartsWith(agentName, "light_ENV_P_campfire") then
        AgentSetProperty(agentName, "EnvLight - Shadow Type", "eLightEnvShadowType_None")
      end
    end
  end
  if Game_GetLoaded() then
    return
  end
  Episode_SetAbelArm()
  Episode_SetAJShirt()
  Episode_SetLouisDamage()
  Episode_SetZombieGrave()
  AgentSetState("Abel", "noseBloody")
  AgentSetState("Abel", "footStab")
  if LogicGet("3 - Slashed Abel's Hand") then
    AgentSetState("Abel", "handSlash")
  end
  AgentSetState("Horse", "ReinsOff")
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("cs_leftGateOpen")
  end
end
function BoardingSchoolExteriorDamaged_ClemLeaveTrigger(agent, trigger)
  if AgentGetName(agent) ~= "Clementine" then
    return
  else
    mbClementineWillBurn = false
  end
end
function BoardingSchoolExteriorDamaged_BurnThisZombie(agent, trigger)
  if not agent then
    return
  end
  if AgentGetName(agent) == "Clementine" then
    AgentSetProperty("ui_panicMeter_vignette", "Render Constant Alpha", 0)
    AgentHide("ui_panicMeter_vignette", false)
    mbClementineWillBurn = true
    local past = GetTotalTime()
    local present = past
    local future = present + 3
    while present < future and mbClementineWillBurn do
      present = present + GetFrameTime()
      AgentSetProperty("ui_panicMeter_vignette", "Render Constant Alpha", Clamp(present - past / future - past + 0.3, 0, 1))
      WaitForNextFrame()
    end
    while Game_GetMode() == eModeCutscene and mbClementineWillBurn do
      WaitForNextFrame()
      WaitForNextFrame()
    end
    if mbClementineWillBurn and AgentGetProperty("Clementine", "AI Player - AI Agents Active") then
      local incr = 1
      local kStr = "trigger_zombiesCatchFire0"
      mbClementineWillBurn = false
      while AgentExistsInScene(kStr .. incr, AgentGetScene(agent)) do
        AgentSetProperty(kStr .. incr, "Trigger Enabled", false)
        incr = incr + 1
        WaitForNextFrame()
      end
      local check = Game_RunSceneDialog("cs_clemDiesByFire")
      if not check then
        print("\"cs_clemDiesByFire\" does not exist! Fix it, fix it, fix it.")
        return
      end
    else
      local bsGarbage = AgentGetProperty("ui_panicMeter_vignette", "Render Constant Alpha")
      while bsGarbage > 0 do
        bsGarbage = bsGarbage - 0.04
        if bsGarbage < 0 then
          AgentHide("ui_panicMeter_vignette", true)
        end
        AgentSetProperty("ui_panicMeter_vignette", "Render Constant Alpha", bsGarbage)
        WaitForNextFrame()
      end
      AgentSetProperty("ui_panicMeter_vignette", "Render Constant Alpha", 0)
      WaitForNextFrame()
    end
  elseif StringStartsWith(AgentGetName(agent), "Zombie") then
    if not AgentGetProperty(agent, "AI Agent - Player Used Interaction Prompt 1 Enable") then
      return
    end
    local zombieController = ChorePlayOnAgent("adv_boardingSchoolExteriorDamaged_zombieCatchesFire.chore", agent)
    while AgentHasProperty(agent, "AI Agent - Dead") and not AgentGetProperty(agent, "AI Agent - Dead") do
      WaitForNextFrame()
    end
    ControllerKill(zombieController)
    WaitForNextFrame()
    local value = AgentGetProperty(agent, "Emitters - Global Intensity")
    while value and value > 0 do
      value = value - 0.02
      WaitForNextFrame()
      AgentSetProperty(agent, "Emitters - Global Intensity", value)
    end
    AgentSetProperty(agent, "Emitters - Global Intensity", 0)
    AgentSetProperty(agent, "Emitters - Enabled", false)
  else
    return
  end
end
function BoardingSchoolExteriorDamaged()
  DlgPreloadAll(Game_GetPlayerDialog(), false)
  SceneAdd("ui_panicMeter.scene")
end
function BoardingSchoolExteriorDamaged_EndEpisode()
  WDAchievements_Unlock("achievement_21")
  Menu_EndEpisode("402", false)
  Menu_EndEpisode_CheckUpsell("403")
end
function BoardingSchoolExteriorDamaged_AnimateTextColor(tokenAgent, textAgent)
  local thread = function()
    local kTokenAlpha = "material_ui_useable_token_actionActive_m - Alpha"
    local chore = ChorePlayOnAgent("ui_activeCrosshairText_fade.chore", textAgent)
    ControllerPause(chore)
    while mbAnimatingTextColors do
      local pct = 0
      if AgentGetProperty(tokenAgent, "material_ui_useable_token_actionActive_m - Visible") then
        pct = AgentGetProperty(tokenAgent, kTokenAlpha)
      end
      ControllerSetTime(chore, pct)
      WaitForNextFrame()
    end
    ControllerKill(chore)
  end
  ThreadStart(thread)
end
function BoardingSchoolExteriorDamaged_SetAnimatingTextColors(bEnable)
  if bEnable == mbAnimatingTextColors then
    return
  end
  mbAnimatingTextColors = bEnable
end
Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)
