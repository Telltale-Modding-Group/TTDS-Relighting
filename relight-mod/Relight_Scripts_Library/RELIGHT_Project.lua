RELIGHT_Project_SetProjectSettings = function()
    local prefs = GetPreferences();
    
    PropertySet(prefs, "Enable Graphic Black", false);
    PropertySet(prefs, "Render - Graphic Black Enabled", false);
    PropertySet(prefs, "Camera Lens Engine", false);
    PropertySet(prefs, "Legacy Light Limits", false);
    PropertySet(prefs, "Render - Feature Level", 1);
    PropertySet(prefs, "Use Legacy DOF", true);
    PropertySet(prefs, "Legacy Use Default Lighting Group", true);
    PropertySet(prefs, "Set Default Intensity", false);
end