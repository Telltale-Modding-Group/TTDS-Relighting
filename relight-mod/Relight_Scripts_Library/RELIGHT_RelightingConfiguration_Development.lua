--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT DEVELOPMENT |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT DEVELOPMENT |||||||||||||||||||||||||||||||||||||||
--||||||||||||||||||||||||||||||||||||||| INI GENERATION - RELIGHT DEVELOPMENT |||||||||||||||||||||||||||||||||||||||

--generates a new ini file
RELIGHT_GenerateNewINI_Development = function(number_configurationVersion)
    local data = 
    {
        Version = 
        {
            ConfigurationVersion = number_configurationVersion,
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
            Camera_FarPlane = 5000,
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