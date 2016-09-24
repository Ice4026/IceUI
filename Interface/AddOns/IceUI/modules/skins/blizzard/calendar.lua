local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
	CalendarFrame:DisableDrawLayer("BORDER")
	for i = 1, 15 do
		if i ~= 10 and i ~= 11 and i ~= 12 and i ~= 13 and i ~= 14 then select(i, CalendarViewEventFrame:GetRegions()):Hide() end
	end
	for i = 1, 9 do
		select(i, CalendarViewHolidayFrame:GetRegions()):Hide()
		select(i, CalendarViewRaidFrame:GetRegions()):Hide()
	end
	for i = 1, 3 do
		select(i, CalendarCreateEventTitleFrame:GetRegions()):Hide()
		select(i, CalendarViewEventTitleFrame:GetRegions()):Hide()
		select(i, CalendarViewHolidayTitleFrame:GetRegions()):Hide()
		select(i, CalendarViewRaidTitleFrame:GetRegions()):Hide()
	end
	for i = 1, 42 do
		_G["CalendarDayButton"..i]:DisableDrawLayer("BACKGROUND")
		_G["CalendarDayButton"..i.."DarkFrame"]:SetAlpha(.5)
	end
	for i = 1, 7 do
		_G["CalendarWeekday"..i.."Background"]:SetAlpha(0)
	end
	CalendarViewEventDivider:Hide()
	CalendarCreateEventDivider:Hide()
	CalendarViewEventInviteList:GetRegions():Hide()
	CalendarViewEventDescriptionContainer:GetRegions():Hide()
	select(5, CalendarCreateEventCloseButton:GetRegions()):Hide()
	select(5, CalendarViewEventCloseButton:GetRegions()):Hide()
	select(5, CalendarViewHolidayCloseButton:GetRegions()):Hide()
	select(5, CalendarViewRaidCloseButton:GetRegions()):Hide()
	CalendarCreateEventBackground:Hide()
	CalendarCreateEventFrameButtonBackground:Hide()
	CalendarCreateEventMassInviteButtonBorder:Hide()
	CalendarCreateEventCreateButtonBorder:Hide()
	CalendarEventPickerTitleFrameBackgroundLeft:Hide()
	CalendarEventPickerTitleFrameBackgroundMiddle:Hide()
	CalendarEventPickerTitleFrameBackgroundRight:Hide()
	CalendarEventPickerFrameButtonBackground:Hide()
	CalendarEventPickerCloseButtonBorder:Hide()
	CalendarCreateEventRaidInviteButtonBorder:Hide()
	CalendarMonthBackground:SetAlpha(0)
	CalendarYearBackground:SetAlpha(0)
	CalendarFrameModalOverlay:SetAlpha(.25)
	CalendarViewHolidayInfoTexture:SetAlpha(0)
	CalendarTexturePickerTitleFrameBackgroundLeft:Hide()
	CalendarTexturePickerTitleFrameBackgroundMiddle:Hide()
	CalendarTexturePickerTitleFrameBackgroundRight:Hide()
	CalendarTexturePickerFrameButtonBackground:Hide()
	CalendarTexturePickerAcceptButtonBorder:Hide()
	CalendarTexturePickerCancelButtonBorder:Hide()
	CalendarClassTotalsButtonBackgroundTop:Hide()
	CalendarClassTotalsButtonBackgroundMiddle:Hide()
	CalendarClassTotalsButtonBackgroundBottom:Hide()
	CalendarFilterFrameLeft:Hide()
	CalendarFilterFrameMiddle:Hide()
	CalendarFilterFrameRight:Hide()

	Skins:SetBD(CalendarFrame, 12, 0, -9, 4)
	Skins:CreateBD(CalendarViewEventFrame)
	Skins:CreateBD(CalendarViewHolidayFrame)
	Skins:CreateBD(CalendarViewRaidFrame)
	Skins:CreateBD(CalendarCreateEventFrame)
	Skins:CreateBD(CalendarClassTotalsButton)
	Skins:CreateBD(CalendarTexturePickerFrame, .7)
	Skins:CreateBD(CalendarViewEventInviteList, .25)
	Skins:CreateBD(CalendarViewEventDescriptionContainer, .25)
	Skins:CreateBD(CalendarCreateEventInviteList, .25)
	Skins:CreateBD(CalendarCreateEventDescriptionContainer, .25)
	Skins:CreateBD(CalendarEventPickerFrame, .25)

	for i, class in ipairs(CLASS_SORT_ORDER) do
		local bu = _G["CalendarClassButton"..i]
		bu:GetRegions():Hide()
		Skins:CreateBG(bu)

		local tcoords = CLASS_ICON_TCOORDS[class]
		local ic = bu:GetNormalTexture()
		ic:SetTexCoord(tcoords[1] + 0.015, tcoords[2] - 0.02, tcoords[3] + 0.018, tcoords[4] - 0.02)
	end

	local bd = CreateFrame("Frame", nil, CalendarFilterFrame)
	bd:SetPoint("TOPLEFT", 40, 0)
	bd:SetPoint("BOTTOMRIGHT", -19, 0)
	bd:SetFrameLevel(CalendarFilterFrame:GetFrameLevel()-1)
	Skins:CreateBD(bd, 0)

	local tex = bd:CreateTexture(nil, "BACKGROUND")
	tex:SetPoint("TOPLEFT")
	tex:SetPoint("BOTTOMRIGHT")
	tex:SetTexture(IC.Medias.Textures.gloss)
	tex:SetGradientAlpha("VERTICAL", 0, 0, 0, .3, .35, .35, .35, .35)

	local downtex = CalendarFilterButton:CreateTexture(nil, "ARTWORK")
	downtex:SetTexture("Interface\\AddOns\\RayUI\\media\\arrow-down-active")
	downtex:SetSize(8, 8)
	downtex:SetPoint("CENTER")
	downtex:SetVertexColor(1, 1, 1)

	for i = 1, 6 do
		local vline = CreateFrame("Frame", nil, _G["CalendarDayButton"..i])
		vline:SetHeight(546)
		vline:SetWidth(1)
		vline:SetPoint("TOP", _G["CalendarDayButton"..i], "TOPRIGHT")
		Skins:CreateBD(vline)
	end
	for i = 1, 36, 7 do
		local hline = CreateFrame("Frame", nil, _G["CalendarDayButton"..i])
		hline:SetWidth(637)
		hline:SetHeight(1)
		hline:SetPoint("LEFT", _G["CalendarDayButton"..i], "TOPLEFT")
		Skins:CreateBD(hline)
	end

	CalendarContextMenu:SetBackdrop(nil)
	local bg = CreateFrame("Frame", nil, CalendarContextMenu)
	bg:SetPoint("TOPLEFT")
	bg:SetPoint("BOTTOMRIGHT")
	bg:SetFrameLevel(CalendarContextMenu:GetFrameLevel()-1)
	Skins:CreateBD(bg)

	CalendarViewEventFrame:SetPoint("TOPLEFT", CalendarFrame, "TOPRIGHT", -8, -24)
	CalendarViewHolidayFrame:SetPoint("TOPLEFT", CalendarFrame, "TOPRIGHT", -8, -24)
	CalendarViewRaidFrame:SetPoint("TOPLEFT", CalendarFrame, "TOPRIGHT", -8, -24)
	CalendarCreateEventFrame:SetPoint("TOPLEFT", CalendarFrame, "TOPRIGHT", -8, -24)
	CalendarCreateEventInviteButton:SetPoint("TOPLEFT", CalendarCreateEventInviteEdit, "TOPRIGHT", 1, 1)
	CalendarClassButton1:SetPoint("TOPLEFT", CalendarClassButtonContainer, "TOPLEFT", 5, 0)

	local cbuttons = {"CalendarViewEventAcceptButton", "CalendarViewEventTentativeButton", "CalendarViewEventDeclineButton", "CalendarViewEventRemoveButton", "CalendarCreateEventMassInviteButton", "CalendarCreateEventCreateButton", "CalendarCreateEventInviteButton", "CalendarEventPickerCloseButton", "CalendarCreateEventRaidInviteButton", "CalendarTexturePickerAcceptButton", "CalendarTexturePickerCancelButton", "CalendarFilterButton"}
	for i = 1, #cbuttons do
		local cbutton = _G[cbuttons[i]]
		Skins:Reskin(cbutton)
	end

	Skins:ReskinClose(CalendarCloseButton, "TOPRIGHT", CalendarFrame, "TOPRIGHT", -14, -4)
	Skins:ReskinClose(CalendarCreateEventCloseButton)
	Skins:ReskinClose(CalendarViewEventCloseButton)
	Skins:ReskinClose(CalendarViewHolidayCloseButton)
	Skins:ReskinClose(CalendarViewRaidCloseButton)
	Skins:ReskinScroll(CalendarTexturePickerScrollBar)
	Skins:ReskinScroll(CalendarViewEventInviteListScrollFrameScrollBar)
	Skins:ReskinScroll(CalendarViewEventDescriptionScrollFrameScrollBar)
	Skins:ReskinDropDown(CalendarCreateEventTypeDropDown)
	Skins:ReskinDropDown(CalendarCreateEventHourDropDown)
	CalendarCreateEventHourDropDown:SetWidth(80)
	Skins:ReskinDropDown(CalendarCreateEventMinuteDropDown)
	CalendarCreateEventMinuteDropDown:SetWidth(80)
	Skins:ReskinInput(CalendarCreateEventTitleEdit)
	Skins:ReskinInput(CalendarCreateEventInviteEdit)
	Skins:ReskinArrow(CalendarPrevMonthButton, "left")
	Skins:ReskinArrow(CalendarNextMonthButton, "right")
	CalendarPrevMonthButton:SetSize(19, 19)
	CalendarNextMonthButton:SetSize(19, 19)
	Skins:ReskinCheck(CalendarCreateEventLockEventCheck)
end

Skins:RegisterSkin("Blizzard_Calendar", LoadSkin)