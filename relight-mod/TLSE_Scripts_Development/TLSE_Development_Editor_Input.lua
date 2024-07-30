--|||||||||||||||||||||||||||||||||||||||||||||||||| IMAP ||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||| IMAP ||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||| IMAP ||||||||||||||||||||||||||||||||||||||||||||||||||
TLSE_Development_Editor_Input_IMAP_File = "TLSE_Development_Editor.imap";

TLSE_Development_Editor_Input_LeftMouseBegin = function()
    --TLSE_Development_Editor_Input_LeftMouseClicked = true;
end

TLSE_Development_Editor_Input_LeftMouseEnd = function()

end

--|||||||||||||||||||||||||||||||||||||||||||||||||| RAW INPUT ||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||| RAW INPUT ||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||| RAW INPUT ||||||||||||||||||||||||||||||||||||||||||||||||||
local bool_inputClickedOnce = false;

TLSE_Development_Editor_Input_LeftMouseClicked = false;
TLSE_Development_Editor_Input_LeftMouseHold = false;
TLSE_Development_Editor_Input_LeftShiftHold = false;
TLSE_Development_Editor_Input_LeftCtrlHold = false;

local bool_deleteClickedOnce = false;
TLSE_Development_Editor_Input_DeleteClicked = false;
TLSE_Development_Editor_Input_DeleteHold = false;

local bool_duplicateActionOnce = false;
TLSE_Development_Editor_Input_DuplicateActionEnter = false;

TLSE_Development_Editor_Input_Update = function()
    if(TLSE_Development_FreezeEditor) then
        TLSE_Development_Editor_Input_LeftMouseHold = false;
        TLSE_Development_Editor_Input_LeftMouseClicked = false;
        bool_inputClickedOnce = false;
        TLSE_Development_Editor_Input_LeftShiftHold = false;
        TLSE_Development_Editor_Input_LeftCtrlHold = false;
        return
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - LEFT MOUSE ||||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - LEFT MOUSE ||||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - LEFT MOUSE ||||||||||||||||||||||||||||||||||||||||||||||||||

    TLSE_Development_Editor_Input_LeftMouseHold = TLSE_InputKeyPress(TLSE_Keycodes_LeftMouse);

    if (TLSE_Development_Editor_Input_LeftMouseHold == true) then
        if(bool_inputClickedOnce == false) then
            TLSE_Development_Editor_Input_LeftMouseClicked = true;
            bool_inputClickedOnce = true;
        else
            TLSE_Development_Editor_Input_LeftMouseClicked = false;
        end
    else
        TLSE_Development_Editor_Input_LeftMouseClicked = false;
        bool_inputClickedOnce = false;
    end

    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - DEL KEY ||||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - DEL KEY ||||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - DEL KEY ||||||||||||||||||||||||||||||||||||||||||||||||||

    TLSE_Development_Editor_Input_DeleteHold = TLSE_InputKeyPress(TLSE_Keycodes_Delete);

    if (TLSE_Development_Editor_Input_DeleteHold == true) then
        if(bool_deleteClickedOnce == false) then
            TLSE_Development_Editor_Input_DeleteClicked = true;
            bool_deleteClickedOnce = true;
        else
            TLSE_Development_Editor_Input_DeleteClicked = false;
        end
    else
        TLSE_Development_Editor_Input_DeleteClicked = false;
        bool_deleteClickedOnce = false;
    end

    TLSE_Development_Editor_Input_LeftShiftHold = TLSE_InputKeyPress(TLSE_Keycodes_LeftShift);
    TLSE_Development_Editor_Input_LeftCtrlHold = TLSE_InputKeyPress(TLSE_Keycodes_LeftControl);

    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - DUPLICATE ACTION ||||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - DUPLICATE ACTION ||||||||||||||||||||||||||||||||||||||||||||||||||
    --|||||||||||||||||||||||||||||||||||||||||||||||||| INPUT - DUPLICATE ACTION ||||||||||||||||||||||||||||||||||||||||||||||||||

    local bool_onHoldKey_D = TLSE_InputKeyPress(TLSE_Keycodes_D);

    if (TLSE_Development_Editor_Input_LeftCtrlHold == true) then
        if(bool_onHoldKey_D) then
            if(bool_duplicateActionOnce == false) then
                TLSE_Development_Editor_Input_DuplicateActionEnter = true;
                bool_duplicateActionOnce = true;
            else
                TLSE_Development_Editor_Input_DuplicateActionEnter = false;
            end
        else
            TLSE_Development_Editor_Input_DuplicateActionEnter = false;
            bool_duplicateActionOnce = false;
        end
    else
        TLSE_Development_Editor_Input_DuplicateActionEnter = false;
        bool_duplicateActionOnce = false;
    end
end