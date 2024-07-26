--current config version
local CurrentConfigurationVersion = 100;

--relight config file names
local configFileName_Main = "RelightMod/RelightingConfig_Main.ini";
local configFileName_Development = "RelightMod/RelightingConfig_Development.ini";
local configFileName_Season1 = "RelightMod/RelightingConfig_Season1.ini";
local configFileName_Season2 = "RelightMod/RelightingConfig_Season2.ini";
local configFileName_Season3 = "RelightMod/RelightingConfig_Season3.ini";
local configFileName_Season4 = "RelightMod/RelightingConfig_Season4.ini";
local configFileName_SeasonM = "RelightMod/RelightingConfig_SeasonM.ini";

--relight config file data
RelightConfigData_Main = nil;
RelightConfigData_Development = nil;
RelightConfigData_Season1 = nil;
RelightConfigData_Season2 = nil;
RelightConfigData_Season3 = nil;
RelightConfigData_Season4 = nil;
RelightConfigData_SeasonM = nil;

--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT MAIN |||||||||||||||||||||||||||||||||||||||

--generates a new ini file
local GenerateNewINI_Main = function()
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = CurrentConfigurationVersion,
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

--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT DEVELOPMENT |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT DEVELOPMENT |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT DEVELOPMENT |||||||||||||||||||||||||||||||||||||||

--generates a new ini file
local GenerateNewINI_Development = function()
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = CurrentConfigurationVersion,
        },
        CameraSettings = 
        {
            Camera_SnappyZoom = false,
            Camera_SnappyMovement = false,
            Camera_SnappyRotation = false,
            Camera_PositionLerpFactor = 5.0,
			Camera_RotationLerpFactor = 7.5,
            Camera_ZoomLerpFactor = 10.0,
            Camera_PositionIncrementDefault = 0.025,
            Camera_PositionIncrementShift = 0.25,
            Camera_FovIncrement = 0.5,
            Camera_FovMax = 179,
            Camera_FovMin = 1,
            Camera_NearPlane = 0.05,
            Camera_FarPlane = 2500,
        },
        DevelopmentTools = 
        {
            PerformanceMetrics = false,
            FreeCameraOnlyMode = false,
            FreeCameraOnlyMode_StartSceneNormally = true,
            EditorMode = false
        }
    };
        
    return data;
end

--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 1 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 1 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 1 |||||||||||||||||||||||||||||||||||||||

local GenerateNewINI_Season1 = function()
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = CurrentConfigurationVersion,
        },
        Level_101_ClementineHouseExterior = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_DrugstoreOffice = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        }
    };
        
    return data;
end

--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 2 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 2 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 2 |||||||||||||||||||||||||||||||||||||||

local GenerateNewINI_Season2 = function()
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = CurrentConfigurationVersion,
        },
----------------------------------- SEASON 2 EPISODE 1 -----------------------------------
----------------------------------- SEASON 2 EPISODE 1 -----------------------------------
----------------------------------- SEASON 2 EPISODE 1 -----------------------------------
        Level_201_TruckStopBathroom = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            HighQualityDepthOfField = true,
            EnableMotionBlur = false,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_201_ClearingCampfire = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            HighQualityDepthOfField = true,
            EnableMotionBlur = false,
            EnableProcedualGrass = true,
            EnableReplaceRain = true,
            EnableVolumetricLighting = false,
			ForceBloomOff = false
        },
        Level_201_RiverWoods = 
        {
            ExposureOffset = -1.0,
            EnableRelighting = true, 
            EnableMotionBlur = false,
            EnableReplaceWater = true,
            EnableReplaceRain = true,
			RelightingThunderRepeatRate = 175.0,
			EnableFlashlights = true,
			EnableDepthOfField = false,
			ForceBloomOff = false
        },
        Level_201_RiverShore = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            HighQualityDepthOfField = true,
            EnableMotionBlur = false,
            EnableReplaceWater = true,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_201_RiverCamp = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_201_CabinExterior = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_201_CabinShedInterior = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_201_CabinInterior = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_201_BackwoodsStream = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableReplaceWater = true,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
            EnableContentRestoration = true,
			ForceBloomOff = false
        },
----------------------------------- SEASON 2 EPISODE 2 -----------------------------------
----------------------------------- SEASON 2 EPISODE 2 -----------------------------------
----------------------------------- SEASON 2 EPISODE 2 -----------------------------------
        Level_202_LakeBridge = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableReplaceWater = true,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_202_LodgeMainRoom = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
			ForceBloomOff = false
        },
----------------------------------- SEASON 2 EPISODE 4 -----------------------------------
----------------------------------- SEASON 2 EPISODE 4 -----------------------------------
----------------------------------- SEASON 2 EPISODE 4 -----------------------------------
        Level_204_CivilWarMemorialObservationDeckEvening = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
			ForceBloomOff = false
        },
