local I, C, L = select(2, ...):unpack()
local T, TC, _, _ = I:unpack()

local Miscellaneous = T["Miscellaneous"]
local Experience = Miscellaneous.Experience

function Experience:Create()
	for i = 1, self.NumBars do
		local XPBar = CreateFrame("StatusBar", nil, UIParent)
		local RestedBar = CreateFrame("StatusBar", nil, UIParent)

		XPBar:SetStatusBarTexture(TC.Medias.Normal)
		XPBar:EnableMouse()
		XPBar:SetFrameStrata("BACKGROUND")
		XPBar:SetFrameLevel(2)
		XPBar:CreateBackdrop()
		XPBar:SetScript("OnEnter", Experience.SetTooltip)
		XPBar:SetScript("OnLeave", HideTooltip)

		RestedBar:SetStatusBarTexture(TC.Medias.Normal)
		RestedBar:SetFrameStrata("BACKGROUND")
		RestedBar:SetStatusBarColor(unpack(self.RestedColor))
		RestedBar:SetAllPoints(XPBar)
		RestedBar:SetOrientation(TC.Chat.Background and "HORIZONTAL" or "Vertical")
		RestedBar:SetFrameLevel(XPBar:GetFrameLevel() - 1)
		RestedBar:SetAlpha(.5)

		if (TC.Chat.Background) then
			XPBar:Size(Panels.LeftChatBG:GetWidth() - 4, 6)
			XPBar:Point("BOTTOM", i == 1 and Panels.LeftChatBG or Panels.RightChatBG, "TOP", 0, 4)
			XPBar:SetReverseFill(i == 2 and true)
			RestedBar:SetReverseFill(i == 2 and true)
		else
			XPBar:SetOrientation("Vertical")
			XPBar:Size(6, 104)
			XPBar:SetPoint( i == 1 and "BOTTOMLEFT" or "BOTTOMRIGHT", UIParent, i == 1 and "BOTTOMLEFT" or "BOTTOMRIGHT", i == 1 and 27 or -27, 43)
		end

		self["XPBar"..i] = XPBar
		self["RestedBar"..i] = RestedBar
	end

	self:RegisterEvent("PLAYER_XP_UPDATE")
	self:RegisterEvent("PLAYER_LEVEL_UP")
	self:RegisterEvent("UPDATE_EXHAUSTION")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("PLAYER_UPDATE_RESTING")
	self:RegisterEvent("ARTIFACT_XP_UPDATE")
	self:RegisterEvent("UNIT_INVENTORY_CHANGED")
	self:RegisterEvent("HONOR_XP_UPDATE")
	self:RegisterEvent("HONOR_LEVEL_UPDATE")
	self:RegisterEvent("HONOR_PRESTIGE_UPDATE")

	self:SetScript("OnEvent", self.Update)
end
