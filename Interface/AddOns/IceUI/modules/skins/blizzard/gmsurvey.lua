local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	Skins:SetBD(GMSurveyFrame, 0, 0, -32, 4)
	Skins:CreateBD(GMSurveyCommentFrame, .25)
	for i = 1, 11 do
		Skins:CreateBD(_G["GMSurveyQuestion"..i], .25)
	end

	for i = 1, 11 do
		select(i, GMSurveyFrame:GetRegions()):Hide()
	end
	GMSurveyHeaderLeft:Hide()
	GMSurveyHeaderRight:Hide()
	GMSurveyHeaderCenter:Hide()
	GMSurveyScrollFrameTop:SetAlpha(0)
	GMSurveyScrollFrameMiddle:SetAlpha(0)
	GMSurveyScrollFrameBottom:SetAlpha(0)
	Skins:Reskin(GMSurveySubmitButton)
	Skins:Reskin(GMSurveyCancelButton)
	Skins:ReskinClose(GMSurveyCloseButton, "TOPRIGHT", GMSurveyFrame, "TOPRIGHT", -36, -4)
	Skins:ReskinScroll(GMSurveyScrollFrameScrollBar)
end

Skins:RegisterSkin("Blizzard_GMSurveyUI", LoadSkin)