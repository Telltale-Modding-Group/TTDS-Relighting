local kScript = "CrawfordAutoShop"
local kScene = "adv_crawfordAutoShop"
function CrawfordAutoShop_PreLoadGrabBattery()
end
function CrawfordAutoShop_PreLoadShootWindow()
end
function CrawfordAutoShop_PreLoadGrabMolly()
end
function CrawfordAutoShop()
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return
  end
  if AllowIntroCutscenes() then
    Dialog_Play("cs_enter")
  end
end
SceneOpen(kScene, kScript)
