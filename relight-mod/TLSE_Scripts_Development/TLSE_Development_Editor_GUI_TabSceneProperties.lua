TLSE_TabSceneProperties_CurrentTab = "";
TLSE_Development_GUI_ScenePropertiesTabActive = false;

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

TLSE_TabSceneProperties_Tab1_Active = false;
TLSE_TabSceneProperties_Tab2_Active = false;
TLSE_TabSceneProperties_Tab3_Active = false;
TLSE_TabSceneProperties_Tab4_Active = false;
TLSE_TabSceneProperties_Tab5_Active = false;
TLSE_TabSceneProperties_Tab6_Active = false;
TLSE_TabSceneProperties_Tab7_Active = false;
TLSE_TabSceneProperties_Tab8_Active = false;
TLSE_TabSceneProperties_Tab9_Active = false;
TLSE_TabSceneProperties_Tab10_Active = false;
TLSE_TabSceneProperties_Tab11_Active = false;
TLSE_TabSceneProperties_Tab12_Active = false;
TLSE_TabSceneProperties_Tab13_Active = false;
TLSE_TabSceneProperties_Tab14_Active = false;
TLSE_TabSceneProperties_Tab15_Active = false;
TLSE_TabSceneProperties_Tab16_Active = false;
TLSE_TabSceneProperties_Tab17_Active = false;
TLSE_TabSceneProperties_Tab18_Active = false;
TLSE_TabSceneProperties_Tab19_Active = false;
TLSE_TabSceneProperties_Tab20_Active = false;
TLSE_TabSceneProperties_Tab21_Active = false;
TLSE_TabSceneProperties_Tab22_Active = false;

TLSE_TabSceneProperties_OnClick_Tab1 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab1"; end
TLSE_TabSceneProperties_OnClick_Tab2 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab2"; end
TLSE_TabSceneProperties_OnClick_Tab3 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab3"; end
TLSE_TabSceneProperties_OnClick_Tab4 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab4"; end
TLSE_TabSceneProperties_OnClick_Tab5 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab5"; end
TLSE_TabSceneProperties_OnClick_Tab6 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab6"; end
TLSE_TabSceneProperties_OnClick_Tab7 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab7"; end
TLSE_TabSceneProperties_OnClick_Tab8 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab8"; end
TLSE_TabSceneProperties_OnClick_Tab9 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab9"; end
TLSE_TabSceneProperties_OnClick_Tab10 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab10"; end
TLSE_TabSceneProperties_OnClick_Tab11 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab11"; end
TLSE_TabSceneProperties_OnClick_Tab12 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab12"; end
TLSE_TabSceneProperties_OnClick_Tab13 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab13"; end
TLSE_TabSceneProperties_OnClick_Tab14 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab14"; end
TLSE_TabSceneProperties_OnClick_Tab15 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab15"; end
TLSE_TabSceneProperties_OnClick_Tab16 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab16"; end
TLSE_TabSceneProperties_OnClick_Tab17 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab17"; end
TLSE_TabSceneProperties_OnClick_Tab18 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab18"; end
TLSE_TabSceneProperties_OnClick_Tab19 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab19"; end
TLSE_TabSceneProperties_OnClick_Tab20 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab20"; end
TLSE_TabSceneProperties_OnClick_Tab21 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab21"; end
TLSE_TabSceneProperties_OnClick_Tab22 = function(textButton_button) TLSE_TabSceneProperties_CurrentTab = "Tab22"; end

TLSE_Development_GUI_TabScenePropertiesInitalize = function()
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

    TLSE_Development_GUI_TabSceneProperties_Tab1Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab2Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab3Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab4Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab5Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab6Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab7Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab8Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab9Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab10Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab11Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab12Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab13Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab14Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab15Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab16Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab17Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab18Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab19Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab20Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab21Initalize();
    TLSE_Development_GUI_TabSceneProperties_Tab22Initalize();
end

