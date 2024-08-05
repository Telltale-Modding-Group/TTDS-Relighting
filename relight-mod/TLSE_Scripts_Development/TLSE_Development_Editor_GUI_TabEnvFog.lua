local label_infoText = nil;

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

TLSE_Development_GUI_TabEnvFogInitalize = function()
    label_infoText = TLSE_Development_Editor_GUI_CreateLabel("No Agent selected...", Vector(0.685, 0.515, 0.0));

    boolProperty_property1 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Fog Enabled", "Env - Fog Enabled", Vector(0.685, 0.515, 0.0), nil);
    boolProperty_property2 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Enabled", "Env - Enabled", Vector(0.685, 0.525, 0.0), nil);
    boolProperty_property3 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Enabled on High", "Env - Enabled on High", Vector(0.685, 0.535, 0.0), nil);
    boolProperty_property4 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Enabled on Medium", "Env - Enabled on Medium", Vector(0.685, 0.545, 0.0), nil);
    boolProperty_property5 = TLSE_Development_Editor_GUI_CreateBooleanPropertyField(nil, "Env - Enabled on Low", "Env - Enabled on Low", Vector(0.685, 0.555, 0.0), nil);
    colorProperty_property6 = TLSE_Development_Editor_GUI_CreateColorPropertyField(nil, "Env - Fog Color", "Env - Fog Color", Vector(0.685, 0.565, 0.0), true, nil, nil, nil, nil, nil, nil, nil, nil);
    numberProperty_property7 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Density", Vector(0.685, 0.605, 0.0), true, nil, nil);
    numberProperty_property8 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Start Distance", Vector(0.685, 0.615, 0.0), true, nil, nil);
    numberProperty_property9 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Height", Vector(0.685, 0.625, 0.0), true, nil, nil);
    numberProperty_property10 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Height Falloff", Vector(0.685, 0.635, 0.0), true, nil, nil);
    numberProperty_property11 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Fog Max Opacity", Vector(0.685, 0.645, 0.0), true, nil, nil);
    numberProperty_property12 = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Env - Priority", Vector(0.685, 0.655, 0.0), true, nil, nil);
end

TLSE_Development_GUI_TabEnvFogUpdate = function()
    local bool_propertiesActive = TLSE_Development_GUI_EnvFogTabActive;

    label_infoText["Visible"] = TLSE_Development_GUI_EnvFogTabActive;

    if(agent_currentSelectedAgent == nil) then
        label_infoText["Text"] = "No Agent selected...";
        bool_propertiesActive = false;
    elseif(agent_currentSelectedAgent ~= nil) and (TLSE_AgentIsEnvironmentFog(agent_currentSelectedAgent) == false) then
        label_infoText["Text"] = "Agent Selected, but no EnvFog properties were found...";
        bool_propertiesActive = false;
    else
        label_infoText["Text"] = "";
        label_infoText["Visible"] = false;
    end

    boolProperty_property1["Visible"] = bool_propertiesActive;
    boolProperty_property2["Visible"] = bool_propertiesActive;
    boolProperty_property3["Visible"] = bool_propertiesActive;
    boolProperty_property4["Visible"] = bool_propertiesActive;
    boolProperty_property5["Visible"] = bool_propertiesActive;
    colorProperty_property6["Visible"] = bool_propertiesActive;
    numberProperty_property7["Visible"] = bool_propertiesActive;
    numberProperty_property8["Visible"] = bool_propertiesActive;
    numberProperty_property9["Visible"] = bool_propertiesActive;
    numberProperty_property10["Visible"] = bool_propertiesActive;
    numberProperty_property11["Visible"] = bool_propertiesActive;
    numberProperty_property12["Visible"] = bool_propertiesActive;

    if(bool_propertiesActive == false) then
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