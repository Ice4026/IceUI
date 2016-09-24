﻿-- Minimap from RayUI
local I, IC, L = select(2, ...):unpack()
local MM = CreateFrame("Frame", "Minimap")

-- Ace libs
LibStub:GetLibrary("AceHook-3.0"):Embed(MM)

local function ConvertSecondstoTime(value)
    local hours, minues, seconds
    hours = floor(value / 3600)
    minutes = floor((value - (hours * 3600)) / 60)
    seconds = floor(value - ((hours * 3600) + (minutes * 60)))

    if ( hours > 0 ) then
        return string.format("%d:%02d:%02d", hours, minutes, seconds)
    else
        return string.format("%02d:%02d", minutes, seconds)
    end
end

function MM:TimeManagerClockButton_UpdateTooltip()
    GameTooltip:SetOwner(Minimap, "ANCHOR_BOTTOMRIGHT", 5, 142)
    GameTooltip:ClearLines()

    if ( TimeManagerClockButton.alarmFiring ) then
        if ( gsub(Settings.alarmMessage, "%s", "") ~= "" ) then
            GameTooltip:AddLine(Settings.alarmMessage, HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b, 1)
            GameTooltip:AddLine(" ")
        end
        GameTooltip:AddLine(TIMEMANAGER_ALARM_TOOLTIP_TURN_OFF)
    else
        GameTime_UpdateTooltip()
        GameTooltip:AddLine(" ")
        GameTooltip:AddLine(GAMETIME_TOOLTIP_TOGGLE_CLOCK)
    end
    GameTooltip:Show()
end

local function PositionGarrisonButton(self, screenQuadrant)
    GarrisonLandingPageMinimapButton:SetScale(0.7)
    screenQuadrant = screenQuadrant or R:GetScreenQuadrant(self)
    if strfind(screenQuadrant, "RIGHT") then
        GarrisonLandingPageMinimapButton:ClearAllPoints()
        GarrisonLandingPageMinimapButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", -100, 10)
    else
        GarrisonLandingPageMinimapButton:ClearAllPoints()
        GarrisonLandingPageMinimapButton:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 100, 10)
    end
end

function MM:SkinMiniMap()
    local frames = {
        "GameTimeFrame",
        "MinimapBorderTop",
        "MinimapNorthTag",
        "MinimapBorder",
        "MinimapZoneTextButton",
        "MinimapZoomOut",
        "MinimapZoomIn",
        "MiniMapVoiceChatFrame",
        "MiniMapWorldMapButton",
        "MiniMapMailBorder",
        "GarrisonLandingPageMinimapButton",
    }
    for i in pairs(frames) do
        _G[frames[i]]:Kill()
    end
    Minimap:Size(175, 175)
    Minimap:CreateShadow("Background")
    Minimap:SetPlayerTexture("Interface\\AddOns\\IceUI\\medias\\textures\\MinimapArrow")
    MinimapCluster:EnableMouse(false)
    MiniMapTrackingBackground:SetAlpha(0)
    MiniMapTrackingButton:SetAlpha(0)
    MiniMapTracking:Hide()
    MiniMapInstanceDifficulty:ClearAllPoints()
    MiniMapInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 2, 2)
    MiniMapInstanceDifficulty:SetScale(0.75)
    MiniMapInstanceDifficulty:SetFrameStrata("LOW")
    GuildInstanceDifficulty:ClearAllPoints()
    GuildInstanceDifficulty:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 2, 2)
    GuildInstanceDifficulty:SetScale(0.75)
    GuildInstanceDifficulty:SetFrameStrata("LOW")
    MiniMapChallengeMode:SetParent(MinimapCluster)
    MiniMapChallengeMode:ClearAllPoints()
    MiniMapChallengeMode:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", -2, -2)
    MiniMapChallengeMode:SetScale(0.75)
    MiniMapChallengeMode:SetFrameStrata("LOW")
    MiniMapMailFrame:ClearAllPoints()
    MiniMapMailFrame:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT", 2, -6)
    MiniMapMailIcon:SetTexture("Interface\\AddOns\\IceUI\\medias\\textures\\mail")
    GameTimeCalendarInvitesTexture:ClearAllPoints()
    GameTimeCalendarInvitesTexture:SetParent(Minimap)
    GameTimeCalendarInvitesTexture:SetPoint("TOPRIGHT")
    if FeedbackUIButton then
        FeedbackUIButton:ClearAllPoints()
        FeedbackUIButton:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 6, -6)
        FeedbackUIButton:SetScale(0.8)
    end
    if StreamingIcon then
        StreamingIcon:ClearAllPoints()
        StreamingIcon:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 8, 8)
        StreamingIcon:SetScale(0.8)
    end
    function GetMinimapShape()
        return "SQUARE"
    end
    Minimap:SetMaskTexture("Interface\\Buttons\\WHITE8X8")
    local zoneTextFrame = CreateFrame("Frame", nil, UIParent)
    zoneTextFrame:SetPoint("TOPLEFT", Minimap, "TOPLEFT", 0, 10)
    zoneTextFrame:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 0, 10)
    zoneTextFrame:SetHeight(19)
    zoneTextFrame:SetAlpha(0)
    MinimapZoneText:SetParent(zoneTextFrame)
    MinimapZoneText:ClearAllPoints()
    MinimapZoneText:SetPoint("LEFT", 2, 1)
    MinimapZoneText:SetPoint("RIGHT", -2, 1)
    MinimapZoneText:SetFont(IC.Medias.Fonts.normal, IC.Medias.Fonts.fontsize, IC.Medias.Fonts.fontflag)
    Minimap:HookScript("OnEnter", function(self)
        UIFrameFadeIn(zoneTextFrame, 0.3, 0, 1)
    end)
    Minimap:HookScript("OnLeave", function(self)
        UIFrameFadeOut(zoneTextFrame, 0.3, 1, 0)
    end)
    DropDownList1:SetClampedToScreen(true)
    LFGDungeonReadyStatus:SetClampedToScreen(true)
    HelpOpenTicketButton:SetParent(Minimap)
    HelpOpenTicketButton:ClearAllPoints()
    HelpOpenTicketButton:SetPoint("BOTTOMRIGHT", Minimap, "BOTTOMRIGHT")
