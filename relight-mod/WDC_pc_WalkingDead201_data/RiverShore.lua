local kScript = "RiverShore"
local kScene = "adv_riverShore"
local envMeshes = {}
envMeshes.shoreline = {
  "group_shoreline",
  "obj_canoeBrokenRiverShore"
}
envMeshes.trail = {
  "group_trail"
}
envMeshes.trailLower = {
  "group_trailLower"
}
envMeshes.trailUpper = {
  "group_trailUpper"
}
envMeshes.forestFloor = {
  "group_forestFloor"
}
local mCurrentEnv
local PreloadAssets = function()
  PreLoad("env_riverShore_cs_wind_1.chore")
  PreLoad("env_riverShore_cs_crowsOnSign_1.chore")
  PreLoad("env_riverShore_cs_crowsFlyOver_1.chore")
  PreLoad("env_riverShore_cs_pathTransition_1.chore")
  PreLoad("env_riverShore_trigger_toForestFloor_2.chore")
end
function RiverShore_SetEnvironment(state)
  local hideEnv = function(env)
    for key, value in pairs(env) do
      if AgentHasProperty(value, "Group - Visible") then
        AgentSetProperty(value, "Group - Visible", false)
        local groupChildren = AgentGetChildren(value)
        for key, value in pairs(groupChildren) do
          if AgentHasProperty(value, "Trigger Enabled") then
            AgentSetProperty(value, "Trigger Enabled", false)
          end
        end
      else
        AgentHide(value, true)
        if AgentHasProperty(value, "Trigger Enabled") then
          AgentSetProperty(value, "Trigger Enabled", false)
        end
      end
    end
  end
  local meshesToShow
  for key, value in pairs(envMeshes) do
    if state == key then
      meshesToShow = envMeshes[state]
      break
    end
  end
  if not meshesToShow then
    print("RiverShore_SetEnvironment() didn't get a valid state!")
    return
  elseif mCurrentEnv == meshesToShow then
    print("RiverShore_SetEnvironment(): " .. tostring(meshesToShow) .. " is already active! Nothing to do!")
    return
  end
  if not mCurrentEnv then
    for key, value in pairs(envMeshes) do
      hideEnv(value)
    end
  else
    hideEnv(mCurrentEnv)
  end
  for key, value in pairs(meshesToShow) do
    if AgentHasProperty(value, "Group - Visible") then
      AgentSetProperty(value, "Group - Visible", true)
      local groupChildren = AgentGetChildren(value)
      for key, value in pairs(groupChildren) do
        if AgentHasProperty(value, "Trigger Enabled") then
          AgentSetProperty(value, "Trigger Enabled", true)
        end
      end
    else
      AgentHide(value, false)
      if AgentHasProperty(value, "Trigger Enabled") then
        AgentSetProperty(value, "Trigger Enabled", true)
      end
    end
  end
  mCurrentEnv = meshesToShow
end
function RiverShore_MakeAllObjsUnselectable()
  for key, value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end
function RiverShore_MoveCanoe()
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_use_canoe_13.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_use_canoe_CM_outro")
  ChoredMovement_Start()
  ChoredMovement_ReverseControls(true)
end
function RiverShore_WalkThroughUnderbrush(pathArea)
  if pathArea == "lower" then
    print("RiverShore_WalkThroughUnderbrush(): LOWER")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_cs_pathTransition_1.chore")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "trigger_toForestFloor")
    ChoredMovement_Start()
    ChoredMovement_ReverseControls(false)
  elseif pathArea == "upper" then
    print("RiverShore_WalkThroughUnderbrush(): UPPER")
  else
    print("RiverShore_WalkThroughUnderbrush() didn't get a valid area!")
  end
end
function RiverShore_StartWalkAcrossLandslide(pathArea)
  if pathArea == "lower" then
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_choredMove_beforeLandslide_lower_1.chore")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "logic_prepForestFloor")
    ChoredMovement_Start()
    ChoredMovement_ReverseControls(false)
  elseif pathArea == "upper" then
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_choredMove_beforeLandslide_upper_1.chore")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "logic_prepForestFloor")
    ChoredMovement_Start()
    ChoredMovement_ReverseControls(false)
  else
    print("RiverShore_StartWalkAcrossLandslide() didn't get a valid area!")
  end
end
function RiverShore()
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
  end
  if IsPlatformAndroid() then
    AgentSetProperty("cam_nav_shore", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_trailTileLowerC", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_trailTileLowerFork", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_forestFloor", "Pan Cam - Dampening", 2)
  end
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_openingCredits")
