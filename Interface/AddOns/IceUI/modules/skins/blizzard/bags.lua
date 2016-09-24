local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	local r, g, b = Skins["media"].classcolours[I.MyClass].r, Skins["media"].classcolours[I.MyClass].g, Skins["media"].classcolours[I.MyClass].b
	Skins:ReskinCheck(TokenFramePopupInactiveCheckBox)
	Skins:ReskinCheck(TokenFramePopupBackpackCheckBox)
	Skins:ReskinClose(TokenFramePopupCloseButton)
	Skins:ReskinScroll(TokenFrameContainerScrollBar)
	TokenFramePopupCorner:Hide()
	TokenFramePopup:SetPoint("TOPLEFT", TokenFrame, "TOPRIGHT", 1, -28)
	local function updateButtons()
		local buttons = TokenFrameContainer.buttons
		for i = 1, #buttons do

			local button = buttons[i]

			if button and not button.reskinned then
				button.highlight:SetPoint("TOPLEFT", 1, 0)
				button.highlight:SetPoint("BOTTOMRIGHT", -1, 0)
				button.highlight.SetPoint = R.dummy
				button.highlight:SetColorTexture(r, g, b, .2)
				button.highlight.SetTexture = R.dummy
				button.categoryMiddle:SetAlpha(0)
				button.categoryLeft:SetAlpha(0)
				button.categoryRight:SetAlpha(0)

				button.icon:SetTexCoord(.08, .92, .08, .92)
				button.bg = Skins:CreateBG(button.icon)
				button.reskinned = true
			end

			if button.isHeader then
				button.bg:Hide()
			else
				button.bg:Show()
			end
		end
	end
	TokenFrame:HookScript("OnShow", updateButtons)
	hooksecurefunc(TokenFrameContainer, "update", updateButtons)
end

Skins:RegisterSkin("RayUI", LoadSkin)