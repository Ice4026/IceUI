local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
    LootHistoryFrame:SetSize(230, 370)
	for i = 1, 9 do
		select(i, LootHistoryFrame:GetRegions()):Hide()
	end
	LootHistoryFrameScrollFrame:GetRegions():Hide()

	LootHistoryFrame.ResizeButton:SetPoint("TOP", LootHistoryFrame, "BOTTOM", 0, -1)
	LootHistoryFrame.ResizeButton:SetFrameStrata("LOW")

	Skins:ReskinArrow(LootHistoryFrame.ResizeButton, "down")
	LootHistoryFrame.ResizeButton:SetSize(32, 12)

	Skins:CreateBD(LootHistoryFrame)
	Skins:CreateSD(LootHistoryFrame)

	Skins:ReskinClose(LootHistoryFrame.CloseButton)
	Skins:ReskinScroll(LootHistoryFrameScrollFrameScrollBar)

    local function SkinLootHistory(self, frame)
        local rollID, _, _, isDone, winnerIdx = C_LootHistory.GetItem(frame.itemIdx)
        local expanded = self.expandedRolls[rollID]

        if not frame.reskinned then
            frame.Divider:Hide()
            frame.NameBorderLeft:Hide()
            frame.NameBorderRight:Hide()
            frame.NameBorderMid:Hide()
            frame.IconBorder:Hide()

            frame.Icon:SetTexCoord(.08, .92, .08, .92)
            frame.Icon:SetDrawLayer("ARTWORK")
            Skins:CreateBG(frame.Icon)
            frame.reskinned = true
        end

        frame.ToggleButton:GetNormalTexture():SetAlpha(0)
        frame.ToggleButton:GetPushedTexture():SetAlpha(0)
        frame.ToggleButton:GetDisabledTexture():SetAlpha(0)

        frame.reskinned = true
    end

	hooksecurefunc("LootHistoryFrame_UpdateItemFrame", SkinLootHistory)

    for i = 1, C_LootHistory.GetNumItems() do
        local frame = LootHistoryFrame.itemFrames[i]
        SkinLootHistory(LootHistoryFrame, frame)
    end
end

Skins:RegisterSkin("RayUI", LoadSkin)
