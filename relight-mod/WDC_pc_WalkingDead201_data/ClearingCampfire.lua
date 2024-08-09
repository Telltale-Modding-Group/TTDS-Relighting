--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| INCLUDES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we include the relight include file, and this file will include all of the dependencies with the relight mod.
--This also includes the Telltale Lua Script Extensions (TLSE) backend as well with all of it's core files + development tools.

require("RELIGHT_Include.lua");

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE SCENE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here telltale declares these two variables at the top of every level script.
--NOTE: That we are only intrested in kScene which is a reference to the actual scene file.
--This is CRITICAL as getting a reference to it means we can do everything that we need to do in the scene.

local kScript = "ClearingCampfire"
local kScene = "adv_clearingCampfire"

--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| CUSTOM VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--Here we declare our own variables related to Relight and Telltale Lua Script Extensions (TLSE) development tools.
--NOTE: These are declared globally so they can be used throughout all scripts.

--Telltale Lua Script Extensions (TLSE) Development variables
TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene .. ".scene";
TLSE_Development_FreecamUseFOVScale = false;

--Relight variables
RELIGHT_SceneObject = kScene;
RELIGHT_SceneObjectAgentName = kScene .. ".scene";
RelightConfigLevel = RelightConfigData_Season2.Level_201_ClearingCampfire;

--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| TELLTALE LEVEL LOGIC ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is alot of the original (decompiled) telltale lua script logic for the level.
--We are leaving this untouched because we still want the level to function normally as intended.

local kDragHintDelay = 0.5
local mbIsKindlingBurning = false
local mBanterDialogID
local multiAgents = {}
multiAgents.kindling = {}
multiAgents.kindling.agents = {
  "obj_kindlingClearingCampfire",
  "obj_kindlingClearingCampfire_clementineWristL"
}

multiAgents.kindling.lastUpdateTime = -1
multiAgents.lighter = {}
multiAgents.lighter.agents = {
  "obj_lighterWD",
  "obj_lighterWD_clementine",
  "obj_lighterWD_christa"
}

multiAgents.lighter.lastUpdateTime = -1
multiAgents.backpack = {}
multiAgents.backpack.agents = {
  "obj_backpackClearingCampfire",
  "obj_backpackClearingCampfire_clementine"
}

multiAgents.backpack.lastUpdateTime = -1
multiAgents.drawings = {}
multiAgents.drawings.agents = {
  "obj_drawingClementineClearingCampfireA",
  "obj_drawingClementineClearingCampfireA_clementine",
  "obj_drawingClementineClearingCampfireA_backpack"
}

multiAgents.drawings.lastUpdateTime = -1
multiAgents.photo = {}
multiAgents.photo.agents = {
  "obj_photoTornLeeClearingCampfire",
  "obj_photoTornLeeClearingCampfire_clementine",
  "obj_photoTornLeeClearingCampfire_backpack"
}

multiAgents.photo.lastUpdateTime = -1

local UpdateContextSensitiveComment = function()
  local choice = DlgEvaluateToNode(Game_GetSceneDialog(), "use_winston_contextual", "exchange", false)
  local text = DlgGetExchangeNodeText(Game_GetSceneDialog(), choice.NodeID, false)
  if text[1] then
    text = text[1]
  else
    text = nil
  end
  if text and AgentExists("ui_dialog_choice3") then
    AgentSetProperty("ui_dialog_choice3", "Text String", text)
  end
end

local ShowDragTut = function()
  Notification_ShowTutorial("tut_campfireClearing_holdAndDrag")
end

function ClearingCampfire_DragHintDelay()
  Sleep(kDragHintDelay)
  LogicSet("1Campfire - Okay for Drag Hint", true)
end

function ClearingCampfire_MultiAgents_Init()
  print("Clearing Campfire: multi agents INIT")
  local multiAgentKey, multiAgentValue
  local actionTime = 0
  for multiAgentKey, multiAgentValue in pairs(multiAgents) do
    for key, value in pairs(multiAgentValue.agents) do
      local agent = value
      local MultiAgentsVisCheck = function(propKey, bVisible)
        if bVisible then
          if multiAgentValue.lastUpdateTime == GetTotalTime() then
            return
          end
          for key, value in pairs(multiAgents[multiAgentKey].agents) do
            if value ~= agent then
              AgentHide(value, true)
            end
          end
          multiAgentValue.lastUpdateTime = GetTotalTime()
        end
      end
      PropertyAddKeyCallback(AgentGetProperties(agent), "Runtime: Visible", MultiAgentsVisCheck)
    end
  end
end

function ClearingCampfire_MultiAgents_Off()
  for multiAgentKey, multiAgentValue in pairs(multiAgents) do
    for key, value in pairs(multiAgentValue.agents) do
      PropertyClearKeyCallbacks(AgentGetProperties(value), "Runtime: Visible")
    end
  end
  print("Clearing Campfire: multi agents OFF")
end

