local I, IC, L = select(2, ...):unpack() --Import: Engine, Locales, ProfileDB, local
local Skins = I.Skins

local function LoadSkin()
    TimeManagerGlobe:Hide()
    StopwatchFrameBackgroundLeft:Hide()
    select(2, StopwatchFrame:GetRegions()):Hide()
    StopwatchTabFrameLeft:Hide()
    StopwatchTabFrameMiddle:Hide()
    StopwatchTabFrameRight:Hide()

    TimeManagerStopwatchCheck:GetNormalTexture():SetTexCoord(.08, .92, .08, .92)
    TimeManagerStopwatchCheck:SetCheckedTexture(Skins["media"].checked)
    Skins:CreateBG(TimeManagerStopwatchCheck)

    TimeManagerAlarmHourDropDown:SetWidth(80)
    TimeManagerAlarmMinuteDropDown:SetWidth(80)
    TimeManagerAlarmAMPMDropDown:SetWidth(90)

    Skins:ReskinPortraitFrame(TimeManagerFrame, true)
    Skins:CreateBD(StopwatchFrame)
    Skins:ReskinDropDown(TimeManagerAlarmHourDropDown)
    Skins:ReskinDropDown(TimeManagerAlarmMinuteDropDown)
    Skins:ReskinDropDown(TimeManagerAlarmAMPMDropDown)
    Skins:ReskinInput(TimeManagerAlarmMessageEditBox)
    Skins:ReskinCheck(TimeManagerMilitaryTimeCheck)
    Skins:ReskinCheck(TimeManagerLocalTimeCheck)
    Skins:ReskinCheck(TimeManagerAlarmEnabledButton)
    Skins:ReskinClose(StopwatchCloseButton, "TOPRIGHT", StopwatchFrame, "TOPRIGHT", -2, -2)
end

Skins:RegisterSkin("Blizzard_TimeManager", LoadSkin)
