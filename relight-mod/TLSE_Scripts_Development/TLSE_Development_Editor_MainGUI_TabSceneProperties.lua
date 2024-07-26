local string_currentScenePropertiesTab = "";

--[ANTI ALIASING] 1
local tab1_boolProperty1 = nil; --(boolean) FX anti-aliasing
local tab1_numberProperty2 = nil; --(number) FX TAA Weight

--[FX LEVELS] 2
local tab2_boolProperty1 = nil; --(boolean) FX Levels Enabled
local tab2_numberProperty2 = nil; --(number) FX Levels Intensity
local tab2_numberProperty3 = nil; --(number) FX Levels Intensity HDR
local tab2_numberProperty4 = nil; --(number) FX Levels White Point
local tab2_numberProperty5 = nil; --(number) FX Levels White Point HDR
local tab2_numberProperty6 = nil; --(number) FX Levels Black Point
local tab2_numberProperty7 = nil; --(number) FX Levels Black Point HDR

--[SCENE FOG] 3
local tab3_boolProperty1 = nil; --(boolean) Fog Enabled
local tab3_colorProperty2 = nil; --(Color) Fog Color
local tab3_numberProperty3 = nil; --(number) Fog Far Plane
local tab3_numberProperty4 = nil; --(number) Fog Near Plane
local tab3_numberProperty5 = nil; --(number) Fog Alpha

--[NPR LINES] 4
local tab4_boolProperty1 = nil; --(boolean) Generate NPR Lines
local tab4_numberProperty2 = nil; --(number) NPR Lines Alpha Bias
local tab4_numberProperty3 = nil; --(number) NPR Lines Alpha Falloff
local tab4_numberProperty4 = nil; --(number) NPR Lines Bias
local tab4_numberProperty5 = nil; --(number) NPR Lines Falloff

--[BLOOM] 5
local tab5_numberProperty1 = nil; --(number) FX Bloom Threshold
local tab5_numberProperty2 = nil; --(number) FX Bloom Intensity

--[GLOW] 6
local tab6_colorProperty1 = nil; --(Color) Glow Clear Color
local tab6_numberProperty2 = nil; --(number) Glow Sigma Scale

--[FX COLOR] 7
local tab7_boolProperty1 = nil; --(boolean) FX Color Enabled
local tab7_colorProperty2 = nil; --(Color) FX Color Tint
local tab7_numberProperty3 = nil; --(number) FX Color Opacity

--[FX TONEMAP] 8
local tab8_boolProperty1 = nil; --(boolean) FX Tonemap Enabled
local tab8_boolProperty2 = nil; --(boolean) FX Tonemap DOF Enabled
local tab8_numberProperty3 = nil; --(number) FX Tonemap Intensity
local tab8_numberProperty4 = nil; --(number) FX Tonemap Type
local tab8_numberProperty5 = nil; --(number) FX Tonemap White Point
local tab8_numberProperty6 = nil; --(number) FX Tonemap Black Point
local tab8_numberProperty7 = nil; --(number) FX Tonemap Filmic Pivot
local tab8_numberProperty8 = nil; --(number) FX Tonemap Filmic Sign
local tab8_numberProperty9 = nil; --(number) FX Tonemap Filmic Shoulder Intensity
local tab8_numberProperty10 = nil; --(number) FX Tonemap Filmic Toe Intensity
local tab8_numberProperty11 = nil; --(number) FX Tonemap Far Filmic Pivot
local tab8_numberProperty12 = nil; --(number) FX Tonemap Far Filmic Sign
local tab8_numberProperty13 = nil; --(number) FX Tonemap Far Filmic Shoulder Intensity
local tab8_numberProperty14 = nil; --(number) FX Tonemap Far Filmic Toe Intensity
local tab8_numberProperty15 = nil; --(number) FX Tonemap Far White Point
local tab8_numberProperty16 = nil; --(number) FX Tonemap Far Black Point

--[FX TONEMAP RGB] 9
local tab9_boolProperty1 = nil; --(boolean) FX Tonemap RGB Enabled
local tab9_boolProperty2 = nil; --(boolean) FX Tonemap RGB DOF Enabled
local tab9_vector3Property3 = nil; --(Vector3) FX Tonemap RGB Pivots
local tab9_vector3Property4 = nil; --(Vector3) FX Tonemap RGB Signs
local tab9_vector3Property5 = nil; --(Vector3) FX Tonemap RGB Shoulder Intensities
local tab9_vector3Property6 = nil; --(Vector3) FX Tonemap RGB Toe Intensities
local tab9_vector3Property7 = nil; --(Vector3) FX Tonemap RGB Black Points
local tab9_vector3Property8 = nil; --(Vector3) FX Tonemap RGB White Points
local tab9_vector3Property9 = nil; --(Vector3) FX Tonemap RGB Far Pivots
local tab9_vector3Property10 = nil; --(Vector3) FX Tonemap RGB Far Signs
local tab9_vector3Property11 = nil; --(Vector3) FX Tonemap RGB Far Shoulder Intensities
local tab9_vector3Property12 = nil; --(Vector3) FX Tonemap RGB Far Toe Intensities
local tab9_vector3Property13 = nil; --(Vector3) FX Tonemap RGB Far Black Points
local tab9_vector3Property14 = nil; --(Vector3) FX Tonemap RGB Far White Points

--[FX AMBIENT OCCLUSION] 10
local tab10_boolProperty1 = nil; --(boolean) FX Ambient Occlusion Enabled
local tab10_numberProperty2 = nil; --(number) FX Ambient Occlusion Intensity
local tab10_numberProperty3 = nil; --(number) FX Ambient Occlusion Falloff
local tab10_numberProperty4 = nil; --(number) FX Ambient Occlusion Radius
local tab10_numberProperty5 = nil; --(number) FX Ambient Occlusion Lightmap

--[FX DOF] 11
local tab11_boolProperty1 = nil; --(boolean) FX DOF Enabled
local tab11_boolProperty2 = nil; --(boolean) FX DOF FOV Adjust Enabled
local tab11_boolProperty3 = nil; --(boolean) FX DOF Auto Focus Enabled
local tab11_boolProperty4 = nil; --(boolean) FX Vignette DOF Enabled
local tab11_numberProperty5 = nil; --(number) FX DOF Near
local tab11_numberProperty6 = nil; --(number) FX DOF Far
local tab11_numberProperty7 = nil; --(number) FX DOF Near Falloff
local tab11_numberProperty8 = nil; --(number) FX DOF Far Falloff
local tab11_numberProperty9 = nil; --(number) FX DOF Near Max
local tab11_numberProperty10 = nil; --(number) FX DOF Far Max
local tab11_numberProperty11 = nil; --(number) FX DOF Vignette Max
local tab11_numberProperty12 = nil; --(number) FX DOF Coverage Boost
local tab11_numberProperty13 = nil; --(number) FX DOF Debug

--[FX VIGNETTE] 12
local tab12_boolProperty1 = nil; --(boolean) FX Vignette Tint Enabled
local tab12_colorProperty2 = nil; --(Color) FX Vignette Tint
local tab12_numberProperty3 = nil; --(number) FX Vignette Falloff
local tab12_numberProperty4 = nil; --(number) FX Vignette Center
local tab12_numberProperty5 = nil; --(number) FX Vignette Corners

--[HBAO] 13
local tab13_boolProperty1 = nil; --(boolean) HBAO Enabled
local tab13_boolProperty2 = nil; --(boolean) HBAO Debug
local tab13_numberProperty3 = nil; --(number) HBAO Intensity
local tab13_numberProperty4 = nil; --(number) HBAO Radius
local tab13_numberProperty5 = nil; --(number) HBAO Max Radius Percent
local tab13_numberProperty6 = nil; --(number) HBAO Hemisphere Bias
local tab13_numberProperty7 = nil; --(number) HBAO Occlusion Scale
local tab13_numberProperty8 = nil; --(number) HBAO Luminance Scale
local tab13_numberProperty9 = nil; --(number) HBAO Max Distance
local tab13_numberProperty10 = nil; --(number) HBAO Distance Falloff
local tab13_numberProperty11 = nil; --(number) HBAO Blur Sharpness

--[SCREEN SPACE LINES] 14
local tab14_boolProperty1 = nil; --(boolean) Screen Space Lines - Enabled
local tab14_colorProperty2 = nil; --(Color) Screen Space Lines - Color
local tab14_numberProperty3 = nil; --(number) Screen Space Lines - Thickness
local tab14_numberProperty4 = nil; --(number) Screen Space Lines - Depth Fade Near
local tab14_numberProperty5 = nil; --(number) Screen Space Lines - Depth Fade Far
local tab14_numberProperty6 = nil; --(number) Screen Space Lines - Depth Magnitude
local tab14_numberProperty7 = nil; --(number) Screen Space Lines - Depth Exponent
local tab14_numberProperty8 = nil; --(number) Screen Space Lines - Debug
local tab14_numberProperty9 = nil; --(number) Screen Space Lines - Light Magnitude
local tab14_numberProperty10 = nil; --(number) Screen Space Lines - Light Exponent
local tab14_vector3Property11 = nil; --(Vector3) Screen Space Lines - Light Direction

--[GRAPHIC BLACK] 15
local tab15_numberProperty1 = nil; --(number) Graphic Black Threshold
local tab15_numberProperty2 = nil; --(number) Graphic Black Softness
local tab15_numberProperty3 = nil; --(number) Graphic Black Alpha
local tab15_numberProperty4 = nil; --(number) Graphic Black Near
local tab15_numberProperty5 = nil; --(number) Graphic Black Far

