require("RELIGHT_Include.lua");

local kScript = "drugstoreOffice"
local kScene = "adv_drugstoreOffice.scene"
RELIGHT_kScene = kScene;

TLSE_Development_SceneObject = kScene;
TLSE_Development_SceneObjectAgentName = kScene;
TLSE_Development_UseSeasonOneAPI = true;
TLSE_Development_FreecamUseFOVScale = false;

--some relighting variables
RelightConfigGlobal = RelightConfigData_Main.Global;
RelightConfigDevelopment = RelightConfigData_Development.DevelopmentTools;
RelightConfigLevel = RelightConfigData_Season2.Level_101_DrugstoreOffice;

drugstoreOffice = function()
    --ShowGenericTextBox("", "test", false, 1, false, 0, "OK", "CANCEL");

    --WaitForNextFrame();

    --while not IsGenericTextBoxFinished() do
        --WaitForNextFrame();
    --end

  --ShowGenericTextBox("String", "This is a description! Hi darkshadow!");
  --local etadsfasfsaf = GetGenericTextBoxResults()
  --ShowGenericTextBox(tostring(etadsfasfsaf), "description");

  --SetPreference("Text Leading Fix", {Season1 = false, Season2 = true, SeasonM = true, Season3 = true, Season4 = true})
  --SetPreference("Text Leading Fix", true)

  --sgags = TLSE_TextUI_CreateTextAgent("agent_testing", "blasafasfsafsafsafsafsafsafh", Vector(0.5, 0.5, 0), 0, 0);

  --global (apply global after so it overrides anything set in scene)
    --RELIGHT_ApplyGlobalAdjustments(RelightConfigGlobal);
    --Callback_PostUpdate:Add(RELIGHT_Global_ForceGraphicBlackOffUpdate);
    

    if (RelightConfigDevelopment.FreeCameraOnlyMode == true) or (RelightConfigDevelopment.EditorMode == true) then     
      TLSE_Development_CreateFreeCamera();
      Callback_PostUpdate:Add(TLSE_Development_UpdateFreeCamera);
    end

    if (RelightConfigDevelopment.PerformanceMetrics == true) then     
      --TLSE_Development_PerformanceMetrics_Initalize();
      --Callback_PostUpdate:Add(TLSE_Development_PerformanceMetrics_Update);
    end

    if (RelightConfigDevelopment.EditorMode == true) then
      TLSE_Development_Editor_Start();
      Callback_PostUpdate:Add(TLSE_Development_Editor_Update);
      do return end --don't continue
    end
















  --[[
  -- function num : 0_0 , upvalues : _ENV
  local bGotKeys = Logic["Drugstore - Got Keys"]
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  if bGotKeys then
    Logic["Office - Pallet moved"] = true
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

    Logic["Office - found medikit"] = true
    AgentSetProperty("obj_doorDrugstoreOffice", "Game Selectable", false)
    AgentSetProperty("obj_doorDrugstoreAlley", "Game Selectable", false)
    AgentHide("Clementine", true)
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  Logic["Drugstore - ArrivalComplete"] = true
  if Logic["Office - got photo"] then
    AgentHide("obj_photoLeeFamily", true)
    AgentSetProperty("trigger_camPhoto", "Trigger Enabled", false)
  else
    if Input_IsUsingTouch() then
      AgentSetProperty("trigger_camPhoto", "Trigger Enabled", true)
    end
  end
  if bGotKeys or Logic["Office - Pallet moved"] then
    AgentSetPos("obj_drugStoreOfficeWoodenPalette", Vector(-2.217857, 0.649245, 0.729007))
    AgentSetRot("obj_drugStoreOfficeWoodenPalette", Vector(-58.13037, -90.98405, 0.282882))
    AgentSetSelectable("obj_drugStoreOfficeWoodenPaletteLogical", false)
  end
  if bGotKeys or Logic["Office - Desk moved"] then
    AgentSetPos("obj_deskDrugstoreOffice", Vector(-1.03863, 0.5799, -2.363176))
    AgentSetRot("obj_deskDrugstoreOffice", Vector(0, -7.310176, 0))
    AgentSetSelectable("obj_deskDrugstoreOffice", false)
    if bGotKeys then
      CameraActivate("cam_navPart3")
    else
      CameraActivate("cam_navPart2")
    end
  end
  if Logic["MotorInn - Have Remote"] then
    AgentHide("obj_Remote", true)
  end
  Mode(mode_Main)
  if not SaveLoad_IsFromLoad() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1")
      DlgPreload("env_office.dlog", "enter_office", 0, 10, 0, false)
    end
    Dialog_Play("enter_office")
  end
  ]]
end

SceneOpen(kScene, kScript)