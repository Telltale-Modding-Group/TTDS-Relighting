--'horizontalAlign': 1 = left alignment, 2 = center alignment, 3 = right alignment

TLSE_TextUI_CreateTextAgent = function(string_agentName, string_text, vector_position, number_horizontalAlign, number_verticalAlign)
    --NOTE: Discovered that in certain setups in games/seasons/episodes that there would usually be a multi-scene setup.
    --Depending on how it was configured the text agents would end up being created in the wrong scene and they would just not show up.
    local agent_text = AgentCreate(string_agentName, "ui_text.prop", Vector(0,0,0), Vector(0,0,0), TLSE_Development_SceneObject, false, false);

    if number_horizontalAlign then
        TextSetHorizAlign(agent_text, number_horizontalAlign);
    end
    
    if number_verticalAlign then
        TextSetVertAlign(agent_text, number_verticalAlign);
    end
    
    TextSet(agent_text, string_text);
    
    AgentSetProperty(agent_text, "Text Render Layer", 99);
    AgentSetProperty(agent_text, "Text Render After Post-Effects", true);
    AgentSetProperty(agent_text, "Runtime: Visible", true);

    return agent_text;
end

--extents min (bottom left corner)
--extents max (top right corner)
TLSE_TextUI_IsCursorOverBounds = function(vector_originPosition, vector_extentsMin, vector_extentsMax)
    local vector_cursorPos = CursorGetPos();

    local vector_offsetExtentsMin = VectorAdd(vector_originPosition, vector_extentsMin);
    local vector_offsetExtentsMax = VectorAdd(vector_originPosition, vector_extentsMax);
    
    local case1 = vector_cursorPos.x >= vector_offsetExtentsMin.x;
    local case2 = vector_cursorPos.y >= vector_offsetExtentsMin.y;
    local case3 = vector_cursorPos.y <= vector_offsetExtentsMax.y;
    local case4 = vector_cursorPos.x <= vector_offsetExtentsMax.x;
    
    local finalCase = case1 and case2 and case3 and case4;
    
    return finalCase;
end

TLSE_TextUI_TextAgentContains = function(agent_text, vector_screenPosition)
    local vector2_extentsMin, vector2_extentsMax = TextGetExtents(agent_text);
    local vector2_textReferenceScreenSize = AgentGetProperty(agent_text, "Text Reference Screen Size");
    local vector_textScreenOriginPosition = AgentGetScreenPos(agent_text);

    --local number_textExtentsMinNormalizedX = vector2_extentsMin.x / vector2_textReferenceScreenSize.x;
    local number_textExtentsMinNormalizedY = vector2_extentsMin.y / vector2_textReferenceScreenSize.y;
    local number_textExtentsMaxNormalizedX = vector2_extentsMax.x / vector2_textReferenceScreenSize.x;
    --local number_textExtentsMaxNormalizedY = vector2_extentsMax.y / vector2_textReferenceScreenSize.y;

    local vector_textExtentsMinNormalized = Vector(0, 0, 0);
    local vector_textExtentsMaxNormalized = Vector(number_textExtentsMaxNormalizedX, -number_textExtentsMinNormalizedY, 0);

    local vector_textMinScreenBounds = VectorAdd(vector_textExtentsMinNormalized, vector_textScreenOriginPosition);
    local vector_textMaxScreenBounds = VectorAdd(vector_textExtentsMaxNormalized, vector_textScreenOriginPosition);

    local case1 = vector_screenPosition.x >= vector_textMinScreenBounds.x;
    local case2 = vector_screenPosition.y >= vector_textMinScreenBounds.y;
    local case3 = vector_screenPosition.y <= vector_textMaxScreenBounds.y;
    local case4 = vector_screenPosition.x <= vector_textMaxScreenBounds.x;
    
    local finalCase = case1 and case2 and case3 and case4;
    
    return finalCase;
end

TLSE_TextUI_GetTextScreenSize = function(agent_text)
    local vector2_extentsMin, vector2_extentsMax = TextGetExtents(agent_text);
    local vector2_textReferenceScreenSize = AgentGetProperty(agent_text, "Text Reference Screen Size");

    --local number_textExtentsMinNormalizedX = vector2_extentsMin.x / vector2_textReferenceScreenSize.x;
    local number_textExtentsMinNormalizedY = vector2_extentsMin.y / vector2_textReferenceScreenSize.y;
    local number_textExtentsMaxNormalizedX = vector2_extentsMax.x / vector2_textReferenceScreenSize.x;
    --local number_textExtentsMaxNormalizedY = vector2_extentsMax.y / vector2_textReferenceScreenSize.y;

    local vector_textScreenSize = Vector(0, 0, 0);

    vector_textScreenSize.x = math.abs(number_textExtentsMaxNormalizedX * 0.5);
    vector_textScreenSize.y = math.abs(number_textExtentsMinNormalizedY * 0.5);

    return vector_textScreenSize;
end

TLSE_TextUI_IsCursorOverTextAgent = function(agent_text)
    return TLSE_TextUI_TextAgentContains(agent_text, CursorGetPos());
end