function ClearingCampfire_BanterStart()
  mBanterDialogID = Dialog_Run(Game_GetSceneDialog(), "cs_banter", false)
  print("^^STARTING^^ scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "1Campfire - Clem Context Comment Group to Winston", UpdateContextSensitiveComment)
end
function ClearingCampfire_BanterPause(bPause)
  if not bPause then
    print("** RESUMING ** scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgResume(mBanterDialogID)
  else
    print(">> PAUSING << scavenger banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgPause(mBanterDialogID)
  end
end

function ClearingCampfire_BanterEnd()
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "1Campfire - Clem Context Comment Group to Winston", UpdateContextSensitiveComment)
end

function ClearingCampfire_IsKindlingBurning()
  return mbIsKindlingBurning
end

function ClearingCampfire_SetKindlingBurning(bool)
  if not bool then
    mbIsKindlingBurning = false
  else
    mbIsKindlingBurning = true
  end
end

function ClearingCampfire_StartWalkToFire()
  AgentSetPos(Game_GetPlayer(), Vector(6.962573, 1.0E-6, 14.514923))
  AgentSetRot(Game_GetPlayer(), Vector(-180, -7.4572, -180))
  Navigate_Enable(true)
  TargetedWalk_Start("tgtWalk_ClemToCampfire")
  CameraActivate("cam_nav_Clementine_chaseToCampfire")
end

function ClearingCampfire_MakeAllObjsUnselectable()
  for key, value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end

function ClearingCampfire_SpecialAgentFocus()
  if AgentGetName(SceneGetCamera(kScene)) == "cam_closeUp_burnYourMemories" then
    if AgentGetName(Reticle_GetSelectedAgent()) == "obj_drawingClementineClearingCampfireA_clementine" then
      print("Clem's looking at the drawings!")
    elseif AgentGetName(Reticle_GetSelectedAgent()) == "obj_photoTornLeeClearingCampfire_clementine" then
      print("Clem's looking at the photo!")
    else
      print("Clem's looking at NEITHER burnable object!")
    end
  elseif AgentGetName(Reticle_GetSelectedAgent()) == "obj_lighterUsePoint" and LogicGet("1Campfire - Okay for Drag Hint") then
    LogicSet("1Campfire - Okay for Drag Hint", false)
    ShowDragTut()
  end
end

local OriginalTelltaleLevelStartLogic = function()
  Game_NewScene(kScene, kScript)
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "131")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "206")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "262")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "138")
  end
  Game_StartScene(true)
  Callback_OnSetReticleAgent:Add(ClearingCampfire_SpecialAgentFocus)
end

--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| LEVEL START FUNCTION ||||||||||||||||||||||||||||||||||||||||||||||||
--Here is the main function that gets called when the level starts.
--This is where we will setup and execute everything that we want to do!

function ClearingCampfire()
  --Load/Parse the required configuration files, and apply them.
  RELIGHT_ConfigurationStart();

  --if we are configured to be in editor mode, make sure to keep track of the original agents in the scene before we apply any modifications to them.
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_Editor_CaptureOriginalSceneAgentNames();
  end
  
  --load this scene's external relight LUA file (NOTE: if it doesn't exist; or it's named incorrectly; or the path is incorrect; or it loads but there are lua errors, then this won't run)
  if(TLSE_LoadAndUseLuaFile(RelightConfigLevel["RelightSceneLuaFile"])) then
    RELIGHT_SceneStart();
    Callback_OnPostUpdate:Add(RELIGHT_SceneUpdate);
  end

  --apply relight backend global logic
  RELIGHT_Global_Start();
  Callback_OnPostUpdate:Add(RELIGHT_Global_Update);

  --If configured in the development ini, enable the TLSE editor
  if (RelightConfigDevelopment.EditorMode == true) then
    TLSE_Development_GUI_RelightLuaExportNamePrefix = "201_";
    TLSE_Development_Editor_Start();
    Callback_OnPostUpdate:Add(TLSE_Development_Editor_Update);
    return; --don't continue
  end

  --If configured in the development ini, enable freecamera (if editor is not enabled)
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true) then     
    TLSE_Development_CreateFreeCamera();
    Callback_OnPostUpdate:Add(TLSE_Development_UpdateFreeCamera);
  end

  --If configured in the development ini, enable a performance metrics overlayalthou
  if (RelightConfigDevelopment.PerformanceMetrics == true) then     
    TLSE_Development_PerformanceMetrics_Initalize();
    Callback_OnPostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
  end

  --If it's configured in the development ini to be in freecamera mode...
  if (RelightConfigDevelopment.FreeCameraOnlyMode == true and RelightConfigDevelopment.FreeCameraOnlyMode_StartSceneNormally == false) then
    return; --don't start the scene normally as the user wants to fly around the scene but not have it attempt to run the original level logic
  end

  --execute the original telltale level start logic
  OriginalTelltaleLevelStartLogic();
end

SceneOpen(kScene, kScript)

if not (RelightConfigDevelopment.EditorMode == true or RelightConfigDevelopment.FreeCameraOnlyMode == true) then
  SceneAdd("ui_openingCredits")
end