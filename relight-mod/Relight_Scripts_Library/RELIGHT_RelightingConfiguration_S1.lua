--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 1 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 1 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 1 |||||||||||||||||||||||||||||||||||||||

RELIGHT_GenerateNewINI_Season1 = function(number_configurationVersion)
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = number_configurationVersion,
        },
        Level_102_DairyMeatLocker = --env_dairyMeatLocker
        {
            RelightSceneLuaFile = RELIGHT_LevelsFolderName .. "/RELIGHT_102_env_dairyMeatLocker.lua",
            RelightSceneConfigurationFile = RELIGHT_LevelsFolderName .. "/RELIGHT_102_env_dairyMeatLocker.ini",
        },
    };
        
    return data;
end