end

function MM:CheckMail()
    local inv = CalendarGetNumPendingInvites()
    local mail = MiniMapMailFrame:IsShown() and true or false
    if inv > 0 and mail then -- New invites and mail
        Minimap.shadow:SetBackdropBorderColor(1, .5, 0)
        R:GetModule("Skins"):CreatePulse(Minimap.shadow, 1, 1)
    elseif inv > 0 and not mail then -- New invites and no mail
        Minimap.shadow:SetBackdropBorderColor(1, 30/255, 60/255)
        R:GetModule("Skins"):CreatePulse(Minimap.shadow, 1, 1)
    elseif inv==0 and mail then -- No invites and new mail
        Minimap.shadow:SetBackdropBorderColor(.5, 1, 1)
        R:GetModule("Skins"):CreatePulse(Minimap.shadow, 1, 1)
    else -- None of the above
        Minimap.Shadow:SetScript("OnUpdate", nil)
        -- Minimap.shadow:SetAlpha(1)
        Minimap.Shadow:SetAlpha(0)
        Minimap.Shadow:SetBackdropBorderColor(unpack(IC.Medias.Textures.bordercolor))
    end
end

function MM:CreateMenu()
    local menuFrame = CreateFrame("Frame", "IceUI_MinimapRightClickMenu", UIParent, "UIDropDownMenuTemplate")
    local menuList = {
        {text = CHARACTER_BUTTON, notCheckable = true,
        func = function() ToggleCharacter("PaperDollFrame") end},
        {text = SPELLBOOK_ABILITIES_BUTTON, notCheckable = true,
        func = function() if not SpellBookFrame:IsShown() then ShowUIPanel(SpellBookFrame) else HideUIPanel(SpellBookFrame) end end},
        {text = TALENTS_BUTTON, notCheckable = true,
        func = function()
            if not PlayerTalentFrame then
                TalentFrame_LoadUI()
            end
            
            if not PlayerTalentFrame:IsShown() then
                ShowUIPanel(PlayerTalentFrame)
            else
                HideUIPanel(PlayerTalentFrame)
            end
        end},
        {text = ACHIEVEMENT_BUTTON, notCheckable = true,
        func = function() ToggleAchievementFrame() end},
        {text = SOCIAL_BUTTON, notCheckable = true,
        func = function() ToggleFriendsFrame() end},
        {text = ACHIEVEMENTS_GUILD_TAB, notCheckable = true,
        func = function()
            if IsInGuild() then
                if not GuildFrame then GuildFrame_LoadUI() end
                GuildFrame_Toggle()
            else
                if not LookingForGuildFrame then LookingForGuildFrame_LoadUI() end
                if not LookingForGuildFrame then return end
                LookingForGuildFrame_Toggle()
            end
        end},
        {text = ENCOUNTER_JOURNAL, notCheckable = true,
        func = function() if not IsAddOnLoaded("Blizzard_EncounterJournal") then EncounterJournal_LoadUI() end ToggleFrame(EncounterJournal) end},
        {text = COLLECTIONS, notCheckable = true,
        func = function()
            ToggleCollectionsJournal();
        end},
        {text = LFG_TITLE, notCheckable = true,
        func = function() PVEFrame_ToggleFrame() end},
        {text = RAID_FINDER, notCheckable = true,
        func = function() PVEFrame_ToggleFrame("GroupFinderFrame", RaidFinderFrame) end},
        {text = BLIZZARD_STORE, notCheckable = true,
        func = function() StoreMicroButton:Click() end},
        {text = HELP_BUTTON, notCheckable = true,
        func = function() ToggleHelpFrame() end},
        {text = GARRISON_LANDING_PAGE_TITLE, notCheckable = true,
        func = function() GarrisonLandingPageMinimapButton_OnClick() end},
        {text = CALENDAR, notCheckable = true,
        func = function()
        if(not CalendarFrame) then LoadAddOn("Blizzard_Calendar") end
            Calendar_Toggle()
        end},
        {text = LOOT_ROLLS, notCheckable = true,
        func = function() ToggleFrame(LootHistoryFrame) end},
    }
    Minimap:SetScript("OnMouseUp", function(_, btn)
        if( btn == "RightButton" and not IsShiftKeyDown() ) then
            ToggleDropDownMenu(1, nil, MiniMapTrackingDropDown, "cursor", 0, 0)
        elseif(btn == "MiddleButton" or ( btn== "RightButton" and IsShiftKeyDown())) then
            EasyMenu(menuList, menuFrame, "cursor", 0, 0, "MENU", 1)
        else
            local x, y = GetCursorPosition()
            x = x / Minimap:GetEffectiveScale()
            y = y / Minimap:GetEffectiveScale()
            local cx, cy = Minimap:GetCenter()
            x = x - cx
            y = y - cy
            if ( sqrt(x * x + y * y) < (Minimap:GetWidth() / 2) ) then
                Minimap:PingLocation(x, y)
            end
            Minimap_SetPing(x, y, 1)
        end
    end)
    self:RegisterEvent("CALENDAR_UPDATE_PENDING_INVITES", "CheckMail")
    self:RegisterEvent("UPDATE_PENDING_MAIL", "CheckMail")
    self:RegisterEvent("PLAYER_ENTERING_WORLD", "CheckMail")
    self:SetScript("OnEvent", self.CheckMail)
    MiniMapMailFrame:HookScript("OnHide", self.CheckMail)
    MiniMapMailFrame:HookScript("OnShow", self.CheckMail)
    Minimap.Shadow:SetBackdrop( { 
        edgeFile = IC.Medias.Textures.glow,
        bgFile = IC.Medias.Textures.blank, 
        edgeSize = I:Scale(4),
        tile = false,
        tileSize = 0,
        insets = {left = I:Scale(4), right = I:Scale(4), top = I:Scale(4), bottom = I:Scale(4)},
    })