--[WIND] 16
local tab16_numberProperty1 = nil; --(number) Wind Speed
local tab16_numberProperty2 = nil; --(number) Wind Idle Strength
local tab16_numberProperty3 = nil; --(number) Wind Idle Spacial Frequency
local tab16_numberProperty4 = nil; --(number) Wind Gust Speed
local tab16_numberProperty5 = nil; --(number) Wind Gust Strength
local tab16_numberProperty6 = nil; --(number) Wind Gust Spacial Frequency
local tab16_numberProperty7 = nil; --(number) Wind Gust Idle Strength Multiplier
local tab16_numberProperty8 = nil; --(number) Wind Gust Separation Exponent
local tab16_vector3Property9 = nil; --(Vector3) Wind Direction

--[REFLECTION] 17
local tab17_boolProperty1 = nil; --(boolean) LightEnv Reflection Enabled
local tab17_numberProperty2 = nil; --(number) LightEnv Reflection Intensity
local tab17_numberProperty3 = nil; --(number) LightEnv Reflection Intensity Shadow
local tab17_colorProperty4 = nil; --(Color) LightEnv Reflection Tint

--[SHADOWS] 18
local tab18_boolProperty1 = nil; --(boolean) FX Sharp Shadows Enabled
local tab18_boolProperty2 = nil; --(boolean) LightEnv Shadow Auto Depth Bounds
local tab18_numberProperty3 = nil; --(number) LightEnv Shadow Moment Bias
local tab18_numberProperty4 = nil; --(number) LightEnv Shadow Depth Bias
local tab18_numberProperty5 = nil; --(number) LightEnv Shadow Position Offset Bias
local tab18_numberProperty6 = nil; --(number) LightEnv Shadow Light Bleed Reduction
local tab18_numberProperty7 = nil; --(number) LightEnv Shadow Min Distance
local tab18_numberProperty8 = nil; --(number) LightEnv Shadow Max Distance
local tab18_numberProperty9 = nil; --(number) LightEnv Dynamic Shadow Max Distance
local tab18_numberProperty10 = nil; --(number) Light Shadow Trace Max Distance
local tab18_numberProperty11 = nil; --(number) LightEnv Shadow Cascade Split Bias
local tab18_numberProperty12 = nil; --(number) LightEnv Shadow Max Updates
local tab18_vector3Property13 = nil; --(Vector3) Light Static Shadow Bounds Min
local tab18_vector3Property14 = nil; --(Vector3) Light Static Shadow Bounds Max

--[FX BRUSH] 19
local tab19_boolProperty1 = nil; --(boolean) FX Brush Outline Enable
local tab19_boolProperty2 = nil; --(boolean) FX Brush Outline Filter Enable
local tab19_boolProperty3 = nil; --(boolean) FX Brush DOF Enable
local tab19_numberProperty4 = nil; --(number) FX Brush Outline Size
local tab19_numberProperty5 = nil; --(number) FX Brush Outline Threshold
local tab19_numberProperty6 = nil; --(number) FX Brush Outline Color Threshold
local tab19_numberProperty7 = nil; --(number) FX Brush Outline Falloff
local tab19_numberProperty8 = nil; --(number) FX Brush Near Outline Scale
local tab19_numberProperty9 = nil; --(number) FX Brush Near Scale
local tab19_numberProperty10 = nil; --(number) FX Brush Near Detail
local tab19_numberProperty11 = nil; --(number) FX Brush Far Scale
local tab19_numberProperty12 = nil; --(number) FX Brush Far Detail
local tab19_numberProperty13 = nil; --(number) FX Brush Far Scale Boost
local tab19_numberProperty14 = nil; --(number) FX Brush Far Plane
local tab19_numberProperty15 = nil; --(number) FX Brush Far Plane Falloff
local tab19_numberProperty16 = nil; --(number) FX Brush Far Plane Max Scale

--[FRAME BUFFER] 20
local tab20_boolProperty1 = nil; --(boolean) Frame Buffer Scale Override
local tab20_numberProperty2 = nil; --(number) Frame Buffer Scale Factor

--[SPECULAR] 21
local tab21_boolProperty1 = nil; --(boolean) Specular Multiplier Enabled
local tab21_numberProperty2 = nil; --(number) Specular Color Multiplier
local tab21_numberProperty3 = nil; --(number) Specular Intensity Multiplier
local tab21_numberProperty4 = nil; --(number) Specular Exponent Multiplier

--[MISC] 22
local tab22_boolProperty1 = nil; --(boolean) After Effects Enabled
local tab22_boolProperty2 = nil; --(boolean) HDR lightmaps Enabled
local tab22_numberProperty3 = nil; --(number) HDR lightmaps Intensity
local tab22_numberProperty4 = nil; --(number) FX Noise Scale
local tab22_colorProperty5 = nil; --(Color) Ambient Color
local tab22_colorProperty6 = nil; --(Color) Shadow Color
local tab22_numberProperty7 = nil; --(number) FX Force Linear Depth Offset
local tab22_numberProperty8 = nil; --(number) HDR - Paper White Nits
local tab22_boolProperty9 = nil; --(boolean) LightEnv Bake Enabled
local tab22_boolProperty10 = nil; --(boolean) LightEnv Enabled
local tab22_numberProperty11 = nil; --(number) LightEnv Intensity
local tab22_numberProperty12 = nil; --(number) LightEnv Saturation
local tab22_colorProperty13 = nil; --(Color) LightEnv Tint
local tab22_colorProperty14 = nil; --(Color) LightEnv Background Color
local tab22_numberProperty15 = nil; --(number) LightEnv Probe Resolution XZ
local tab22_numberProperty16 = nil; --(number) LightEnv Probe Resolution Y

local textButton_tab1 = nil; --[ANTI ALIASING] 1
local textButton_tab2 = nil; --[FX LEVELS] 2
local textButton_tab3 = nil; --[SCENE FOG] 3
local textButton_tab4 = nil; --[NPR LINES] 4 
local textButton_tab5 = nil; --[BLOOM] 5
local textButton_tab6 = nil; --[GLOW] 6
local textButton_tab7 = nil; --[FX COLOR] 7
local textButton_tab8 = nil; --[FX TONEMAP] 8 
local textButton_tab9 = nil; --[FX TONEMAP RGB] 9 
local textButton_tab10 = nil; --[FX AMBIENT OCCLUSION] 10
local textButton_tab11 = nil; --[FX DOF] 11
local textButton_tab12 = nil; --[FX VIGNETTE] 12
local textButton_tab13 = nil; --[HBAO] 13
local textButton_tab14 = nil; --[SCREEN SPACE LINES] 14
local textButton_tab15 = nil; --[GRAPHIC BLACK] 15
local textButton_tab16 = nil; --[WIND] 16
local textButton_tab17 = nil; --[REFLECTION] 17
local textButton_tab18 = nil; --[SHADOWS] 18
local textButton_tab19 = nil; --[FX BRUSH] 19
local textButton_tab20 = nil; --[FRAME BUFFER] 20
local textButton_tab21 = nil; --[SPECULAR] 21
local textButton_tab22 = nil; --[UNCATEGORIZED] 22

local numberPropertyFieldAdjustmentValue = 1;

local ModifiyNumberPropertyValueOnAgent = function(string_property, number_adjustment, bool_multiplyByFrameTime)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local number_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            if(bool_multiplyByFrameTime) then
                number_originalValue = number_originalValue + (number_adjustment * GetFrameTime());
            else
                number_originalValue = number_originalValue + number_adjustment;
            end

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, number_originalValue);
        end
    end
end

local ModifiyBooleanPropertyValueOnAgent = function(string_property)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local number_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            number_originalValue = not number_originalValue;

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, number_originalValue);
        end
    end
end

local ModifiyColorPropertyValueOnAgent = function(string_property, number_channel, number_adjustment, bool_clamp01)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local color_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            if(number_channel == 0) then
                color_originalValue.r = color_originalValue.r + number_adjustment;
            elseif(number_channel == 1) then
                color_originalValue.g = color_originalValue.g + number_adjustment;
            elseif(number_channel == 2) then
                color_originalValue.b = color_originalValue.b + number_adjustment;
            elseif(number_channel == 3) then
                color_originalValue.a = color_originalValue.a + number_adjustment;
            end

            if(bool_clamp01) then
                color_originalValue = TLSE_ColorClamp01(color_originalValue);
            end

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, color_originalValue);
        end
    end
end

local ModifiyVector3PropertyValueOnAgent = function(string_property, number_component, number_adjustment)
    if(TLSE_Development_SceneAgent ~= nil) then
        if(AgentHasProperty(TLSE_Development_SceneAgent, string_property)) then
            local vector_originalValue = AgentGetProperty(TLSE_Development_SceneAgent, string_property);

            if(number_component == 0) then
                vector_originalValue.x = vector_originalValue.x + number_adjustment;
            elseif(number_component == 1) then
                vector_originalValue.y = vector_originalValue.y + number_adjustment;
            elseif(number_component == 2) then
                vector_originalValue.z = vector_originalValue.z + number_adjustment;
            end

            AgentSetProperty(TLSE_Development_SceneAgent, string_property, vector_originalValue);
        end
    end
end

