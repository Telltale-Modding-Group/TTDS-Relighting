local string_texture_editorColor = "TLSE_Development_EditorGUIGrey.d3dtx";

local label_editorModeTextTopLeft = nil;

local agent_guiGroup = nil;
local agent_bg_rightSide = nil;
local agent_bg_inspectorArea = nil;
local agent_bg_hierarchyArea = nil;

local label_hierarchyTitle = nil;

local textButton_inspectorTab = nil;
local textButton_lightingTab = nil;
local textButton_fogTab = nil;
local textButton_renderTab = nil;
local textButton_scenePropertiesTab = nil;

local agentTable_sceneAgents = {};

TLSE_Development_GUI_CursorOverGUI = false;
TLSE_Development_GUI_BottomRightWindowTab = "Inspector";

local OnPress_SelectInspectorTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "Inspector"; end
local OnPress_SelectLightingTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "Lighting"; end
local OnPress_SelectScenePropertiesTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "SceneProperties"; end
local OnPress_SelectFogTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "Fog"; end
local OnPress_SelectRenderTab = function(textButton_button) TLSE_Development_GUI_BottomRightWindowTab = "Render"; end

local textButton_hideIcons = nil;
local textButton_hideSelectionBox = nil;
local textButton_hideHoverBox = nil;
local textButton_exportSceneToLuaScript = nil;
local textButton_disableAllLights = nil;
local textButton_enableAllLights = nil;

local OnPress_HideIcons = function(textButton_button) TLSE_Development_Editor_ObjectIcons_Visible = not TLSE_Development_Editor_ObjectIcons_Visible; end
local OnPress_HideSelectionBox = function(textButton_button) TLSE_Development_Selection_HideSelectBox = not TLSE_Development_Selection_HideSelectBox; end
local OnPress_HideHoverBox = function(textButton_button) TLSE_Development_Selection_HideHoverBox = not TLSE_Development_Selection_HideHoverBox; end

local OnPress_ExportSceneChangesToScript = function(textButton_button) 
    TLSE_Development_Editor_LuaHelper_ExportSceneChangesToScript(TLSE_Development_SceneObject .. "_SceneChanges");
end

local OnPress_DisableAllLights = function(textButton_button) 
    for index, agent_sceneAgent in pairs(TLSE_Development_SceneAgentsList) do
        if(AgentHasProperty(agent_sceneAgent, "EnvLight - Enabled")) then
            AgentSetProperty(agent_sceneAgent, "EnvLight - Enabled", false);
        end
    end
end

local OnPress_EnableAllLights = function(textButton_button) 
    for index, agent_sceneAgent in pairs(TLSE_Development_SceneAgentsList) do
        if(AgentHasProperty(agent_sceneAgent, "EnvLight - Enabled")) then
            AgentSetProperty(agent_sceneAgent, "EnvLight - Enabled", true);
        end
    end
end

