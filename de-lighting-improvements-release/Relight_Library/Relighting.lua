--gets the key and if it's a symbol it removes the symbol: tag and quotations
local customKeyToString = function(key)
    --convert the key to a string
    local keyAsString = tostring(key)
    
    --if the string contains symbol: then remove it, otherwise keep the string as is
    if (string.match)(keyAsString, "symbol: ") then
        keyAsString = (string.sub)(keyAsString, 9)
    else
        keyAsString = keyAsString
    end
    
    --remove any leftover quotations from the string
    keyAsString = keyAsString:gsub('"','')

    --return the final result
    return keyAsString
end

--gets and sets a property value using a symbol key string
customSetProperty = function(properties, symbolString, newValue)
    --check if the properties isn't null
    if properties then
        --get the property keys list
        local agent_property_keys = PropertyGetKeys(properties)
        
        --loop through each property key in the list
        for i, agent_property_key in ipairs(agent_property_keys) do
            --get the property key as a string
            local agent_propety_key_string = customKeyToString(agent_property_key)
            
            --check if the property key string matches the user's symbol string
            if agent_propety_key_string == symbolString then
                --we have a match! so set the property with the new value
                PropertySet(properties, agent_property_key, newValue)
            end
        end
    end
end

--newValue = Color(1.0, 1.0, 1.0, 1.0) [r, g, b, a]
--gets and sets a property color value table using a symbol key string
customSetPropertyColor = function(properties, symbolString, newValue)
    --check if the properties isn't null
    if properties then
        --get the property keys list
        local agent_property_keys = PropertyGetKeys(properties)

        --loop through each property key in the list
        for i, agent_property_key in ipairs(agent_property_keys) do
            --get the property key as a string
            local agent_propety_key_string = customKeyToString(agent_property_key)

            --check if the property key string matches the user's symbol string
            if agent_propety_key_string == symbolString then
                
                --get the name type of the property value
                local agent_property_value_type = TypeName(PropertyGet(properties, agent_property_key))
                --throw the name type under another string conversion
                local agent_property_key_type_string = customKeyToString(agent_property_value_type)
                
                --check if the key type is a table
                if agent_property_key_type_string == "table" then
                    --we have a match! so set the property with the new color value
                    PropertySet(properties, agent_property_key, newValue)
                end
            end
        end
    end
end

function tprint (tbl, indent)
  if not indent then indent = 0 end
  local toprint = string.rep(" ", indent) .. "{\r\n"
  indent = indent + 2 
  for k, v in pairs(tbl) do
    toprint = toprint .. string.rep(" ", indent)
    if (type(k) == "number") then
      toprint = toprint .. "[" .. k .. "] = "
    elseif (type(k) == "string") then
      toprint = toprint  .. k ..  "= "   
    end
    if (type(v) == "number") then
      toprint = toprint .. v .. ",\r\n"
    elseif (type(v) == "string") then
      toprint = toprint .. "\"" .. v .. "\",\r\n"
    elseif (type(v) == "table") then
      toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
    else
      toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
    end
  end
  toprint = toprint .. string.rep(" ", indent-2) .. "}"
  return toprint
end

