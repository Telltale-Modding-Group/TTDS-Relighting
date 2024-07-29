local boolProperty_property1 = nil;
local boolProperty_property2 = nil;
local boolProperty_property3 = nil;
local boolProperty_property4 = nil;
local boolProperty_property5 = nil;
local colorProperty_property6 = nil;
local numberProperty_property7 = nil;
local numberProperty_property8 = nil;
local numberProperty_property9 = nil;
local numberProperty_property10 = nil;
local numberProperty_property11 = nil;
local numberProperty_property12 = nil;

local numberPropertyFieldAdjustmentValue = 1;

local ModifiyNumberPropertyValueOnAgent = function(agent_main, string_property, number_adjustment, bool_multiplyByFrameTime)
    if(agent_main ~= nil) then
        if(AgentHasProperty(agent_main, string_property)) then
            local number_originalValue = AgentGetProperty(agent_main, string_property);

            if(bool_multiplyByFrameTime) then
                number_originalValue = number_originalValue + (number_adjustment * GetFrameTime());
            else
                number_originalValue = number_originalValue + number_adjustment;
            end

            AgentSetProperty(agent_main, string_property, number_originalValue);
        end
    end
end

local ModifiyBooleanPropertyValueOnAgent = function(agent_main, string_property)
    if(agent_main ~= nil) then
        if(AgentHasProperty(agent_main, string_property)) then
            local number_originalValue = AgentGetProperty(agent_main, string_property);

            number_originalValue = not number_originalValue;

            AgentSetProperty(agent_main, string_property, number_originalValue);
        end
    end
end

local ModifiyColorChannelPropertyValueOnAgent = function(agent_main, string_property, number_channel, number_adjustment, bool_clamp01)
    if(agent_main ~= nil) then
        if(AgentHasProperty(agent_main, string_property)) then
            local color_originalValue = AgentGetProperty(agent_main, string_property);

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

            AgentSetProperty(agent_main, string_property, color_originalValue);
        end
    end
end

local OnToggle_Property1 = function(textButton_button)
    ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Enabled");
end

local OnToggle_Property2 = function(textButton_button)
    ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Enabled");
end

local OnToggle_Property3 = function(textButton_button)
    ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Enabled on High");
end

local OnToggle_Property4 = function(textButton_button)
    ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Enabled on Medium");
end

local OnToggle_Property5 = function(textButton_button)
    ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Enabled on Low");
end

local OnIncrease_Property6_R = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 0, numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_Property6_R = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 0, -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_Property6_G = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 1, numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_Property6_G = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 1, -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_Property6_B = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 2, numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_Property6_B = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 2, -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_Property6_A = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 3, numberPropertyFieldAdjustmentValue, true);
end

local OnDecrease_Property6_A = function(textButton_button)
    ModifiyColorChannelPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 3, -numberPropertyFieldAdjustmentValue, true);
end

local OnIncrease_Property7 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Density", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_Property7 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Density", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_Property8 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Start Distance", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_Property8 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Start Distance", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_Property9 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Height", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_Property9 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Height", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_Property10 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Height Falloff", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_Property10 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Height Falloff", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_Property11 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Max Opacity", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_Property11 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Max Opacity", -numberPropertyFieldAdjustmentValue, false);
end

local OnIncrease_Property12 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Priority", numberPropertyFieldAdjustmentValue, false);
end

local OnDecrease_Property12 = function(textButton_button)
    ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Priority", -numberPropertyFieldAdjustmentValue, false);
end

TLSE_Development_GUI_TabFogInitalize = function()
    boolProperty_property1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Fog Enabled", "Env - Fog Enabled", Vector(0.685, 0.515, 0.0), OnToggle_Property1);
    boolProperty_property2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Enabled", "Env - Enabled", Vector(0.685, 0.525, 0.0), OnToggle_Property2);
    boolProperty_property3 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Enabled on High", "Env - Enabled on High", Vector(0.685, 0.535, 0.0), OnToggle_Property3);
    boolProperty_property4 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Enabled on Medium", "Env - Enabled on Medium", Vector(0.685, 0.545, 0.0), OnToggle_Property4);
    boolProperty_property5 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Enabled on Low", "Env - Enabled on Low", Vector(0.685, 0.555, 0.0), OnToggle_Property5);
    colorProperty_property6 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Env - Fog Color", "Env - Fog Color", Vector(0.685, 0.565, 0.0), true, OnIncrease_Property6_R, OnIncrease_Property6_G, OnIncrease_Property6_B, OnIncrease_Property6_A, OnDecrease_Property6_R, OnDecrease_Property6_G, OnDecrease_Property6_B, OnDecrease_Property6_A);
    numberProperty_property7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Density", Vector(0.685, 0.605, 0.0), true, OnIncrease_Property7, OnDecrease_Property7);
    numberProperty_property8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Start Distance", Vector(0.685, 0.615, 0.0), true, OnIncrease_Property8, OnDecrease_Property8);
    numberProperty_property9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Height", Vector(0.685, 0.625, 0.0), true, OnIncrease_Property9, OnDecrease_Property9);
    numberProperty_property10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Height Falloff", Vector(0.685, 0.635, 0.0), true, OnIncrease_Property10, OnDecrease_Property10);
    numberProperty_property11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Max Opacity", Vector(0.685, 0.645, 0.0), true, OnIncrease_Property11, OnDecrease_Property11);
    numberProperty_property12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Priority", Vector(0.685, 0.655, 0.0), true, OnIncrease_Property12, OnDecrease_Property12);
end

TLSE_Development_GUI_TabFogUpdate = function()
    local bool_fogTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Fog";

    if(TLSE_Development_Editor_Input_LeftShiftHold) then
        numberPropertyFieldAdjustmentValue = 10;
    elseif(TLSE_Development_Editor_Input_LeftCtrlHold) then
        numberPropertyFieldAdjustmentValue = 0.01;
    else
        numberPropertyFieldAdjustmentValue = 1;
    end

    boolProperty_property1["BooleanPropertyFieldVisible"] = bool_fogTabActive;
    boolProperty_property2["BooleanPropertyFieldVisible"] = bool_fogTabActive;
    boolProperty_property3["BooleanPropertyFieldVisible"] = bool_fogTabActive;
    boolProperty_property4["BooleanPropertyFieldVisible"] = bool_fogTabActive;
    boolProperty_property5["BooleanPropertyFieldVisible"] = bool_fogTabActive;

    colorProperty_property6["ColorFieldVisible"] = bool_fogTabActive;

    numberProperty_property7["NumberPropertyFieldVisible"] = bool_fogTabActive;
    numberProperty_property8["NumberPropertyFieldVisible"] = bool_fogTabActive;
    numberProperty_property9["NumberPropertyFieldVisible"] = bool_fogTabActive;
    numberProperty_property10["NumberPropertyFieldVisible"] = bool_fogTabActive;
    numberProperty_property11["NumberPropertyFieldVisible"] = bool_fogTabActive;
    numberProperty_property12["NumberPropertyFieldVisible"] = bool_fogTabActive;

    if(bool_fogTabActive == false) then
        return
    end

    boolProperty_property1["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolProperty_property2["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolProperty_property3["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolProperty_property4["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;
    boolProperty_property5["BooleanPropertyFieldAgent"] = agent_currentSelectedAgent;

    colorProperty_property6["ColorPropertyFieldAgent"] = agent_currentSelectedAgent;

    numberProperty_property7["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberProperty_property8["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberProperty_property9["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberProperty_property10["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberProperty_property11["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
    numberProperty_property12["NumberPropertyFieldAgent"] = agent_currentSelectedAgent;
end