----------------------------------- SEASON 2 EPISODE 5 -----------------------------------
----------------------------------- SEASON 2 EPISODE 5 -----------------------------------
----------------------------------- SEASON 2 EPISODE 5 -----------------------------------
        Level_205_SnowyPowerStation = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            HighQualityDepthOfField = true,
            EnableMotionBlur = false,
            EnableVolumetricLighting = false,
            EnableProcedualGrass = true,
			ForceBloomOff = false
        },
        Level_205_FinaleWellington = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            HighQualityDepthOfField = true,
            EnableMotionBlur = false,
            EnableVolumetricLighting = false,
			ForceBloomOff = false
        },
        Level_205_FinaleOpenField =
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            HighQualityDepthOfField = true,
            EnableMotionBlur = false,
            EnableProcedualGrass = true,
			ForceBloomOff = false
        }
    };
        
    return data;
end

--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 3 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 3 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 3 |||||||||||||||||||||||||||||||||||||||

local GenerateNewINI_Season3 = function()
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = CurrentConfigurationVersion,
        },
    };
        
    return data;
end

--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 4 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 4 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 4 |||||||||||||||||||||||||||||||||||||||

local GenerateNewINI_Season4 = function()
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = CurrentConfigurationVersion,
        },
----------------------------------- SEASON 4 EPISODE 1 -----------------------------------
----------------------------------- SEASON 4 EPISODE 1 -----------------------------------
----------------------------------- SEASON 4 EPISODE 1 -----------------------------------
        Level_401_BoardingSchoolExterior = 
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            ForceBloomOff = false
        }
    };
        
    return data;
end

--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 3 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 3 |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT SEASON 3 |||||||||||||||||||||||||||||||||||||||

local GenerateNewINI_SeasonM = function()
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = CurrentConfigurationVersion,
        },
    };
        
    return data;
end

--||||||||||||||||||||||||||||||||||||||| LOAD IN OR GENERATE RELIGHT CONFIG FILES |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| LOAD IN OR GENERATE RELIGHT CONFIG FILES |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| LOAD IN OR GENERATE RELIGHT CONFIG FILES |||||||||||||||||||||||||||||||||||||||

--main
do
    ----------------------------------- GENERATE NEW INI FILES (IF THEY DON'T EXIST) -----------------------------------
    --checks if the ini files relight requires exists.
    --if they don't exist then generate a new ini object and write that to the disk

    if not TLSE_FileExists(configFileName_Main) then
        TLSE_DirectoryCreate("RelightMod");
        TLSE_INI_SaveINIFile(configFileName_Main, GenerateNewINI_Main());
    end

    if not TLSE_FileExists(configFileName_Development) then
        TLSE_INI_SaveINIFile(configFileName_Development, GenerateNewINI_Development());
    end

    if not TLSE_FileExists(configFileName_Season1) then
        TLSE_INI_SaveINIFile(configFileName_Season1, GenerateNewINI_Season1());
    end

    if not TLSE_FileExists(configFileName_Season2) then
        TLSE_INI_SaveINIFile(configFileName_Season2, GenerateNewINI_Season2());
    end

    if not TLSE_FileExists(configFileName_Season3) then
        TLSE_INI_SaveINIFile(configFileName_Season3, GenerateNewINI_Season3());
    end

    if not TLSE_FileExists(configFileName_Season4) then
        TLSE_INI_SaveINIFile(configFileName_Season4, GenerateNewINI_Season4());
    end

    if not TLSE_FileExists(configFileName_SeasonM) then
        TLSE_INI_SaveINIFile(configFileName_SeasonM, GenerateNewINI_SeasonM());
    end

    ----------------------------------- LOAD INI FILE DATA -----------------------------------
    --load in the ini files so we can pull data from them

    RelightConfigData_Main = TLSE_INI_LoadINIFile(configFileName_Main);
    RelightConfigData_Development = TLSE_INI_LoadINIFile(configFileName_Development);
    RelightConfigData_Season1 = TLSE_INI_LoadINIFile(configFileName_Season1);
    RelightConfigData_Season2 = TLSE_INI_LoadINIFile(configFileName_Season2);
    RelightConfigData_Season3 = TLSE_INI_LoadINIFile(configFileName_Season3);
    RelightConfigData_Season4 = TLSE_INI_LoadINIFile(configFileName_Season4);
    RelightConfigData_SeasonM = TLSE_INI_LoadINIFile(configFileName_SeasonM);

    ----------------------------------- REGENERATE INI FILES (IF THEY ARE A DIFFERENT VERSION) -----------------------------------
    --do a version check, and if the version number doesn't match, rebuild the ini file
    --this will revert user changes to the original ini file

    if not (RelightConfigData_Main.Version.ConfigurationVersion == CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(configFileName_Main, GenerateNewINI_Main());
    end

    if not (RelightConfigData_Development.Version.ConfigurationVersion == CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(configFileName_Development, GenerateNewINI_Development());
    end

    if not (RelightConfigData_Season1.Version.ConfigurationVersion == CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(configFileName_Season1, GenerateNewINI_Season1());
    end

    if not (RelightConfigData_Season2.Version.ConfigurationVersion == CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(configFileName_Season2, GenerateNewINI_Season2());
    end

    if not (RelightConfigData_Season3.Version.ConfigurationVersion == CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(configFileName_Season3, GenerateNewINI_Season3());
    end

    if not (RelightConfigData_Season4.Version.ConfigurationVersion == CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(configFileName_Season4, GenerateNewINI_Season4());
    end

    if not (RelightConfigData_SeasonM.Version.ConfigurationVersion == CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(configFileName_SeasonM, GenerateNewINI_SeasonM());
    end
end