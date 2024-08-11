local agent_text_hierarchyItemCount = 29;
local agent_text_hierarchyItems = {};
local number_hierarchyPageIndex = 0;

local textButton_hierarchyPrevious = nil;
local textButton_hierarchyNext = nil;
local label_hierarchyCount = nil;

local label_filter = nil;
local textButton_filterLights = nil;
local textButton_filterFog = nil;
local textButton_filterParticle = nil;
local textButton_filterCineLight = nil;
local textButton_filterCineLightRig = nil;
local textButton_filterMesh = nil;

local OnPress_CycleNextHierarchyItems = function(textButton_button) 
    number_hierarchyPageIndex = number_hierarchyPageIndex + 1; 
end

local OnPress_CyclePreviousHierarchyItems = function(textButton_button) 
    number_hierarchyPageIndex = math.max(0, number_hierarchyPageIndex - 1); 
end

local OnPress_SelectHierarchyItem = function(textButton_button) 
    agent_currentSelectedAgent = AgentFindInScene(textButton_button["Text"], TLSE_Development_SceneObject); 
end

local OnPress_FilterLights = function(textButton_button) 
    number_hierarchyPageIndex = 0; 
    TLSE_Development_SceneAgents_FilterLights = not TLSE_Development_SceneAgents_FilterLights; 
end

local OnPress_FilterFog = function(textButton_button) 
    number_hierarchyPageIndex = 0; 
    TLSE_Development_SceneAgents_FilterFog = not TLSE_Development_SceneAgents_FilterFog; 
end

local OnPress_FilterParticle = function(textButton_button) 
    number_hierarchyPageIndex = 0; 
    TLSE_Development_SceneAgents_FilterParticle = not TLSE_Development_SceneAgents_FilterParticle; 
end

local OnPress_FilterCineLight = function(textButton_button) 
    number_hierarchyPageIndex = 0; 
    TLSE_Development_SceneAgents_FilterCineLight = not TLSE_Development_SceneAgents_FilterCineLight; 
end

local OnPress_FilterCineLightRig = function(textButton_button) 
    number_hierarchyPageIndex = 0; 
    TLSE_Development_SceneAgents_FilterCineLightRig = not TLSE_Development_SceneAgents_FilterCineLightRig; 
end

local OnPress_FilterMesh = function(textButton_button) 
    number_hierarchyPageIndex = 0; 
    TLSE_Development_SceneAgents_FilterMesh = not TLSE_Development_SceneAgents_FilterMesh; 
end

TLSE_Development_GUI_TabSceneHierarchyInitalize = function()
    label_filter = TLSE_Development_Editor_GUI_CreateLabel("Filter:", Vector(0.758, 0.005, 0.0));
    textButton_filterLights = TLSE_Development_Editor_GUI_CreateTextButton("[EnvLight]", true, Vector(0.780, 0.005, 0.0), OnPress_FilterLights, nil);
    textButton_filterFog = TLSE_Development_Editor_GUI_CreateTextButton("[EnvFog]", true, Vector(0.805, 0.005, 0.0), OnPress_FilterFog, nil);
    textButton_filterParticle = TLSE_Development_Editor_GUI_CreateTextButton("[Particle]", true, Vector(0.825, 0.005, 0.0), OnPress_FilterParticle, nil);
    textButton_filterCineLight = TLSE_Development_Editor_GUI_CreateTextButton("[CinLight]", true, Vector(0.860, 0.005, 0.0), OnPress_FilterCineLight, nil);
    textButton_filterCineLightRig = TLSE_Development_Editor_GUI_CreateTextButton("[LightRig]", true, Vector(0.902, 0.005, 0.0), OnPress_FilterCineLightRig, nil);
    textButton_filterMesh = TLSE_Development_Editor_GUI_CreateTextButton("[Renderable]", true, Vector(0.955, 0.005, 0.0), OnPress_FilterMesh, nil);

    textButton_hierarchyPrevious = TLSE_Development_Editor_GUI_CreateTextButton("[PREVIOUS]", false, Vector(0.685, 0.465, 0.0), OnPress_CyclePreviousHierarchyItems, nil);
    textButton_hierarchyNext = TLSE_Development_Editor_GUI_CreateTextButton("[NEXT]", false, Vector(0.965, 0.465, 0.0), OnPress_CycleNextHierarchyItems, nil);
    label_hierarchyCount = TLSE_Development_Editor_GUI_CreateLabel("0 / 0", Vector(0.815, 0.465, 0.0));

    for index = 1, agent_text_hierarchyItemCount do
        local number_yOffset = index * 0.015;
        local string_hierarchyItemContent = "Item" .. tostring(index);
        local textButton_newButton = TLSE_Development_Editor_GUI_CreateTextButton(string_hierarchyItemContent, true, Vector(0.685, 0.006 + number_yOffset, 0.0), OnPress_SelectHierarchyItem, nil);
        textButton_newButton["ParameterData"] = textButton_newButton;
        table.insert(agent_text_hierarchyItems, textButton_newButton);
    end
