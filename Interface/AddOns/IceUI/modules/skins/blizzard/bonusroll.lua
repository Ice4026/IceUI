local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	BonusRollFrame:StripTextures()
	Skins:CreateBD(BonusRollFrame)
	BonusRollFrame.PromptFrame.Icon:SetTexCoord(.08, .92, .08, .92)
	BonusRollFrame.PromptFrame.IconBackdrop = CreateFrame("Frame", nil, BonusRollFrame.PromptFrame)
	BonusRollFrame.PromptFrame.IconBackdrop:SetFrameLevel(BonusRollFrame.PromptFrame.IconBackdrop:GetFrameLevel() - 1)
	BonusRollFrame.PromptFrame.IconBackdrop:SetOutside(BonusRollFrame.PromptFrame.Icon, 1, 1)
	Skins:CreateBD(BonusRollFrame.PromptFrame.IconBackdrop)
	BonusRollFrame.BlackBackgroundHoist:Kill()
	BonusRollFrame.PromptFrame.Timer.Bar:SetTexture(IC.Medias.Textures.blank)
	BonusRollFrame.PromptFrame.Timer.Bar:SetVertexColor(0, .6, 1)
	BonusRollFrame.PromptFrame.Timer.border = CreateFrame("Frame", nil, BonusRollFrame.PromptFrame.Timer)
	BonusRollFrame.PromptFrame.Timer.border:SetFrameLevel(BonusRollFrame.PromptFrame.Timer:GetFrameLevel() - 1)
	BonusRollFrame.PromptFrame.Timer.border:SetOutside(BonusRollFrame.PromptFrame.Timer, 1, 1)
	Skins:CreateBD(BonusRollFrame.PromptFrame.Timer.border)

	BonusRollMoneyWonFrame:SetAlpha(1)
	BonusRollMoneyWonFrame.SetAlpha = R.dummy
	if not BonusRollMoneyWonFrame.bg then
		BonusRollMoneyWonFrame.bg = CreateFrame("Frame", nil, BonusRollMoneyWonFrame)
		BonusRollMoneyWonFrame.bg:SetPoint("TOPLEFT", BonusRollMoneyWonFrame, "TOPLEFT", 8, -8)
		BonusRollMoneyWonFrame.bg:SetPoint("BOTTOMRIGHT", BonusRollMoneyWonFrame, "BOTTOMRIGHT", -6, 8)
		BonusRollMoneyWonFrame.bg:SetFrameLevel(BonusRollMoneyWonFrame:GetFrameLevel()-1)

		-- Icon border
		if not BonusRollMoneyWonFrame.Icon.b then
			BonusRollMoneyWonFrame.Icon.b = Skins:CreateBG(BonusRollMoneyWonFrame.Icon)
		end

		BonusRollMoneyWonFrame:HookScript("OnEnter", function()
			Skins:CreateBD(BonusRollMoneyWonFrame.bg)
		end)

		BonusRollMoneyWonFrame.animIn:HookScript("OnFinished", function()
			Skins:CreateBD(BonusRollMoneyWonFrame.bg)
		end)
	end
	BonusRollMoneyWonFrame.Background:Kill()
	BonusRollMoneyWonFrame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	BonusRollMoneyWonFrame.IconBorder:Kill()


	BonusRollMoneyWonFrame:SetAlpha(1)
	BonusRollMoneyWonFrame.SetAlpha = R.dummy
	if not BonusRollLootWonFrame.bg then
		BonusRollLootWonFrame.bg = CreateFrame("Frame", nil, BonusRollLootWonFrame)
		BonusRollLootWonFrame.bg:SetPoint("TOPLEFT", BonusRollLootWonFrame, "TOPLEFT", 8, -8)
		BonusRollLootWonFrame.bg:SetPoint("BOTTOMRIGHT", BonusRollLootWonFrame, "BOTTOMRIGHT", -6, 8)
		BonusRollLootWonFrame.bg:SetFrameLevel(BonusRollLootWonFrame:GetFrameLevel()-1)

		-- Icon border
		if not BonusRollLootWonFrame.Icon.b then
			BonusRollLootWonFrame.Icon.b = Skins:CreateBG(BonusRollLootWonFrame.Icon)
		end

		BonusRollLootWonFrame:HookScript("OnEnter", function()
			Skins:CreateBD(BonusRollLootWonFrame.bg)
		end)

		BonusRollLootWonFrame.animIn:HookScript("OnFinished", function()
			Skins:CreateBD(BonusRollLootWonFrame.bg)
		end)
	end
	BonusRollLootWonFrame.Background:Kill()
	BonusRollLootWonFrame.Icon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	BonusRollLootWonFrame.IconBorder:Kill()
	BonusRollFrame.SpecIcon:SetTexCoord(0.1, 0.9, 0.1, 0.9)
	Skins:CreateBG(BonusRollFrame.SpecIcon)
end

Skins:RegisterSkin("RayUI", LoadSkin)
