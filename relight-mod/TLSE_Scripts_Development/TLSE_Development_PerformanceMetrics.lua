--[[

]]--

--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) USER CONFIGURABLE VARIABLES ||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_PerformanceMetrics_ShowCommonMetrics = true;
TLSE_Development_PerformanceMetrics_ShowTimeMetrics = true;
TLSE_Development_PerformanceMetrics_ShowVramMetrics = true;
TLSE_Development_PerformanceMetrics_ShowHeapMetrics = true;

--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||| (GLOBAL) VARIABLES (DONT TOUCH) ||||||||||||||||||||||||||||||||||||||||||||||||

--(public) dev variables (public because these values need to be persistent)
TLSE_Development_PerformanceMetrics_Text = nil;
TLSE_Development_PerformanceMetrics_TextTitle = "[Performance Metrics]";

--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||||||||| GLOBAL FUNCTIONS ||||||||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_PerformanceMetrics_Initalize = function()
    -------------------------------------------------------------
    --initalize menu text

    --create our menu text
    TLSE_Development_PerformanceMetrics_Text = TLSE_TextUI_CreateTextAgent("PerformanceMetricsText", "Performance Metrics Error", Vector(0, 0, 0), 0, 0, TLSE_Development_SceneObject);

    --set the text color
    TextSetColor(TLSE_Development_PerformanceMetrics_Text, Color(0.5, 1.0, 0.5, 1.0));

    --scale note
    --1.0 = default
    --0.5 = half
    --2.0 = double
    TextSetScale(TLSE_Development_PerformanceMetrics_Text, 0.5);
end

TLSE_Development_PerformanceMetrics_Update = function()  
    -------------------------------------------------------------
    --screen pos notes
    --0.0 0.0 0.0 = top left
    --0.5 0.5 0.0 = center
    --0.0 1.0 0.0 = bottom left
    local screenPos = Vector(0.0, 0.75, 0.0);
    AgentSetWorldPosFromLogicalScreenPos(TLSE_Development_PerformanceMetrics_Text, screenPos);

    -------------------------------------------------------------
    local finalText = TLSE_Development_PerformanceMetrics_TextTitle;

    -------------------------------------------------------------------------
    --common metrics

    if(TLSE_Development_PerformanceMetrics_ShowCommonMetrics) then
        local averageFrameTime = GetAverageFrameTime();
        local fpsValue = 1.0 / GetAverageFrameTime();

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "FPS: " .. fpsValue;

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Average Frame Time: " .. averageFrameTime;

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "--------------------------";
    end

    -------------------------------------------------------------------------
    --time metrics

    if(TLSE_Development_PerformanceMetrics_ShowTimeMetrics) then
        local frameTime = GetFrameTime();
        local frameNumber = GetFrameNumber();
        local totalTime = GetTotalTime();

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Frame Time: " .. frameTime;

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Frame Number: " .. frameNumber;

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Total Time: " .. totalTime;

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "--------------------------";
    end

    -------------------------------------------------------------------------
    --vram metrics

    if(TLSE_Development_PerformanceMetrics_ShowVramMetrics) then
        local vramSize = GetVramSize();
        local vramSize_MB = math.floor(vramSize * 1e-6);
        local vramAllocated = GetVramAllocated();
        local vramAllocated_MB = math.floor(vramAllocated * 1e-6);
        local vramUsagePercent = (vramAllocated / vramSize) * 100;

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Vram Size: " .. vramSize .. " (" .. vramSize_MB .. " MB)";

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Vram Allocated: " .. vramAllocated .. " (" .. vramAllocated_MB .. " MB)";

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Vram Usage: " .. vramUsagePercent .. "%";

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "--------------------------";
    end

    -------------------------------------------------------------------------
    --heap metrics

    if(TLSE_Development_PerformanceMetrics_ShowHeapMetrics) then
        local heapSize_MB = GetHeapSizeMB();
        local heapSizeAllocated = GetHeapAllocated();
        local heapSizeAllocated_MB = math.floor(GetHeapAllocated() * 1e-6);
        local heapUsagePercent = (heapSizeAllocated_MB / heapSize_MB) * 100;

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Heap Size MB: " .. heapSize_MB .. " MB";

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Heap Allocated: " .. heapSizeAllocated .. " (" .. heapSizeAllocated_MB .. " MB)";

        finalText = finalText .. "\n"; --new line
        finalText = finalText .. "Heap Usage: " .. heapUsagePercent .. "%";
    end

    TextSet(TLSE_Development_PerformanceMetrics_Text, finalText);
end