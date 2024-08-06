local numberProperty_nearPlane = nil;
local numberProperty_farPlane = nil;

TLSE_Development_GUI_TabEditorInitalize = function()
    numberProperty_nearPlane = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Clip Plane - Near", Vector(0.685, 0.515, 0.0), true, nil, nil);
    numberProperty_farPlane = TLSE_Development_Editor_GUI_CreateNumberPropertyField(nil, "Clip Plane - Far", Vector(0.685, 0.525, 0.0), true, nil, nil);
end

TLSE_Development_GUI_TabEditorUpdate = function()
    numberProperty_nearPlane["Visible"] = TLSE_Development_GUI_EditorTabActive;
    numberProperty_farPlane["Visible"] = TLSE_Development_GUI_EditorTabActive;

    if(TLSE_Development_GUI_EditorTabActive == false) then
        return
    end

    local agent_sceneCamera = SceneGetCamera(TLSE_Development_SceneObject);

    numberProperty_nearPlane["ReferenceAgent"] = agent_sceneCamera;
    numberProperty_farPlane["ReferenceAgent"] = agent_sceneCamera;
end