--[[
This is the main connective script for all the TLSE editor functionality.
The segmented logic/functions are all called centrally here.

In addition to that some variables here are also declared, and are shared/used in the various editor scripts.
]]

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_EditorVersion = 100;

--Freeze all logic in the editor? (This occasionally gets set by a few actions that require user attention)
TLSE_Development_FreezeEditor = false;

TLSE_Development_TextBox_Inputing = false;
TLSE_Development_TextBox_InitalText = nil;
TLSE_Development_TextBox_TextResult = nil;
TLSE_Development_TextBox_OnFinish = nil;

--(IMPORTANT) This is the prop file that is used for alot of the editor tools, which is a flat UI plane with a texture on it.
TLSE_Development_FlatPlaneMesh = "ui_boot_title.prop";

--This is the name of the texture that is used on the flat UI plane prop file, this texture gets overriden.
TLSE_Development_FlatPlaneOriginalTexture = "ui_boot_title.d3dtx";

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_ShowTextBox = function(string_inputText, string_description)
    TLSE_Development_TextBox_Inputing = true;
    TLSE_Development_TextBox_TextResult = nil;
    TLSE_Development_TextBox_InitalText = string_inputText;
    ShowGenericTextBox(string_inputText, string_description, false, 1, false, 0, "OK", "CANCEL");
end

TLSE_Development_Editor_Start = function()
    --NOTE: These are important as these archives contain a prop file that we need and use for everything GUI wise in the editor.
    --That being "ui_boot_title.prop" (as of The Walking Dead Definitive Edition)
    ResourceSetEnable("Boot");
    ResourceSetEnable("ProjectSeason4");

    TLSE_Development_CreateFreeCamera();
    TLSE_Development_Selection_Initalize();
    TLSE_Development_GUI_Initalize();
    TLSE_Development_TransformTool_Initalize();
end

TLSE_Development_Editor_Update = function()
    TLSE_Development_TextBox_TextResult = GetGenericTextBoxResults();

    --if(TLSE_Development_TextBox_TextResult ~= nil) then
        --if(TLSE_Development_TextBox_OnFinish ~= nil) then
            --TLSE_Development_TextBox_OnFinish();
        --end
    --end

    if not IsGenericTextBoxFinished() then
        TLSE_Development_Freecam_Frozen = true;
        return;
    else
        if(TLSE_Development_TextBox_OnFinish ~= nil) then
            TLSE_Development_TextBox_OnFinish();
        end
    end
    

    --[[
    local string_currentCapture = GetGenericTextBoxResults();

    if(string_currentCapture ~= nil) then
        TLSE_Development_TextBox_TextResult = string_currentCapture;

        if(TLSE_Development_TextBox_OnFinish ~= nil) then
            TLSE_Development_TextBox_OnFinish();
            TLSE_Development_TextBox_OnFinish = nil;
        end

        string_currentCapture = nil;
        TLSE_Development_TextBox_Inputing = false;
    end

    if(TLSE_Development_TextBox_Inputing) then
        TLSE_Development_Freecam_Frozen = true;
        return;
    end

    if IsGenericTextBoxFinished() then
        TLSE_Development_TextBox_Inputing = false;
    end
    ]]

        --[[
    if(TLSE_Development_TextBox_Inputing) then
        TLSE_Development_TextBox_TextResult = GetGenericTextBoxResults();

        if(TLSE_Development_TextBox_OnFinish ~= nil) then
            TLSE_Development_TextBox_OnFinish();
            TLSE_Development_TextBox_OnFinish = nil;
        end
    end

    if not IsGenericTextBoxFinished() then
        TLSE_Development_Freecam_Frozen = true;
        return;
    end
    ]]

        --[[
    if not IsGenericTextBoxFinished() and TLSE_Development_TextBox_Inputing then
        TLSE_Development_Freecam_Frozen = true;
        return;
    elseif IsGenericTextBoxFinished() and TLSE_Development_TextBox_Inputing then
        TLSE_Development_TextBox_TextResult = GetGenericTextBoxResults();

        if(TLSE_Development_TextBox_OnFinish ~= nil) then
            TLSE_Development_TextBox_OnFinish();
            TLSE_Development_TextBox_OnFinish = nil;
        end

        TLSE_Development_TextBox_Inputing = false;
        return;
    end
    ]]

    --[[
    if(TLSE_Development_TextBox_Inputing) then
        TLSE_Development_Freecam_Frozen = true;

        --if IsGenericTextBoxFinished() then
            TLSE_Development_TextBox_TextResult = GetGenericTextBoxResults();

            if(TLSE_Development_TextBox_OnFinish ~= nil) then
                TLSE_Development_TextBox_OnFinish();
                TLSE_Development_TextBox_OnFinish = nil;
            end

            TLSE_Development_TextBox_Inputing = false;
        --end

        --return;
    end
    ]]

    --[[
    NOTE TO SELF
    CREATE A LABEL
    LABEL TEXT EVERY UPDATE = GetGenericTextBoxResults();
    ]]


    TLSE_Development_UpdateFreeCamera();
    TLSE_Development_Editor_Input_Update();
    TLSE_Development_Editor_UpdateSceneAgentsList();
    TLSE_Development_Editor_ObjectIcons_Update();
    TLSE_Development_TransformTool_Update();
    TLSE_Development_Selection_Update();
    TLSE_Development_GUI_Update();
end