--prints an entire scene and its contents to a text file
PrintSceneListToTXT = function(SceneObject, txtName)
    local main_txt_file                 = io.open(txtName, "a")
    local scene_agents                  = SceneGetAgents(SceneObject)
    local print_agent_transformation    = true
    local print_agent_properties        = false
    local print_agent_properties_keyset = false --not that useful
    local print_scene_camera            = false
    
    if print_scene_camera then
        local sceneCamera = SceneGetCamera(SceneObject)
        
        local cam_name        = tostring(AgentGetName(sceneCamera))
        local cam_type        = tostring(TypeName(sceneCamera))
        local cam_pos       = tostring(AgentGetPos(sceneCamera))
        local cam_rot       = tostring(AgentGetRot(sceneCamera))
        local cam_pos_world = tostring(AgentGetWorldPos(sceneCamera))
        local cam_rot_world = tostring(AgentGetWorldRot(sceneCamera))
        
        main_txt_file:write(" ", "\n")
        main_txt_file:write("Camera Name: " .. cam_name, "\n")
        main_txt_file:write("Camera Type: " .. cam_type, "\n")
        main_txt_file:write("Camera Position: " .. cam_pos, "\n")
        main_txt_file:write("Camera Rotation: " .. cam_rot, "\n")
        main_txt_file:write("Camera World Position: " .. cam_pos_world, "\n")
        main_txt_file:write("Camera World Rotation: " .. cam_rot_world, "\n")
        
        local cam_properties = AgentGetProperties(sceneCamera)
        
        if cam_properties then
            --write a quick header to seperate
            main_txt_file:write(" --- Camera Properties ---", "\n")
            
            --get the property keys list
            local cam_property_keys = PropertyGetKeys(cam_properties)
            
            --begin looping through each property key found in the property keys list
            for b, cam_property_key in ipairs(cam_property_keys) do
                --get the key type and the value, as well as the value type
                local cam_property_key_type     = TypeName(PropertyGetKeyType(cam_properties, cam_property_key))
                local cam_property_value        = PropertyGet(cam_properties, cam_property_key)
                local cam_property_value_type = TypeName(PropertyGet(cam_properties, cam_property_key))

                --convert these to a string using a special function to format it nicely
                local cam_propety_key_string       = customKeyToString(cam_property_key)
                local cam_property_key_type_string = customKeyToString(cam_property_value_type)
                
                --convert these to a string using a special function to format it nicely
                local cam_property_value_string      = customKeyToString(cam_property_value)
                local cam_property_value_type_string = customKeyToString(cam_property_key_type)
                
                --begin writing these values to file
                main_txt_file:write("Camera" .. " " .. b .. " [Camera Property]", "\n")
                main_txt_file:write("Camera" .. " " .. b .. " Key: " .. cam_propety_key_string, "\n")
                main_txt_file:write("Camera" .. " " .. b .. " Value: " .. cam_property_value_string, "\n")
                main_txt_file:write("Camera" .. " " .. b .. " Key Type: " .. cam_property_key_type_string, "\n")
                main_txt_file:write("Camera" .. " " .. b .. " Value Type: " .. cam_property_value_type_string, "\n")

                --if the key type is of a table type, then print out the values of the table
                if cam_property_key_type_string == "table" then
                    main_txt_file:write("Camera" .. " " .. b .. " Value Table", "\n")
                    main_txt_file:write(tprint(cam_property_value), "\n")
                end
            end
            
            --write a header to indicate the end of the agent properties information
            main_txt_file:write(" ---Camera Properties END ---", "\n")
        end
    end
    
    --being looping through the list of agents gathered from the scene
    for i, agent_object in pairs(scene_agents) do
        --get the agent name and the type
        local agent_name = tostring(AgentGetName(agent_object))
        local agent_type = tostring(TypeName(agent_object))--type(agent_object)
        
        --start writing the agent information to the file
        main_txt_file:write(i, "\n")
        main_txt_file:write(i .. " Agent Name: " .. agent_name, "\n")
        main_txt_file:write(i .. " Agent Type: " .. agent_type, "\n")
        
        --if true, then it also writes information regarding the transformation properties of the agent
        if print_agent_transformation then
            local agent_pos = tostring(AgentGetPos(agent_object))
            local agent_rot = tostring(AgentGetRot(agent_object))
            
            local agent_pos_world = tostring(AgentGetWorldPos(agent_object))
            local agent_rot_world = tostring(AgentGetWorldRot(agent_object))
            
            main_txt_file:write(i .. " Agent Position: " .. agent_pos, "\n")
            main_txt_file:write(i .. " Agent Rotation: " .. agent_rot, "\n")
            main_txt_file:write(i .. " Agent World Position: " .. agent_pos_world, "\n")
            main_txt_file:write(i .. " Agent World Rotation: " .. agent_rot_world, "\n")
        end

        --get the properties list from the agent
        local agent_properties = AgentGetProperties(agent_object)
        
        --if the properties field isnt null and print_agent_properties is true
        if agent_properties and print_agent_properties then
            --write a quick header to seperate
            main_txt_file:write(i .. " --- Agent Properties ---", "\n")
            
            --get the property keys list
            local agent_property_keys = PropertyGetKeys(agent_properties)
            
            --begin looping through each property key found in the property keys list
            for x, agent_property_key in ipairs(agent_property_keys) do
                --get the key type and the value, as well as the value type
                local agent_property_key_type   = TypeName(PropertyGetKeyType(agent_properties, agent_property_key))
                local agent_property_value      = PropertyGet(agent_properties, agent_property_key)
                local agent_property_value_type = TypeName(PropertyGet(agent_properties, agent_property_key))

                --convert these to a string using a special function to format it nicely
                local agent_propety_key_string       = customKeyToString(agent_property_key)
                local agent_property_key_type_string = customKeyToString(agent_property_value_type)
                
                --convert these to a string using a special function to format it nicely
                local agent_property_value_string      = customKeyToString(agent_property_value)
                local agent_property_value_type_string = customKeyToString(agent_property_key_type)
                
                --begin writing these values to file
                main_txt_file:write(i .. " " .. x .. " [Agent Property]", "\n")
                main_txt_file:write(i .. " " .. x .. " Key: " .. agent_propety_key_string, "\n")
                main_txt_file:write(i .. " " .. x .. " Value: " .. agent_property_value_string, "\n")
                main_txt_file:write(i .. " " .. x .. " Key Type: " .. agent_property_key_type_string, "\n")
                main_txt_file:write(i .. " " .. x .. " Value Type: " .. agent_property_value_type_string, "\n")

                --if the key type is of a table type, then print out the values of the table
                if agent_property_key_type_string == "table" then
                    main_txt_file:write(i .. " " .. x .. " Value Table", "\n")
                    main_txt_file:write(tprint(agent_property_value), "\n")
                end
                
                --for printing the key property set of the agent properties
                if print_agent_properties_keyset then
                    local property_key_set = PropertyGetKeyPropertySet(agent_properties, agent_property_key)
                    
                    main_txt_file:write(i .. " " .. x .. " [Key Property Set] " .. tostring(property_key_set), "\n")
                    
                    for y, property_key in pairs(property_key_set) do
                        main_txt_file:write(i .. " " .. x .. " Key Property Set Key: " .. tostring(property_key), "\n")
                        main_txt_file:write(i .. " " .. x .. " Key Property Set Value: " .. tostring(PropertyGet(agent_properties, property_key)), "\n")
                    end
                end
            end
            
            --write a header to indicate the end of the agent properties information
            main_txt_file:write(i .. " ---Agent Properties END ---", "\n")
            
        end
    end
    
    --close the file stream
    main_txt_file:close()

    --for testing/validating
    --DialogBox_Okay("Printed Output")
