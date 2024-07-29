local kScript = "FlagshipExteriorNormaBranch"
local kScene = "adv_flagshipExteriorDeck"
function FlagshipExteriorNormaBranch()
  Game_NewScene(kScene, kScript)
  Game_StartScene(true)
end
SceneOpen(kScene, kScript)
