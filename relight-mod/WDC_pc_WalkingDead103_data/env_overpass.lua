local kScript = "Overpass"
local kScene = "adv_trainTileOverpass"
local SetSlowWalkAnim = function()
  AgentFind("Lee").mProps["Walk Animation - Forward"] = "sk54_move_lee_walk.chore"
end
local SetFastWalkAnim = function()
  AgentFind("Lee").mProps["Walk Animation - Forward"] = "sk54_move_lee_walkfast.chore"
end
function Overpass_ZombieHerdPreLoad()
end
function Overpass()
  Mode(mode_Main)
  Callback_DialogCutsceneBegin:Add(SetSlowWalkAnim)
  Callback_DialogCutsceneEnd:Add(SetFastWalkAnim)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetFightTextures(true)
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Overpass")
      DlgPreload("env_overpass.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
