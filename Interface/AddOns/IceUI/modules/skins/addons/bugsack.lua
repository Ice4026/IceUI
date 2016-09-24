local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local skinned = false
local function SkinBugSack()
	if not IsAddOnLoaded("BugSack") or not BugSack then return end

	hooksecurefunc(BugSack, "OpenSack", function()
		if skinned then return end
		BugSackFrame:StripTextures()
		Skins:SetBD(BugSackFrame)
		Skins:Reskin(BugSackPrevButton)
		Skins:Reskin(BugSackNextButton)
		Skins:Reskin(BugSackSendButton)
		BugSackSendButton:SetPoint("LEFT", BugSackPrevButton, "RIGHT", 5, 0)
		BugSackSendButton:SetPoint("RIGHT", BugSackNextButton, "LEFT", -5, 0)
		Skins:ReskinScroll(BugSackScrollScrollBar)
		local BugSackFrameCloseButton = select(1, BugSackFrame:GetChildren())
		Skins:ReskinClose(BugSackFrameCloseButton)
		BugSackTabAll:ClearAllPoints()
		BugSackTabAll:SetPoint("TOPLEFT", BugSackFrame, "BOTTOMLEFT", 0, 1)
		Skins:CreateTab(BugSackTabAll)
		Skins:CreateTab(BugSackTabSession)
		Skins:CreateTab(BugSackTabLast)
		skinned = true
	end)
end

Skins:RegisterSkin("BugSack", SkinBugSack)