end

TLSE_Development_GUI_TabSceneHierarchyUpdate = function()
    local agentTable_sceneAgents = TLSE_Development_SceneAgentsList;
    local hierarchyItemsCurrentPage = number_hierarchyPageIndex * agent_text_hierarchyItemCount;
    --local hierarchyItemsCurrentPage = TLSE_NumberClamp(number_hierarchyPageIndex * agent_text_hierarchyItemCount, 0, #agentTable_sceneAgents);
    local hierarchyItemsIndex = 1;

    local hierarchyCountText = "";

    hierarchyCountText = "(" .. tostring(hierarchyItemsCurrentPage);
    hierarchyCountText = hierarchyCountText .. " - " .. tostring(hierarchyItemsCurrentPage + agent_text_hierarchyItemCount) .. ") / ";
    hierarchyCountText = hierarchyCountText .. tostring(#agentTable_sceneAgents);

    label_hierarchyCount["Text"] = hierarchyCountText;

    for key, value in pairs(agent_text_hierarchyItems) do
        local sceneAgentIndex = (number_hierarchyPageIndex * agent_text_hierarchyItemCount) + hierarchyItemsIndex;

        if(sceneAgentIndex > #agentTable_sceneAgents) then
            value["Visible"] = false;
        else
            value["Visible"] = true;
            local agent_sceneAgent = agentTable_sceneAgents[sceneAgentIndex];
            value["Text"] = AgentGetName(agent_sceneAgent);

            if(value["Text"] == AgentGetName(agent_currentSelectedAgent)) then
                value["Selected"] = true;
            else
                value["Selected"] = false;
            end
        end

        hierarchyItemsIndex = hierarchyItemsIndex + 1;
    end

    local vector_startScreenPosition = label_filter["ScreenPosition"];
    local vector_item1Size = TLSE_TextUI_GetTextScreenSize(label_filter["TextAgent"]);
    local vector_item2Size = TLSE_TextUI_GetTextScreenSize(textButton_filterLights["TextAgent"]);
    local vector_item3Size = TLSE_TextUI_GetTextScreenSize(textButton_filterFog["TextAgent"]);
    local vector_item4Size = TLSE_TextUI_GetTextScreenSize(textButton_filterParticle["TextAgent"]);
    local vector_item5Size = TLSE_TextUI_GetTextScreenSize(textButton_filterCineLight["TextAgent"]);
    local vector_item6Size = TLSE_TextUI_GetTextScreenSize(textButton_filterCineLightRig["TextAgent"]);
    --local vector_item7Size = TLSE_TextUI_GetTextScreenSize(textButton_filterMesh["TextAgent"]);
 
    local number_horizontalOffset = 0.003;
    local vector_guiOffset = Vector(0, 0, 0);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = 0;
    label_filter["ScreenPosition"] = vector_startScreenPosition;

    vector_guiOffset.x = vector_guiOffset.x + (vector_item1Size.x * 2.0) + number_horizontalOffset;
    textButton_filterLights["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_item2Size.x * 2.0) + number_horizontalOffset;
    textButton_filterFog["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_item3Size.x * 2.0) + number_horizontalOffset;
    textButton_filterParticle["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_item4Size.x * 2.0) + number_horizontalOffset;
    textButton_filterCineLight["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_item5Size.x * 2.0) + number_horizontalOffset;
    textButton_filterCineLightRig["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_item6Size.x * 2.0) + number_horizontalOffset;
    textButton_filterMesh["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);
end