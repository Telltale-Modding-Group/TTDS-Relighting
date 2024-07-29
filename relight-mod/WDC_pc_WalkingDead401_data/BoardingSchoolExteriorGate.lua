local kScript = "BoardingSchoolExteriorGate"
local kScene = "adv_boardingSchoolExteriorGate"
local OnLogicReady = function()
  if Game_GetLoaded() then
    return
  end
  local debugID = LogicGet("Debug ID")
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_outside")
  end
end
function BoardingSchoolExteriorGate()
  DlgPreloadAll(Game_GetPlayerDialog(), false)
end
if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