end

local function MinimapPostDrag(self, screenQuadrant)
    MM:PositionButtonCollector(self, screenQuadrant)
    PositionGarrisonButton(self, screenQuadrant)
end

function MM:Enable()
    if not IsAddOnLoaded("Blizzard_TimeManager") then
        LoadAddOn("Blizzard_TimeManager")
        if ( not BlizzardStopwatchOptions ) then
            BlizzardStopwatchOptions = {}
        end

        if ( BlizzardStopwatchOptions.position ) then
            StopwatchFrame:ClearAllPoints()
            StopwatchFrame:SetPoint("CENTER", "UIParent", "BOTTOMLEFT", BlizzardStopwatchOptions.position.x, BlizzardStopwatchOptions.position.y)
            StopwatchFrame:SetUserPlaced(true)
        else
            StopwatchFrame:SetPoint("TOPRIGHT", "UIParent", "TOPRIGHT", -250, -300)
        end
    end
    self:SkinMiniMap()
    self:CreateMenu()
    self:ButtonCollector()
    self:RawHook("TimeManagerClockButton_UpdateTooltip", true)
    Minimap:ClearAllPoints()
    Minimap:Point("TOPLEFT", "UIParent", "TOPLEFT", 10, -20)
    Minimap:SetFrameLevel(10)
    local clockFrame, clockTime = TimeManagerClockButton:GetRegions()
    clockFrame:Hide()
    clockTime:SetFont(IC.Medias.Fonts.normal, IC.Medias.Fonts.fontsize, IC.Medias.Fonts.fontflag)
    clockTime:SetTextColor(1,1,1)
    TimeManagerClockButton:SetPoint("BOTTOM", Minimap, "BOTTOM", 0, -3)
    TimeManagerClockButton:SetScript("OnClick", function(_,btn)
        if btn == "LeftButton" then
            TimeManager_Toggle()
        end
        if btn == "RightButton" then
            if not CalendarFrame then
                LoadAddOn("Blizzard_Calendar")
            end
            Calendar_Toggle()
        end
    end)
    Minimap:EnableMouseWheel(true)
    Minimap:SetScript("OnMouseWheel", function(_, zoom)
        if zoom > 0 then
            Minimap_ZoomIn()
        else
            Minimap_ZoomOut()
        end
    end)
    -- R:CreateMover(Minimap, "MinimapMover", L["小地图锚点"], true, MinimapPostDrag)
end

I["Minimap"] = MM
