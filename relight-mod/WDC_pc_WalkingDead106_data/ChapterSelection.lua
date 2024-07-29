local kScript = "ChapterSelection"
local kScene = "adv_truckStopChapterSelection"
function ChapterSelection()
  Mode(mode_Main)
  Game_EnableMovement(false)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
