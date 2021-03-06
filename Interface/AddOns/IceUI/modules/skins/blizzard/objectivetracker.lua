local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	local r, g, b = Skins["media"].classcolours[I.MyClass].r, Skins["media"].classcolours[I.MyClass].g, Skins["media"].classcolours[I.MyClass].b
	local ot = ObjectiveTrackerFrame
	local BlocksFrame = ot.BlocksFrame

	-- [[ Header ]]

	-- Header

	ot.HeaderMenu.Title:FontTemplate(IC.Medias.Textures.font, IC.Medias.Textures.fontsize, "OUTLINE")

	-- Minimize button

	local minimizeButton = ot.HeaderMenu.MinimizeButton

	Skins:ReskinExpandOrCollapse(minimizeButton)
	minimizeButton:SetSize(15, 15)
	minimizeButton.plus:Hide()

	hooksecurefunc("ObjectiveTracker_Collapse", function()
		minimizeButton.plus:Show()
	end)
	hooksecurefunc("ObjectiveTracker_Expand", function()
		minimizeButton.plus:Hide()
	end)

	-- [[ Blocks and lines ]]

	for _, headerName in pairs({"QuestHeader", "AchievementHeader", "ScenarioHeader"}) do
		local header = BlocksFrame[headerName]

		header.Background:Hide()
		header.Text:FontTemplate(IC.Medias.Textures.font, IC.Medias.Textures.fontsize, "OUTLINE")
	end

	BONUS_OBJECTIVE_TRACKER_MODULE.Header.Background:Hide()

	hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "SetBlockHeader", function(_, block)
		if not block.headerStyled then
			block.HeaderText:FontTemplate(IC.Medias.Textures.font, IC.Medias.Textures.fontsize, "OUTLINE")
			block.headerStyled = true
		end
	end)

	hooksecurefunc(QUEST_TRACKER_MODULE, "SetBlockHeader", function(_, block)
		if not block.headerStyled then
			block.HeaderText:FontTemplate(IC.Medias.Textures.font, IC.Medias.Textures.fontsize, "OUTLINE")
			block.headerStyled = true
		end

		local itemButton = block.itemButton

		if itemButton and not itemButton.styled then
			itemButton:SetNormalTexture("")
			itemButton:SetPushedTexture("")

			itemButton.HotKey:ClearAllPoints()
			itemButton.HotKey:SetPoint("TOP", itemButton, -1, 0)
			itemButton.HotKey:SetJustifyH("CENTER")
			itemButton.HotKey:FontTemplate(IC.Medias.Textures.font, IC.Medias.Textures.fontsize, "OUTLINE")

			itemButton.icon:SetTexCoord(.08, .92, .08, .92)
			Skins:CreateBG(itemButton)

			itemButton.styled = true
		end
	end)

	hooksecurefunc(DEFAULT_OBJECTIVE_TRACKER_MODULE, "AddObjective", function(self, block)
		if block.module == QUEST_TRACKER_MODULE or block.module == ACHIEVEMENT_TRACKER_MODULE then
			local line = block.currentLine

			local p1, a, p2, x, y = line:GetPoint()
			line:SetPoint(p1, a, p2, x, y - 4)
		end
	end)

	local function fixBlockHeight(block)
		if block.shouldFix then
			local height = block:GetHeight()

			if block.lines then
				for _, line in pairs(block.lines) do
					if line:IsShown() then
						height = height + 4
					end
				end
			end

			block.shouldFix = false
			block:SetHeight(height + 5)
			block.shouldFix = true
		end
	end

	hooksecurefunc("ObjectiveTracker_AddBlock", function(block)
		if block.lines then
			for _, line in pairs(block.lines) do
				if not line.styled then
					line.Text:FontTemplate(IC.Medias.Textures.font, IC.Medias.Textures.fontsize, "OUTLINE")
					line.Text:SetSpacing(2)

					if line.Dash then
						line.Dash:FontTemplate(IC.Medias.Textures.font, IC.Medias.Textures.fontsize, "OUTLINE")
					end

					line:SetHeight(line.Text:GetHeight())

					line.styled = true
				end
			end
		end

		if not block.styled then
			block.shouldFix = true
			hooksecurefunc(block, "SetHeight", fixBlockHeight)
			block.styled = true
		end
	end)

	-- [[ Bonus objective progress bar ]]

	hooksecurefunc(BONUS_OBJECTIVE_TRACKER_MODULE, "AddProgressBar", function(self, block, line)
		local progressBar = line.ProgressBar

		if not progressBar.styled then
			local bar = progressBar.Bar
			local label = bar.Label
			local icon = bar.Icon

			bar.BarFrame:Hide()
			bar.BarBG:Hide()
			bar.IconBG:Hide()

			if icon:IsShown() then
				icon:SetMask(nil)
				icon:SetDrawLayer("BACKGROUND", 1)
				icon:ClearAllPoints()
				icon:SetPoint("RIGHT", 35, 2)
				Skins:ReskinIcon(icon)
			end
			
			bar:SetStatusBarTexture(IC.Medias.Textures.gloss)

			label:ClearAllPoints()
			label:SetPoint("CENTER", 0, -1)
			label:FontTemplate(nil, nil, "OUTLINE")

			local bg = Skins:CreateBDFrame(bar)
			bg:Point("TOPLEFT", -1, 1)
			bg:Point("BOTTOMRIGHT", 0, -2)

			progressBar.styled = true
		end

		progressBar.Bar:SetValue(50)
	end)
end

Skins:RegisterSkin("RayUI", LoadSkin)