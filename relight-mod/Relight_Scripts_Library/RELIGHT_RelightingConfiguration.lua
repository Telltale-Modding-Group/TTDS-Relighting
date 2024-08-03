--current config version
RELIGHT_CurrentConfigurationVersion = 100;

--relight config file names
RELIGHT_FolderName = "RelightMod";
RELIGHT_ConfigFileName_Main = RELIGHT_FolderName .. "/RelightConfiguration_Main.ini";
RELIGHT_ConfigFileName_Development = RELIGHT_FolderName .. "/RelightConfiguration_Development.ini";
RELIGHT_ConfigFileName_Season1 = RELIGHT_FolderName .. "/RelightConfiguration_Season1.ini";
RELIGHT_ConfigFileName_Season2 = RELIGHT_FolderName .. "/RelightConfiguration_Season2.ini";
RELIGHT_ConfigFileName_Season3 = RELIGHT_FolderName .. "/RelightConfiguration_Season3.ini";
RELIGHT_ConfigFileName_Season4 = RELIGHT_FolderName .. "/RelightConfiguration_Season4.ini";
RELIGHT_ConfigFileName_SeasonM = RELIGHT_FolderName .. "/RelightConfiguration_SeasonM.ini";

--relight config file data
RelightConfigData_Main = nil;
RelightConfigData_Development = nil;
RelightConfigData_Season1 = nil;
RelightConfigData_Season2 = nil;
RelightConfigData_Season3 = nil;
RelightConfigData_Season4 = nil;
RelightConfigData_SeasonM = nil;

RELIGHT_ConfigurationStart = function()
    TLSE_Development_Freecam_SnappyZoom = RelightConfigData_Development.CameraSettings.Camera_SnappyZoom;
    TLSE_Development_Freecam_SnappyMovement = RelightConfigData_Development.CameraSettings.Camera_SnappyMovement;
    TLSE_Development_Freecam_SnappyRotation = RelightConfigData_Development.CameraSettings.Camera_SnappyRotation;
    TLSE_Development_Freecam_PositionLerpFactor = RelightConfigData_Development.CameraSettings.Camera_PositionLerpFactor;
    TLSE_Development_Freecam_RotationLerpFactor = RelightConfigData_Development.CameraSettings.Camera_RotationLerpFactor;
    TLSE_Development_Freecam_ZoomLerpFactor = RelightConfigData_Development.CameraSettings.Camera_ZoomLerpFactor;
    TLSE_Development_Freecam_PositionIncrementDefault = RelightConfigData_Development.CameraSettings.Camera_PositionIncrementDefault;
    TLSE_Development_Freecam_PositionIncrementShift = RelightConfigData_Development.CameraSettings.Camera_PositionIncrementShift;
    TLSE_Development_Freecam_FovIncrement = RelightConfigData_Development.CameraSettings.Camera_FovIncrement;
    TLSE_Development_Freecam_FovMax = RelightConfigData_Development.CameraSettings.Camera_FovMax;
    TLSE_Development_Freecam_FovMin = RelightConfigData_Development.CameraSettings.Camera_FovMin;
    TLSE_Development_Freecam_NearPlane = RelightConfigData_Development.CameraSettings.Camera_NearPlane;
    TLSE_Development_Freecam_FarPlane = RelightConfigData_Development.CameraSettings.Camera_FarPlane;
end

--||||||||||||||||||||||||||||||||||||||| LOAD IN OR GENERATE RELIGHT CONFIG FILES |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| LOAD IN OR GENERATE RELIGHT CONFIG FILES |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| LOAD IN OR GENERATE RELIGHT CONFIG FILES |||||||||||||||||||||||||||||||||||||||

