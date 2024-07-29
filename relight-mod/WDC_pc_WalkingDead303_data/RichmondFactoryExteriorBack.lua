local kScript = "RichmondFactoryExteriorBack"
local kScene = "adv_richmondFactoryExteriorBack"
function RichmondFactoryExteriorBack()
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if LogicGet("3 - Who Killed Badger") == "Javier" then
    AgentSetProperty("obj_batAluminum", kMesh, "obj_batAluminumBloody.d3dmesh")
  end
  Game_StartScene()
end
SceneOpen(kScene, kScript)
