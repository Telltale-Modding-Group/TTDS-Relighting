local kScript = "JunkyardHill"
local kScene = "adv_junkyardHill"
local OnLogicReady = function()
  if not Game_GetLoaded() and LogicGet("bEnteredJunkyardHill") then
    Game_SetSceneDialogNode("cs_enterTrailer")
  end
end
function JunkyardHill()
  Game_NewScene(kScene, kScript)
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalkAmbulance", false)
  end
  Game_StartScene()
end
if IsToolBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
SceneOpen(kScene, kScript)
