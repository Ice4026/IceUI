local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function SkinExtraCD()
	local ExtraCD = ExtraCD

	hooksecurefunc(ExtraCD, "CreateIcon", function(self, order, bar)
		local btn = bar[order]

		local backdrop = btn:GetBackdrop()
		local icon = backdrop.bgFile

		if not btn.icon then
			btn.icon = btn:CreateTexture(nil, "BORDER")
			btn.icon:SetAllPoints()
			btn.icon:SetTexCoord(.08, .92, .08, .92)
		end
		btn.icon:SetTexture(icon)
		btn:SetBackdrop(nil)
		btn:CreateShadow("Background")
		btn:StyleButton(true)
	end)
end

Skins:RegisterSkin("ExtraCD", SkinExtraCD)