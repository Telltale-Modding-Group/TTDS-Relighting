--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||

--generates a new ini file
RELIGHT_GenerateNewINI_Main = function(number_configurationVersion)
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = number_configurationVersion,
        },
        Global = 
        {
            FOVMultiplier = 1.0, 
            MotionBlurIntensity = 25.0,
            RenderScale = 1.0,
            DisableOutlines = false,
            DisablePostProcessing = false,
			DisableFog = false,
            CinematicMode = false,
            BlackAndWhiteMode = false,
            HighQualityDepthOfField = true,
            OverrideTimeScale = false,
            TimeScaleValue = 1,
            ForceGraphicBlackOff = true,
            ForceBloomOff = false,
            EnableMotionBlur = false,
        },
    };
        
    return data;
end