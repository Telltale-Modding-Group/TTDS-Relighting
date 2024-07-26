TLSE_Development_FreezeEditor = false;

TLSE_Development_Editor_Start = function()
    ResourceSetEnable("Boot");
    ResourceSetEnable("ProjectSeason4");

    --ResourceSetEnable("ProjectSeason1");
    --ResourceSetEnable("ProjectSeason2");
    --ResourceSetEnable("ProjectSeason3");
    --ResourceSetEnable("ProjectSeasonM");
    --ResourceSetEnable("WalkingDead201", 10000);

    TLSE_Development_Selection_Initalize();
    TLSE_Development_MainGUI_Initalize();
    TLSE_Development_ObjectIcons_Initalize();
    TLSE_Development_TransformTool_Initalize();
end

TLSE_Development_Editor_Update = function()
    TLSE_Development_Editor_TextBoxUpdate();
    TLSE_Development_Editor_Input_Update();
    TLSE_Development_Editor_UpdateSceneAgentsList();
    TLSE_Development_ObjectIcons_Update();
    TLSE_Development_TransformTool_Update();
    TLSE_Development_Selection_Update();
    TLSE_Development_MainGUI_Update();
end