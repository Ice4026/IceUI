local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
    local r, g, b = Skins["media"].classcolours[I.MyClass].r, Skins["media"].classcolours[I.MyClass].g, Skins["media"].classcolours[I.MyClass].b
    Skins:SetBD(GuildFrame)
    Skins:CreateBD(GuildMemberDetailFrame)
    Skins:CreateBD(GuildMemberNoteBackground, .25)
    Skins:CreateBD(GuildMemberOfficerNoteBackground, .25)
    Skins:CreateBD(GuildLogFrame)
    Skins:CreateBD(GuildLogContainer, .25)
    Skins:CreateBD(GuildNewsFiltersFrame)
    Skins:CreateBD(GuildTextEditFrame)
    Skins:CreateSD(GuildTextEditFrame)
    Skins:CreateBD(GuildTextEditContainer, .25)
    Skins:CreateBD(GuildRecruitmentInterestFrame, .25)
    Skins:CreateBD(GuildRecruitmentAvailabilityFrame, .25)
    Skins:CreateBD(GuildRecruitmentRolesFrame, .25)
    Skins:CreateBD(GuildRecruitmentLevelFrame, .25)
    for i = 1, 5 do
        Skins:CreateTab(_G["GuildFrameTab"..i])
    end
    GuildInfoMOTD:SetFontObject(GameFontNormal)
    GuildInfoDetails:SetFont(IC.Medias.Textures.font, 12)
    GuildFrameTabardBackground:Hide()
    GuildFrameTabardEmblem:Hide()
    GuildFrameTabardBorder:Hide()
    select(5, GuildInfoFrameInfo:GetRegions()):Hide()
    select(11, GuildMemberDetailFrame:GetRegions()):Hide()
    GuildMemberDetailCorner:Hide()
    for i = 1, 9 do
        select(i, GuildLogFrame:GetRegions()):Hide()
        select(i, GuildNewsFiltersFrame:GetRegions()):Hide()
        select(i, GuildTextEditFrame:GetRegions()):Hide()
    end
    GuildAllPerksFrame:GetRegions():Hide()
    GuildNewsFrame:GetRegions():Hide()
    GuildRewardsFrame:GetRegions():Hide()
    GuildNewsBossModelShadowOverlay:Hide()
    GuildPerksContainerScrollBarTrack:Hide()
    GuildNewsContainerScrollBarTrack:Hide()
    GuildInfoDetailsFrameScrollBarTrack:Hide()
    GuildInfoFrameInfoHeader1:SetAlpha(0)
    GuildInfoFrameInfoHeader2:SetAlpha(0)
    GuildInfoFrameInfoHeader3:SetAlpha(0)
    select(9, GuildInfoFrameInfo:GetRegions()):Hide()
    GuildRecruitmentCommentInputFrameTop:Hide()
    GuildRecruitmentCommentInputFrameTopLeft:Hide()
    GuildRecruitmentCommentInputFrameTopRight:Hide()
    GuildRecruitmentCommentInputFrameBottom:Hide()
    GuildRecruitmentCommentInputFrameBottomLeft:Hide()
    GuildRecruitmentCommentInputFrameBottomRight:Hide()
    GuildRecruitmentInterestFrameBg:Hide()
    GuildRecruitmentAvailabilityFrameBg:Hide()
    GuildRecruitmentRolesFrameBg:Hide()
    GuildRecruitmentLevelFrameBg:Hide()
    GuildRecruitmentCommentFrameBg:Hide()

    GuildFrame:DisableDrawLayer("BACKGROUND")
    GuildFrame:DisableDrawLayer("BORDER")
    GuildFrameInset:DisableDrawLayer("BACKGROUND")
    GuildFrameInset:DisableDrawLayer("BORDER")
    GuildFrameBottomInset:DisableDrawLayer("BACKGROUND")
    GuildFrameBottomInset:DisableDrawLayer("BORDER")
    GuildInfoFrameInfoBar1Left:SetAlpha(0)
    GuildInfoFrameInfoBar2Left:SetAlpha(0)
    select(2, GuildInfoFrameInfo:GetRegions()):SetAlpha(0)
    select(4, GuildInfoFrameInfo:GetRegions()):SetAlpha(0)
    GuildFramePortraitFrame:Hide()
    GuildFrameTopRightCorner:Hide()
    GuildFrameTopBorder:Hide()
    GuildRosterColumnButton1:DisableDrawLayer("BACKGROUND")
    GuildRosterColumnButton2:DisableDrawLayer("BACKGROUND")
    GuildRosterColumnButton3:DisableDrawLayer("BACKGROUND")
    GuildRosterColumnButton4:DisableDrawLayer("BACKGROUND")
    GuildAddMemberButton_RightSeparator:Hide()
    GuildControlButton_LeftSeparator:Hide()
    GuildNewsBossModel:DisableDrawLayer("BACKGROUND")
    GuildNewsBossModel:DisableDrawLayer("OVERLAY")
    GuildNewsBossNameText:SetDrawLayer("ARTWORK")
    GuildNewsBossModelTextFrame:DisableDrawLayer("BACKGROUND")
    for i = 2, 6 do
        select(i, GuildNewsBossModelTextFrame:GetRegions()):Hide()
    end

    GuildMemberRankDropdown:HookScript("OnShow", function()
        GuildMemberDetailRankText:Hide()
    end)
    GuildMemberRankDropdown:HookScript("OnHide", function()
        GuildMemberDetailRankText:Show()
    end)

    Skins:ReskinClose(GuildFrameCloseButton)
    Skins:ReskinClose(GuildNewsFiltersFrameCloseButton)
    Skins:ReskinClose(GuildLogFrameCloseButton)
    Skins:ReskinClose(GuildMemberDetailCloseButton)
    Skins:ReskinClose(GuildTextEditFrameCloseButton)
    Skins:ReskinScroll(GuildPerksContainerScrollBar)
    Skins:ReskinScroll(GuildRosterContainerScrollBar)
    Skins:ReskinScroll(GuildNewsContainerScrollBar)
    Skins:ReskinScroll(GuildRewardsContainerScrollBar)
    Skins:ReskinScroll(GuildInfoDetailsFrameScrollBar)
    Skins:ReskinScroll(GuildLogScrollFrameScrollBar)
    Skins:ReskinScroll(GuildTextEditScrollFrameScrollBar)
    Skins:ReskinScroll(GuildInfoFrameInfoMOTDScrollFrameScrollBar)
    GuildInfoFrameInfoMOTDScrollFrameScrollBarThumbTexture.bg:Hide()
    GuildInfoFrameInfoMOTDScrollFrameScrollBar:DisableDrawLayer("BACKGROUND")
    Skins:ReskinDropDown(GuildRosterViewDropdown)
    Skins:ReskinDropDown(GuildMemberRankDropdown)
    Skins:ReskinInput(GuildRecruitmentCommentInputFrame)
    GuildRecruitmentCommentInputFrame:SetWidth(312)
    GuildRecruitmentCommentEditBox:SetWidth(284)
    GuildRecruitmentCommentFrame:ClearAllPoints()
    GuildRecruitmentCommentFrame:SetPoint("TOPLEFT", GuildRecruitmentLevelFrame, "BOTTOMLEFT", 0, 1)
    Skins:ReskinCheck(GuildRosterShowOfflineButton)
    for i = 1, 7 do
        Skins:ReskinCheck(_G["GuildNewsFilterButton"..i])
    end

	for i=1, 14 do
		Skins:Reskin(_G["GuildRosterContainerButton"..i.."HeaderButton"])
	end

    local a1, p, a2, x, y = GuildNewsBossModel:GetPoint()
    GuildNewsBossModel:ClearAllPoints()
    GuildNewsBossModel:SetPoint(a1, p, a2, x+5, y)

    local f = CreateFrame("Frame", nil, GuildNewsBossModel)
    f:SetPoint("TOPLEFT", 0, 1)
    f:SetPoint("BOTTOMRIGHT", 1, -52)
    f:SetFrameLevel(GuildNewsBossModel:GetFrameLevel()-1)
    Skins:CreateBD(f)

    local line = CreateFrame("Frame", nil, GuildNewsBossModel)
    line:SetPoint("BOTTOMLEFT", 0, -1)
    line:SetPoint("BOTTOMRIGHT", 0, -1)
    line:SetHeight(1)
    line:SetFrameLevel(GuildNewsBossModel:GetFrameLevel()-1)
    Skins:CreateBD(line, 0)

    GuildNewsFiltersFrame:SetWidth(224)
    GuildNewsFiltersFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 1, -20)
    GuildMemberDetailFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 1, -28)
    GuildLogFrame:SetPoint("TOPLEFT", GuildFrame, "TOPRIGHT", 1, 0)

    for i = 1, 5 do
        local bu = _G["GuildInfoFrameApplicantsContainerButton"..i]
        Skins:CreateBD(bu, .25)
        bu:SetHighlightTexture("")
        bu:GetRegions():SetTexture(IC.Medias.Textures.gloss)
        bu:GetRegions():SetVertexColor(r, g, b, .2)
    end

    GuildFactionBarProgress:SetTexture(IC.Medias.Textures.gloss)
    GuildFactionBarLeft:Hide()
    GuildFactionBarMiddle:Hide()
    GuildFactionBarRight:Hide()
    GuildFactionBarShadow:Hide()
    GuildFactionBarBG:Hide()
    GuildFactionBarCap:SetAlpha(0)
    GuildFactionBar.bg = CreateFrame("Frame", nil, GuildFactionFrame)
    GuildFactionBar.bg:Point("TOPLEFT", GuildFactionFrame, -1, -1)
    GuildFactionBar.bg:Point("BOTTOMRIGHT", GuildFactionFrame, -3, 0)
    GuildFactionBar.bg:SetFrameLevel(0)
    Skins:CreateBD(GuildFactionBar.bg, .25)

    local reskinnedrewards = false
    GuildFrameTab4:HookScript("OnClick", function()
        if not reskinnedrewards == true then
            for i = 1, 8 do
                local button = "GuildRewardsContainerButton"..i
                local bu = _G[button]
                local ic = _G[button.."Icon"]

                local bg = CreateFrame("Frame", nil, bu)
                bg:SetPoint("TOPLEFT", 0, -1)
                bg:SetPoint("BOTTOMRIGHT")
                Skins:CreateBD(bg, 0)

                bu:SetHighlightTexture(IC.Medias.Textures.gloss)
                local hl = bu:GetHighlightTexture()
                hl:SetVertexColor(r, g, b, .2)
                hl:SetPoint("TOPLEFT", 0, -1)
                hl:SetPoint("BOTTOMRIGHT")

                ic:SetTexCoord(.08, .92, .08, .92)

                select(6, bu:GetRegions()):SetAlpha(0)
                select(7, bu:GetRegions()):SetTexture(IC.Medias.Textures.gloss)
                select(7, bu:GetRegions()):SetVertexColor(0, 0, 0, .25)
                select(7, bu:GetRegions()):SetPoint("TOPLEFT", 0, -1)
                select(7, bu:GetRegions()):SetPoint("BOTTOMRIGHT", 0, 1)

                Skins:CreateBG(ic)
            end
            reskinnedrewards = true
        end
    end)

    for i = 1, 16 do
        local bu = _G["GuildRosterContainerButton"..i]
        local ic = _G["GuildRosterContainerButton"..i.."Icon"]

        bu:SetHighlightTexture(IC.Medias.Textures.gloss)
        bu:GetHighlightTexture():SetVertexColor(r, g, b, .2)

        bu.bg = Skins:CreateBG(ic)
    end

    for _, bu in pairs(GuildPerksContainer.buttons) do
        for i = 1, 4 do
            select(i, bu:GetRegions()):SetAlpha(0)
        end

        local bg = Skins:CreateBDFrame(bu, .25)
        bg:ClearAllPoints()
        bg:SetPoint("TOPLEFT", 1, -3)
        bg:SetPoint("BOTTOMRIGHT", 0, 4)

        bu.icon:SetTexCoord(.08, .92, .08, .92)
        Skins:CreateBG(bu.icon)
    end

	local UpdateIcons = function()
		local index
		local offset = HybridScrollFrame_GetOffset(GuildRosterContainer)
		local totalMembers, onlineMembers, onlineAndMobileMembers = GetNumGuildMembers()
		local visibleMembers = onlineAndMobileMembers
		local numbuttons = #GuildRosterContainer.buttons
		if GetGuildRosterShowOffline() then
			visibleMembers = totalMembers
		end

		for i = 1, numbuttons do
			local bu = GuildRosterContainer.buttons[i]

			if not bu.bg then
				bu:SetHighlightTexture(IC.Medias.Textures.gloss)
				bu:GetHighlightTexture():SetVertexColor(r, g, b, .2)

				bu.bg = Skins:CreateBG(bu.icon)
			end

			index = offset + i
			local name, _, _, _, _, _, _, _, _, _, classFileName  = GetGuildRosterInfo(index)
			if name and index <= visibleMembers and bu.icon:IsShown() then
				local tcoords = CLASS_ICON_TCOORDS[classFileName]
				bu.icon:SetTexCoord(tcoords[1] + 0.022, tcoords[2] - 0.025, tcoords[3] + 0.022, tcoords[4] - 0.025)
				bu.bg:Show()
			else
				bu.bg:Hide()
			end
		end
	end

	hooksecurefunc("GuildRoster_Update", UpdateIcons)
	hooksecurefunc(GuildRosterContainer, "update", UpdateIcons)

    GuildPerksContainerButton1:SetPoint("LEFT", -1, 0)

    Skins:Reskin(select(4, GuildTextEditFrame:GetChildren()))
    Skins:Reskin(select(3, GuildLogFrame:GetChildren()))

    local gbuttons = {"GuildAddMemberButton", "GuildViewLogButton", "GuildControlButton", "GuildTextEditFrameAcceptButton", "GuildMemberGroupInviteButton", "GuildMemberRemoveButton", "GuildRecruitmentInviteButton", "GuildRecruitmentMessageButton", "GuildRecruitmentDeclineButton", "GuildRecruitmentListGuildButton"}
    for i = 1, #gbuttons do
        Skins:Reskin(_G[gbuttons[i]])
    end

    local checkboxes = {"GuildRecruitmentQuestButton", "GuildRecruitmentDungeonButton", "GuildRecruitmentRaidButton", "GuildRecruitmentPvPButton", "GuildRecruitmentRPButton", "GuildRecruitmentWeekdaysButton", "GuildRecruitmentWeekendsButton"}
    for i = 1, #checkboxes do
        Skins:ReskinCheck(_G[checkboxes[i]])
    end

    Skins:ReskinCheck(GuildRecruitmentTankButton:GetChildren())
    Skins:ReskinCheck(GuildRecruitmentHealerButton:GetChildren())
    Skins:ReskinCheck(GuildRecruitmentDamagerButton:GetChildren())

    for i = 1, 3 do
        for j = 1, 6 do
            select(j, _G["GuildInfoFrameTab"..i]:GetRegions()):Hide()
            select(j, _G["GuildInfoFrameTab"..i]:GetRegions()).Show = R.dummy
        end
    end
end

Skins:RegisterSkin("Blizzard_GuildUI", LoadSkin)