do
    ----------------------------------- GENERATE NEW INI FILES (IF THEY DON'T EXIST) -----------------------------------
    --checks if the ini files relight requires exists.
    --if they don't exist then generate a new ini object and write that to the disk

    if TLSE_FileExists(RELIGHT_ConfigFileName_Main) == false then
        TLSE_DirectoryCreate(RELIGHT_FolderName);
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Main, RELIGHT_GenerateNewINI_Main(RELIGHT_CurrentConfigurationVersion));
    end

    if TLSE_FileExists(RELIGHT_ConfigFileName_Development) == false then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Development, RELIGHT_GenerateNewINI_Development(RELIGHT_CurrentConfigurationVersion));
    end

    if TLSE_FileExists(RELIGHT_ConfigFileName_Season1) == false then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Season1, RELIGHT_GenerateNewINI_Season1(RELIGHT_CurrentConfigurationVersion));
    end

    if TLSE_FileExists(RELIGHT_ConfigFileName_Season2) == false then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Season2, RELIGHT_GenerateNewINI_Season2(RELIGHT_CurrentConfigurationVersion));
    end

    if TLSE_FileExists(RELIGHT_ConfigFileName_Season3) == false then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Season3, RELIGHT_GenerateNewINI_Season3(RELIGHT_CurrentConfigurationVersion));
    end

    if TLSE_FileExists(RELIGHT_ConfigFileName_Season4) == false then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Season4, RELIGHT_GenerateNewINI_Season4(RELIGHT_CurrentConfigurationVersion));
    end

    if TLSE_FileExists(RELIGHT_ConfigFileName_SeasonM) == false then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_SeasonM, RELIGHT_GenerateNewINI_SeasonM(RELIGHT_CurrentConfigurationVersion));
    end

    ----------------------------------- LOAD INI FILE DATA -----------------------------------
    --load in the ini files so we can pull data from them

    RelightConfigData_Main = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_Main);
    RelightConfigData_Development = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_Development);
    RelightConfigData_Season1 = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_Season1);
    RelightConfigData_Season2 = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_Season2);
    RelightConfigData_Season3 = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_Season3);
    RelightConfigData_Season4 = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_Season4);
    RelightConfigData_SeasonM = TLSE_INI_LoadINIFile(RELIGHT_ConfigFileName_SeasonM);

    ----------------------------------- REGENERATE INI FILES (IF THEY ARE A DIFFERENT VERSION) -----------------------------------
    --do a version check, and if the version number doesn't match, rebuild the ini file
    --this will revert user changes to the original ini file

    if not (RelightConfigData_Main["Version"]["ConfigurationVersion"] == RELIGHT_CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Main, RELIGHT_GenerateNewINI_Main(RELIGHT_CurrentConfigurationVersion));
    end

    if not (RelightConfigData_Development["Version"]["ConfigurationVersion"] == RELIGHT_CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Development, RELIGHT_GenerateNewINI_Development(RELIGHT_CurrentConfigurationVersion));
    end

    if not (RelightConfigData_Season1["Version"]["ConfigurationVersion"] == RELIGHT_CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Season1, RELIGHT_GenerateNewINI_Season1(RELIGHT_CurrentConfigurationVersion));
    end

    if not (RelightConfigData_Season2["Version"]["ConfigurationVersion"] == RELIGHT_CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Season2, RELIGHT_GenerateNewINI_Season2(RELIGHT_CurrentConfigurationVersion));
    end

    if not (RelightConfigData_Season3["Version"]["ConfigurationVersion"] == RELIGHT_CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Season3, RELIGHT_GenerateNewINI_Season3(RELIGHT_CurrentConfigurationVersion));
    end

    if not (RelightConfigData_Season4["Version"]["ConfigurationVersion"] == RELIGHT_CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_Season4, RELIGHT_GenerateNewINI_Season4(RELIGHT_CurrentConfigurationVersion));
    end

    if not (RelightConfigData_SeasonM["Version"]["ConfigurationVersion"] == RELIGHT_CurrentConfigurationVersion) then
        TLSE_INI_SaveINIFile(RELIGHT_ConfigFileName_SeasonM, RELIGHT_GenerateNewINI_SeasonM(RELIGHT_CurrentConfigurationVersion));
    end
end