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

TLSE_Development_Editor_Input_Update = function()
    if(TLSE_Development_FreezeEditor) then
        TLSE_Development_Editor_Input_LeftMouseHold = false;
        TLSE_Development_Editor_Input_LeftMouseClicked = false;
        bool_inputClickedOnce = false;
        TLSE_Development_Editor_Input_LeftShiftHold = false;
        TLSE_Development_Editor_Input_LeftCtrlHold = false;
        return
    end

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

    TLSE_Development_Editor_Input_LeftShiftHold = TLSE_InputKeyPress(TLSE_Keycodes_LeftShift);
    TLSE_Development_Editor_Input_LeftCtrlHold = TLSE_InputKeyPress(TLSE_Keycodes_LeftControl);
end