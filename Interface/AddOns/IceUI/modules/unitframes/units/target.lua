local I, IC, L = select(2, ...):unpack()
local T, C, _, _ = Tukui:unpack()

local TukuiUnitFrames = T["UnitFrames"]
local Movers = T["Movers"]
local Class = select(2, UnitClass("player"))

function TukuiUnitFrames:Target()
	local DarkTheme = C["UnitFrames"].DarkTheme
	local HealthTexture = T.GetTexture(C["UnitFrames"].HealthTexture)
	local PowerTexture = T.GetTexture(C["UnitFrames"].PowerTexture)
	local CastTexture = T.GetTexture(C["UnitFrames"].CastTexture)
	local Font = T.GetFont(C["UnitFrames"].Font)

	self:RegisterForClicks("AnyUp")
	self:SetScript("OnEnter", UnitFrame_OnEnter)
	self:SetScript("OnLeave", UnitFrame_OnLeave)
	self:SetBackdrop(TukuiUnitFrames.Backdrop)
	self:SetBackdropColor(0, 0, 0)
	self:CreateShadow()

	local Panel = CreateFrame("Frame", nil, self)
	Panel:SetFrameStrata(self:GetFrameStrata())
	Panel:SetTemplate()
	Panel:Size(250, 40)
	Panel:Point("BOTTOM", self, "BOTTOM", 0, 0)
	Panel:SetFrameLevel(2)
	Panel:SetBackdropBorderColor(C["General"].BorderColor[1] * 0.7, C["General"].BorderColor[2] * 0.7, C["General"].BorderColor[3] * 0.7)
	Panel:SetAlpha(0)

	local Health = CreateFrame("StatusBar", nil, self)
	Health:SetFrameStrata(self:GetFrameStrata())
	Health:Height(35)
	Health:SetPoint("TOPLEFT")
	Health:SetPoint("TOPRIGHT")
	Health:SetStatusBarTexture(HealthTexture)

	Health.Background = Health:CreateTexture(nil, "BORDER")
	Health.Background:SetAllPoints()
	Health.Background:SetColorTexture(.1, .1, .1)

	Health.Value = Health:CreateFontString(nil, "OVERLAY")
	Health.Value:SetFontObject(Font)
	Health.Value:Point("TOPLEFT", Health, "TOPLEFT", 4, -2)

	Health.frequentUpdates = true

	if DarkTheme then
		Health.colorTapping = false
		Health.colorDisconnected = false
		Health.colorClass = false
		Health:SetStatusBarColor(0.2, 0.2, 0.2, 1)
		Health.Background:SetVertexColor(0, 0, 0, 1)
	else
		Health.colorTapping = true
		Health.colorDisconnected = true
		Health.colorClass = true
		Health.colorReaction = true
	end

	Health.PreUpdate = TukuiUnitFrames.PreUpdateHealth
	Health.PostUpdate = TukuiUnitFrames.PostUpdateHealth

	if (C.UnitFrames.Smooth) then
		Health.Smooth = true
	end

	local Power = CreateFrame("StatusBar", nil, self)
	Power:SetFrameStrata(self:GetFrameStrata())
	Power:SetFrameLevel(4)
	Power:Height(5)
	Power:Point("TOPLEFT", Health, "BOTTOMLEFT", 0, -1)
	Power:Point("TOPRIGHT", Health, "BOTTOMRIGHT", 0, -1)
	Power:SetStatusBarTexture(PowerTexture)

	Power.Background = Power:CreateTexture(nil, "BORDER")
	Power.Background:SetAllPoints()
	Power.Background:SetColorTexture(.4, .4, .4)
	Power.Background.multiplier = 0.3

	Power.Value = Power:CreateFontString(nil, "OVERLAY")
	Power.Value:SetFontObject(Font)
	Power.Value:Point("BOTTOMLEFT", Health, "BOTTOMLEFT", 4, 2)

	Power.frequentUpdates = true

	if DarkTheme then
		Power.colorTapping = true
		Power.colorClass = true
		Power.colorClassNPC = true
		Power.colorClassPet = true
		Power.Background.multiplier = 0.1
	else
		Power.colorPower = true
	end

	if (C.UnitFrames.Smooth) then
		Power.Smooth = true
	end

	Power.PostUpdate = TukuiUnitFrames.PostUpdatePower

	local AltPowerBar = CreateFrame("StatusBar", nil, self)
	AltPowerBar:SetFrameStrata(self:GetFrameStrata())
	AltPowerBar:Height(5)
	AltPowerBar:SetStatusBarTexture(PowerTexture)
	AltPowerBar:GetStatusBarTexture():SetHorizTile(false)
	AltPowerBar:SetStatusBarColor(0, 0, 0)
	AltPowerBar:SetPoint("LEFT")
	AltPowerBar:SetPoint("RIGHT")
	AltPowerBar:SetPoint("BOTTOM", Health, "BOTTOM", 0, 0)
	AltPowerBar:SetBackdrop({
		bgFile = C.Medias.Blank,
		edgeFile = C.Medias.Blank,
		tile = false, tileSize = 0, edgeSize = T.Scale(1),
		insets = { left = 0, right = 0, top = T.Scale(-1), bottom = 0}
	})
	AltPowerBar:SetBackdropColor(0, 0, 0)
	AltPowerBar:SetBackdropBorderColor(0, 0, 0)
	AltPowerBar:SetFrameLevel(Health:GetFrameLevel() + 1)

	if C.UnitFrames.AltPowerText then
		AltPowerBar.Value = AltPowerBar:CreateFontString(nil, "OVERLAY")
		AltPowerBar.Value:SetFontObject(Font)
		AltPowerBar.Value:Point("CENTER", 0, 0)
	end

	AltPowerBar.PostUpdate = TukuiUnitFrames.UpdateAltPower

	if C.UnitFrames.Portrait then
		self.Portrait = TukuiUnitFrames:ConstructPortrait(Health)
	end

	local Name = Health:CreateFontString(nil, "OVERLAY")
	Name:Point("RIGHT", Health, "RIGHT", -4, 0)
	Name:SetJustifyH("RIGHT")
	Name:SetFontObject(Font)

	if (C.UnitFrames.HealBar) then
		local FirstBar = CreateFrame("StatusBar", nil, Health)
		FirstBar:SetPoint("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
		FirstBar:SetPoint("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		FirstBar:SetWidth(250)
		FirstBar:SetStatusBarTexture(HealthTexture)
		FirstBar:SetStatusBarColor(0, 0.3, 0.15, 1)
		FirstBar:SetMinMaxValues(0,1)

		local SecondBar = CreateFrame("StatusBar", nil, Health)
		SecondBar:SetPoint("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
		SecondBar:SetPoint("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		SecondBar:SetWidth(250)
		SecondBar:SetStatusBarTexture(HealthTexture)
		SecondBar:SetStatusBarColor(0, 0.3, 0, 1)

		local ThirdBar = CreateFrame("StatusBar", nil, Health)
		ThirdBar:SetPoint("TOPLEFT", Health:GetStatusBarTexture(), "TOPRIGHT", 0, 0)
		ThirdBar:SetPoint("BOTTOMLEFT", Health:GetStatusBarTexture(), "BOTTOMRIGHT", 0, 0)
		ThirdBar:SetWidth(250)
		ThirdBar:SetStatusBarTexture(HealthTexture)
		ThirdBar:SetStatusBarColor(0.3, 0.3, 0, 1)

		ThirdBar:SetFrameLevel(Health:GetFrameLevel())
		SecondBar:SetFrameLevel(ThirdBar:GetFrameLevel() + 1)
		FirstBar:SetFrameLevel(ThirdBar:GetFrameLevel() + 2)

		self.HealPrediction = {
			myBar = FirstBar,
			otherBar = SecondBar,
			absorbBar = ThirdBar,
			maxOverflow = 1,
		}
	end

	if (C.UnitFrames.CastBar) then
		local CastBar = CreateFrame("StatusBar", "TukuiTargetCastBar", self)
		CastBar:SetFrameStrata(self:GetFrameStrata())
		CastBar:SetStatusBarTexture(CastTexture)
		CastBar:SetFrameLevel(6)
		CastBar:SetInside(Panel)

		CastBar.Background = CastBar:CreateTexture(nil, "BORDER")
		CastBar.Background:SetAllPoints(CastBar)
		CastBar.Background:SetTexture(CastTexture)
		CastBar.Background:SetVertexColor(0.15, 0.15, 0.15)

		CastBar.Time = CastBar:CreateFontString(nil, "OVERLAY")
		CastBar.Time:SetFontObject(Font)
		CastBar.Time:Point("RIGHT", Panel, "RIGHT", -4, 0)
		CastBar.Time:SetTextColor(0.84, 0.75, 0.65)
		CastBar.Time:SetJustifyH("RIGHT")

		CastBar.Text = CastBar:CreateFontString(nil, "OVERLAY")
		CastBar.Text:SetFontObject(Font)
		CastBar.Text:Point("LEFT", Panel, "LEFT", 4, 0)
		CastBar.Text:SetTextColor(0.84, 0.75, 0.65)
		CastBar.Text:SetWidth(166)
		CastBar.Text:SetJustifyH("LEFT")

		if (C.UnitFrames.CastBarIcon) then
			CastBar.Button = CreateFrame("Frame", nil, CastBar)
			CastBar.Button:Size(26)
			CastBar.Button:SetTemplate()
			CastBar.Button:CreateShadow()
			CastBar.Button:Point("RIGHT", 46.5, 26.5)

			CastBar.Icon = CastBar.Button:CreateTexture(nil, "ARTWORK")
			CastBar.Icon:SetInside()
			CastBar.Icon:SetTexCoord(unpack(T.IconCoord))
		end

		if (C.UnitFrames.CastBarLatency) then
			CastBar.SafeZone = CastBar:CreateTexture(nil, "ARTWORK")
			CastBar.SafeZone:SetTexture(CastTexture)
			CastBar.SafeZone:SetVertexColor(0.69, 0.31, 0.31, 0.75)
		end

		CastBar.CustomTimeText = TukuiUnitFrames.CustomCastTimeText
		CastBar.CustomDelayText = TukuiUnitFrames.CustomCastDelayText
		CastBar.PostCastStart = TukuiUnitFrames.CheckCast
		CastBar.PostChannelStart = TukuiUnitFrames.CheckChannel

		if (C.UnitFrames.UnlinkCastBar) then
			CastBar:ClearAllPoints()
			CastBar:SetWidth(200)
			CastBar:SetHeight(23)
			CastBar:SetPoint("TOP", UIParent, "TOP", 0, -140)
			CastBar:CreateShadow()

			if (C.UnitFrames.CastBarIcon) then
				CastBar.Icon:ClearAllPoints()
				CastBar.Icon:SetPoint("RIGHT", CastBar, "LEFT", -8, 0)
				CastBar.Icon:SetSize(CastBar:GetHeight(), CastBar:GetHeight())

				CastBar.Button:ClearAllPoints()
				CastBar.Button:SetAllPoints(CastBar.Icon)
			end

			CastBar.Time:ClearAllPoints()
			CastBar.Time:Point("RIGHT", CastBar, "RIGHT", -4, 0)

			CastBar.Text:ClearAllPoints()
			CastBar.Text:Point("LEFT", CastBar, "LEFT", 4, 0)

			Movers:RegisterFrame(CastBar)
		end

		self.Castbar = CastBar
	end

	if (C.UnitFrames.TargetAuras) then
		local Buffs = CreateFrame("Frame", self:GetName()..'Buffs', self)
		local Debuffs = CreateFrame("Frame", self:GetName()..'Debuffs', self)

		Buffs:SetFrameStrata(self:GetFrameStrata())
		Buffs:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 4)

		Buffs:SetHeight(26)
		Buffs:SetWidth(252)
		Buffs.size = 26
		Buffs.num = 36
		Buffs.numRow = 9

		Buffs:SetFrameStrata(self:GetFrameStrata())
		Debuffs:SetHeight(26)
		Debuffs:SetWidth(252)
		Debuffs:SetPoint("BOTTOMLEFT", Buffs, "TOPLEFT", -2, 2)
		Debuffs.size = 26
		Debuffs.num = 36
		Debuffs.numRow = 9

		Buffs.spacing = 2
		Buffs.initialAnchor = "TOPLEFT"
		Buffs.PostCreateIcon = TukuiUnitFrames.PostCreateAura
		Buffs.PostUpdateIcon = TukuiUnitFrames.PostUpdateAura
		Buffs.PostUpdate = TukuiUnitFrames.UpdateDebuffsHeaderPosition
		Buffs.onlyShowPlayer = C.UnitFrames.OnlySelfBuffs

		Debuffs.spacing = 2
		Debuffs.initialAnchor = "TOPRIGHT"
		Debuffs["growth-y"] = "UP"
		Debuffs["growth-x"] = "LEFT"
		Debuffs.PostCreateIcon = TukuiUnitFrames.PostCreateAura
		Debuffs.PostUpdateIcon = TukuiUnitFrames.PostUpdateAura
		Debuffs.onlyShowPlayer = C.UnitFrames.OnlySelfDebuffs

		self.Buffs = Buffs
		self.Debuffs = Debuffs
	end

	if (C.UnitFrames.CombatLog) then
		local CombatFeedbackText = Health:CreateFontString(nil, "OVERLAY")
		CombatFeedbackText:SetFontObject(Font)
		CombatFeedbackText:SetFont(CombatFeedbackText:GetFont(), 16, "THINOUTLINE")
		CombatFeedbackText:SetPoint("CENTER", 0, 0)
		CombatFeedbackText.colors = {
			DAMAGE = {0.69, 0.31, 0.31},
			CRUSHING = {0.69, 0.31, 0.31},
			CRITICAL = {0.69, 0.31, 0.31},
			GLANCING = {0.69, 0.31, 0.31},
			STANDARD = {0.84, 0.75, 0.65},
			IMMUNE = {0.84, 0.75, 0.65},
			ABSORB = {0.84, 0.75, 0.65},
			BLOCK = {0.84, 0.75, 0.65},
			RESIST = {0.84, 0.75, 0.65},
			MISS = {0.84, 0.75, 0.65},
			HEAL = {0.33, 0.59, 0.33},
			CRITHEAL = {0.33, 0.59, 0.33},
			ENERGIZE = {0.31, 0.45, 0.63},
			CRITENERGIZE = {0.31, 0.45, 0.63},
		}

		self.CombatFeedbackText = CombatFeedbackText
	end

	if (C.UnitFrames.ComboBar) then
		local ComboPoints = CreateFrame("Frame", self:GetName()..'ComboPointsBar', self)
		ComboPoints:SetFrameStrata(self:GetFrameStrata())
		ComboPoints:Point("BOTTOMLEFT", self, "TOPLEFT", 0, 1)
		ComboPoints:Width(250)
		ComboPoints:Height(8)
		ComboPoints:SetBackdrop(TukuiUnitFrames.Backdrop)
		ComboPoints:SetBackdropColor(0, 0, 0)
		ComboPoints:SetBackdropBorderColor(unpack(C["General"].BorderColor))

		for i = 1, 8 do
			ComboPoints[i] = CreateFrame("StatusBar", nil, ComboPoints)
			ComboPoints[i]:Height(8)
			ComboPoints[i]:SetStatusBarTexture(PowerTexture)

			if i == 1 then
				ComboPoints[i]:Point("LEFT", ComboPoints, "LEFT", 0, 0)
				ComboPoints[i]:Width(250 / 8 + 2)
				
				ComboPoints[i].Anticipation = ComboPoints[i]:GetWidth()
				ComboPoints[i].Deeper = 250 / 6
				ComboPoints[i].None = 250 / 5
			else
				ComboPoints[i]:Point("LEFT", ComboPoints[i-1], "RIGHT", 1, 0)
				ComboPoints[i]:Width(250 / 8 - 1)
				
				ComboPoints[i].Anticipation = ComboPoints[i]:GetWidth()
				ComboPoints[i].Deeper = 250 / 6 - 1
				ComboPoints[i].None = 250 / 5 - 1
			end
		end

		ComboPoints:SetScript("OnShow", function(self)
			TukuiUnitFrames.UpdateShadow(self, 12)
			TukuiUnitFrames.UpdateBuffsHeaderPosition(self, 14)
		end)

		ComboPoints:SetScript("OnHide", function(self)
			TukuiUnitFrames.UpdateShadow(self, 4)
			TukuiUnitFrames.UpdateBuffsHeaderPosition(self, 4)
		end)

		self.ComboPointsBar = ComboPoints
	end

	local RaidIcon = Health:CreateTexture(nil, "OVERLAY")
	RaidIcon:SetSize(16, 16)
	RaidIcon:SetPoint("TOP", self, 0, 8)

	local Threat = Health:CreateTexture(nil, "OVERLAY")
	Threat.Override = TukuiUnitFrames.UpdateThreat

	self:Tag(Name, "[shortclassification] [Tukui:DiffColor][level] [Tukui:GetNameColor][Tukui:NameLong]")
	self.Name = Name
	self.Panel = Panel
	self.Health = Health
	self.Health.bg = Health.Background
	self.Power = Power
	self.Power.bg = Power.Background
	self.AltPowerBar = AltPowerBar
	self.RaidIcon = RaidIcon
	self.Threat = Threat
end