end


destroyMe = function(agent)
   if AgentExists(AgentGetName(agent)) then
       AgentDestroy(agent)
   end
end

Custom_RemoveAgent = function(agentName, sceneObj)
   if AgentExists(AgentGetName(agentName)) then
       local agent = AgentFindInScene(agentName, sceneObj)
       AgentDestroy(agent)
   end
end

Desaturate_RGBColor = function(color, amount)
    local lumanince = 0.3 * color.r + 0.6 * color.g + 0.1 * color.b;
    color.r         = color.r + amount * (lumanince - color.r)
    color.g         = color.g + amount * (lumanince - color.g)
    color.b         = color.b + amount * (lumanince - color.b)
    return color
end

Multiplier_RGBColor = function(color, amount)
    local multiplier = 1.0 * amount
    color.r = color.r * multiplier
    color.g = color.g * multiplier
    color.b = color.b * multiplier
    return color
end

RGBColor = function(r, g, b, a)
    local scalar  = 1 / 255
    local scaledR = r * scalar
    local scaledG = g * scalar
    local scaledB = b * scalar
    local scaledA = a * scalar
    return Color(scaledR, scaledG, scaledB, scaledA)
end

ModifyAgentTransformation_Rotation = function(agent, newRotation)
    local rot      = AgentGetRot(agent)
    local worldRot = AgentGetWorldRot(agent)
        
    rot.x = 0
    rot.y = 0
    rot.z = 0
    
    worldRot.x = newRotation.x
    worldRot.y = newRotation.y
    worldRot.z = newRotation.z

    AgentSetRot(agent, rot)
    AgentSetWorldRot(agent, worldRot)
end

ModifyAgentTransformation_Position = function(agent, newPosition)
    local pos = AgentGetPos(agent)
    
    pos.x = newPosition.x
    pos.y = newPosition.y
    pos.z = newPosition.z

    AgentSetPos(agent, pos)
end

ModifyAgentTransformation_OffsetPosition = function(agent, offset)
    local pos = AgentGetPos(agent)
    
    pos.x = pos.x + offset.x
    pos.y = pos.y + offset.y
    pos.z = pos.z + offset.z

    AgentSetPos(agent, pos)
end

ModifyLightSettings = function(light_agent, intensity, indirectMultiplier, color)
    if AgentExists(AgentGetName(light_agent)) then
        local light_agent_props = AgentGetRuntimeProperties(light_agent)
        customSetProperty(light_agent_props, "6895516104914333780", intensity)
        customSetProperty(light_agent_props, "13406938452151364352", indirectMultiplier)
        customSetPropertyColor(light_agent_props, "4281326393034255142", color)
        --customSetProperty(spot1_props, "17375235324208571526", 0.1) --near clip plane (value: 0.10000000149012)
        
        --customSetProperty(spot1_props, "14190607628258417874", 9.0) --no clue (value: 0.30000001192093)
        --customSetProperty(spot1_props, "5244049086127162110", 1.0) --no clue? (value: 0.20000000298023)
    end
