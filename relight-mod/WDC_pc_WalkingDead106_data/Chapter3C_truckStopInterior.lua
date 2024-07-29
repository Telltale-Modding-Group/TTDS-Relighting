require("mode_fastSlow.lua")
local kScript = "Chapter3C"
local kScene = "adv_truckStopInteriorCh3"
function Chapter3C()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if Logic["3 - Killed Zombie"] then
    Dialog_Play("use_nate")
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