TLSE_Development_GUI_TabScenePropertiesUpdate = function()
    TLSE_TabSceneProperties_Tab1_Active = TLSE_TabSceneProperties_CurrentTab == "Tab1" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab2_Active = TLSE_TabSceneProperties_CurrentTab == "Tab2" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab3_Active = TLSE_TabSceneProperties_CurrentTab == "Tab3" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab4_Active = TLSE_TabSceneProperties_CurrentTab == "Tab4" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab5_Active = TLSE_TabSceneProperties_CurrentTab == "Tab5" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab6_Active = TLSE_TabSceneProperties_CurrentTab == "Tab6" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab7_Active = TLSE_TabSceneProperties_CurrentTab == "Tab7" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab8_Active = TLSE_TabSceneProperties_CurrentTab == "Tab8" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab9_Active = TLSE_TabSceneProperties_CurrentTab == "Tab9" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab10_Active = TLSE_TabSceneProperties_CurrentTab == "Tab10" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab11_Active = TLSE_TabSceneProperties_CurrentTab == "Tab11" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab12_Active = TLSE_TabSceneProperties_CurrentTab == "Tab12" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab13_Active = TLSE_TabSceneProperties_CurrentTab == "Tab13" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab14_Active = TLSE_TabSceneProperties_CurrentTab == "Tab14" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab15_Active = TLSE_TabSceneProperties_CurrentTab == "Tab15" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab16_Active = TLSE_TabSceneProperties_CurrentTab == "Tab16" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab17_Active = TLSE_TabSceneProperties_CurrentTab == "Tab17" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab18_Active = TLSE_TabSceneProperties_CurrentTab == "Tab18" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab19_Active = TLSE_TabSceneProperties_CurrentTab == "Tab19" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab20_Active = TLSE_TabSceneProperties_CurrentTab == "Tab20" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab21_Active = TLSE_TabSceneProperties_CurrentTab == "Tab21" and TLSE_Development_GUI_ScenePropertiesTabActive;
    TLSE_TabSceneProperties_Tab22_Active = TLSE_TabSceneProperties_CurrentTab == "Tab22" and TLSE_Development_GUI_ScenePropertiesTabActive;

    textButton_tab1["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab2["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab3["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab4["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab5["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab6["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab7["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab8["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab9["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab10["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab11["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab12["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab13["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab14["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab15["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab16["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab17["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab18["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab19["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab20["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab21["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;
    textButton_tab22["Visible"] = TLSE_Development_GUI_ScenePropertiesTabActive;

    textButton_tab1["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab1";
    textButton_tab2["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab2";
    textButton_tab3["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab3";
    textButton_tab4["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab4";
    textButton_tab5["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab5";
    textButton_tab6["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab6";
    textButton_tab7["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab7";
    textButton_tab8["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab8";
    textButton_tab9["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab9";
    textButton_tab10["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab10";
    textButton_tab11["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab11";
    textButton_tab12["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab12";
    textButton_tab13["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab13";
    textButton_tab14["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab14";
    textButton_tab15["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab15";
    textButton_tab16["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab16";
    textButton_tab17["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab17";
    textButton_tab18["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab18";
    textButton_tab19["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab19";
    textButton_tab20["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab20";
    textButton_tab21["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab21";
    textButton_tab22["Selected"] = TLSE_TabSceneProperties_CurrentTab == "Tab22";

    TLSE_Development_GUI_TabSceneProperties_Tab1Update();
    TLSE_Development_GUI_TabSceneProperties_Tab2Update();
    TLSE_Development_GUI_TabSceneProperties_Tab3Update();
    TLSE_Development_GUI_TabSceneProperties_Tab4Update();
    TLSE_Development_GUI_TabSceneProperties_Tab5Update();
    TLSE_Development_GUI_TabSceneProperties_Tab6Update();
    TLSE_Development_GUI_TabSceneProperties_Tab7Update();
    TLSE_Development_GUI_TabSceneProperties_Tab8Update();
    TLSE_Development_GUI_TabSceneProperties_Tab9Update();
    TLSE_Development_GUI_TabSceneProperties_Tab10Update();
    TLSE_Development_GUI_TabSceneProperties_Tab11Update();
    TLSE_Development_GUI_TabSceneProperties_Tab12Update();
    TLSE_Development_GUI_TabSceneProperties_Tab13Update();
    TLSE_Development_GUI_TabSceneProperties_Tab14Update();
    TLSE_Development_GUI_TabSceneProperties_Tab15Update();
    TLSE_Development_GUI_TabSceneProperties_Tab16Update();
    TLSE_Development_GUI_TabSceneProperties_Tab17Update();
    TLSE_Development_GUI_TabSceneProperties_Tab18Update();
    TLSE_Development_GUI_TabSceneProperties_Tab19Update();
    TLSE_Development_GUI_TabSceneProperties_Tab20Update();
    TLSE_Development_GUI_TabSceneProperties_Tab21Update();
    TLSE_Development_GUI_TabSceneProperties_Tab22Update();

    if(TLSE_Development_GUI_ScenePropertiesTabActive == false) then
        return
    end

    local vector_startScreenPosition = textButton_tab1["ScreenPosition"];
    local vector_screenSizeTab1 = TLSE_TextUI_GetTextScreenSize(textButton_tab1["TextAgent"]);
    local vector_screenSizeTab2 = TLSE_TextUI_GetTextScreenSize(textButton_tab2["TextAgent"]);
    local vector_screenSizeTab3 = TLSE_TextUI_GetTextScreenSize(textButton_tab3["TextAgent"]);
    local vector_screenSizeTab4 = TLSE_TextUI_GetTextScreenSize(textButton_tab4["TextAgent"]);
    local vector_screenSizeTab5 = TLSE_TextUI_GetTextScreenSize(textButton_tab5["TextAgent"]);
    local vector_screenSizeTab6 = TLSE_TextUI_GetTextScreenSize(textButton_tab6["TextAgent"]);
    --local vector_screenSizeTab7 = TLSE_TextUI_GetTextScreenSize(textButton_tab7["TextAgent"]);
    local vector_screenSizeTab8 = TLSE_TextUI_GetTextScreenSize(textButton_tab8["TextAgent"]);
    local vector_screenSizeTab9 = TLSE_TextUI_GetTextScreenSize(textButton_tab9["TextAgent"]);
    local vector_screenSizeTab10 = TLSE_TextUI_GetTextScreenSize(textButton_tab10["TextAgent"]);
    local vector_screenSizeTab11 = TLSE_TextUI_GetTextScreenSize(textButton_tab11["TextAgent"]);
    --local vector_screenSizeTab12 = TLSE_TextUI_GetTextScreenSize(textButton_tab12["TextAgent"]);
    local vector_screenSizeTab13 = TLSE_TextUI_GetTextScreenSize(textButton_tab13["TextAgent"]);
    local vector_screenSizeTab14 = TLSE_TextUI_GetTextScreenSize(textButton_tab14["TextAgent"]);
    local vector_screenSizeTab15 = TLSE_TextUI_GetTextScreenSize(textButton_tab15["TextAgent"]);
    local vector_screenSizeTab16 = TLSE_TextUI_GetTextScreenSize(textButton_tab16["TextAgent"]);
    --local vector_screenSizeTab17 = TLSE_TextUI_GetTextScreenSize(textButton_tab17["TextAgent"]);
    local vector_screenSizeTab18 = TLSE_TextUI_GetTextScreenSize(textButton_tab18["TextAgent"]);
    local vector_screenSizeTab19 = TLSE_TextUI_GetTextScreenSize(textButton_tab19["TextAgent"]);
    local vector_screenSizeTab20 = TLSE_TextUI_GetTextScreenSize(textButton_tab20["TextAgent"]);
    local vector_screenSizeTab21 = TLSE_TextUI_GetTextScreenSize(textButton_tab21["TextAgent"]);
    --local vector_screenSizeTab22 = TLSE_TextUI_GetTextScreenSize(textButton_tab22["TextAgent"]);

    local number_horizontalOffset = 0.003;
    local number_verticalOffset = 0.015;
    local vector_guiOffset = Vector(0, 0, 0);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = 0;
    textButton_tab1["ScreenPosition"] = vector_startScreenPosition;

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab1.x * 2.0) + number_horizontalOffset;
    textButton_tab2["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab2.x * 2.0) + number_horizontalOffset;
    textButton_tab3["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab3.x * 2.0) + number_horizontalOffset;
    textButton_tab4["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab4.x * 2.0) + number_horizontalOffset;
    textButton_tab5["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab5.x * 2.0) + number_horizontalOffset;
    textButton_tab6["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab6.x * 2.0) + number_horizontalOffset;
    textButton_tab7["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = vector_guiOffset.y + number_verticalOffset;
    textButton_tab8["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab8.x * 2.0) + number_horizontalOffset;
    textButton_tab9["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab9.x * 2.0) + number_horizontalOffset;
    textButton_tab10["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab10.x * 2.0) + number_horizontalOffset;
    textButton_tab11["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab11.x * 2.0) + number_horizontalOffset;
    textButton_tab12["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = vector_guiOffset.y + number_verticalOffset;
    textButton_tab13["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab13.x * 2.0) + number_horizontalOffset;
    textButton_tab14["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab14.x * 2.0) + number_horizontalOffset;
    textButton_tab15["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab15.x * 2.0) + number_horizontalOffset;
    textButton_tab16["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab16.x * 2.0) + number_horizontalOffset;
    textButton_tab17["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = 0;
    vector_guiOffset.y = vector_guiOffset.y + number_verticalOffset;
    textButton_tab18["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab18.x * 2.0) + number_horizontalOffset;
    textButton_tab19["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab19.x * 2.0) + number_horizontalOffset;
    textButton_tab20["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab20.x * 2.0) + number_horizontalOffset;
    textButton_tab21["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);

    vector_guiOffset.x = vector_guiOffset.x + (vector_screenSizeTab21.x * 2.0) + number_horizontalOffset;
    textButton_tab22["ScreenPosition"] = VectorAdd(vector_guiOffset, vector_startScreenPosition);
end