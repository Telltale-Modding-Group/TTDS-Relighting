require("OpeningCredits.lua")
local kScript = "RiverBoat"
local kScene = "adv_riverBoat"
function RiverBoat()
  Episode_SetClemState()
end
Game_SceneOpen(kScene, kScript)
SceneAdd("ui_notification")
