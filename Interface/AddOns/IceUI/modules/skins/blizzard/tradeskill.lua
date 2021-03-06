local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	-- MainFrame
	TradeSkillFramePortrait:Kill()
	TradeSkillFrame:StripTextures(true)
	Skins:CreateBDFrame(TradeSkillFrame)
	TradeSkillFrame:Height(TradeSkillFrame:GetHeight() + 12)
	TradeSkillFrame.RankFrame:StripTextures()
	TradeSkillFrame.RankFrame:SetStatusBarTexture(IC.Medias.Textures.gloss)
	TradeSkillFrame.RankFrame.SetStatusBarColor = R.dummy
	TradeSkillFrame.RankFrame:GetStatusBarTexture():SetGradient("VERTICAL", .1, .3, .9, .2, .4, 1)
	TradeSkillFrame.FilterButton:StripTextures(true)
	Skins:Reskin(TradeSkillFrame.FilterButton)
	TradeSkillFrame.LinkToButton:GetNormalTexture():SetTexCoord(0.25, 0.7, 0.37, 0.75)
	TradeSkillFrame.LinkToButton:GetPushedTexture():SetTexCoord(0.25, 0.7, 0.45, 0.8)
	TradeSkillFrame.LinkToButton:GetHighlightTexture():Kill()
	Skins:Reskin(TradeSkillFrame.LinkToButton)
	TradeSkillFrame.LinkToButton:Size(17, 14)
	TradeSkillFrame.LinkToButton:SetPoint("BOTTOMRIGHT", TradeSkillFrame.FilterButton, "TOPRIGHT", -2, 4)

	Skins:ReskinInput(TradeSkillFrame.SearchBox)
	Skins:ReskinClose(TradeSkillFrameCloseButton)

	-- RecipeList
	TradeSkillFrame.RecipeInset:StripTextures()
	TradeSkillFrame.RecipeInset:StripTextures()
	TradeSkillFrame.RecipeList.LearnedTab:StripTextures()
	TradeSkillFrame.RecipeList.UnlearnedTab:StripTextures()

	-- DetailsFrame
	TradeSkillFrame.DetailsFrame:StripTextures()
	TradeSkillFrame.DetailsInset:StripTextures()
	TradeSkillFrame.DetailsFrame.Background:Hide()
	Skins:ReskinInput(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox)
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox:DisableDrawLayer("BACKGROUND")

	Skins:Reskin(TradeSkillFrame.DetailsFrame.CreateAllButton, true)
	Skins:Reskin(TradeSkillFrame.DetailsFrame.CreateButton, true)
	Skins:Reskin(TradeSkillFrame.DetailsFrame.ExitButton, true)

	-- Skins:ReskinScroll(TradeSkillFrame.RecipeList.scrollBar) --This cannot be skinned due to issues on Blizzards end.
	Skins:ReskinScroll(TradeSkillFrame.DetailsFrame.ScrollBar)

	Skins:ReskinArrow(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.DecrementButton, "right")
	Skins:ReskinArrow(TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton, "left")
	TradeSkillFrame.DetailsFrame.CreateMultipleInputBox.IncrementButton:Point("LEFT", TradeSkillFrame.DetailsFrame.CreateMultipleInputBox, "RIGHT", 4, 0)

	hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function()
		local ResultIcon = TradeSkillFrame.DetailsFrame.Contents.ResultIcon
		ResultIcon:StyleButton(true)
		if ResultIcon:GetNormalTexture() then
			ResultIcon:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
		end
		Skins:CreateBG(ResultIcon)
		ResultIcon.Background:SetTexture(nil)

		for i = 1, #TradeSkillFrame.DetailsFrame.Contents.Reagents do
			local Button = TradeSkillFrame.DetailsFrame.Contents.Reagents[i]
			local Icon = Button.Icon
			local Count = Button.Count
			
			Icon:SetTexCoord(.08, .92, .08, .92)
			Icon:SetDrawLayer("OVERLAY")
			if not Icon.backdrop then
				Icon.backdrop = CreateFrame("Frame", nil, Button)
				Icon.backdrop:SetFrameLevel(Button:GetFrameLevel() - 1)
				Skins:CreateBG(Icon.backdrop)
			end
			
			Icon:SetParent(Icon.backdrop)
			Count:SetParent(Icon.backdrop)
			Count:SetDrawLayer("OVERLAY")
			
			Button.NameFrame:Kill()
		end
	end)

	--Guild Crafters
	Skins:ReskinClose(TradeSkillFrame.DetailsFrame.GuildFrame.CloseButton)
	Skins:Reskin(TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton)
	TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton.LeftSeparator:SetTexture(nil)
	TradeSkillFrame.DetailsFrame.ViewGuildCraftersButton.RightSeparator:SetTexture(nil)
	TradeSkillFrame.DetailsFrame.GuildFrame:StripTextures()
	TradeSkillFrame.DetailsFrame.GuildFrame:SetTemplate("Transparent")
	TradeSkillFrame.DetailsFrame.GuildFrame.Container:StripTextures()
	TradeSkillFrame.DetailsFrame.GuildFrame.Container:SetTemplate("Transparent")
	-- Skins:ReskinScroll(TradeSkillFrame.DetailsFrame.GuildFrame.Container.ScrollFrame.scrollBar) --This cannot be skinned due to issues on Blizzards end.

	--BUGFIX: TradeSkillFrame.RecipeList.scrollBar
	--Hide current scrollbar
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarTop:Hide()
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarTop = nil
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarBottom:Hide()
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarBottom = nil
	TradeSkillFrame.RecipeList.scrollBar.ScrollBarMiddle:Hide()
	TradeSkillFrame.RecipeList.scrollBar.thumbTexture:Hide()
	TradeSkillFrame.RecipeList.scrollBar.thumbTexture = nil
	TradeSkillFrameScrollUpButton:Hide()
	TradeSkillFrameScrollUpButton = nil
	TradeSkillFrameScrollDownButton:Hide()
	TradeSkillFrameScrollDownButton = nil

	--Create new one with fixed template
	TradeSkillFrame.RecipeList.scrollBar = CreateFrame("Slider", nil, TradeSkillFrame.RecipeList, "HybridScrollBarTemplateFixed")
	Skins:ReskinScroll(TradeSkillFrame.RecipeList.scrollBar)
	TradeSkillFrame.RecipeList.scrollBar:SetFrameLevel(TradeSkillFrame.RecipeList.scrollBar:GetFrameLevel()+1)
	C_Timer.After(0.25, function()
		--Scroll back to top
		TradeSkillFrame.RecipeList.scrollBar:SetValue(1)
		TradeSkillFrame.RecipeList.scrollBar:SetValue(0)
	end)
end

Skins:RegisterSkin("Blizzard_TradeSkillUI", LoadSkin)