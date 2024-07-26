--[[

]]--

--(public) relight dev variables (public because these values need to be persistent)
KTBM_Development_DevelopmentBuildText_Text = nil;
KTBM_Development_DevelopmentBuildText_TextTitle = "Kenny The Boat Master (DEVELOPMENT BUILD V0.9.2)";
KTBM_Development_DevelopmentBuildText_ShowText = true;

KTBM_Development_DevelopmentBuildText_Initalize = function()
    KTBM_Development_DevelopmentBuildText_Text = KTBM_TextUI_CreateTextAgent("PerformanceMetricsText", "Performance Metrics Text Initalized", Vector(0, 0, 0), 1, 0);

    TextSetColor(KTBM_Development_DevelopmentBuildText_Text, Color(0.75, 0.75, 1.0, 1.0));

    --scale note
    --1.0 = default
    --0.5 = half
    --2.0 = double
    TextSetScale(KTBM_Development_DevelopmentBuildText_Text, 0.75);
end

KTBM_Development_DevelopmentBuildText_Update = function()  
    -------------------------------------------------------------
    --screen pos notes
    --0.0 0.0 0.0 = top left
    --0.5 0.5 0.0 = center
    --0.0 1.0 0.0 = bottom left
    AgentSetWorldPosFromLogicalScreenPos(KTBM_Development_DevelopmentBuildText_Text, Vector(0.0, 0.0, 0.0));

    TextSet(KTBM_Development_DevelopmentBuildText_Text, KTBM_Development_DevelopmentBuildText_TextTitle);
end