local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	local r, g, b = Skins["media"].classcolours[I.MyClass].r, Skins["media"].classcolours[I.MyClass].g, Skins["media"].classcolours[I.MyClass].b

	PVPUIFrame:StripTextures()

	Skins:ReskinClose(PVPUIFrameCloseButton)

	for i=1, 2 do
		Skins:CreateTab(_G["PVPUIFrameTab"..i])
	end

	for i=1, 4 do
		local button = _G["PVPQueueFrameCategoryButton"..i]
		button:SetTemplate('Default')
		button.Background:Kill()
		button.Ring:Kill()
		button.Icon:Size(45)
		button.Icon:SetTexCoord(.15, .85, .15, .85)
		Skins:Reskin(button)
	end

	--[[for i=1, 3 do
		local button = _G["PVPArenaTeamsFrameTeam"..i]
		button.Background:Kill()
		Skins:Reskin(button)
	end]]

	-->>>HONOR FRAME
	Skins:ReskinDropDown(HonorFrameTypeDropDown)

	HonorFrame.Inset:StripTextures()
	--HonorFrame.Inset:SetTemplate("Transparent")

	Skins:ReskinScroll(HonorFrameSpecificFrameScrollBar)
	Skins:Reskin(HonorFrameSoloQueueButton)
	Skins:Reskin(HonorFrameGroupQueueButton)
	HonorFrame.BonusFrame:StripTextures()
	HonorFrame.BonusFrame.ShadowOverlay:StripTextures()
	-->>>CONQUEST FRAME
	ConquestFrame.Inset:StripTextures()
	ConquestFrame:StripTextures()
	ConquestFrame.ShadowOverlay:StripTextures()
	Skins:Reskin(ConquestJoinButton, true)

	local bg = CreateFrame("Frame", nil, ConquestPointsBar)
	Skins:CreateBD(ConquestPointsBar, .25)
	bg:SetPoint("TOPLEFT", -1, -2)
	bg:SetPoint("BOTTOMRIGHT", 1, 2)

	-->>>WARGRAMES FRAME
	WarGamesFrame:StripTextures()
	WarGamesFrame.RightInset:StripTextures()
	Skins:Reskin(WarGameStartButton, true)
	Skins:ReskinScroll(WarGamesFrameScrollFrameScrollBar)
	WarGamesFrame.HorizontalBar:StripTextures()

	local RoleInset = HonorFrame.RoleInset

	RoleInset:DisableDrawLayer("BACKGROUND")
	RoleInset:DisableDrawLayer("BORDER")

	for _, roleButton in pairs({RoleInset.HealerIcon, RoleInset.TankIcon, RoleInset.DPSIcon}) do
		Skins:ReskinCheck(roleButton.checkButton)
	end

	for _, button in pairs(WarGamesFrame.scrollFrame.buttons) do
		local bu = button.Entry
		local SelectedTexture = bu.SelectedTexture

		bu.Bg:Hide()
		bu.Border:Hide()

		bu:SetNormalTexture("")
		bu:SetHighlightTexture("")

		local bg = CreateFrame("Frame", nil, bu)
		bg:SetPoint("TOPLEFT", 2, 0)
		bg:SetPoint("BOTTOMRIGHT", -1, 2)
		Skins:CreateBD(bg, 0)
		bg:SetFrameLevel(bu:GetFrameLevel()-1)

		SelectedTexture:SetDrawLayer("BACKGROUND")
		SelectedTexture:SetColorTexture(r, g, b, .2)
		SelectedTexture:SetPoint("TOPLEFT", 2, 0)
		SelectedTexture:SetPoint("BOTTOMRIGHT", -1, 2)

		bu.Icon:SetTexCoord(.08, .92, .08, .92)
		bu.Icon.bg = Skins:CreateBG(bu.Icon)
		bu.Icon.bg:SetDrawLayer("BACKGROUND", 1)
		bu.Icon:SetPoint("TOPLEFT", 5, -3)
	end
end

Skins:RegisterSkin("Blizzard_PVPUI", LoadSkin)