TLSE_TabSceneProperties_OnClick_Tab1 = function(textButton_button) string_currentScenePropertiesTab = "Tab1"; end
TLSE_TabSceneProperties_OnClick_Tab2 = function(textButton_button) string_currentScenePropertiesTab = "Tab2"; end
TLSE_TabSceneProperties_OnClick_Tab3 = function(textButton_button) string_currentScenePropertiesTab = "Tab3"; end
TLSE_TabSceneProperties_OnClick_Tab4 = function(textButton_button) string_currentScenePropertiesTab = "Tab4"; end
TLSE_TabSceneProperties_OnClick_Tab5 = function(textButton_button) string_currentScenePropertiesTab = "Tab5"; end
TLSE_TabSceneProperties_OnClick_Tab6 = function(textButton_button) string_currentScenePropertiesTab = "Tab6"; end
TLSE_TabSceneProperties_OnClick_Tab7 = function(textButton_button) string_currentScenePropertiesTab = "Tab7"; end
TLSE_TabSceneProperties_OnClick_Tab8 = function(textButton_button) string_currentScenePropertiesTab = "Tab8"; end
TLSE_TabSceneProperties_OnClick_Tab9 = function(textButton_button) string_currentScenePropertiesTab = "Tab9"; end
TLSE_TabSceneProperties_OnClick_Tab10 = function(textButton_button) string_currentScenePropertiesTab = "Tab10"; end
TLSE_TabSceneProperties_OnClick_Tab11 = function(textButton_button) string_currentScenePropertiesTab = "Tab11"; end
TLSE_TabSceneProperties_OnClick_Tab12 = function(textButton_button) string_currentScenePropertiesTab = "Tab12"; end
TLSE_TabSceneProperties_OnClick_Tab13 = function(textButton_button) string_currentScenePropertiesTab = "Tab13"; end
TLSE_TabSceneProperties_OnClick_Tab14 = function(textButton_button) string_currentScenePropertiesTab = "Tab14"; end
TLSE_TabSceneProperties_OnClick_Tab15 = function(textButton_button) string_currentScenePropertiesTab = "Tab15"; end
TLSE_TabSceneProperties_OnClick_Tab16 = function(textButton_button) string_currentScenePropertiesTab = "Tab16"; end
TLSE_TabSceneProperties_OnClick_Tab17 = function(textButton_button) string_currentScenePropertiesTab = "Tab17"; end
TLSE_TabSceneProperties_OnClick_Tab18 = function(textButton_button) string_currentScenePropertiesTab = "Tab18"; end
TLSE_TabSceneProperties_OnClick_Tab19 = function(textButton_button) string_currentScenePropertiesTab = "Tab19"; end
TLSE_TabSceneProperties_OnClick_Tab20 = function(textButton_button) string_currentScenePropertiesTab = "Tab20"; end
TLSE_TabSceneProperties_OnClick_Tab21 = function(textButton_button) string_currentScenePropertiesTab = "Tab21"; end
TLSE_TabSceneProperties_OnClick_Tab22 = function(textButton_button) string_currentScenePropertiesTab = "Tab22"; end

--[ANTI ALIASING] 1
TLSE_TabSceneProperties_OnToggle_Tab1Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX anti-aliasing"); end
TLSE_TabSceneProperties_OnIncrease_Tab1Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX TAA Weight", numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab1Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX TAA Weight", -numberPropertyFieldAdjustmentValue, true); end

--[FX LEVELS] 2
TLSE_TabSceneProperties_OnToggle_Tab2Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Levels Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Intensity HDR", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Intensity HDR", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels White Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels White Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels White Point HDR", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels White Point HDR", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Black Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Black Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab2Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Black Point HDR", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab2Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Levels Black Point HDR", -numberPropertyFieldAdjustmentValue, false); end

--[SCENE FOG] 3
TLSE_TabSceneProperties_OnToggle_Tab3Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Fog Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Fog Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Far Plane", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Far Plane", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Near Plane", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Near Plane", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab3Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Alpha", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab3Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Fog Alpha", -numberPropertyFieldAdjustmentValue, false); end

--[NPR LINES] 4
TLSE_TabSceneProperties_OnToggle_Tab4Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Generate NPR Lines"); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Alpha Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Alpha Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Alpha Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Alpha Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab4Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab4Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("NPR Lines Falloff", -numberPropertyFieldAdjustmentValue, false); end

--[BLOOM] 5
TLSE_TabSceneProperties_OnIncrease_Tab5Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Bloom Threshold", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab5Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Bloom Threshold", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab5Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Bloom Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab5Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Bloom Intensity", -numberPropertyFieldAdjustmentValue, false); end

--[GLOW] 6
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property1_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property1_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Glow Clear Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab6Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Glow Sigma Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab6Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Glow Sigma Scale", -numberPropertyFieldAdjustmentValue, false); end

--[FX COLOR] 7
TLSE_TabSceneProperties_OnToggle_Tab7Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Color Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Color Tint", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab7Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Color Opacity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab7Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Color Opacity", -numberPropertyFieldAdjustmentValue, false); end

--[FX TONEMAP] 8
TLSE_TabSceneProperties_OnToggle_Tab8Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Tonemap Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab8Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Tonemap DOF Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Type", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Type", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap White Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap White Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Black Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Black Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Pivot", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Pivot", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Sign", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Sign", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Shoulder Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Shoulder Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Toe Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Filmic Toe Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Pivot", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Pivot", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Sign", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Sign", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Shoulder Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Shoulder Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property14 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Toe Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property14 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Filmic Toe Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far White Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far White Point", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab8Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Black Point", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab8Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Tonemap Far Black Point", -numberPropertyFieldAdjustmentValue, false); end

--[FX TONEMAP RGB] 9
TLSE_TabSceneProperties_OnToggle_Tab9Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Tonemap RGB Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab9Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Tonemap RGB DOF Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property3_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property3_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property3_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property3_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property3_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property3_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Pivots", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property4_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property4_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property4_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property4_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property4_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property4_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Signs", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property5_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property5_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property5_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property5_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property5_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property5_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Shoulder Intensities", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property6_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property6_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property6_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property6_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property6_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property6_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Toe Intensities", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property7_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property7_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property7_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property7_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property7_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property7_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Black Points", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property8_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property8_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property8_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property8_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property8_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property8_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB White Points", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property9_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property9_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property9_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property9_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property9_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property9_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Pivots", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property10_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property10_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property10_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property10_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property10_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property10_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Signs", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property11_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property11_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property11_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property11_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property11_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property11_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Shoulder Intensities", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property12_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property12_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property12_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property12_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property12_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property12_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Toe Intensities", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property13_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property13_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property13_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property13_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property13_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property13_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far Black Points", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property14_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property14_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab9Property14_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property14_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property14_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab9Property14_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("FX Tonemap RGB Far White Points", 2, -numberPropertyFieldAdjustmentValue); end

--[FX AMBIENT OCCLUSION] 10
TLSE_TabSceneProperties_OnToggle_Tab10Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Ambient Occlusion Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab10Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab10Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab10Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab10Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab10Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Radius", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab10Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Radius", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab10Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Lightmap", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab10Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Ambient Occlusion Lightmap", -numberPropertyFieldAdjustmentValue, false); end

--[FX DOF] 11
TLSE_TabSceneProperties_OnToggle_Tab11Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX DOF Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab11Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX DOF FOV Adjust Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab11Property3 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX DOF Auto Focus Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab11Property4 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Vignette DOF Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Near", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Near", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Far", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Far", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Near Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Near Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Far Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Far Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Near Max", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Near Max", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Far Max", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Far Max", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Vignette Max", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Vignette Max", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Coverage Boost", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Coverage Boost", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab11Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Debug", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab11Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX DOF Debug", -numberPropertyFieldAdjustmentValue, false); end

--[FX VIGNETTE] 12
TLSE_TabSceneProperties_OnToggle_Tab12Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Vignette Tint Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("FX Vignette Tint", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Center", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Center", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab12Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Corners", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab12Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Vignette Corners", -numberPropertyFieldAdjustmentValue, false); end

--[HBAO] 13
TLSE_TabSceneProperties_OnToggle_Tab13Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("HBAO Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab13Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("HBAO Debug"); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Radius", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Radius", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Max Radius Percent", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Max Radius Percent", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Hemisphere Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Hemisphere Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Occlusion Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Occlusion Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Luminance Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Luminance Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Max Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Max Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Distance Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Distance Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab13Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Blur Sharpness", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab13Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HBAO Blur Sharpness", -numberPropertyFieldAdjustmentValue, false); end

--[SCREEN SPACE LINES] 14
TLSE_TabSceneProperties_OnToggle_Tab14Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Screen Space Lines - Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property2_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Screen Space Lines - Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Thickness", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Thickness", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Fade Near", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Fade Near", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Fade Far", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Fade Far", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Magnitude", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Magnitude", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Exponent", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Depth Exponent", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Debug", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Debug", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Light Magnitude", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Light Magnitude", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Light Exponent", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Screen Space Lines - Light Exponent", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Screen Space Lines - Light Direction", 2, -numberPropertyFieldAdjustmentValue); end

--[GRAPHIC BLACK] 15
TLSE_TabSceneProperties_OnIncrease_Tab15Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Threshold", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Threshold", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Softness", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Softness", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Alpha", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Alpha", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Near", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Near", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab15Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Far", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab15Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Graphic Black Far", -numberPropertyFieldAdjustmentValue, false); end

