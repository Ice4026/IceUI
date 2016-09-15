local I, C, L = select(2, ...):unpack()
local T, TC, _, _ = I:unpack()
local Miscellaneous = T["Miscellaneous"]
local Reputation = Miscellaneous.Reputation
local Experience = Miscellaneous.Experience

function Reputation:Create()
	for i = 1, self.NumBars do
		local RepBar = CreateFrame("StatusBar", nil, UIParent)

		RepBar:SetStatusBarTexture(TC.Medias.Normal)
		RepBar:EnableMouse()
		RepBar:SetFrameStrata("BACKGROUND")
		RepBar:SetFrameLevel(3)
		RepBar:CreateBackdrop()
		RepBar:SetScript("OnEnter", Reputation.SetTooltip)
		RepBar:SetScript("OnLeave", HideTooltip)

		if (TC.Chat.Background) then
			RepBar:Size(Panels.LeftChatBG:GetWidth() - 4, 6)
			RepBar:Point("BOTTOM", i == 1 and Panels.LeftChatBG or Panels.RightChatBG, "TOP", 0, 4)
			RepBar:SetReverseFill(i == 2 and true)
		else
			RepBar:SetOrientation("Vertical")
			RepBar:Size(6, 104)
			RepBar:SetPoint( i == 1 and "BOTTOMLEFT" or "BOTTOMRIGHT", UIParent, i == 1 and "BOTTOMLEFT" or "BOTTOMRIGHT", i == 1 and 27 or -27, 43)
		end

		self["RepBar"..i] = RepBar
	end

	self:RegisterEvent("UPDATE_FACTION")
	self:RegisterEvent("PLAYER_ENTERING_WORLD")

	self:SetScript("OnEvent", self.Update)
end

function Reputation:Enable()
	Experience:Disable()
	if not self.IsCreated then
		self:Create()

		self.IsCreated = true
	end

	for i = 1, self.NumBars do
		if not self["RepBar"..i]:IsShown() then
			self["RepBar"..i]:Show()
		end
	end
end

function Reputation:Disable()
	Experience:Enable()
	for i = 1, self.NumBars do
		if self["RepBar"..i]:IsShown() then
			self["RepBar"..i]:Hide()
		end
	end
end
