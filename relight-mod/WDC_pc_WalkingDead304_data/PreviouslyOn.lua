require("SceneLoader.lua")
local kScript = "PreviouslyOn"
local kScene = "adv_previouslyOn"
function PreviouslyOn_SetClemMeshState()
  local kClementine = "Clementine"
  if AgentExists(kClementine) then
    local endingChoice = LogicGet("Episode 205 - Ending Choice")
    if endingChoice == "Kenny" then
      AgentSetProperty(kClementine, "Mesh sk62_clementine_head - Visible", false)
      AgentSetProperty(kClementine, "Mesh sk62_clementine_headCarCrashCut - Visible", true)
    elseif endingChoice == "Jane" then
      AgentSetPropertyEx(kClementine, "material_sk62_clementine_hands_sk62_clementine_hands_M1 - Diffuse Texture", "sk62_clementine_handsTattoo.d3dtx", "Handle<T3Texture>")
    elseif endingChoice == "Wellington" then
      AgentSetProperty(kClementine, "Mesh sk62_clementine_head - Visible", false)
      AgentSetProperty(kClementine, "Mesh sk62_clementine_headBulletGraze - Visible", true)
    else
      AgentSetProperty(kClementine, "Mesh sk62_clementine_hands - Visible", false)
      AgentSetProperty(kClementine, "Mesh sk62_clementine_handsMissingFinger - Visible", true)
    end
  end
end
function PreviouslyOn()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if not Game_GetDebug() then
    PersistentLogic_SetGameLogic()
  end
  SceneLoader_Init()
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
SceneAdd("ui_previouslyOn")
if not IsPlatformTouch(true) then
  SceneAdd("ui_letterbox")
end
