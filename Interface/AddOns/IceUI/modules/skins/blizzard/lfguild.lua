local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	local r, g, b = Skins["media"].classcolours[I.MyClass].r, Skins["media"].classcolours[I.MyClass].g, Skins["media"].classcolours[I.MyClass].b
	Skins:SetBD(LookingForGuildFrame)
	Skins:CreateBD(LookingForGuildInterestFrame, .25)
	LookingForGuildInterestFrameBg:Hide()
	Skins:CreateBD(LookingForGuildAvailabilityFrame, .25)
	LookingForGuildAvailabilityFrameBg:Hide()
	Skins:CreateBD(LookingForGuildRolesFrame, .25)
	LookingForGuildRolesFrameBg:Hide()
	Skins:CreateBD(LookingForGuildCommentFrame, .25)
	LookingForGuildCommentFrameBg:Hide()
	Skins:CreateBD(LookingForGuildCommentInputFrame, .12)
	LookingForGuildFrame:DisableDrawLayer("BACKGROUND")
	LookingForGuildFrame:DisableDrawLayer("BORDER")
	LookingForGuildFrameInset:DisableDrawLayer("BACKGROUND")
	LookingForGuildFrameInset:DisableDrawLayer("BORDER")
	for i = 1, 5 do
		local bu = _G["LookingForGuildBrowseFrameContainerButton"..i]
		Skins:CreateBD(bu, .25)
		bu:SetHighlightTexture("")
		bu:GetRegions():SetTexture(IC.Medias.Textures.gloss)
		bu:GetRegions():SetVertexColor(r, g, b, .2)
	end
	for i = 1, 9 do
		select(i, LookingForGuildCommentInputFrame:GetRegions()):Hide()
	end
	for i = 1, 3 do
		for j = 1, 6 do
			select(j, _G["LookingForGuildFrameTab"..i]:GetRegions()):Hide()
			select(j, _G["LookingForGuildFrameTab"..i]:GetRegions()).Show = R.dummy
		end
	end
	LookingForGuildFrameTabardBackground:Hide()
	LookingForGuildFrameTabardEmblem:Hide()
	LookingForGuildFrameTabardBorder:Hide()
	LookingForGuildFramePortraitFrame:Hide()
	LookingForGuildFrameTopBorder:Hide()
	LookingForGuildFrameTopRightCorner:Hide()
	LookingForGuildBrowseButton_LeftSeparator:Hide()
	LookingForGuildRequestButton_RightSeparator:Hide()

	Skins:Reskin(LookingForGuildBrowseButton)
	Skins:Reskin(LookingForGuildRequestButton)

	Skins:ReskinScroll(LookingForGuildBrowseFrameContainerScrollBar)
	Skins:ReskinClose(LookingForGuildFrameCloseButton)
	Skins:ReskinCheck(LookingForGuildQuestButton)
	Skins:ReskinCheck(LookingForGuildDungeonButton)
	Skins:ReskinCheck(LookingForGuildRaidButton)
	Skins:ReskinCheck(LookingForGuildPvPButton)
	Skins:ReskinCheck(LookingForGuildRPButton)
	Skins:ReskinCheck(LookingForGuildWeekdaysButton)
	Skins:ReskinCheck(LookingForGuildWeekendsButton)
	Skins:ReskinCheck(LookingForGuildTankButton:GetChildren())
	Skins:ReskinCheck(LookingForGuildHealerButton:GetChildren())
	Skins:ReskinCheck(LookingForGuildDamagerButton:GetChildren())
	Skins:CreateBD(GuildFinderRequestMembershipFrame)
	Skins:CreateSD(GuildFinderRequestMembershipFrame)
	for i = 1, 6 do
		select(i, GuildFinderRequestMembershipFrameInputFrame:GetRegions()):Hide()
	end
	Skins:Reskin(GuildFinderRequestMembershipFrameAcceptButton)
	Skins:Reskin(GuildFinderRequestMembershipFrameCancelButton)
	Skins:ReskinInput(GuildFinderRequestMembershipFrameInputFrame)
end

Skins:RegisterSkin("Blizzard_LookingForGuildUI", LoadSkin)