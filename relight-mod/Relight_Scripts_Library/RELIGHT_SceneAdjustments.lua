RELIGHT_Apply_Scene_ApplyExposureAdjustment = function(relightConfigLevel, number_customSetExposure)
    local number_sceneExposureOffset = relightConfigLevel.ExposureOffset; --user defined exposure offset that will be added ontop
    local number_finalExposureValue = number_customSetExposure + number_sceneExposureOffset; --combine both values
    TLSE_SetPropertyOnAllCameras(RELIGHT_SceneObject, "Exposure", number_finalExposureValue)
end