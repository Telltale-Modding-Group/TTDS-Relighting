local kScript = "ManorNeighborBedroom"
local kScene = "adv_manorNeighborBedroom"
function ManorNeighborBedroom()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  Episode_SetLeeState(Logic["Saved Ben"] == "false")
  if Logic["2Bedroom - Crossed Alley"] then
    Dialog_Play("cs_rescueBen")
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
function PreloadShaders()
end
SceneOpen(kScene, kScript)
