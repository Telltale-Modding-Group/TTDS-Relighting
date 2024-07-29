TLSE_Development_TextBoxFinished = false;

local TestThread = function()
    ShowGenericTextBox("", "test tread", false, 1, false, 0, "OK", "CANCEL");

    WaitForNextFrame();

    while not IsGenericTextBoxFinished() do
        WaitForNextFrame();
    end
end

local GetTextBox = function(string_inputText, string_description)
    --local createPath = "logical://<Project>\\Properties\\" .. "DAVIDS_PROP.prop"
    --local createPath = "DAVIDS_PROP.prop"
    --Create(createPath)

    ShowGenericTextBox(string_inputText, string_description, false, 1, false, 0, "OK", "CANCEL");

    --ThreadSleep();

    --TLSE_Development_FreezeEditor = true;

    --WaitForNextFrame();
    --WaitForNextFrame();
    --WaitForNextFrame();

    --while not IsGenericTextBoxFinished() do
        --Yield();
    --end

    --TLSE_Development_FreezeEditor = IsGenericTextBoxFinished();

    --local string_result = GetGenericTextBoxResults();

    --TLSE_Development_FreezeEditor = false;
    
    --return string_result;
    return nil;
end

TLSE_Development_Editor_GetTextBoxString = function(string_inputText, string_description)
    ShowGenericTextBox(string_inputText, string_description, false, 1, false, 0, "OK", "CANCEL");

    --WaitForNextFrame();

    --while not IsGenericTextBoxFinished() do
        --WaitForNextFrame();
    --end

    return nil;

    --return GetTextBox(string_inputText, string_description);

    --ThreadStart(TestThread);
    --return nil;
end

TLSE_Development_Editor_GetTextBoxBool = function(string_inputText, string_description)
    local bool_result = nil;

    return bool_result;
end

TLSE_Development_Editor_GetTextBoxNumber = function(string_inputText, string_description)
    local number_result = nil;

    return number_result;
end

TLSE_Development_Editor_TextBoxInitalize = function()

end

TLSE_Development_Editor_TextBoxUpdate = function()
    --TLSE_Development_FreezeEditor = not IsGenericTextBoxFinished();

end