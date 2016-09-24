local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	Skins:Reskin(RaidFrameRaidInfoButton)
	Skins:Reskin(RaidFrameConvertToRaidButton)
	Skins:Reskin(RaidInfoExtendButton)
	Skins:Reskin(RaidInfoCancelButton)
	Skins:ReskinClose(RaidInfoCloseButton)
	Skins:ReskinScroll(RaidInfoScrollFrameScrollBar)
	Skins:ReskinCheck(RaidFrameAllAssistCheckButton)
	RaidInfoInstanceLabel:DisableDrawLayer("BACKGROUND")
	RaidInfoIDLabel:DisableDrawLayer("BACKGROUND")
	RaidInfoDetailFooter:Hide()
	RaidInfoDetailHeader:Hide()
	RaidInfoDetailCorner:Hide()
	RaidInfoFrameHeader:Hide()
	RaidInfoFrame:SetPoint("TOPLEFT", RaidFrame, "TOPRIGHT", 1, -28)
end

Skins:RegisterSkin("RayUI", LoadSkin)