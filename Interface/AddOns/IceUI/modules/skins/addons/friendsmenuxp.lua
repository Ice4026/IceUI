local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function SkinFriendsMenuXP()
	if FriendsMenuXPSecure then
		FriendsMenuXPSecureMenuBackdrop:StripTextures()
        Skins:CreateBD(FriendsMenuXPSecureMenuBackdrop)
		Skins:CreateStripesThin(FriendsMenuXPSecureMenuBackdrop)
	end
	if FriendsMenuXP then
		FriendsMenuXPMenuBackdrop:StripTextures()
        Skins:CreateBD(FriendsMenuXPMenuBackdrop)
		Skins:CreateStripesThin(FriendsMenuXPMenuBackdrop)
	end
end

Skins:RegisterSkin("RayUI", SkinFriendsMenuXP)
