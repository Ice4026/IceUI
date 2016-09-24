local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	BarberShopFrame:GetRegions():Hide()
	BarberShopFrameMoneyFrame:GetRegions():Hide()
	BarberShopAltFormFrameBackground:Hide()
	BarberShopAltFormFrameBorder:Hide()

	BarberShopAltFormFrame:ClearAllPoints()
	BarberShopAltFormFrame:SetPoint("BOTTOM", BarberShopFrame, "TOP", 0, -74)

	Skins:SetBD(BarberShopFrame, 44, -75, -40, 44)
	Skins:SetBD(BarberShopAltFormFrame, 0, 0, 2, -2)

	Skins:Reskin(BarberShopFrameOkayButton)
	Skins:Reskin(BarberShopFrameCancelButton)
	Skins:Reskin(BarberShopFrameResetButton)

	for i = 1, 5 do
		Skins:ReskinArrow(_G["BarberShopFrameSelector"..i.."Prev"], "left")
		Skins:ReskinArrow(_G["BarberShopFrameSelector"..i.."Next"], "right")
	end

	-- [[ Banner frame ]]

	BarberShopBannerFrameBGTexture:Hide()

	Skins:SetBD(BarberShopBannerFrame, 25, -80, -20, 75)
end

Skins:RegisterSkin("Blizzard_BarbershopUI", LoadSkin)