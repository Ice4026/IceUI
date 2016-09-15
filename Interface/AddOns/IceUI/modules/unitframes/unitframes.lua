local I, IC, L = select(2, ...):unpack()
local T, C, _, _ = Tukui:unpack()
local Panels = T["Panels"]
local TukuiUnitFrames = T["UnitFrames"]

function TukuiUnitFrames:UpdateNamePosition()
    if (self.Power.Value:GetText() and UnitIsEnemy("player", "target")) then
        self.Name:ClearAllPoints()
        self.Name:SetPoint("CENTER", self.Panel, "CENTER", 0, 0)
    else
        self.Name:ClearAllPoints()
        self.Power.Value:SetAlpha(1)
        self.Name:SetPoint("RIGHT", self.Panel, "RIGHT", -4, 0)
    end
end

function TukuiUnitFrames:PostUpdateHealth(unit, min, max)
    if (not UnitIsConnected(unit) or UnitIsDead(unit) or UnitIsGhost(unit)) then
        if (not UnitIsConnected(unit)) then
            self.Value:SetText("|cffD7BEA5"..FRIENDS_LIST_OFFLINE.."|r")
        elseif (UnitIsDead(unit)) then
            self.Value:SetText("|cffD7BEA5"..DEAD.."|r")
        elseif (UnitIsGhost(unit)) then
            self.Value:SetText("|cffD7BEA5"..L.UnitFrames.Ghost.."|r")
        end
    else
        local r, g, b
        local IsRaid = string.match(self:GetParent():GetName(), "Button") or false

        if (min ~= max) then
            r, g, b = T.ColorGradient(min, max, 0.69, 0.31, 0.31, 0.65, 0.63, 0.35, 0.33, 0.59, 0.33)
            if (unit == "player" and self:GetAttribute("normalUnit") ~= "pet") then
                if (IsRaid) then
                    self.Value:SetText("|cffff2222-"..TukuiUnitFrames.ShortValue(max-min).."|r")
                else
                    self.Value:SetFormattedText("|cffAF5050%d|r |cffD7BEA5-|r |cff%02x%02x%02x%d%%|r", min, r * 255, g * 255, b * 255, floor(min / max * 100))
                end
            elseif (unit == "target" or (unit and strfind(unit, "boss%d"))) then
                self.Value:SetFormattedText("|cff%02x%02x%02x%d%%|r |cffD7BEA5-|r |cffAF5050%s|r", r * 255, g * 255, b * 255, floor(min / max * 100), TukuiUnitFrames.ShortValue(min))
            elseif (unit and strfind(unit, "arena%d")) or (unit == "focus") or (unit == "focustarget") then
                self.Value:SetText("|cff559655"..TukuiUnitFrames.ShortValue(min).."|r")
            else
                self.Value:SetText("|cffff2222-"..TukuiUnitFrames.ShortValue(max-min).."|r")
            end
        else
            if (unit == "player" and self:GetAttribute("normalUnit") ~= "pet") then
                if (IsRaid) then
                    self.Value:SetText(" ")
                else
                    self.Value:SetText("|cff559655"..max.."|r")
                end
            elseif (unit == "target" or unit == "focus"  or unit == "focustarget" or (unit and strfind(unit, "arena%d")) or (unit and strfind(unit, "boss%d"))) then
                self.Value:SetText("|cff559655"..TukuiUnitFrames.ShortValue(max).."|r")
            else
                self.Value:SetText(" ")
            end
        end
    end
end

function TukuiUnitFrames:ConstructPortrait(frame)
    local portrait = CreateFrame("PlayerModel", nil, frame)
    portrait:SetFrameStrata("LOW")
    portrait:SetFrameLevel(frame:GetFrameLevel() + 1)
    portrait:SetInside(frame, 1, 1)
    portrait:SetAlpha(.2)
    portrait:SetCamDistanceScale(1)

    frame.Background:ClearAllPoints()
    frame.Background:Point("BOTTOMLEFT", frame:GetStatusBarTexture(), "BOTTOMRIGHT")
    frame.Background:Point("TOPRIGHT", frame)

    return portrait
end

function TukuiUnitFrames:SetUnits()
    local Player = self.Units.Player
    Player:Size(250, 40)

    local Target = self.Units.Target
    Target:Size(250, 40)

    local TargetOfTarget = self.Units.TargetOfTarget
    TargetOfTarget:Size(129, 30)

    local Pet = self.Units.Pet
    local Focus = self.Units.Focus
    local FocusTarget = self.Units.FocusTarget
end

function TukuiUnitFrames:SetUI()
    self:SetUnits()
end