--[WIND] 16
TLSE_TabSceneProperties_OnIncrease_Tab16Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Speed", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property1 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Speed", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Idle Strength", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Idle Strength", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Idle Spacial Frequency", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Idle Spacial Frequency", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Speed", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Speed", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Strength", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Strength", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Spacial Frequency", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Spacial Frequency", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Idle Strength Multiplier", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Idle Strength Multiplier", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Separation Exponent", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Wind Gust Separation Exponent", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Wind Direction", 2, -numberPropertyFieldAdjustmentValue); end

--[REFLECTION] 17
TLSE_TabSceneProperties_OnToggle_Tab17Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("LightEnv Reflection Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Reflection Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Reflection Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Reflection Intensity Shadow", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Reflection Intensity Shadow", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab17Property4_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab17Property4_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Reflection Tint", 3, -numberPropertyFieldAdjustmentValue, true); end

--[SHADOWS] 18
TLSE_TabSceneProperties_OnToggle_Tab18Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Sharp Shadows Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab18Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("LightEnv Shadow Auto Depth Bounds"); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Moment Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Moment Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Depth Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Depth Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Position Offset Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Position Offset Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Light Bleed Reduction", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Light Bleed Reduction", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Min Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Min Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Max Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Max Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Dynamic Shadow Max Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Dynamic Shadow Max Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Light Shadow Trace Max Distance", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Light Shadow Trace Max Distance", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Cascade Split Bias", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Cascade Split Bias", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Max Updates", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Shadow Max Updates", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Min", 2, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 0, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 1, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 2, numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_X = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 0, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Y = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 1, -numberPropertyFieldAdjustmentValue); end
TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Z = function(textButton_button) ModifiyVector3PropertyValueOnAgent("Light Static Shadow Bounds Max", 2, -numberPropertyFieldAdjustmentValue); end

--[FX BRUSH] 19
TLSE_TabSceneProperties_OnToggle_Tab19Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Brush Outline Enable"); end
TLSE_TabSceneProperties_OnToggle_Tab19Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Brush Outline Filter Enable"); end
TLSE_TabSceneProperties_OnToggle_Tab19Property3 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("FX Brush DOF Enable"); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Size", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Size", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Threshold", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property5 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Threshold", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Color Threshold", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property6 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Color Threshold", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Outline Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Outline Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Outline Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property9 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Detail", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property10 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Near Detail", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Detail", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Detail", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Scale Boost", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property13 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Scale Boost", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property14 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property14 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane Falloff", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane Falloff", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab19Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane Max Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab19Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Brush Far Plane Max Scale", -numberPropertyFieldAdjustmentValue, false); end

--[FRAME BUFFER] 20
TLSE_TabSceneProperties_OnToggle_Tab20Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Frame Buffer Scale Override"); end
TLSE_TabSceneProperties_OnIncrease_Tab20Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Frame Buffer Scale Factor", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab20Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Frame Buffer Scale Factor", -numberPropertyFieldAdjustmentValue, false); end

