--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||

--generates a new ini file
RELIGHT_GenerateNewINI_Main = function()
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = RELIGHT_CurrentConfigurationVersion,
        },
        Global = 
        {
            FOVMultiplier = 1.0, 
            MotionBlurIntensity = 25.0,
            RenderScale = 1.0,
            DisableOutlines = true,
            DisablePostProcessing = false,
			DisableFog = false
        },
    };
        
    return data;
end