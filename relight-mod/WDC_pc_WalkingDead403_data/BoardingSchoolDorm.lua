require("Sketchpad.lua")
local kScript = "BoardingSchoolDorm"
local kScene = "adv_boardingSchoolDorm"
local OnLogicReady = function()
  if LogicGet("Debug ID") == 1 then
    AgentHide("obj_toySketchpad", false)
    if Game_GetSkipEnterCutscenes() then
      Sleep(0.25)
      Station_Enter("cam_station_sketchpad")
      Sketchpad_Enable(true)
    end
  end
end
function BoardingSchoolDorm()
  if not Game_GetLoaded() then
    Collectible_SetVisibility()
  end
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