--[SPECULAR] 21
TLSE_TabSceneProperties_OnToggle_Tab21Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("Specular Multiplier Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Color Multiplier", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property2 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Color Multiplier", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Intensity Multiplier", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Intensity Multiplier", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab21Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Exponent Multiplier", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab21Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("Specular Exponent Multiplier", -numberPropertyFieldAdjustmentValue, false); end

--[MISC] 22
TLSE_TabSceneProperties_OnToggle_Tab22Property1 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("After Effects Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property2 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("HDR lightmaps Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property9 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("LightEnv Bake Enabled"); end
TLSE_TabSceneProperties_OnToggle_Tab22Property10 = function(textButton_button) ModifiyBooleanPropertyValueOnAgent("LightEnv Enabled"); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HDR lightmaps Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property3 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HDR lightmaps Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Noise Scale", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property4 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Noise Scale", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Force Linear Depth Offset", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property7 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("FX Force Linear Depth Offset", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HDR - Paper White Nits", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property8 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("HDR - Paper White Nits", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Intensity", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property11 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Intensity", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Saturation", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property12 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Saturation", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution XZ", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property15 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution XZ", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution Y", numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property16 = function(textButton_button) ModifiyNumberPropertyValueOnAgent("LightEnv Probe Resolution Y", -numberPropertyFieldAdjustmentValue, false); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property5_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property5_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Ambient Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property6_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property6_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("Shadow Color", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property13_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property13_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Tint", 3, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 0, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 1, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 2, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnIncrease_Tab22Property14_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 3, numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_R = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 0, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_G = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 1, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_B = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 2, -numberPropertyFieldAdjustmentValue, true); end
TLSE_TabSceneProperties_OnDecrease_Tab22Property14_A = function(textButton_button) ModifiyColorPropertyValueOnAgent("LightEnv Background Color", 3, -numberPropertyFieldAdjustmentValue, true); end

TLSE_Development_MainGUI_TabScenePropertiesInitalize = function()
    textButton_tab1 = TLSE_Development_Editor_GUI_CreateTextButton("[ANTI ALIASING]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab1, nil);
    textButton_tab2 = TLSE_Development_Editor_GUI_CreateTextButton("[FX LEVELS]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab2, nil);
    textButton_tab3 = TLSE_Development_Editor_GUI_CreateTextButton("[SCENE FOG]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab3, nil);
    textButton_tab4 = TLSE_Development_Editor_GUI_CreateTextButton("[NPR LINES]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab4, nil);
    textButton_tab5 = TLSE_Development_Editor_GUI_CreateTextButton("[BLOOM]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab5, nil);
    textButton_tab6 = TLSE_Development_Editor_GUI_CreateTextButton("[GLOW]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab6, nil);
    textButton_tab7 = TLSE_Development_Editor_GUI_CreateTextButton("[FX COLOR]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab7, nil);
    textButton_tab8 = TLSE_Development_Editor_GUI_CreateTextButton("[FX TONEMAP]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab8, nil);
    textButton_tab9 = TLSE_Development_Editor_GUI_CreateTextButton("[FX TONEMAP RGB]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab9, nil);
    textButton_tab10 = TLSE_Development_Editor_GUI_CreateTextButton("[FX AMBIENT OCCLUSION]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab10, nil);
    textButton_tab11 = TLSE_Development_Editor_GUI_CreateTextButton("[FX DOF]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab11, nil);
    textButton_tab12 = TLSE_Development_Editor_GUI_CreateTextButton("[FX VIGNETTE]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab12, nil);
    textButton_tab13 = TLSE_Development_Editor_GUI_CreateTextButton("[HBAO]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab13, nil);
    textButton_tab14 = TLSE_Development_Editor_GUI_CreateTextButton("[SCREEN SPACE LINES]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab14, nil);
    textButton_tab15 = TLSE_Development_Editor_GUI_CreateTextButton("[GRAPHIC BLACK]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab15, nil);
    textButton_tab16 = TLSE_Development_Editor_GUI_CreateTextButton("[WIND]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab16, nil);
    textButton_tab17 = TLSE_Development_Editor_GUI_CreateTextButton("[REFLECTION]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab17, nil);
    textButton_tab18 = TLSE_Development_Editor_GUI_CreateTextButton("[SHADOWS]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab18, nil);
    textButton_tab19 = TLSE_Development_Editor_GUI_CreateTextButton("[FX BRUSH]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab19, nil);
    textButton_tab20 = TLSE_Development_Editor_GUI_CreateTextButton("[FRAME BUFFER]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab20, nil);
    textButton_tab21 = TLSE_Development_Editor_GUI_CreateTextButton("[SPECULAR]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab21, nil);
    textButton_tab22 = TLSE_Development_Editor_GUI_CreateTextButton("[UNCATEGORIZED]", true, Vector(0.685, 0.525, 0.0), TLSE_TabSceneProperties_OnClick_Tab22, nil);

    --[ANTI ALIASING] 1
    tab1_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX anti-aliasing", "FX anti-aliasing", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab1Property1);
    tab1_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX TAA Weight", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab1Property2, TLSE_TabSceneProperties_OnDecrease_Tab1Property2);

    --[FX LEVELS] 2
    tab2_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Levels Enabled", "FX Levels Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab2Property1);
    tab2_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property2, TLSE_TabSceneProperties_OnDecrease_Tab2Property2);
    tab2_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels Intensity HDR", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property3, TLSE_TabSceneProperties_OnDecrease_Tab2Property3);
    tab2_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels White Point", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property4, TLSE_TabSceneProperties_OnDecrease_Tab2Property4);
    tab2_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels White Point HDR", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property5, TLSE_TabSceneProperties_OnDecrease_Tab2Property5);
    tab2_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels Black Point", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property6, TLSE_TabSceneProperties_OnDecrease_Tab2Property6);
    tab2_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Levels Black Point HDR", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab2Property7, TLSE_TabSceneProperties_OnDecrease_Tab2Property7);

    --[SCENE FOG] 3
    tab3_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Fog Enabled", "Fog Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab3Property1);
    tab3_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Fog Color", "Fog Color", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab3Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab3Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab3Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab3Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab3Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab3Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab3Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab3Property2_A);
    tab3_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Far Plane", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab3Property3, TLSE_TabSceneProperties_OnDecrease_Tab3Property3);
    tab3_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Near Plane", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab3Property4, TLSE_TabSceneProperties_OnDecrease_Tab3Property4);
    tab3_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Fog Alpha", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab3Property5, TLSE_TabSceneProperties_OnDecrease_Tab3Property5);

    --[NPR LINES] 4
    tab4_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Generate NPR Lines", "Generate NPR Lines", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab4Property1);
    tab4_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Alpha Bias", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property2, TLSE_TabSceneProperties_OnDecrease_Tab4Property2);
    tab4_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Alpha Falloff", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property3, TLSE_TabSceneProperties_OnDecrease_Tab4Property3);
    tab4_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Bias", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property4, TLSE_TabSceneProperties_OnDecrease_Tab4Property4);
    tab4_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "NPR Lines Falloff", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab4Property5, TLSE_TabSceneProperties_OnDecrease_Tab4Property5);

    --[BLOOM] 5
    tab5_numberProperty1 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Bloom Threshold", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab5Property1, TLSE_TabSceneProperties_OnDecrease_Tab5Property1);
    tab5_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Bloom Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab5Property2, TLSE_TabSceneProperties_OnDecrease_Tab5Property2);

    --[GLOW] 6
    tab6_colorProperty1 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Glow Clear Color", "Glow Clear Color", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_R, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_G, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_B, TLSE_TabSceneProperties_OnIncrease_Tab6Property1_A, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_R, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_G, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_B, TLSE_TabSceneProperties_OnDecrease_Tab6Property1_A);
    tab6_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Glow Sigma Scale", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab6Property2, TLSE_TabSceneProperties_OnDecrease_Tab6Property2);

    --[FX COLOR] 7
    tab7_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Color Enabled", "FX Color Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab7Property1);
    tab7_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "FX Color Tint", "FX Color Tint", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab7Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab7Property2_A);
    tab7_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Color Opacity", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab7Property3, TLSE_TabSceneProperties_OnDecrease_Tab7Property3);

    --[FX TONEMAP] 8
    tab8_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap Enabled", "FX Tonemap Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab8Property1);
    tab8_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap DOF Enabled", "FX Tonemap DOF Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab8Property2);
    tab8_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Intensity", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property3, TLSE_TabSceneProperties_OnDecrease_Tab8Property3);
    tab8_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Type", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property4, TLSE_TabSceneProperties_OnDecrease_Tab8Property4);
    tab8_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap White Point", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property5, TLSE_TabSceneProperties_OnDecrease_Tab8Property5);
    tab8_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Black Point", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property6, TLSE_TabSceneProperties_OnDecrease_Tab8Property6);
    tab8_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Pivot", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property7, TLSE_TabSceneProperties_OnDecrease_Tab8Property7);
    tab8_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Sign", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property8, TLSE_TabSceneProperties_OnDecrease_Tab8Property8);
    tab8_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Shoulder Intensity", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property9, TLSE_TabSceneProperties_OnDecrease_Tab8Property9);
    tab8_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Filmic Toe Intensity", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property10, TLSE_TabSceneProperties_OnDecrease_Tab8Property10);
    tab8_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Pivot", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property11, TLSE_TabSceneProperties_OnDecrease_Tab8Property11);
    tab8_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Sign", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property12, TLSE_TabSceneProperties_OnDecrease_Tab8Property12);
    tab8_numberProperty13 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Shoulder Intensity", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property13, TLSE_TabSceneProperties_OnDecrease_Tab8Property13);
    tab8_numberProperty14 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Filmic Toe Intensity", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property14, TLSE_TabSceneProperties_OnDecrease_Tab8Property14);
    tab8_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far White Point", Vector(0.685, 0.725, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property15, TLSE_TabSceneProperties_OnDecrease_Tab8Property15);
    tab8_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Tonemap Far Black Point", Vector(0.685, 0.735, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab8Property16, TLSE_TabSceneProperties_OnDecrease_Tab8Property16);

    --[FX TONEMAP RGB] 9
    tab9_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap RGB Enabled", "FX Tonemap RGB Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab9Property1);
    tab9_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Tonemap RGB DOF Enabled", "FX Tonemap RGB DOF Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab9Property2);
    tab9_vector3Property3 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Pivots", "FX Tonemap RGB Pivots", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property3_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property3_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property3_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property3_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property3_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property3_Z);
    tab9_vector3Property4 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Signs", "FX Tonemap RGB Signs", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property4_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property4_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property4_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property4_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property4_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property4_Z);
    tab9_vector3Property5 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Shoulder Intensities", "FX Tonemap RGB Shoulder Intensities", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property5_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property5_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property5_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property5_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property5_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property5_Z);
    tab9_vector3Property6 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Toe Intensities", "FX Tonemap RGB Toe Intensities", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property6_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property6_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property6_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property6_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property6_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property6_Z);
    tab9_vector3Property7 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Black Points", "FX Tonemap RGB Black Points", Vector(0.685, 0.725, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property7_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property7_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property7_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property7_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property7_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property7_Z);
    tab9_vector3Property8 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB White Points", "FX Tonemap RGB White Points", Vector(0.685, 0.755, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property8_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property8_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property8_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property8_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property8_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property8_Z);
    tab9_vector3Property9 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Pivots", "FX Tonemap RGB Far Pivots", Vector(0.685, 0.785, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property9_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property9_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property9_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property9_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property9_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property9_Z);
    tab9_vector3Property10 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Signs", "FX Tonemap RGB Far Signs", Vector(0.685, 0.815, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property10_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property10_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property10_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property10_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property10_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property10_Z);
    tab9_vector3Property11 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Shoulder Intensities", "FX Tonemap RGB Far Shoulder Intensities", Vector(0.685, 0.845, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property11_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property11_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property11_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property11_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property11_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property11_Z);
    tab9_vector3Property12 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Toe Intensities", "FX Tonemap RGB Far Toe Intensities", Vector(0.685, 0.875, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property12_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property12_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property12_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property12_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property12_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property12_Z);
    tab9_vector3Property13 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far Black Points", "FX Tonemap RGB Far Black Points", Vector(0.685, 0.905, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property13_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property13_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property13_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property13_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property13_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property13_Z);
    tab9_vector3Property14 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "FX Tonemap RGB Far White Points", "FX Tonemap RGB Far White Points", Vector(0.685, 0.935, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab9Property14_X, TLSE_TabSceneProperties_OnIncrease_Tab9Property14_Y, TLSE_TabSceneProperties_OnIncrease_Tab9Property14_Z, TLSE_TabSceneProperties_OnDecrease_Tab9Property14_X, TLSE_TabSceneProperties_OnDecrease_Tab9Property14_Y, TLSE_TabSceneProperties_OnDecrease_Tab9Property14_Z);

    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Ambient Occlusion Enabled", "FX Ambient Occlusion Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab10Property1);
    tab10_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab10Property2, TLSE_TabSceneProperties_OnDecrease_Tab10Property2);
    tab10_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Falloff", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab10Property3, TLSE_TabSceneProperties_OnDecrease_Tab10Property3);
    tab10_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Radius", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab10Property4, TLSE_TabSceneProperties_OnDecrease_Tab10Property4);
    tab10_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Ambient Occlusion Lightmap", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab10Property5, TLSE_TabSceneProperties_OnDecrease_Tab10Property5);

    --[FX DOF] 11
    tab11_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX DOF Enabled", "FX DOF Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab11Property1);
    tab11_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX DOF FOV Adjust Enabled", "FX DOF FOV Adjust Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab11Property2);
    tab11_boolProperty3 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX DOF Auto Focus Enabled", "FX DOF Auto Focus Enabled", Vector(0.685, 0.605, 0.0), TLSE_TabSceneProperties_OnToggle_Tab11Property3);
    tab11_boolProperty4 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Vignette DOF Enabled", "FX Vignette DOF Enabled", Vector(0.685, 0.615, 0.0), TLSE_TabSceneProperties_OnToggle_Tab11Property4);
    tab11_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Near", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property5, TLSE_TabSceneProperties_OnDecrease_Tab11Property5);
    tab11_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Far", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property6, TLSE_TabSceneProperties_OnDecrease_Tab11Property6);
    tab11_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Near Falloff", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property7, TLSE_TabSceneProperties_OnDecrease_Tab11Property7);
    tab11_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Far Falloff", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property8, TLSE_TabSceneProperties_OnDecrease_Tab11Property8);
    tab11_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Near Max", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property9, TLSE_TabSceneProperties_OnDecrease_Tab11Property9);
    tab11_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Far Max", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property10, TLSE_TabSceneProperties_OnDecrease_Tab11Property10);
    tab11_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Vignette Max", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property11, TLSE_TabSceneProperties_OnDecrease_Tab11Property11);
    tab11_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Coverage Boost", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property12, TLSE_TabSceneProperties_OnDecrease_Tab11Property12);
    tab11_numberProperty13 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX DOF Debug", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab11Property13, TLSE_TabSceneProperties_OnDecrease_Tab11Property13);

    --[FX VIGNETTE] 12
    tab12_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Vignette Tint Enabled", "FX Vignette Tint Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab12Property1);
    tab12_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "FX Vignette Tint", "FX Vignette Tint", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab12Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab12Property2_A);
    tab12_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Falloff", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property3, TLSE_TabSceneProperties_OnDecrease_Tab12Property3);
    tab12_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Center", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property4, TLSE_TabSceneProperties_OnDecrease_Tab12Property4);
    tab12_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Vignette Corners", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab12Property5, TLSE_TabSceneProperties_OnDecrease_Tab12Property5);

    --[HBAO] 13
    tab13_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HBAO Enabled", "HBAO Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab13Property1);
    tab13_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HBAO Debug", "HBAO Debug", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab13Property2);
    tab13_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Intensity", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property3, TLSE_TabSceneProperties_OnDecrease_Tab13Property3);
    tab13_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Radius", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property4, TLSE_TabSceneProperties_OnDecrease_Tab13Property4);
    tab13_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Max Radius Percent", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property5, TLSE_TabSceneProperties_OnDecrease_Tab13Property5);
    tab13_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Hemisphere Bias", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property6, TLSE_TabSceneProperties_OnDecrease_Tab13Property6);
    tab13_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Occlusion Scale", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property7, TLSE_TabSceneProperties_OnDecrease_Tab13Property7);
    tab13_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Luminance Scale", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property8, TLSE_TabSceneProperties_OnDecrease_Tab13Property8);
    tab13_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Max Distance", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property9, TLSE_TabSceneProperties_OnDecrease_Tab13Property9);
    tab13_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Distance Falloff", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property10, TLSE_TabSceneProperties_OnDecrease_Tab13Property10);
    tab13_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HBAO Blur Sharpness", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab13Property11, TLSE_TabSceneProperties_OnDecrease_Tab13Property11);

    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Screen Space Lines - Enabled", "Screen Space Lines - Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab14Property1);
    tab14_colorProperty2 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Screen Space Lines - Color", "Screen Space Lines - Color", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_R, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_G, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_B, TLSE_TabSceneProperties_OnIncrease_Tab14Property2_A, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_R, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_G, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_B, TLSE_TabSceneProperties_OnDecrease_Tab14Property2_A);
    tab14_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Thickness", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property3, TLSE_TabSceneProperties_OnDecrease_Tab14Property3);
    tab14_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Fade Near", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property4, TLSE_TabSceneProperties_OnDecrease_Tab14Property4);
    tab14_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Fade Far", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property5, TLSE_TabSceneProperties_OnDecrease_Tab14Property5);
    tab14_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Magnitude", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property6, TLSE_TabSceneProperties_OnDecrease_Tab14Property6);
    tab14_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Depth Exponent", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property7, TLSE_TabSceneProperties_OnDecrease_Tab14Property7);
    tab14_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Debug", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property8, TLSE_TabSceneProperties_OnDecrease_Tab14Property8);
    tab14_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Light Magnitude", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property9, TLSE_TabSceneProperties_OnDecrease_Tab14Property9);
    tab14_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Screen Space Lines - Light Exponent", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property10, TLSE_TabSceneProperties_OnDecrease_Tab14Property10);
    tab14_vector3Property11 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Screen Space Lines - Light Direction", "Screen Space Lines - Light Direction", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_X, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Y, TLSE_TabSceneProperties_OnIncrease_Tab14Property11_Z, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_X, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Y, TLSE_TabSceneProperties_OnDecrease_Tab14Property11_Z);

    --[GRAPHIC BLACK] 15
    tab15_numberProperty1 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Threshold", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property1, TLSE_TabSceneProperties_OnDecrease_Tab15Property1);
    tab15_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Softness", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property2, TLSE_TabSceneProperties_OnDecrease_Tab15Property2);
    tab15_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Alpha", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property3, TLSE_TabSceneProperties_OnDecrease_Tab15Property3);
    tab15_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Near", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property4, TLSE_TabSceneProperties_OnDecrease_Tab15Property4);
    tab15_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Graphic Black Far", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab15Property5, TLSE_TabSceneProperties_OnDecrease_Tab15Property5);

    --[WIND] 16
    tab16_numberProperty1 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Speed", Vector(0.685, 0.585, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property1, TLSE_TabSceneProperties_OnDecrease_Tab16Property1);
    tab16_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Idle Strength", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property2, TLSE_TabSceneProperties_OnDecrease_Tab16Property2);
    tab16_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Idle Spacial Frequency", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property3, TLSE_TabSceneProperties_OnDecrease_Tab16Property3);
    tab16_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Speed", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property4, TLSE_TabSceneProperties_OnDecrease_Tab16Property4);
    tab16_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Strength", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property5, TLSE_TabSceneProperties_OnDecrease_Tab16Property5);
    tab16_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Spacial Frequency", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property6, TLSE_TabSceneProperties_OnDecrease_Tab16Property6);
    tab16_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Idle Strength Multiplier", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property7, TLSE_TabSceneProperties_OnDecrease_Tab16Property7);
    tab16_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Wind Gust Separation Exponent", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab16Property8, TLSE_TabSceneProperties_OnDecrease_Tab16Property8);
    tab16_vector3Property9 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Wind Direction", "Wind Direction", Vector(0.685, 0.665, 0.0), TLSE_TabSceneProperties_OnIncrease_Tab16Property9_X, TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Y, TLSE_TabSceneProperties_OnIncrease_Tab16Property9_Z, TLSE_TabSceneProperties_OnDecrease_Tab16Property9_X, TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Y, TLSE_TabSceneProperties_OnDecrease_Tab16Property9_Z);

    --[REFLECTION] 17
    tab17_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Reflection Enabled", "LightEnv Reflection Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab17Property1);
    tab17_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Reflection Intensity", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property2, TLSE_TabSceneProperties_OnDecrease_Tab17Property2);
    tab17_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Reflection Intensity Shadow", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property3, TLSE_TabSceneProperties_OnDecrease_Tab17Property3);
    tab17_colorProperty4 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Reflection Tint", "LightEnv Reflection Tint", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_R, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_G, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_B, TLSE_TabSceneProperties_OnIncrease_Tab17Property4_A, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_R, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_G, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_B, TLSE_TabSceneProperties_OnDecrease_Tab17Property4_A);

    --[SHADOWS] 18
    tab18_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Sharp Shadows Enabled", "FX Sharp Shadows Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab18Property1);
    tab18_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Shadow Auto Depth Bounds", "LightEnv Shadow Auto Depth Bounds", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab18Property2);
    tab18_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Moment Bias", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property3, TLSE_TabSceneProperties_OnDecrease_Tab18Property3);
    tab18_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Depth Bias", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property4, TLSE_TabSceneProperties_OnDecrease_Tab18Property4);
    tab18_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Position Offset Bias", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property5, TLSE_TabSceneProperties_OnDecrease_Tab18Property5);
    tab18_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Light Bleed Reduction", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property6, TLSE_TabSceneProperties_OnDecrease_Tab18Property6);
    tab18_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Min Distance", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property7, TLSE_TabSceneProperties_OnDecrease_Tab18Property7);
    tab18_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Max Distance", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property8, TLSE_TabSceneProperties_OnDecrease_Tab18Property8);
    tab18_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Dynamic Shadow Max Distance", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property9, TLSE_TabSceneProperties_OnDecrease_Tab18Property9);
    tab18_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Light Shadow Trace Max Distance", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property10, TLSE_TabSceneProperties_OnDecrease_Tab18Property10);
    tab18_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Cascade Split Bias", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property11, TLSE_TabSceneProperties_OnDecrease_Tab18Property11);
    tab18_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Shadow Max Updates", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property12, TLSE_TabSceneProperties_OnDecrease_Tab18Property12);
    tab18_vector3Property13 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Light Static Shadow Bounds Min", "Light Static Shadow Bounds Min", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property13_X, TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Y, TLSE_TabSceneProperties_OnIncrease_Tab18Property13_Z, TLSE_TabSceneProperties_OnDecrease_Tab18Property13_X, TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Y, TLSE_TabSceneProperties_OnDecrease_Tab18Property13_Z);
    tab18_vector3Property14 = TLSE_Development_Editor_GUI_CreateVector3PropertyField(nil, "Light Static Shadow Bounds Max", "Light Static Shadow Bounds Max", Vector(0.685, 0.735, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab18Property14_X, TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Y, TLSE_TabSceneProperties_OnIncrease_Tab18Property14_Z, TLSE_TabSceneProperties_OnDecrease_Tab18Property14_X, TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Y, TLSE_TabSceneProperties_OnDecrease_Tab18Property14_Z);

    --[FX BRUSH] 19
    tab19_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush Outline Enable", "FX Brush Outline Enable", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab19Property1);
    tab19_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush Outline Filter Enable", "FX Brush Outline Filter Enable", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab19Property2);
    tab19_boolProperty3 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "FX Brush DOF Enable", "FX Brush DOF Enable", Vector(0.685, 0.605, 0.0), TLSE_TabSceneProperties_OnToggle_Tab19Property3);
    tab19_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Size", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property4, TLSE_TabSceneProperties_OnDecrease_Tab19Property4);
    tab19_numberProperty5 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Threshold", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property5, TLSE_TabSceneProperties_OnDecrease_Tab19Property5);
    tab19_numberProperty6 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Color Threshold", Vector(0.685, 0.635, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property6, TLSE_TabSceneProperties_OnDecrease_Tab19Property6);
    tab19_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Outline Falloff", Vector(0.685, 0.645, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property7, TLSE_TabSceneProperties_OnDecrease_Tab19Property7);
    tab19_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Outline Scale", Vector(0.685, 0.655, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property8, TLSE_TabSceneProperties_OnDecrease_Tab19Property8);
    tab19_numberProperty9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Scale", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property9, TLSE_TabSceneProperties_OnDecrease_Tab19Property9);
    tab19_numberProperty10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Near Detail", Vector(0.685, 0.675, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property10, TLSE_TabSceneProperties_OnDecrease_Tab19Property10);
    tab19_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Scale", Vector(0.685, 0.685, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property11, TLSE_TabSceneProperties_OnDecrease_Tab19Property11);
    tab19_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Detail", Vector(0.685, 0.695, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property12, TLSE_TabSceneProperties_OnDecrease_Tab19Property12);
    tab19_numberProperty13 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Scale Boost", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property13, TLSE_TabSceneProperties_OnDecrease_Tab19Property13);
    tab19_numberProperty14 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property14, TLSE_TabSceneProperties_OnDecrease_Tab19Property14);
    tab19_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane Falloff", Vector(0.685, 0.725, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property15, TLSE_TabSceneProperties_OnDecrease_Tab19Property15);
    tab19_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Brush Far Plane Max Scale", Vector(0.685, 0.735, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab19Property16, TLSE_TabSceneProperties_OnDecrease_Tab19Property16);

    --[FRAME BUFFER] 20
    tab20_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Frame Buffer Scale Override", "Frame Buffer Scale Override", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab20Property1);
    tab20_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Frame Buffer Scale Factor", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab20Property2, TLSE_TabSceneProperties_OnDecrease_Tab20Property2);

    --[SPECULAR] 21
    tab21_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Specular Multiplier Enabled", "Specular Multiplier Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab21Property1);
    tab21_numberProperty2 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Color Multiplier", Vector(0.685, 0.595, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property2, TLSE_TabSceneProperties_OnDecrease_Tab21Property2);
    tab21_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Intensity Multiplier", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property3, TLSE_TabSceneProperties_OnDecrease_Tab21Property3);
    tab21_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Specular Exponent Multiplier", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab21Property4, TLSE_TabSceneProperties_OnDecrease_Tab21Property4);

    --[MISC] 22
    tab22_boolProperty1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "After Effects Enabled", "After Effects Enabled", Vector(0.685, 0.585, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property1);
    tab22_boolProperty2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "HDR lightmaps Enabled", "HDR lightmaps Enabled", Vector(0.685, 0.595, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property2);
    tab22_numberProperty3 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HDR lightmaps Intensity", Vector(0.685, 0.605, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property3, TLSE_TabSceneProperties_OnDecrease_Tab22Property3);
    tab22_numberProperty4 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Noise Scale", Vector(0.685, 0.615, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property4, TLSE_TabSceneProperties_OnDecrease_Tab22Property4);
    tab22_colorProperty5 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Ambient Color", "Ambient Color", Vector(0.685, 0.625, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property5_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property5_A);
    tab22_colorProperty6 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Shadow Color", "Shadow Color", Vector(0.685, 0.665, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property6_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property6_A);
    tab22_numberProperty7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "FX Force Linear Depth Offset", Vector(0.685, 0.705, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property7, TLSE_TabSceneProperties_OnDecrease_Tab22Property7);
    tab22_numberProperty8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "HDR - Paper White Nits", Vector(0.685, 0.715, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property8, TLSE_TabSceneProperties_OnDecrease_Tab22Property8);
    tab22_boolProperty9 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Bake Enabled", "LightEnv Bake Enabled", Vector(0.685, 0.725, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property9);
    tab22_boolProperty10 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "LightEnv Enabled", "LightEnv Enabled", Vector(0.685, 0.735, 0.0), TLSE_TabSceneProperties_OnToggle_Tab22Property10);
    tab22_numberProperty11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Intensity", Vector(0.685, 0.745, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property11, TLSE_TabSceneProperties_OnDecrease_Tab22Property11);
    tab22_numberProperty12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Saturation", Vector(0.685, 0.755, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property12, TLSE_TabSceneProperties_OnDecrease_Tab22Property12);
    tab22_colorProperty13 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Tint", "LightEnv Tint", Vector(0.685, 0.765, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property13_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property13_A);
    tab22_colorProperty14 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "LightEnv Background Color", "LightEnv Background Color", Vector(0.685, 0.805, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_R, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_G, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_B, TLSE_TabSceneProperties_OnIncrease_Tab22Property14_A, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_R, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_G, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_B, TLSE_TabSceneProperties_OnDecrease_Tab22Property14_A);
    tab22_numberProperty15 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Probe Resolution XZ", Vector(0.685, 0.845, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property15, TLSE_TabSceneProperties_OnDecrease_Tab22Property15);
    tab22_numberProperty16 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "LightEnv Probe Resolution Y", Vector(0.685, 0.855, 0.0), true, TLSE_TabSceneProperties_OnIncrease_Tab22Property16, TLSE_TabSceneProperties_OnDecrease_Tab22Property16);
