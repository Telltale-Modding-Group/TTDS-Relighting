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
        Level_101_StreetOutskirts = --env_streetOutskirts 1
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_WoodsClementine = --env_woodsClementine 2
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_ClementineHouseExterior = --env_clementineHouseExterior 3
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_ClementineHouseInterior = --env_clementineHouseInterior 4
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_ClementineHouseExteriorNight = --env_clementineHouseExterior_night 5
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableProcedualGrass = true,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_HershelFarmExteriorNight = --env_hershelFarmExteriorNight 6
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_HershelFarmExterior = --env_hershelFarmExterior 7
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_DrugstoreExterior = --env_drugstoreExterior 8
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_DrugstoreInteriorPrologue = --env_drugstoreInteriorPrologue 9
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_DrugstoreOffice = --env_drugstoreOffice 10
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_DrugstoreInterior = --env_drugstoreInterior 11
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_DrugstoreExteriorNight = --env_drugstoreExteriorNight 12
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_MotorInnStealthMission = --env_motorInn_stealthMission 13
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
        Level_101_MotorInnEnd = --env_motorInn_end 14
        {
            ExposureOffset = 0.0,
            EnableRelighting = true, 
            EnableDepthOfField = true,
            EnableMotionBlur = false,
            EnableAdditionalParticles = true,
			ForceBloomOff = false
        },
    };
        
    return data;
end