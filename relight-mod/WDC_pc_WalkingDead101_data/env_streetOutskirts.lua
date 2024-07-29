require("wd_tutorial.lua")
local kScript = "streetOutskirts"
local kScene = "adv_streetOutskirts.scene"
local kTreeProps = {
  "obj_streetOutskirtsTileTreesA.prop",
  "obj_streetOutskirtsTileTreesB.prop",
  "obj_streetOutskirtsTileTreesC.prop",
  "obj_streetOutskirtsTileTreesD.prop",
  "obj_streetOutskirtsTileTreesE.prop",
  "obj_streetOutskirtsTileTreesF.prop",
  "obj_streetOutskirtsTileTreesG.prop",
  "obj_streetOutskirtsTileTreesH.prop"
}
local SetTreeShadows = function(qualityLevel)
  local bDisableShadowsForMid = qualityLevel <= 6
  for i, prop in ipairs(kTreeProps) do
    PropertySet(prop, "Render EnvLight Shadow Cast Enable", not bDisableShadowsForMid)
  end
end
local EngineRenderSetCurQualityLevel = RenderSetCurQualityLevel
function RenderSetCurQualityLevel(level)
  SetTreeShadows(level)
  EngineRenderSetCurQualityLevel(level)
end
function streetOutskirts()
  Main_AllowMovement(false)
  Mode(mode_Main)
  SceneAdd("ui_openingcredits.scene")
  Yield()
  if Platform_IsWiiU() then
    print("Dialog Preloading start")
    DlgPreload("env_copCar", "cs_intro", 0, 10, 0, false)
  end
  if LangGetCurLanguage() == "german" and Platform_IsVita() then
    AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
  end
  SetTreeShadows(RenderGetCurQualityLevel())
  if SaveLoad_IsFromLoad() then
    if Logic["CopCar - PastIntro"] then
      SceneHide("ui_openingcredits.scene", true)
    end
  else
    Dialog_Play("cs_intro")
  end
end
if not IsRegistered() then
  ThreadStart(LoadScript, "env_clementineHouseExterior.lua")
else
  SceneOpen(kScene, kScript)
end