end

ModifyLightSettings_spotLight = function(light_agent, innerAngle, outerAngle)
    if AgentExists(AgentGetName(light_agent)) then
        local light_agent_props = AgentGetRuntimeProperties(light_agent)
        customSetProperty(light_agent_props, "1169752224460102433", innerAngle) --inner spot angle (degrees, 1 - 180)
        customSetProperty(light_agent_props, "596410821983666954", outerAngle) --outer spot angle (degrees, 1 - 180)
    end
end

ModifyLightSettings_Riglight = function(light_agent, intensity, color)
    if AgentExists(AgentGetName(light_agent)) then
        local light_agent_props = AgentGetRuntimeProperties(light_agent)
        customSetProperty(light_agent_props, "1403056135949921157", intensity)
        customSetPropertyColor(light_agent_props, "0000026BFF754FA0", color)
    end
end

RemovingAllLightingRigs = function(sceneObject)
    local scene_agents     = SceneGetAgents(sceneObject)
    local rig_agents_names = {}
    
    --fill out rig agents list
    for i, agent_object in pairs(scene_agents) do
        local agent_name = tostring(AgentGetName(agent_object))
        
        if (string.match)(agent_name, "light_CHAR_CC") then
            table.insert(rig_agents_names, agent_name)
        end
    end
    
    --start removing agents in the list
    for x, rig_agent_name in pairs(rig_agents_names) do
        local agent = AgentFindInScene(rig_agent_name, sceneObject)
        destroyMe(agent)
    end
end


BrightenAllCameras = function(sceneObject, intensityExposure)
    local scene_agents     = SceneGetAgents(sceneObject)
    local rig_agents_names = {}
    
    --fill out rig agents list
    for i, agent_object in pairs(scene_agents) do
        local agent_name = tostring(AgentGetName(agent_object))
        
        if (string.match)(agent_name, "cam_") then
            table.insert(rig_agents_names, agent_name)
        end
    end
    
    for x, rig_agent_name in pairs(rig_agents_names) do
        local agent = AgentFindInScene(rig_agent_name, sceneObject)
        local agent_props        = AgentGetRuntimeProperties(agent)
        customSetProperty(agent_props, "709099056866139056", intensityExposure)
    end
end

SetPropertyOnAllCameras = function(sceneObject, propertyString, propertyValue)
    local scene_agents     = SceneGetAgents(sceneObject)
    local rig_agents_names = {}
    
    --fill out rig agents list
    for i, agent_object in pairs(scene_agents) do
        local agent_name = tostring(AgentGetName(agent_object))
        
        if (string.match)(agent_name, "cam_") then
            table.insert(rig_agents_names, agent_name)
        end
    end
    
    for x, rig_agent_name in pairs(rig_agents_names) do
        local agent = AgentFindInScene(rig_agent_name, sceneObject)
        local agent_props        = AgentGetRuntimeProperties(agent)
        
        PropertySet(agent_props, propertyString, propertyValue)
    end
end


RemovingAll_AdvMesh = function(sceneObject)
    local scene_agents     = SceneGetAgents(sceneObject)
    local adv_agents_names = {}
    
    --fill out rig agents list
    for i, agent_object in pairs(scene_agents) do
        local agent_name = tostring(AgentGetName(agent_object))
        
        if (string.match)(agent_name, "adv_") then
            table.insert(adv_agents_names, agent_name)
        end
    end
    
    --start removing agents in the list
    for x, adv_agent_name in pairs(adv_agents_names) do
        local agent = AgentFindInScene(adv_agent_name, sceneObject)
        destroyMe(agent)
    end
end

Custom_AgentSetProperty = function(agentName, propertyString, propertyValue, sceneObject)
    local agent = AgentFindInScene(agentName, sceneObject)
    local agent_props = AgentGetRuntimeProperties(agent)
    PropertySet(agent_props, propertyString, propertyValue)
end

RemoveNPR_OutlineOnAllAgents = function(sceneObject)
    local scene_agents     = SceneGetAgents(sceneObject)

    --fill out rig agents list
    for i, agent_object in pairs(scene_agents) do
        local agent_object_props = AgentGetRuntimeProperties(agent_object)
        customSetProperty(agent_object_props, "1987003616645213847", -5)
    end
end

Custom_PropertySet = function(agent, propertyString, propertyValue)
    local agent_props = AgentGetRuntimeProperties(agent)
    PropertySet(agent_props, propertyString, propertyValue)
end