end

TLSE_Development_MainGUI_TabScenePropertiesUpdate = function()
    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    local bool_scenePropertiesTabActive = TLSE_Development_MainGUI_BottomRightWindowTab == "SceneProperties";

    textButton_tab1["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab2["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab3["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab4["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab5["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab6["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab7["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab8["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab9["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab10["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab11["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab12["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab13["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab14["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab15["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab16["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab17["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab18["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab19["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab20["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab21["TextButtonVisible"] = bool_scenePropertiesTabActive;
    textButton_tab22["TextButtonVisible"] = bool_scenePropertiesTabActive;

    textButton_tab1["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab1";
    textButton_tab2["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab2";
    textButton_tab3["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab3";
    textButton_tab4["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab4";
    textButton_tab5["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab5";
    textButton_tab6["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab6";
    textButton_tab7["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab7";
    textButton_tab8["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab8";
    textButton_tab9["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab9";
    textButton_tab10["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab10";
    textButton_tab11["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab11";
    textButton_tab12["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab12";
    textButton_tab13["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab13";
    textButton_tab14["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab14";
    textButton_tab15["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab15";
    textButton_tab16["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab16";
    textButton_tab17["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab17";
    textButton_tab18["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab18";
    textButton_tab19["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab19";
    textButton_tab20["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab20";
    textButton_tab21["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab21";
    textButton_tab22["TextButtonSelected"] = string_currentScenePropertiesTab == "Tab22";

    --[ANTI ALIASING] 1
    tab1_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab1["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab1_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab1["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[FX LEVELS] 2
    tab2_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab2["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab2_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab2["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab2_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab2["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab2_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab2["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab2_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab2["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab2_numberProperty6["NumberPropertyFieldVisible"] = textButton_tab2["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab2_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab2["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[SCENE FOG] 3
    tab3_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab3["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab3_colorProperty2["ColorFieldVisible"] = textButton_tab3["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab3_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab3["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab3_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab3["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab3_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab3["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[NPR LINES] 4
    tab4_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab4["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab4_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab4["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab4_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab4["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab4_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab4["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab4_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab4["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[BLOOM] 5
    tab5_numberProperty1["NumberPropertyFieldVisible"] = textButton_tab5["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab5_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab5["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[GLOW] 6
    tab6_colorProperty1["ColorFieldVisible"] = textButton_tab6["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab6_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab6["TextButtonSelected"] and bool_scenePropertiesTabActive;
    
    --[FX COLOR] 7
    tab7_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab7["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab7_colorProperty2["ColorFieldVisible"] = textButton_tab7["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab7_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab7["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[FX TONEMAP] 8
    tab8_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_boolProperty2["BooleanPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty6["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty8["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty9["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty10["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty11["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty12["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty13["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty14["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty15["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab8_numberProperty16["NumberPropertyFieldVisible"] = textButton_tab8["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[FX TONEMAP RGB] 9
    tab9_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_boolProperty2["BooleanPropertyFieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property3["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property4["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property5["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property6["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property7["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property8["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property9["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property10["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property11["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property12["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property13["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab9_vector3Property14["Vector3FieldVisible"] = textButton_tab9["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab10["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab10_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab10["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab10_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab10["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab10_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab10["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab10_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab10["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[FX DOF] 11
    tab11_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_boolProperty2["BooleanPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_boolProperty3["BooleanPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_boolProperty4["BooleanPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty6["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty8["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty9["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty10["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty11["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty12["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab11_numberProperty13["NumberPropertyFieldVisible"] = textButton_tab11["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[FX VIGNETTE] 12
    tab12_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab12["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab12_colorProperty2["ColorFieldVisible"] = textButton_tab12["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab12_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab12["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab12_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab12["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab12_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab12["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[HBAO] 13
    tab13_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_boolProperty2["BooleanPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty6["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty8["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty9["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty10["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab13_numberProperty11["NumberPropertyFieldVisible"] = textButton_tab13["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_colorProperty2["ColorFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_numberProperty6["NumberPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_numberProperty8["NumberPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_numberProperty9["NumberPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_numberProperty10["NumberPropertyFieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab14_vector3Property11["Vector3FieldVisible"] = textButton_tab14["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[GRAPHIC BLACK] 15
    tab15_numberProperty1["NumberPropertyFieldVisible"] = textButton_tab15["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab15_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab15["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab15_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab15["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab15_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab15["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab15_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab15["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[WIND] 16
    tab16_numberProperty1["NumberPropertyFieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab16_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab16_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab16_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab16_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab16_numberProperty6["NumberPropertyFieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab16_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab16_numberProperty8["NumberPropertyFieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab16_vector3Property9["Vector3FieldVisible"] = textButton_tab16["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[REFLECTION] 17
    tab17_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab17["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab17_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab17["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab17_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab17["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab17_colorProperty4["ColorFieldVisible"] = textButton_tab17["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[SHADOWS] 18
    tab18_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_boolProperty2["BooleanPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty6["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty8["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty9["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty10["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty11["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_numberProperty12["NumberPropertyFieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_vector3Property13["Vector3FieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab18_vector3Property14["Vector3FieldVisible"] = textButton_tab18["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[FX BRUSH] 19
    tab19_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_boolProperty2["BooleanPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_boolProperty3["BooleanPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty5["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty6["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty8["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty9["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty10["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty11["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty12["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty13["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty14["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty15["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab19_numberProperty16["NumberPropertyFieldVisible"] = textButton_tab19["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[FRAME BUFFER] 20
    tab20_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab20["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab20_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab20["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[SPECULAR] 21
    tab21_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab21["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab21_numberProperty2["NumberPropertyFieldVisible"] = textButton_tab21["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab21_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab21["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab21_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab21["TextButtonSelected"] and bool_scenePropertiesTabActive;

    --[MISC] 22
    tab22_boolProperty1["BooleanPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_boolProperty2["BooleanPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_numberProperty3["NumberPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_numberProperty4["NumberPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_colorProperty5["ColorFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_colorProperty6["ColorFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_numberProperty7["NumberPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_numberProperty8["NumberPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_boolProperty9["BooleanPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_boolProperty10["BooleanPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_numberProperty11["NumberPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_numberProperty12["NumberPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_colorProperty13["ColorFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_colorProperty14["ColorFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_numberProperty15["NumberPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;
    tab22_numberProperty16["NumberPropertyFieldVisible"] = textButton_tab22["TextButtonSelected"] and bool_scenePropertiesTabActive;

    if(bool_scenePropertiesTabActive == false) then
        return
    end

    local vector_startScreenPosition = textButton_tab1["TextButtonScreenPosition"];
    local vector_screenSizeTab1 = TLSE_TextUI_GetTextScreenSize(textButton_tab1["TextButtonAgentReference"]);
    local vector_screenSizeTab2 = TLSE_TextUI_GetTextScreenSize(textButton_tab2["TextButtonAgentReference"]);
    local vector_screenSizeTab3 = TLSE_TextUI_GetTextScreenSize(textButton_tab3["TextButtonAgentReference"]);
    local vector_screenSizeTab4 = TLSE_TextUI_GetTextScreenSize(textButton_tab4["TextButtonAgentReference"]);
    local vector_screenSizeTab5 = TLSE_TextUI_GetTextScreenSize(textButton_tab5["TextButtonAgentReference"]);
    local vector_screenSizeTab6 = TLSE_TextUI_GetTextScreenSize(textButton_tab6["TextButtonAgentReference"]);
    local vector_screenSizeTab7 = TLSE_TextUI_GetTextScreenSize(textButton_tab7["TextButtonAgentReference"]);
    local vector_screenSizeTab8 = TLSE_TextUI_GetTextScreenSize(textButton_tab8["TextButtonAgentReference"]);
    local vector_screenSizeTab9 = TLSE_TextUI_GetTextScreenSize(textButton_tab9["TextButtonAgentReference"]);
    local vector_screenSizeTab10 = TLSE_TextUI_GetTextScreenSize(textButton_tab10["TextButtonAgentReference"]);
    local vector_screenSizeTab11 = TLSE_TextUI_GetTextScreenSize(textButton_tab11["TextButtonAgentReference"]);
    local vector_screenSizeTab12 = TLSE_TextUI_GetTextScreenSize(textButton_tab12["TextButtonAgentReference"]);
    local vector_screenSizeTab13 = TLSE_TextUI_GetTextScreenSize(textButton_tab13["TextButtonAgentReference"]);
    local vector_screenSizeTab14 = TLSE_TextUI_GetTextScreenSize(textButton_tab14["TextButtonAgentReference"]);
    local vector_screenSizeTab15 = TLSE_TextUI_GetTextScreenSize(textButton_tab15["TextButtonAgentReference"]);
    local vector_screenSizeTab16 = TLSE_TextUI_GetTextScreenSize(textButton_tab16["TextButtonAgentReference"]);
    local vector_screenSizeTab17 = TLSE_TextUI_GetTextScreenSize(textButton_tab17["TextButtonAgentReference"]);
    local vector_screenSizeTab18 = TLSE_TextUI_GetTextScreenSize(textButton_tab18["TextButtonAgentReference"]);
    local vector_screenSizeTab19 = TLSE_TextUI_GetTextScreenSize(textButton_tab19["TextButtonAgentReference"]);
    local vector_screenSizeTab20 = TLSE_TextUI_GetTextScreenSize(textButton_tab20["TextButtonAgentReference"]);
    local vector_screenSizeTab21 = TLSE_TextUI_GetTextScreenSize(textButton_tab21["TextButtonAgentReference"]);
    local vector_screenSizeTab22 = TLSE_TextUI_GetTextScreenSize(textButton_tab22["TextButtonAgentReference"]);

    local number_horizontalOffset = 0.003;
    local number_verticalOffset = 0.015;
    local vector_guiOffset = Vector(0, 0, 0);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = 0;
    textButton_tab1["TextButtonScreenPosition"] = vector_startScreenPosition;

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab1.x * 2.0) + number_horizontalOffset;
    textButton_tab2["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab2.x * 2.0) + number_horizontalOffset;
    textButton_tab3["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab3.x * 2.0) + number_horizontalOffset;
    textButton_tab4["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab4.x * 2.0) + number_horizontalOffset;
    textButton_tab5["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab5.x * 2.0) + number_horizontalOffset;
    textButton_tab6["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab6.x * 2.0) + number_horizontalOffset;
    textButton_tab7["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = vector_guiOffset.y + number_verticalOffset;
    textButton_tab8["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab8.x * 2.0) + number_horizontalOffset;
    textButton_tab9["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab9.x * 2.0) + number_horizontalOffset;
    textButton_tab10["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab10.x * 2.0) + number_horizontalOffset;
    textButton_tab11["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab11.x * 2.0) + number_horizontalOffset;
    textButton_tab12["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = vector_guiOffset.y + number_verticalOffset;
    textButton_tab13["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab13.x * 2.0) + number_horizontalOffset;
    textButton_tab14["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab14.x * 2.0) + number_horizontalOffset;
    textButton_tab15["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab15.x * 2.0) + number_horizontalOffset;
    textButton_tab16["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab16.x * 2.0) + number_horizontalOffset;
    textButton_tab17["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = vector_guiOffset.y + number_verticalOffset;
    textButton_tab18["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab18.x * 2.0) + number_horizontalOffset;
    textButton_tab19["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab19.x * 2.0) + number_horizontalOffset;
    textButton_tab20["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab20.x * 2.0) + number_horizontalOffset;
    textButton_tab21["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab21.x * 2.0) + number_horizontalOffset;
    textButton_tab22["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    --[ANTI ALIASING] 1
    tab1_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab1_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FX LEVELS] 2
    tab2_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab2_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[SCENE FOG] 3
    tab3_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab3_colorProperty2["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab3_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab3_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab3_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[NPR LINES] 4
    tab4_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab4_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[BLOOM] 5
    tab5_numberProperty1["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab5_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[GLOW] 6
    tab6_colorProperty1["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab6_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FX COLOR] 7
    tab7_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab7_colorProperty2["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab7_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FX TONEMAP] 8
    tab8_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty13["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty14["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty15["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab8_numberProperty16["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FX TONEMAP RGB] 9
    tab9_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property3["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property4["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property5["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property6["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property7["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property8["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property9["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property10["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property11["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property12["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property13["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab9_vector3Property14["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FX AMBIENT OCCLUSION] 10
    tab10_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab10_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FX DOF] 11
    tab11_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent
    tab11_boolProperty3["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_boolProperty4["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab11_numberProperty13["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FX VIGNETTE] 12
    tab12_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab12_colorProperty2["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab12_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[HBAO] 13
    tab13_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab13_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[SCREEN SPACE LINES] 14
    tab14_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_colorProperty2["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab14_vector3Property11["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[GRAPHIC BLACK] 15
    tab15_numberProperty1["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab15_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[WIND] 16
    tab16_numberProperty1["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab16_vector3Property9["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[REFLECTION] 17
    tab17_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab17_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab17_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab17_colorProperty4["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[SHADOWS] 18
    tab18_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_vector3Property13["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab18_vector3Property14["Vector3PropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FX BRUSH] 19
    tab19_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_boolProperty3["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty5["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty6["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty9["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty10["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty13["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty14["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty15["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab19_numberProperty16["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[FRAME BUFFER] 20
    tab20_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab20_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[SPECULAR] 21
    tab21_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty2["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab21_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;

    --[MISC] 22
    tab22_boolProperty1["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty2["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty3["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty4["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty5["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty6["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty7["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty8["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty9["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_boolProperty10["BooleanPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty11["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty12["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty13["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_colorProperty14["ColorPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty15["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
    tab22_numberProperty16["NumberPropertyFieldAgent"] = TLSE_Development_SceneAgent;
end