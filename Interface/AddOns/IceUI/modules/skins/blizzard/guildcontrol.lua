local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	Skins:CreateBD(GuildControlUI)
	Skins:CreateSD(GuildControlUI)
	Skins:CreateBD(GuildControlUIRankBankFrameInset, .25)

	for i = 1, 9 do
		select(i, GuildControlUI:GetRegions()):Hide()
	end

	for i = 1, 8 do
		select(i, GuildControlUIRankBankFrameInset:GetRegions()):Hide()
	end

	GuildControlUIRankSettingsFrameChatBg:SetAlpha(0)
	GuildControlUIRankSettingsFrameRosterBg:SetAlpha(0)
	GuildControlUIRankSettingsFrameInfoBg:SetAlpha(0)
	GuildControlUIRankSettingsFrameBankBg:SetAlpha(0)
	GuildControlUITopBg:Hide()
	GuildControlUIHbar:Hide()
	GuildControlUIRankBankFrameInsetScrollFrameTop:SetAlpha(0)
	GuildControlUIRankBankFrameInsetScrollFrameBottom:SetAlpha(0)

	hooksecurefunc("GuildControlUI_RankOrder_Update", function()
		if not reskinnedranks then
			for i = 1, GuildControlGetNumRanks() do
				Skins:ReskinInput(_G["GuildControlUIRankOrderFrameRank"..i.."NameEditBox"], 20)
			end
			reskinnedranks = true
		end
	end)

	hooksecurefunc("GuildControlUI_BankTabPermissions_Update", function()
		for i = 1, GetNumGuildBankTabs()+1 do
			local tab = "GuildControlBankTab"..i
			local bu = _G[tab]
			if bu and not bu.reskinned then
				_G[tab.."Bg"]:Hide()
				Skins:CreateBD(bu, .12)
				Skins:Reskin(_G[tab.."BuyPurchaseButton"])
				Skins:ReskinInput(_G[tab.."OwnedStackBox"])

				bu.reskinned = true
			end
		end
	end)

	Skins:Reskin(GuildControlUIRankOrderFrameNewButton)

	Skins:ReskinClose(GuildControlUICloseButton)
	Skins:ReskinScroll(GuildControlUIRankBankFrameInsetScrollFrameScrollBar)
	Skins:ReskinDropDown(GuildControlUINavigationDropDown)
	Skins:ReskinDropDown(GuildControlUIRankSettingsFrameRankDropDown)
	Skins:ReskinDropDown(GuildControlUIRankBankFrameRankDropDown)
	Skins:ReskinInput(GuildControlUIRankSettingsFrameGoldBox, 20)
end

Skins:RegisterSkin("Blizzard_GuildControlUI", LoadSkin)