TLSE_Development_GUI_Initalize = function()
    TLSE_Development_Freecam_ForceDisableZoom = true;

    TLSE_Development_GUI_TransformPanelInitalize();
    TLSE_Development_GUI_TabSceneHierarchyInitalize();
    TLSE_Development_GUI_TabLightingInitalize();
    TLSE_Development_GUI_TabFogInitalize();
    TLSE_Development_GUI_TabRenderInitalize();
    TLSE_Development_GUI_TabInspectorInitalize();
    TLSE_Development_GUI_TabScenePropertiesInitalize();

    agent_bg_rightSide = AgentCreate("TLSE_Development_bg_rightSide", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    agent_bg_inspectorArea = AgentCreate("TLSE_Development_bg_inspectorArea", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);
    agent_bg_hierarchyArea = AgentCreate("TLSE_Development_bg_hierarchyArea", TLSE_Development_FlatPlaneMesh, Vector(0, 0, 0), Vector(0, 0, 0), TLSE_Development_SceneObject, false, false);

    label_hierarchyTitle = TLSE_Development_Editor_GUI_CreateLabel("[SCENE HIERARCHY]", Vector(0.685, 0.005, 0.0));
    textButton_inspectorTab = TLSE_Development_Editor_GUI_CreateTextButton("[INSPECTOR]", true, Vector(0.685, 0.5, 0.0), OnPress_SelectInspectorTab, nil);
    textButton_lightingTab = TLSE_Development_Editor_GUI_CreateTextButton("[LIGHT]", true, Vector(0.735, 0.5, 0.0), OnPress_SelectLightingTab, nil);
    textButton_fogTab = TLSE_Development_Editor_GUI_CreateTextButton("[FOG]", true, Vector(0.778, 0.5, 0.0), OnPress_SelectFogTab, nil);
    textButton_renderTab = TLSE_Development_Editor_GUI_CreateTextButton("[RENDER]", true, Vector(0.803, 0.5, 0.0), OnPress_SelectRenderTab, nil);
    textButton_scenePropertiesTab = TLSE_Development_Editor_GUI_CreateTextButton("[SCENE]", true, Vector(0.843, 0.5, 0.0), OnPress_SelectScenePropertiesTab, nil);

    textButton_exportSceneToLuaScript = TLSE_Development_Editor_GUI_CreateTextButton("[EXPORT SCENE CHANGES TO LUA]", true, Vector(0.558, 0.005, 0.0), OnPress_ExportSceneChangesToScript, nil);
    textButton_hideIcons = TLSE_Development_Editor_GUI_CreateTextButton("[HIDE ICONS]", true, Vector(0.635, 0.020, 0.0), OnPress_HideIcons, nil);
    textButton_hideSelectionBox = TLSE_Development_Editor_GUI_CreateTextButton("[HIDE SELECTION BOX]", true, Vector(0.602, 0.035, 0.0), OnPress_HideSelectionBox, nil);
    textButton_hideHoverBox = TLSE_Development_Editor_GUI_CreateTextButton("[HIDE HOVER BOX]", true, Vector(0.615, 0.050, 0.0), OnPress_HideHoverBox, nil);
    textButton_disableAllLights = TLSE_Development_Editor_GUI_CreateTextButton("[DISABLE ALL LIGHTS]", true, Vector(0.605, 0.065, 0.0), OnPress_DisableAllLights, nil);
    textButton_enableAllLights = TLSE_Development_Editor_GUI_CreateTextButton("[ENABLE ALL LIGHTS]", true, Vector(0.605, 0.080, 0.0), OnPress_EnableAllLights, nil);

    label_editorModeTextTopLeft = TLSE_Development_Editor_GUI_CreateLabel("", Vector(0, 0, 0));

    ShaderSwapTexture(agent_bg_rightSide, TLSE_Development_FlatPlaneOriginalTexture, "color_000.d3dtx");
    ShaderSwapTexture(agent_bg_inspectorArea, TLSE_Development_FlatPlaneOriginalTexture, string_texture_editorColor);
    ShaderSwapTexture(agent_bg_hierarchyArea, TLSE_Development_FlatPlaneOriginalTexture, string_texture_editorColor);

    AgentSetProperty(agent_bg_rightSide, "Render Axis Scale", Vector(0.1, 0.5, 1));
    AgentSetProperty(agent_bg_rightSide, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_bg_rightSide, "Render Depth Test", false);
    AgentSetProperty(agent_bg_rightSide, "Render Depth Write", false);
    AgentSetProperty(agent_bg_rightSide, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_bg_rightSide, "Render Layer", 93);

    AgentSetProperty(agent_bg_inspectorArea, "Render Axis Scale", Vector(0.1, 0.081, 1));
    AgentSetProperty(agent_bg_inspectorArea, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_bg_inspectorArea, "Render Depth Test", false);
    AgentSetProperty(agent_bg_inspectorArea, "Render Depth Write", false);
    AgentSetProperty(agent_bg_inspectorArea, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_bg_inspectorArea, "Render Layer", 94);

    AgentSetProperty(agent_bg_hierarchyArea, "Render Axis Scale", Vector(0.1, 0.081, 1));
    AgentSetProperty(agent_bg_hierarchyArea, "Render After Anti-Aliasing", true);
    AgentSetProperty(agent_bg_hierarchyArea, "Render Depth Test", false);
    AgentSetProperty(agent_bg_hierarchyArea, "Render Depth Write", false);
    AgentSetProperty(agent_bg_hierarchyArea, "Render Depth Write Alpha", false);
    AgentSetProperty(agent_bg_hierarchyArea, "Render Layer", 94);
end

TLSE_Development_GUI_Update = function()  
    TLSE_Development_GUI_CursorOverGUI = false;

    TLSE_Development_Editor_GUI_Update();

    local agent_sceneCamera = SceneGetCamera(TLSE_Development_SceneObject);
    local vector_sceneCameraPosition = AgentGetWorldPos(agent_sceneCamera);
    local vector_sceneCameraRotation = AgentGetWorldRot(agent_sceneCamera);
    local vector_sceneCameraForward = AgentGetForwardVec(agent_sceneCamera);

    local number_buttonVerticalSize = 0.04;
    local number_buttonHorizontalSize = 0.04 / RenderGetAspectRatio();
    local vector_buttonExtentsMin = Vector(-number_buttonHorizontalSize, -number_buttonVerticalSize, 1);
    local vector_buttonExtentsMax = Vector(number_buttonHorizontalSize, number_buttonVerticalSize, 1);

    local bool_isOverRightSideGUI = TLSE_TextUI_IsCursorOverBounds(Vector(1, 0, 0), Vector(-0.6 / RenderGetAspectRatio(), -2, 0), Vector(0.6 / RenderGetAspectRatio(), 2, 0));

    --screen pos notes
    --0.0 0.0 0.0 = top left
    --0.5 0.5 0.0 = center
    --0.0 1.0 0.0 = bottom left

    if(bool_isOverRightSideGUI) then
        TLSE_Development_GUI_CursorOverGUI = true;
    end

    TLSE_Development_GUI_TransformPanelUpdate();

    AgentSetWorldPos(agent_bg_rightSide, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(8, 0, 0))));
    AgentSetWorldPos(agent_bg_hierarchyArea, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(8.05, -5.25, 0))));
    AgentSetWorldPos(agent_bg_inspectorArea, VectorAdd(vector_sceneCameraForward, CameraGetWorldPosFromLogicalScreenPos(agent_sceneCamera, Vector(8.05, 5.75, 0))));

    AgentSetWorldRot(agent_bg_rightSide, vector_sceneCameraRotation);
    AgentSetWorldRot(agent_bg_inspectorArea, vector_sceneCameraRotation);
    AgentSetWorldRot(agent_bg_hierarchyArea, vector_sceneCameraRotation);





    --string_editorModeTextTopLeftText = "GetGenericTextBoxResults: " .. tostring(GetGenericTextBoxResults()) .. " | IsGenericTextBoxFinished: " .. tostring(IsGenericTextBoxFinished());



    string_editorModeTextTopLeftText = "[Editor Mode]";
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line

    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Scene: " .. TLSE_Development_SceneObjectAgentName;
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line

    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Camera Position: " .. TLSE_VectorToString(AgentGetPos(TLSE_Development_Freecam_Camera));
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Camera Rotation: " .. TLSE_VectorToString(AgentGetRot(TLSE_Development_Freecam_Camera));
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Camera World Position: " .. TLSE_VectorToString(AgentGetWorldPos(TLSE_Development_Freecam_Camera));
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Camera World Rotation: " .. TLSE_VectorToString(AgentGetWorldRot(TLSE_Development_Freecam_Camera));
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "Camera Forward: " .. TLSE_VectorToString(AgentGetForwardVec(TLSE_Development_Freecam_Camera));
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line

    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "R Key - Unfreeze Camera / Hide Cursor";
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "F Key - Freeze Camera / Show Cursor";
    string_editorModeTextTopLeftText = string_editorModeTextTopLeftText .. "\n"; --new line

    label_editorModeTextTopLeft["LabelText"] = string_editorModeTextTopLeftText;










    

 
    local vector_startScreenPosition = textButton_inspectorTab["TextButtonScreenPosition"];
    local vector_screenSizeTab1 = TLSE_TextUI_GetTextScreenSize(textButton_inspectorTab["TextButtonAgentReference"]);
    local vector_screenSizeTab2 = TLSE_TextUI_GetTextScreenSize(textButton_lightingTab["TextButtonAgentReference"]);
    local vector_screenSizeTab3 = TLSE_TextUI_GetTextScreenSize(textButton_fogTab["TextButtonAgentReference"]);
    local vector_screenSizeTab4 = TLSE_TextUI_GetTextScreenSize(textButton_renderTab["TextButtonAgentReference"]);
    --local vector_screenSizeTab5 = TLSE_TextUI_GetTextScreenSize(textButton_scenePropertiesTab["TextButtonAgentReference"]);


    local number_horizontalOffset = 0.003;
    local vector_guiOffset = Vector(0, 0, 0);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = 0;
    textButton_inspectorTab["TextButtonScreenPosition"] = vector_startScreenPosition;

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab1.x * 2.0) + number_horizontalOffset;
    textButton_lightingTab["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab2.x * 2.0) + number_horizontalOffset;
    textButton_fogTab["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab3.x * 2.0) + number_horizontalOffset;
    textButton_renderTab["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab4.x * 2.0) + number_horizontalOffset;
    textButton_scenePropertiesTab["TextButtonScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);







































    local bool_inspectorTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Inspector";
    local bool_lightingTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Lighting";
    local bool_fogTabActive = TLSE_Development_GUI_BottomRightWindowTab == "Fog";
    local bool_scenePropertiesTabActive = TLSE_Development_GUI_BottomRightWindowTab == "SceneProperties";

    textButton_inspectorTab["TextButtonSelected"] = TLSE_Development_GUI_BottomRightWindowTab == "Inspector";
    textButton_lightingTab["TextButtonSelected"] = TLSE_Development_GUI_BottomRightWindowTab == "Lighting";
    textButton_fogTab["TextButtonSelected"] = TLSE_Development_GUI_BottomRightWindowTab == "Fog";
    textButton_renderTab["TextButtonSelected"] = TLSE_Development_GUI_BottomRightWindowTab == "Render";
    textButton_scenePropertiesTab["TextButtonSelected"] = TLSE_Development_GUI_BottomRightWindowTab == "SceneProperties";

    TLSE_Development_GUI_TabSceneHierarchyUpdate();
    TLSE_Development_GUI_TabInspectorUpdate();
    TLSE_Development_GUI_TabLightingUpdate();
    TLSE_Development_GUI_TabFogUpdate();
    TLSE_Development_GUI_TabRenderUpdate();
    TLSE_Development_GUI_TabScenePropertiesUpdate();
end