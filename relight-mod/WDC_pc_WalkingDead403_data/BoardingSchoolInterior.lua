local kScript = "BoardingSchoolInterior"
local kScene = "adv_boardingSchoolInterior"
function BoardingSchoolInterior()
  Episode_SetClemButton()
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_prepStation")
  end
end
function BoardingSchoolInterior_StopPrepDialog()
  local initialID = Subtitle_GetCurrentID()
  if initialID then
    while Subtitle_GetCurrentID() == initialID do
      WaitForNextFrame()
    end
  end
  Dialog_StopStringID("bg_prepStation")
end
Game_SceneOpen(kScene, kScript)
