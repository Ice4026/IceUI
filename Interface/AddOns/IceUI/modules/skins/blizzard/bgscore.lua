local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	Skins:SetBD(WorldStateScoreFrame)
	Skins:ReskinScroll(WorldStateScoreScrollFrameScrollBar)
	WorldStateScoreFrame:DisableDrawLayer("BACKGROUND")
	WorldStateScoreFrameInset:DisableDrawLayer("BACKGROUND")
	WorldStateScoreFrame:DisableDrawLayer("BORDER")
	WorldStateScoreFrameInset:DisableDrawLayer("BORDER")
	WorldStateScoreFrameTopLeftCorner:Hide()
	WorldStateScoreFrameTopBorder:Hide()
	WorldStateScoreFrameTopRightCorner:Hide()
	select(2, WorldStateScoreScrollFrame:GetRegions()):Hide()
	select(3, WorldStateScoreScrollFrame:GetRegions()):Hide()
	WorldStateScoreFrameTab2:SetPoint("LEFT", WorldStateScoreFrameTab1, "RIGHT", -15, 0)
	WorldStateScoreFrameTab3:SetPoint("LEFT", WorldStateScoreFrameTab2, "RIGHT", -15, 0)
	for i = 1, 3 do
		Skins:CreateTab(_G["WorldStateScoreFrameTab"..i])
	end
	Skins:Reskin(WorldStateScoreFrameLeaveButton)
	Skins:ReskinClose(WorldStateScoreFrameCloseButton)
end

Skins:RegisterSkin("RayUI", LoadSkin)