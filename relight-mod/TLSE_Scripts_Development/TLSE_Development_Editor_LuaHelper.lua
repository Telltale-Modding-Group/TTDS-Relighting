--|||||||||||||||||||||||||||||||||||||||||||||| LUA HELPER ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| LUA HELPER ||||||||||||||||||||||||||||||||||||||||||||||
--|||||||||||||||||||||||||||||||||||||||||||||| LUA HELPER ||||||||||||||||||||||||||||||||||||||||||||||

TLSE_Development_Editor_LuaHelper_WriteColor = function(color_colorToWrite)
    --REFERENCE LINE
    --Color(color_colorToWrite.r, color_colorToWrite.g, color_colorToWrite.b, color_colorToWrite.a)

    local string_codeToWrite = "Color(";
    string_codeToWrite = string_codeToWrite .. tostring(color_colorToWrite.r) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(color_colorToWrite.g) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(color_colorToWrite.b) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(color_colorToWrite.a) .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteVector3 = function(vector_vector3ToWrite)
    --REFERENCE LINE
    --Vector(vector_vector3ToWrite.x, vector_vector3ToWrite.y, vector_vector3ToWrite.z)

    local string_codeToWrite = "Vector(";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector3ToWrite.x) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector3ToWrite.y) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector3ToWrite.z) .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteVector2 = function(vector_vector2ToWrite)
    --REFERENCE LINE
    --Vector(vector_vector2ToWrite.x, vector_vector2ToWrite.y, 0);

    local string_codeToWrite = "Vector(";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector2ToWrite.x) .. ", ";
    string_codeToWrite = string_codeToWrite .. tostring(vector_vector2ToWrite.y) .. ", ";
    string_codeToWrite = string_codeToWrite .. "0)";
    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteAgentDestroy = function(string_agentVariableName, string_sceneVariableName)
    --REFERENCE LINE
    --AgentDestroy(AgentFindInScene("string_agentVariableName", "string_sceneVariableName")))

    local string_codeToWrite = "AgentDestroy(AgentFindInScene(";
    string_codeToWrite = string_codeToWrite .. '"' .. string_agentVariableName .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. '"' .. string_sceneVariableName .. '"' .. "))";
    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty = function(string_agentVariableName, string_agentPropertyName, string_propertyValue)
    --REFERENCE LINE
    --AgentSetProperty("string_agentVariableName", "string_agentPropertyName", string_propertyValue)

    local string_codeToWrite = "AgentSetProperty(";
    string_codeToWrite = string_codeToWrite .. string_agentVariableName .. ", ";
    string_codeToWrite = string_codeToWrite .. '"' .. string_agentPropertyName .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. string_propertyValue .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty = function(agent_sceneAgent, string_agentPropertyName, string_propertyValue, string_sceneVariableName)
    --REFERENCE LINE
    --TLSE_AgentNameSetProperty("agent_sceneAgent", "string_agentPropertyName", string_propertyValue, string_sceneVariableName)

    local string_codeToWrite = "TLSE_AgentNameSetProperty(";
    string_codeToWrite = string_codeToWrite .. '"' .. AgentGetName(agent_sceneAgent) .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. '"' .. string_agentPropertyName .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. string_propertyValue .. ", ";
    string_codeToWrite = string_codeToWrite .. string_sceneVariableName .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteAgentNameSetWorldPositionAndRotation = function(agent_sceneAgent, string_sceneVariableName)
    --REFERENCE LINE
    --TLSE_AgentNameSetWorldPositionAndRotation("agent_sceneAgent", Vector(0, 0, 0), Vector(0, 0, 0), string_sceneVariableName)

    local string_codeToWrite = "TLSE_AgentNameSetWorldPositionAndRotation(";
    string_codeToWrite = string_codeToWrite .. '"' .. AgentGetName(agent_sceneAgent) .. '"' .. ", ";
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetWorldPos(agent_sceneAgent)) .. ", ";
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetWorldRot(agent_sceneAgent)) .. ", ";
    string_codeToWrite = string_codeToWrite .. string_sceneVariableName .. ")";
    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteSceneAgentsDeleteFunction = function(stringArray_agentNamesToDelete)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "TLSE_DeleteAgentsInScene = function(string_scene)";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    --remove the following agents from the scene";
    string_codeToWrite = string_codeToWrite .. "\n";

    for i, string_agentNameToDelete in pairs(stringArray_agentNamesToDelete) do
        --REFERENCE LINE
        --    TLSE_AgentNameDestroy("string_agentNameToDelete", string_scene);

        string_codeToWrite = string_codeToWrite.. "   TLSE_AgentNameDestroy(" .. '"' .. string_agentNameToDelete .. '"' .. ", string_scene); \n";
    end

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end";
    string_codeToWrite = string_codeToWrite .. "\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteSceneAgentsDuplicateFunction = function(duplicateAgentsArray_agentsToDuplicate)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "TLSE_DuplicateAgentsInScene = function(string_scene)";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    --duplicate the following agents in the scene";
    string_codeToWrite = string_codeToWrite .. "\n";

    for key, value in pairs(duplicateAgentsArray_agentsToDuplicate) do
        local string_agentReferenceName = value["AgentReferenceName"];
        local string_agentDuplicateName = value["AgentDuplicateName"];

        --REFERENCE LINE
        --    AgentDuplicate("string_agentDuplicateName", AgentFindInScene("string_agentReferenceName", string_scene), false, true, true);

        string_codeToWrite = string_codeToWrite .. "    AgentDuplicate(";
        string_codeToWrite = string_codeToWrite .. '"';
        string_codeToWrite = string_codeToWrite .. string_agentDuplicateName;
        string_codeToWrite = string_codeToWrite .. '"';
        string_codeToWrite = string_codeToWrite .. ", AgentFindInScene(";
        string_codeToWrite = string_codeToWrite .. '"';
        string_codeToWrite = string_codeToWrite .. string_agentReferenceName;
        string_codeToWrite = string_codeToWrite .. '"';
        string_codeToWrite = string_codeToWrite .. ", string_scene), ";
        string_codeToWrite = string_codeToWrite .. "false, "; -- duplicate children
        string_codeToWrite = string_codeToWrite .. "true, "; -- copy scene props
        string_codeToWrite = string_codeToWrite .. "true"; -- copy classes
        string_codeToWrite = string_codeToWrite .. ");\n";
    end

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end";
    string_codeToWrite = string_codeToWrite .. "\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteSceneAgentsTransformationsFunction = function(agentArray_sceneAgents)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "TLSE_TransformAgentsInScene = function(string_scene)";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    --apply transformations to the following agents in the scene";
    string_codeToWrite = string_codeToWrite .. "\n";

    for i, agent_sceneAgent in pairs(agentArray_sceneAgents) do
        string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetWorldPositionAndRotation(agent_sceneAgent, "string_scene") .. ";\n";
    end

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end";
    string_codeToWrite = string_codeToWrite .. "\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteApplyLightPropertiesChunk = function(agent_light)
    local string_codeToWrite = "";

    local string_agentName = AgentGetName(agent_light);

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Enabled", tostring(AgentGetProperty(agent_light, "EnvLight - Enabled")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Enabled Group", tostring(AgentGetProperty(agent_light, "EnvLight - Enabled Group")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Type", tostring(AgentGetProperty(agent_light, "EnvLight - Type")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Intensity", tostring(AgentGetProperty(agent_light, "EnvLight - Intensity")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Intensity Dimmer", tostring(AgentGetProperty(agent_light, "EnvLight - Intensity Dimmer")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Intensity Specular", tostring(AgentGetProperty(agent_light, "EnvLight - Intensity Specular")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Intensity Diffuse", tostring(AgentGetProperty(agent_light, "EnvLight - Intensity Diffuse")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Enlighten Intensity", tostring(AgentGetProperty(agent_light, "EnvLight - Enlighten Intensity")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Color", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_light, "EnvLight - Color")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Radius", tostring(AgentGetProperty(agent_light, "EnvLight - Radius")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Distance Falloff", tostring(AgentGetProperty(agent_light, "EnvLight - Distance Falloff")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Spot Angle Inner", tostring(AgentGetProperty(agent_light, "EnvLight - Spot Angle Inner")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Spot Angle Outer", tostring(AgentGetProperty(agent_light, "EnvLight - Spot Angle Outer")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Type", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Type")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Quality", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Quality")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Softness", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Softness")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Near Clip", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Near Clip")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Depth Bias", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Depth Bias")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Modulated Intensity", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Modulated Intensity")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Shadow Map Quality Distance Scale", tostring(AgentGetProperty(agent_light, "EnvLight - Shadow Map Quality Distance Scale")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Wrap", tostring(AgentGetProperty(agent_light, "EnvLight - Wrap")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Opacity", tostring(AgentGetProperty(agent_light, "EnvLight - Opacity")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Mobility", tostring(AgentGetProperty(agent_light, "EnvLight - Mobility")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Priority", tostring(AgentGetProperty(agent_light, "EnvLight - Priority")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - HBAO Participation Type", tostring(AgentGetProperty(agent_light, "EnvLight - HBAO Participation Type")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Bake Allowed on Static", tostring(AgentGetProperty(agent_light, "EnvLight - Bake Allowed on Static")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - Visible Threshold Scale", tostring(AgentGetProperty(agent_light, "EnvLight - Visible Threshold Scale")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - LOD Behavior", tostring(AgentGetProperty(agent_light, "EnvLight - LOD Behavior")), "string_scene") .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentNameSetProperty(string_agentName, "EnvLight - NPR Banding", tostring(AgentGetProperty(agent_light, "EnvLight - NPR Banding")), "string_scene") .. ";\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteApplyLightPropertiesFunction = function(agentsArray_sceneAgents)
    local string_codeToWrite = "";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "TLSE_ApplyLightingSettings = function(string_scene)";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    for i, agent_sceneAgent in pairs(agentsArray_sceneAgents) do
        if(TLSE_AgentIsLight(agent_sceneAgent)) then
            string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteApplyLightPropertiesChunk(agent_sceneAgent) .. "\n";
        end
    end

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end";
    string_codeToWrite = string_codeToWrite .. "\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteApplyEnvironmentFogModulePropertiesFunction = function(agent_environmentFog)
    local string_codeToWrite = "";

    local string_agentVariable = "agent_environmentFogModule";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "TLSE_ApplyEnvironmentFogSettings = function(" .. string_agentVariable .. ")";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    --apply properties to environment fog module agent \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Fog Enabled", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Enabled", tostring(AgentGetProperty(agent_environmentFog, "Env - Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Enabled on High", tostring(AgentGetProperty(agent_environmentFog, "Env - Enabled on High"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Enabled on Medium", tostring(AgentGetProperty(agent_environmentFog, "Env - Enabled on Medium"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Enabled on Low", tostring(AgentGetProperty(agent_environmentFog, "Env - Enabled on Low"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Fog Color", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_environmentFog, "Env - Fog Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Fog Density", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Density"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Fog Start Distance", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Start Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Fog Height", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Height"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Fog Height Falloff", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Height Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Fog Max Opacity", tostring(AgentGetProperty(agent_environmentFog, "Env - Fog Max Opacity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Env - Priority", tostring(AgentGetProperty(agent_environmentFog, "Env - Priority"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end";
    string_codeToWrite = string_codeToWrite .. "\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteApplyScenePropertiesFunction = function(agent_sceneAgent)
    local string_codeToWrite = "";

    local string_agentVariable = "agent_sceneAgent";

    string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "TLSE_ApplySceneSettings = function(" .. string_agentVariable .. ")";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[ANTI ALIASING] 1
    string_codeToWrite = string_codeToWrite .. "    --apply anti aliasing settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX anti-aliasing", tostring(AgentGetProperty(agent_sceneAgent, "FX anti-aliasing"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX TAA Weight", tostring(AgentGetProperty(agent_sceneAgent, "FX TAA Weight"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX LEVELS] 2
    string_codeToWrite = string_codeToWrite .. "    --apply fx levels settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Levels Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Levels Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Levels Intensity HDR", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Intensity HDR"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Levels White Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels White Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Levels White Point HDR", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels White Point HDR"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Levels Black Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Black Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Levels Black Point HDR", tostring(AgentGetProperty(agent_sceneAgent, "FX Levels Black Point HDR"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[SCENE FOG] 3
    string_codeToWrite = string_codeToWrite .. "    --apply scene fog settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Fog Enabled", tostring(AgentGetProperty(agent_sceneAgent, "Fog Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Fog Color", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "Fog Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Fog Far Plane", tostring(AgentGetProperty(agent_sceneAgent, "Fog Far Plane"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Fog Near Plane", tostring(AgentGetProperty(agent_sceneAgent, "Fog Near Plane"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Fog Alpha", tostring(AgentGetProperty(agent_sceneAgent, "Fog Alpha"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[NPR LINES] 4
    string_codeToWrite = string_codeToWrite .. "    --apply npr lines settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Generate NPR Lines", tostring(AgentGetProperty(agent_sceneAgent, "Generate NPR Lines"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "NPR Lines Alpha Bias", tostring(AgentGetProperty(agent_sceneAgent, "NPR Lines Alpha Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "NPR Lines Alpha Falloff", tostring(AgentGetProperty(agent_sceneAgent, "NPR Lines Alpha Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "NPR Lines Bias", tostring(AgentGetProperty(agent_sceneAgent, "NPR Lines Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "NPR Lines Falloff", tostring(AgentGetProperty(agent_sceneAgent, "NPR Lines Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[BLOOM] 5
    string_codeToWrite = string_codeToWrite .. "    --apply bloom settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Bloom Threshold", tostring(AgentGetProperty(agent_sceneAgent, "FX Bloom Threshold"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Bloom Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Bloom Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[GLOW] 6
    string_codeToWrite = string_codeToWrite .. "    --apply glow settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Glow Clear Color", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "Glow Clear Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Glow Sigma Scale", tostring(AgentGetProperty(agent_sceneAgent, "Glow Sigma Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX COLOR] 7
    string_codeToWrite = string_codeToWrite .. "    --apply fx color settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Color Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Color Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Color Tint", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "FX Color Tint"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Color Opacity", tostring(AgentGetProperty(agent_sceneAgent, "FX Color Opacity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX TONEMAP] 8
    string_codeToWrite = string_codeToWrite .. "    --apply fx tonemap settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap DOF Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap DOF Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Type", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Type"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap White Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap White Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Black Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Black Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Filmic Pivot", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Filmic Pivot"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Filmic Sign", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Filmic Sign"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Filmic Shoulder Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Filmic Shoulder Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Filmic Toe Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Filmic Toe Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Filmic Pivot", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Pivot"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Filmic Sign", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Sign"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Filmic Shoulder Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Shoulder Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Filmic Toe Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Filmic Toe Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far White Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far White Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap Far Black Point", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap Far Black Point"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX TONEMAP RGB] 9
    string_codeToWrite = string_codeToWrite .. "    --apply fx tonemap rgb settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB DOF Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB DOF Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Pivots", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Pivots"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Signs", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Signs"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Shoulder Intensities", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Shoulder Intensities"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Toe Intensities", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Toe Intensities"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Black Points", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Black Points"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB White Points", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB White Points"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Pivots", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Pivots"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Signs", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Signs"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Shoulder Intensities", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Shoulder Intensities"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Toe Intensities", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Toe Intensities"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far Black Points", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far Black Points"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Tonemap RGB Far White Points", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "FX Tonemap RGB Far White Points"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX AMBIENT OCCLUSION] 10
    string_codeToWrite = string_codeToWrite .. "    --apply fx ambient occlusion settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Intensity", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Radius", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Radius"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Ambient Occlusion Lightmap", tostring(AgentGetProperty(agent_sceneAgent, "FX Ambient Occlusion Lightmap"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX DOF] 11
    string_codeToWrite = string_codeToWrite .. "    --apply fx dof settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF FOV Adjust Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF FOV Adjust Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Auto Focus Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Auto Focus Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Vignette DOF Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette DOF Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Near", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Near"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Far", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Far"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Near Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Near Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Far Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Far Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Near Max", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Near Max"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Far Max", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Far Max"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Vignette Max", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Vignette Max"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Coverage Boost", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Coverage Boost"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX DOF Debug", tostring(AgentGetProperty(agent_sceneAgent, "FX DOF Debug"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX VIGNETTE] 12
    string_codeToWrite = string_codeToWrite .. "    --apply fx vignette settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Vignette Tint Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette Tint Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Vignette Tint", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "FX Vignette Tint"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Vignette Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Vignette Center", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette Center"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Vignette Corners", tostring(AgentGetProperty(agent_sceneAgent, "FX Vignette Corners"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[HBAO] 13
    string_codeToWrite = string_codeToWrite .. "    --apply hbao settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Enabled", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Debug", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Debug"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Intensity", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Radius", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Radius"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Max Radius Percent", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Max Radius Percent"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Hemisphere Bias", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Hemisphere Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Occlusion Scale", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Occlusion Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Luminance Scale", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Luminance Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Max Distance", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Max Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Distance Falloff", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Distance Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HBAO Blur Sharpness", tostring(AgentGetProperty(agent_sceneAgent, "HBAO Blur Sharpness"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[SCREEN SPACE LINES] 14
    string_codeToWrite = string_codeToWrite .. "    --apply screen space lines settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Enabled", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Color", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Thickness", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Thickness"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Depth Fade Near", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Depth Fade Near"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Depth Fade Far", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Depth Fade Far"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Depth Magnitude", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Depth Magnitude"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Depth Exponent", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Depth Exponent"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Debug", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Debug"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Light Magnitude", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Light Magnitude"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Light Exponent", tostring(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Light Exponent"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Screen Space Lines - Light Direction", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "Screen Space Lines - Light Direction"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[GRAPHIC BLACK] 15
    string_codeToWrite = string_codeToWrite .. "    --apply graphic black settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Graphic Black Threshold", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Threshold"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Graphic Black Softness", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Softness"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Graphic Black Alpha", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Alpha"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Graphic Black Near", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Near"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Graphic Black Far", tostring(AgentGetProperty(agent_sceneAgent, "Graphic Black Far"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[WIND] 16
    string_codeToWrite = string_codeToWrite .. "    --apply wind settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Speed", tostring(AgentGetProperty(agent_sceneAgent, "Wind Speed"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Idle Strength", tostring(AgentGetProperty(agent_sceneAgent, "Wind Idle Strength"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Idle Spacial Frequency", tostring(AgentGetProperty(agent_sceneAgent, "Wind Idle Spacial Frequency"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Gust Speed", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Speed"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Gust Strength", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Strength"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Gust Spacial Frequency", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Spacial Frequency"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Gust Idle Strength Multiplier", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Idle Strength Multiplier"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Gust Separation Exponent", tostring(AgentGetProperty(agent_sceneAgent, "Wind Gust Separation Exponent"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Wind Direction", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "Wind Direction"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[REFLECTION] 17
    string_codeToWrite = string_codeToWrite .. "    --apply reflection settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Enabled", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Intensity", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Intensity Shadow", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Intensity Shadow"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Tint", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Tint"))) .. ";\n";
    --string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Reflection Texture", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Reflection Texture"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    --LightEnv Reflection Texture (string) \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[SHADOWS] 18
    string_codeToWrite = string_codeToWrite .. "    --apply shadows settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Sharp Shadows Enabled", tostring(AgentGetProperty(agent_sceneAgent, "FX Sharp Shadows Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Auto Depth Bounds", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Auto Depth Bounds"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Moment Bias", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Moment Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Depth Bias", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Depth Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Position Offset Bias", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Position Offset Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Light Bleed Reduction", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Light Bleed Reduction"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Min Distance", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Min Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Max Distance", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Max Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Dynamic Shadow Max Distance", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Dynamic Shadow Max Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Light Shadow Trace Max Distance", tostring(AgentGetProperty(agent_sceneAgent, "Light Shadow Trace Max Distance"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Cascade Split Bias", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Cascade Split Bias"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Shadow Max Updates", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Shadow Max Updates"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Light Static Shadow Bounds Min", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "Light Static Shadow Bounds Min"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Light Static Shadow Bounds Max", TLSE_Development_Editor_LuaHelper_WriteVector3(AgentGetProperty(agent_sceneAgent, "Light Static Shadow Bounds Max"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FX BRUSH] 19
    string_codeToWrite = string_codeToWrite .. "    --apply fx brush settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Enable", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Enable"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Filter Enable", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Filter Enable"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush DOF Enable", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush DOF Enable"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Size", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Size"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Threshold", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Threshold"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Color Threshold", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Color Threshold"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Outline Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Outline Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Near Outline Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Near Outline Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Near Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Near Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Near Detail", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Near Detail"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Detail", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Detail"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Scale Boost", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Scale Boost"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Plane", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Plane"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Plane Falloff", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Plane Falloff"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Brush Far Plane Max Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Brush Far Plane Max Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[FRAME BUFFER] 20
    string_codeToWrite = string_codeToWrite .. "    --apply frame buffer settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Frame Buffer Scale Override", tostring(AgentGetProperty(agent_sceneAgent, "Frame Buffer Scale Override"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Frame Buffer Scale Factor", tostring(AgentGetProperty(agent_sceneAgent, "Frame Buffer Scale Factor"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[SPECULAR] 21
    string_codeToWrite = string_codeToWrite .. "    --apply specular settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Specular Multiplier Enabled", tostring(AgentGetProperty(agent_sceneAgent, "Specular Multiplier Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Specular Color Multiplier", tostring(AgentGetProperty(agent_sceneAgent, "Specular Color Multiplier"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Specular Intensity Multiplier", tostring(AgentGetProperty(agent_sceneAgent, "Specular Intensity Multiplier"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Specular Exponent Multiplier", tostring(AgentGetProperty(agent_sceneAgent, "Specular Exponent Multiplier"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --[MISC] 22
    string_codeToWrite = string_codeToWrite .. "    --apply misc settings \n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "After Effects Enabled", tostring(AgentGetProperty(agent_sceneAgent, "After Effects Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HDR lightmaps Enabled", tostring(AgentGetProperty(agent_sceneAgent, "HDR lightmaps Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HDR lightmaps Intensity", tostring(AgentGetProperty(agent_sceneAgent, "HDR lightmaps Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Noise Scale", tostring(AgentGetProperty(agent_sceneAgent, "FX Noise Scale"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Ambient Color", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "Ambient Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "Shadow Color", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "Shadow Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "FX Force Linear Depth Offset", tostring(AgentGetProperty(agent_sceneAgent, "FX Force Linear Depth Offset"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "HDR - Paper White Nits", tostring(AgentGetProperty(agent_sceneAgent, "HDR - Paper White Nits"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Bake Enabled", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Bake Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Enabled", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Enabled"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Intensity", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Intensity"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Saturation", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Saturation"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Tint", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "LightEnv Tint"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Background Color", TLSE_Development_Editor_LuaHelper_WriteColor(AgentGetProperty(agent_sceneAgent, "LightEnv Background Color"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Probe Resolution XZ", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Probe Resolution XZ"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "    " .. TLSE_Development_Editor_LuaHelper_WriteAgentSetProperty(string_agentVariable, "LightEnv Probe Resolution Y", tostring(AgentGetProperty(agent_sceneAgent, "LightEnv Probe Resolution Y"))) .. ";\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end";
    string_codeToWrite = string_codeToWrite .. "\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_WriteSceneCleanupFunction = function(agentArray_sceneAgents)
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| start of lua cleanup function |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| start of lua cleanup function |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| start of lua cleanup function |||||||||||||||||||||||||||||||||||||||||||||||||||||

    local string_codeToWrite = "\n";
    string_codeToWrite = string_codeToWrite .. "TLSE_DeleteAllAgentsInScene = function(string_scene)\n";
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| sort scene agents into arrays |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| sort scene agents into arrays |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| sort scene agents into arrays |||||||||||||||||||||||||||||||||||||||||||||||||||||

    local stringArray_adv_agentNames = {};
    local stringArray_obj_agentNames = {};
    local stringArray_cam_agentNames = {};
    local stringArray_ui_agentNames = {};
    local stringArray_fx_agentNames = {};
    local stringArray_fxGroup_agentNames = {};
    local stringArray_module_agentNames = {};
    local stringArray_group_agentNames = {};
    local stringArray_light_agentNames = {};
    local stringArray_light_CHAR_CC_agentNames = {};
    local stringArray_lightrig_CC_agentNames = {};
    local stringArray_lightrotation_CC_agentNames = {};
    local stringArray_charLightComposer_agentNames = {};
    local stringArray_unsorted_agentNames = {};

    for i, agent_sceneAgent in pairs(agentArray_sceneAgents) do
        local string_agentName = tostring(AgentGetName(agent_sceneAgent))

        local subString3 = string.sub(string_agentName, 1, 3);
        local subString4 = string.sub(string_agentName, 1, 4);
        local subString6 = string.sub(string_agentName, 1, 6);
        local subString7 = string.sub(string_agentName, 1, 7);
        local subString8 = string.sub(string_agentName, 1, 8);
        local subString9 = string.sub(string_agentName, 1, 9);
        local subString12 = string.sub(string_agentName, 1, 12);
        local subString14 = string.sub(string_agentName, 1, 14);
        local subString17 = string.sub(string_agentName, 1, 17);
        local subString18 = string.sub(string_agentName, 1, 18);

        if (subString4 == "adv_") then
            table.insert(stringArray_adv_agentNames, string_agentName);
        elseif (subString4 == "obj_") then
            table.insert(stringArray_obj_agentNames, string_agentName);
        elseif (subString4 == "cam_") then
            table.insert(stringArray_cam_agentNames, string_agentName);
        elseif (subString3 == "ui_") then
            table.insert(stringArray_ui_agentNames, string_agentName);
        elseif (subString3 == "fx_") then
            table.insert(stringArray_fx_agentNames, string_agentName);
        elseif (subString8 == "fxGroup_") then
            table.insert(stringArray_fxGroup_agentNames, string_agentName);
        elseif (subString7 == "module_") then
            table.insert(stringArray_module_agentNames, string_agentName);
        elseif (subString6 == "group_") then
            table.insert(stringArray_group_agentNames, string_agentName);
        elseif (subString14 == "light_CHAR_CC_") then
            table.insert(stringArray_light_CHAR_CC_agentNames, string_agentName);
        elseif (subString6 == "light_") then
            table.insert(stringArray_light_agentNames, string_agentName);
        elseif (subString9 == "lightrig_") then
            table.insert(stringArray_lightrig_CC_agentNames, string_agentName);
        elseif (subString17 == "lightrotation_CC_") then
            table.insert(stringArray_lightrotation_CC_agentNames, string_agentName);
        elseif (subString18 == "charLightComposer_") then
            table.insert(stringArray_charLightComposer_agentNames, string_agentName);
        else
            table.insert(stringArray_unsorted_agentNames, string_agentName);
        end
    end

    --REFERENCE LINE
    --    TLSE_AgentNameDestroy("agentName", string_scene);

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| adv_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| adv_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| adv_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --adv agents \n";
    for i, string_adv_agentName in pairs(stringArray_adv_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_adv_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| obj_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| obj_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| obj_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --obj agents \n";
    for i, string_obj_agentName in pairs(stringArray_obj_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_obj_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| cam_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| cam_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| cam_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --cam agents \n";
    for i, string_cam_agentName in pairs(stringArray_cam_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_cam_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| ui_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| ui_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| ui_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --ui agents \n";
    for i, string_ui_agentName in pairs(stringArray_ui_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_ui_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| fx_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| fx_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| fx_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --fx agents \n";
    for i, string_fx_agentName in pairs(stringArray_fx_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_fx_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| fxGroup_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| fxGroup_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| fxGroup_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --fxGroup agents \n";
    for i, string_fxGroup_agentName in pairs(stringArray_fxGroup_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_fxGroup_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| module_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| module_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| module_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --module agents \n";
    for i, string_module_agentName in pairs(stringArray_module_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_module_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| group_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| group_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| group_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --group agents \n";
    for i, string_group_agentName in pairs(stringArray_group_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_group_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| light_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| light_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| light_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --light agents \n";
    for i, string_light_agentName in pairs(stringArray_light_agentNames) do
        --local agent_light = AgentFindInScene(string_light_agentName, TLSE_Development_SceneObject);
        --local number_lightType = AgentGetProperty(agent_light, "EnvLight - Type");
        --local lightTypeValueString = TLSE_Enum_T3LightEnvType_ToString(lightTypeValue);
        --local lightLuaComment = "--Light Type: " .. tostring(lightTypeValueString);

        --string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_light_agentName .. '"' .. ", string_scene); " .. lightLuaComment .. "\n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| light_CHAR_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| light_CHAR_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| light_CHAR_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --light_CHAR_CC agents \n";
    for i, string_light_CHAR_CC_agentName in pairs(stringArray_light_CHAR_CC_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_light_CHAR_CC_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| lightrig_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| lightrig_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| lightrig_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --lightrig_CC agents \n";
    for i, string_lightrig_CC_agentName in pairs(stringArray_lightrig_CC_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_lightrig_CC_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| lightrotation_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| lightrotation_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| lightrotation_CC_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --lightrotation_CC agents \n";
    for i, string_lightrotation_CC_agentName in pairs(stringArray_lightrotation_CC_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_lightrotation_CC_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| charLightComposer_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| charLightComposer_ |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| charLightComposer_ |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --charLightComposer agents \n";
    for i, string_charLightComposer_agentName in pairs(stringArray_charLightComposer_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_charLightComposer_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| unsorted |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| unsorted |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| unsorted |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "    --unsorted agents \n";
    for i, string_unsorted_agentName in pairs(stringArray_unsorted_agentNames) do
        string_codeToWrite = string_codeToWrite .. "    TLSE_AgentNameDestroy(" .. '"' .. string_unsorted_agentName .. '"' .. ", string_scene); \n";
    end
    string_codeToWrite = string_codeToWrite .. "\n";

    --||||||||||||||||||||||||||||||||||||||||||||||||||||| end of lua cleanup function |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| end of lua cleanup function |||||||||||||||||||||||||||||||||||||||||||||||||||||
    --||||||||||||||||||||||||||||||||||||||||||||||||||||| end of lua cleanup function |||||||||||||||||||||||||||||||||||||||||||||||||||||

    string_codeToWrite = string_codeToWrite .. "end \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    return string_codeToWrite;
end

TLSE_Development_Editor_LuaHelper_ExportSceneChangesToScript = function(string_scriptName)
    local finalPath = "TLSEDevelopment/" .. string_scriptName .. ".lua";

    if(TLSE_FileExists(finalPath) == true) then
        TLSE_FileDelete(finalPath);
    else
        TLSE_DirectoryCreate("TLSEDevelopment");
    end

    local main_lua_file = io.open(finalPath, "w");

    --||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
    local string_codeToWrite = "\n";

    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteSceneAgentsDeleteFunction(TLSE_Development_SceneAgentsDeletedNames);
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteSceneAgentsDuplicateFunction(TLSE_Development_SceneAgentsDuplicated);
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteApplyScenePropertiesFunction(TLSE_Development_SceneAgent);

    local agent_environmentFogAgent = nil;

    for i, agent_sceneAgent in pairs(TLSE_Development_SceneAgentsList) do
        if(AgentHasProperty(agent_sceneAgent, "Env - Fog Enabled")) then
            agent_environmentFogAgent = agent_sceneAgent;
            break
        end
    end

    if(agent_environmentFogAgent ~= nil) then
        string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteApplyEnvironmentFogModulePropertiesFunction(agent_environmentFogAgent);
    end

    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteApplyLightPropertiesFunction(TLSE_Development_SceneAgentsList);
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteSceneAgentsTransformationsFunction(TLSE_Development_SceneAgentsList);
    string_codeToWrite = string_codeToWrite .. TLSE_Development_Editor_LuaHelper_WriteSceneCleanupFunction(TLSE_Development_SceneAgentsList);

    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "TLSE_SceneRelight = function(string_scene) \n"
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "    TLSE_DeleteAgentsInScene(string_scene); \n";
    string_codeToWrite = string_codeToWrite .. "    TLSE_DuplicateAgentsInScene(string_scene); \n";
    --string_codeToWrite = string_codeToWrite .. "    TLSE_ApplySceneSettings(agent_sceneAgent); \n";
    string_codeToWrite = string_codeToWrite .. "    TLSE_ApplyLightingSettings(string_scene); \n";
    string_codeToWrite = string_codeToWrite .. "    TLSE_TransformAgentsInScene(string_scene); \n";
    string_codeToWrite = string_codeToWrite .. "    --TLSE_DeleteAllAgentsInScene(string_scene); \n";
    string_codeToWrite = string_codeToWrite .. "\n";
    string_codeToWrite = string_codeToWrite .. "end \n";
    string_codeToWrite = string_codeToWrite .. "\n";

    main_lua_file:write(string_codeToWrite);
    main_lua_file:close();
end