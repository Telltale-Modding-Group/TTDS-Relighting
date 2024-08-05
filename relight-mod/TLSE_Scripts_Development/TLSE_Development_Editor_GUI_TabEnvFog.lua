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

local OnToggle_Property1 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Enabled"); end
local OnToggle_Property2 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Enabled"); end
local OnToggle_Property3 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Enabled on High"); end
local OnToggle_Property4 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Enabled on Medium"); end
local OnToggle_Property5 = function(textButton_button) TLSE_Development_GUI_ModifiyBooleanPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Enabled on Low"); end
local OnIncrease_Property6_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 0, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
local OnDecrease_Property6_R = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 0, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
local OnIncrease_Property6_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 1, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
local OnDecrease_Property6_G = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 1, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
local OnIncrease_Property6_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 2, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
local OnDecrease_Property6_B = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 2, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
local OnIncrease_Property6_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 3, TLSE_Development_GUI_PropertyAdjustmentValue, true); end
local OnDecrease_Property6_A = function(textButton_button) TLSE_Development_GUI_ModifiyColorPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Color", 3, -TLSE_Development_GUI_PropertyAdjustmentValue, true); end
local OnIncrease_Property7 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Density", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnDecrease_Property7 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Density", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnIncrease_Property8 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Start Distance", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnDecrease_Property8 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Start Distance", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnIncrease_Property9 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Height", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnDecrease_Property9 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Height", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnIncrease_Property10 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Height Falloff", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnDecrease_Property10 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Height Falloff", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnIncrease_Property11 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Max Opacity", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnDecrease_Property11 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Fog Max Opacity", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnIncrease_Property12 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Priority", TLSE_Development_GUI_PropertyAdjustmentValue, false); end
local OnDecrease_Property12 = function(textButton_button) TLSE_Development_GUI_ModifiyNumberPropertyValueOnAgent(agent_currentSelectedAgent, "Env - Priority", -TLSE_Development_GUI_PropertyAdjustmentValue, false); end

TLSE_Development_GUI_TabEnvFogInitalize = function()
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

TLSE_Development_GUI_TabEnvFogUpdate = function()
    boolProperty_property1["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    boolProperty_property2["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    boolProperty_property3["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    boolProperty_property4["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    boolProperty_property5["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    colorProperty_property6["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    numberProperty_property7["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    numberProperty_property8["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    numberProperty_property9["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    numberProperty_property10["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    numberProperty_property11["Visible"] = TLSE_Development_GUI_EnvFogTabActive;
    numberProperty_property12["Visible"] = TLSE_Development_GUI_EnvFogTabActive;

    if(TLSE_Development_GUI_EnvFogTabActive == false) then
        return
    end

    boolProperty_property1["ReferenceAgent"] = agent_currentSelectedAgent;
    boolProperty_property2["ReferenceAgent"] = agent_currentSelectedAgent;
    boolProperty_property3["ReferenceAgent"] = agent_currentSelectedAgent;
    boolProperty_property4["ReferenceAgent"] = agent_currentSelectedAgent;
    boolProperty_property5["ReferenceAgent"] = agent_currentSelectedAgent;
    colorProperty_property6["ReferenceAgent"] = agent_currentSelectedAgent;
    numberProperty_property7["ReferenceAgent"] = agent_currentSelectedAgent;
    numberProperty_property8["ReferenceAgent"] = agent_currentSelectedAgent;
    numberProperty_property9["ReferenceAgent"] = agent_currentSelectedAgent;
    numberProperty_property10["ReferenceAgent"] = agent_currentSelectedAgent;
    numberProperty_property11["ReferenceAgent"] = agent_currentSelectedAgent;
    numberProperty_property12["ReferenceAgent"] = agent_currentSelectedAgent;
end