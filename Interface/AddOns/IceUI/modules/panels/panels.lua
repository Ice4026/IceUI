local I, C, L = select(2, ...):unpack()
local T, TC, _, _ = I:unpack()
local Panels = T["Panels"]

function Panels:Enable()
    local Background = TC.Chat.Background

    local DataTextLeft = CreateFrame("Frame", "TukuiLeftDataTextBox", UIParent)
    DataTextLeft:Size(370, 22)
    DataTextLeft:SetPoint("BOTTOMLEFT", UIParent, 44, 19)
    DataTextLeft:SetTemplate()
    DataTextLeft:SetFrameStrata("BACKGROUND")
    DataTextLeft:SetFrameLevel(1)

    local DataTextRight = CreateFrame("Frame", "TukuiRightDataTextBox", UIParent)
    DataTextRight:Size(370, 22)
    DataTextRight:SetPoint("BOTTOMRIGHT", UIParent, -44, 19)
    DataTextRight:SetTemplate()
    DataTextRight:SetFrameStrata("BACKGROUND")
    DataTextRight:SetFrameLevel(1)

    local BottomLine1 = CreateFrame("Frame", nil, UIParent)
    BottomLine1:SetTemplate()
    BottomLine1:Size(1)
    BottomLine1:Point("BOTTOMLEFT", 30, 30)
    BottomLine1:SetPoint("RIGHT", DataTextLeft, "LEFT")
    BottomLine1:SetFrameStrata("BACKGROUND")
    BottomLine1:SetFrameLevel(0)

    local BottomLine2 = CreateFrame("Frame", nil, UIParent)
    BottomLine2:SetTemplate()
    BottomLine2:Size(1)
    BottomLine2:SetPoint("LEFT", DataTextLeft, "RIGHT")
    BottomLine2:SetPoint("RIGHT", Panels.ActionBar2, "LEFT")
    BottomLine2:SetFrameStrata("BACKGROUND")
    BottomLine2:SetFrameLevel(0)

    local BottomLine3 = CreateFrame("Frame", nil, UIParent)
    BottomLine3:SetTemplate()
    BottomLine3:Size(1)
    BottomLine3:SetPoint("BOTTOMLEFT", Panels.ActionBar2, "BOTTOMRIGHT", 0, 15)
    BottomLine3:SetPoint("BOTTOMRIGHT", Panels.ActionBar1, "BOTTOMLEFT", 0, 15)
    BottomLine3:SetFrameStrata("BACKGROUND")
    BottomLine3:SetFrameLevel(0)

    local BottomLine4 = CreateFrame("Frame", nil, UIParent)
    BottomLine4:SetTemplate()
    BottomLine4:Size(1)
    BottomLine4:SetPoint("BOTTOMLEFT", Panels.ActionBar1, "BOTTOMRIGHT", 0, 15)
    BottomLine4:SetPoint("BOTTOMRIGHT", Panels.ActionBar3, "BOTTOMLEFT", 0, 15)
    BottomLine4:SetFrameStrata("BACKGROUND")
    BottomLine4:SetFrameLevel(0)

    local BottomLine5 = CreateFrame("Frame", nil, UIParent)
    BottomLine5:SetTemplate()
    BottomLine5:Size(1)
    BottomLine5:SetPoint("BOTTOMLEFT", Panels.ActionBar3, "BOTTOMRIGHT", 0, 15)
    BottomLine5:SetPoint("RIGHT", DataTextRight, "LEFT")
    BottomLine5:SetFrameStrata("BACKGROUND")
    BottomLine5:SetFrameLevel(0)

    local BottomLine6 = CreateFrame("Frame", nil, UIParent)
    BottomLine6:SetTemplate()
    BottomLine6:Size(1)
    BottomLine6:SetPoint("LEFT", DataTextRight, "RIGHT")
    BottomLine6:Point("BOTTOMRIGHT", -30, 30)
    BottomLine6:SetFrameStrata("BACKGROUND")
    BottomLine6:SetFrameLevel(0)

    local LeftVerticalLine1 = CreateFrame("Frame", nil, UIParent)
    LeftVerticalLine1:SetTemplate()
    LeftVerticalLine1:Size(2, 13)
    LeftVerticalLine1:SetPoint("BOTTOM", BottomLine1, "LEFT")
    LeftVerticalLine1:SetFrameLevel(0)
    LeftVerticalLine1:SetFrameStrata("BACKGROUND")
    LeftVerticalLine1:SetAlpha(Background and 0 or 1)

    local LeftVerticalLine2 = CreateFrame("Frame", nil, UIParent)
    LeftVerticalLine2:SetTemplate()
    LeftVerticalLine2:Size(2, 13)
    LeftVerticalLine2:SetPoint("BOTTOM", LeftVerticalLine1, "TOP", 0, 104)
    LeftVerticalLine2:SetFrameLevel(0)
    LeftVerticalLine2:SetFrameStrata("BACKGROUND")
    LeftVerticalLine2:SetAlpha(Background and 0 or 1)

    local RightVerticalLine1 = CreateFrame("Frame", nil, UIParent)
    RightVerticalLine1:SetTemplate()
    RightVerticalLine1:Size(2, 13)
    RightVerticalLine1:SetPoint("BOTTOM", BottomLine6, "RIGHT")
    RightVerticalLine1:SetFrameLevel(0)
    RightVerticalLine1:SetFrameStrata("BACKGROUND")
    RightVerticalLine1:SetAlpha(Background and 0 or 1)

    local RightVerticalLine2 = CreateFrame("Frame", nil, UIParent)
    RightVerticalLine2:SetTemplate()
    RightVerticalLine2:Size(2, 13)
    RightVerticalLine2:SetPoint("BOTTOM", RightVerticalLine1, "TOP", 0, 104)
    RightVerticalLine2:SetFrameLevel(0)
    RightVerticalLine2:SetFrameStrata("BACKGROUND")
    RightVerticalLine2:SetAlpha(Background and 0 or 1)

    if (not Background) then
        local CubeLeft = CreateFrame("Frame", nil, LeftVerticalLine2)
        CubeLeft:SetTemplate()
        CubeLeft:Size(10)
        CubeLeft:Point("BOTTOM", LeftVerticalLine2, "TOP", 0, 0)
        CubeLeft:EnableMouse(true)
        CubeLeft:SetFrameLevel(0)

        local CubeRight = CreateFrame("Frame", nil, RightVerticalLine2)
        CubeRight:SetTemplate()
        CubeRight:Size(10)
        CubeRight:Point("BOTTOM", RightVerticalLine2, "TOP", 0, 0)
        CubeRight:EnableMouse(true)
        CubeRight:SetFrameLevel(0)

        self.CubeLeft = CubeLeft
        self.CubeRight = CubeRight
    end

    if Background then
        BottomLine:SetAlpha(0)

        local LeftChatBG = CreateFrame("Frame", nil, DataTextLeft)
        LeftChatBG:SetTemplate("Transparent")
        LeftChatBG:Size(370 + 12, 177)
        LeftChatBG:Point("BOTTOM", DataTextLeft, "BOTTOM", 0, -6)
        LeftChatBG:SetFrameLevel(1)
        LeftChatBG:SetFrameStrata("BACKGROUND")

        local RightChatBG = CreateFrame("Frame", nil, DataTextRight)
        RightChatBG:SetTemplate("Transparent")
        RightChatBG:Size(370 + 12, 177)
        RightChatBG:Point("BOTTOM", DataTextRight, "BOTTOM", 0, -6)
        RightChatBG:SetFrameLevel(1)
        RightChatBG:SetFrameStrata("BACKGROUND")

        local TabsBGLeft = CreateFrame("Frame", nil, LeftChatBG)
        TabsBGLeft:SetTemplate()
        TabsBGLeft:Size(370, 23)
        TabsBGLeft:Point("TOP", LeftChatBG, "TOP", 0, -6)
        TabsBGLeft:SetFrameLevel(2)

        local TabsBGRight = CreateFrame("Frame", nil, RightChatBG)
        TabsBGRight:SetTemplate()
        TabsBGRight:Size(370, 23)
        TabsBGRight:Point("TOP", RightChatBG, "TOP", 0, -6)
        TabsBGRight:SetFrameLevel(2)

        self.LeftChatBG = LeftChatBG
        self.RightChatBG = RightChatBG
        self.TabsBGLeft = TabsBGLeft
        self.TabsBGRight = TabsBGRight
    end

    local PetBattleHider = CreateFrame("Frame", nil, UIParent, "SecureHandlerStateTemplate")
    PetBattleHider:SetAllPoints()
    PetBattleHider:SetFrameStrata("LOW")
    RegisterStateDriver(PetBattleHider, "visibility", "[petbattle] hide; show")

    self.BottomLine1 = BottomLine1
    self.BottomLine2 = BottomLine2
    self.BottomLine3 = BottomLine3
    self.BottomLine4 = BottomLine4
    self.BottomLine5 = BottomLine5
    self.BottomLine6 = BottomLine6
    self.LeftVerticalLine1 = LeftVerticalLine1
    self.LeftVerticalLine2 = LeftVerticalLine2
    self.RightVerticalLine1 = RightVerticalLine1
    self.RightVerticalLine2 = RightVerticalLine2
    self.DataTextLeft = DataTextLeft
    self.DataTextRight = DataTextRight
    self.PetBattleHider = PetBattleHider
end
