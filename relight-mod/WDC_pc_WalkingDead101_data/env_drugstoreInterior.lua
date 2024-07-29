local kScene = "adv_drugstoreInteriorAct3.scene"
local preloadShaders = function()
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "263")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "258")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "135")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "3")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "64")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "74")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "196")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "131")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "132")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "10")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "259")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "330")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "3")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "263")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "258")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "132")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "135")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "131")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "74")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "10")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "330")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "64")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "196")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "323")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "259")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "0")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "258")
end
local callouts = {}
local calloutThread
function Callout_Add(dlgItem)
  table.insert(callouts, dlgItem)
end
function Callout_Remove(dlgItem)
  for i, v in ipairs(callouts) do
    if v == dlgItem then
      table.remove(callouts, i)
      return
    end
  end
end
local CalloutThreadFunc = function()
  calloutThread = GetCurrentThread()
  while true do
    Sleep(10)
    local n = table.getn(callouts)
    local id
    while n > 0 and id == nil do
      local item = TableGetRandomElement(callouts)
      id = Dialog_Play(item, SceneGetSceneAgent(SceneGetBottomScene()))
      if id == nil then
        Callout_Remove(item)
      end
    end
  end
end
local calloutActivate = function(bActive)
  if bActive then
    if not ThreadIsRunning(calloutThread) then
      calloutThread = ThreadStart(CalloutThreadFunc)
    end
  else
    ThreadKill(calloutThread)
    calloutThread = nil
  end
end
function dlgIdle(dlgItem, logicKey)
  while Logic[logicKey] do
    Dialog_PlayAndWait(dlgItem)
    Yield()
  end
end
local introDialogID
function hax()
  if introDialogID and DlgIsRunning(introDialogID) then
    RenderDelay(1)
    ControllerKill(DlgGetCurPlaybackController(introDialogID))
    DlgStop(introDialogID)
  end
end
function Arrival()
  if IsEngineIPhone() or IsEngineAndroid() then
    preloadShaders()
  end
  Logic["Drugstore - Arrival"] = true
  if Logic["Drugstore - Secure"] then
    Logic["Drugstore - ArrivalComplete"] = true
    Logic["Drugstore - Window Boarded"] = true
    Logic["Drugstore - Window Barricaded"] = true
  end
  Mode(mode_thirdperson)
  Mode(mode_Main)
  CameraActivate("cam_nav")
  if not SaveLoad_IsFromLoad() then
    if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - DrugstoreStartFromWCZombie") then
      AgentSetProperty("logic_debug", "Debug - DrugstoreStartFromWCZombie", false)
      if Platform_IsWiiU() then
        print("Dialog Preloading start1")
        DlgPreload("env_drugstore.dlog", "cs_clementineOpensBathroom", 0, 15, 0, false)
      end
      introDialogID = Dialog_Play("cs_clementineOpensBathroom")
    elseif not IsToolBuild() or not GetPreferences()["Skip Intro Cutscenes"] then
      if Platform_IsWiiU() then
        print("Dialog Preloading start2")
        DlgPreload("env_drugstore.dlog", "Enter", 0, 15, 0, false)
      end
      introDialogID = Dialog_Play("Enter")
    end
  end
end
SceneOpen(kScene, "Arrival")
