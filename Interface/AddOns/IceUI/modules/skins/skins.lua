--Skins from IceUI
local I, IC, L = select(2, ...):unpack()
local Skins = CreateFrame("Frame", "Skins")

Skins.SkinFuncs = {}
Skins.SkinFuncs["IceUI"] = {}

local alpha
local backdropcolorr, backdropcolorg, backdropcolorb
local backdropfadecolorr, backdropfadecolorg, backdropfadecolorb
local bordercolorr, bordercolorg, bordercolorb

Skins["media"] = {
	["checked"] = "Interface\\AddOns\\IceUI\\medias\\textures\\CheckButtonHilight",
	["arrowUp"] = "Interface\\AddOns\\IceUI\\medias\\textures\\arrow-up-active",
	["arrowDown"] = "Interface\\AddOns\\IceUI\\medias\\textures\\arrow-down-active",
	["arrowLeft"] = "Interface\\AddOns\\IceUI\\medias\\textures\\arrow-left-active",
	["arrowRight"] = "Interface\\AddOns\\IceUI\\medias\\textures\\arrow-right-active",
	["classcolours"] = I.Colors.Classes
}

local r, g, b = Skins["media"].classcolours[I.MyClass].r, Skins["media"].classcolours[I.MyClass].g, Skins["media"].classcolours[I.MyClass].b

function Skins:CreateGradient(f)
	local tex = f:CreateTexture(nil, "BORDER")
	tex:SetPoint("TOPLEFT", 1, -1)
	tex:SetPoint("BOTTOMRIGHT", -1, 1)
	tex:SetTexture([[Interface\AddOns\IceUI\medias\textures\gradient.tga"]])
	tex:SetVertexColor(.3, .3, .3, .15)

	return tex
end

function Skins:CreateStripesThin(f)
	if not f then return end
	f.stripesthin = f:CreateTexture(nil, "BACKGROUND", nil, 1)
	f.stripesthin:SetAllPoints()
	f.stripesthin:SetTexture([[Interface\AddOns\IceUI\medias\textures\StripesThin]], true, true)
	f.stripesthin:SetHorizTile(true)
	f.stripesthin:SetVertTile(true)
	f.stripesthin:SetBlendMode("ADD")
end

function Skins:CreateBackdropTexture(f)
	if not f then return end
	local tex = f:CreateTexture(nil, "BACKGROUND")
	tex:SetDrawLayer("BACKGROUND", 1)
	tex:SetInside(f, 1, 1)
	tex:SetTexture(IC.Medias.Textures.gloss)
	--tex:SetGradientAlpha("VERTICAL", 0, 0, 0, .3, .35, .35, .35, .35)
	tex:SetVertexColor(backdropcolorr, backdropcolorg, backdropcolorb)
	tex:SetAlpha(0.8)
	f.backdropTexture = tex
end

function Skins:CreateBD(f, a)
	if not f then return end
	f:SetBackdrop({
		bgFile = IC.Medias.Textures.blank,
		edgeFile = IC.Medias.Textures.blank,
		edgeSize = I.mult,
	})
	f:SetBackdropColor(backdropfadecolorr, backdropfadecolorg, backdropfadecolorb, a or alpha)
	f:SetBackdropBorderColor(bordercolorr, bordercolorg, bordercolorb)
end

function Skins:CreateBG(frame)
	if not frame then return end
	local f = frame
	if frame:GetObjectType() == "Texture" then f = frame:GetParent() end

	local bg = f:CreateTexture(nil, "BACKGROUND")
	bg:Point("TOPLEFT", frame, -1, 1)
	bg:Point("BOTTOMRIGHT", frame, 1, -1)
	bg:SetTexture(IC.Medias.Textures.blank)
	bg:SetVertexColor(0, 0, 0)

	return bg
end

function Skins:CreateSD(parent, size, r, g, b, alpha, offset)
	if not parent then return end
	Skins:CreateStripesThin(parent)

	local sd = CreateFrame("Frame", nil, parent)
	sd.size = size or 5
	sd.size = sd.size - 5
	sd.offset = offset or 0
	sd:Point("TOPLEFT", parent, -sd.size - 1 - sd.offset, sd.size + 1 + sd.offset)
	sd:Point("BOTTOMRIGHT", parent, sd.size + 1 + sd.offset, -sd.size - 1 - sd.offset)
	sd:CreateShadow()
	sd.Shadow:SetBackdropBorderColor(r or bordercolorr, g or bordercolorg, b or bordercolorb)
	sd.Border:SetBackdropBorderColor(r or bordercolorr, g or bordercolorg, b or bordercolorb)
	sd:SetAlpha(alpha or 1)
end

function Skins:CreatePulse(frame, speed, alpha, mult)
	if not frame then return end
	frame.speed = .02
	frame.mult = mult or 1
	frame.alpha = alpha or 1
	frame.tslu = 0
	frame:SetScript("OnUpdate", function(self, elapsed)
		elapsed = elapsed * ( speed or 5/4 )
		self.tslu = self.tslu + elapsed
		if self.tslu > self.speed then
			self.tslu = 0
			self:SetAlpha(self.alpha*(alpha or 3/5))
		end
		self.alpha = self.alpha - elapsed*self.mult
		if self.alpha < 0 and self.mult > 0 then
			self.mult = self.mult*-1
			self.alpha = 0
		elseif self.alpha > 1 and self.mult < 0 then
			self.mult = self.mult*-1
		end
	end)
end

local function StartGlow(f)
	if not f:IsEnabled() then return end
	f:SetBackdropColor(r, g, b, .5)
	f:SetBackdropBorderColor(r, g, b)
	f.glow:SetAlpha(1)
	Skins:CreatePulse(f.glow)
end

local function StopGlow(f)
	if not f then return end
	f:SetBackdropColor(0, 0, 0, 0)
	f:SetBackdropBorderColor(bordercolorr, bordercolorg, bordercolorb)
	f.glow:SetScript("OnUpdate", nil)
	f.glow:SetAlpha(0)
end

function Skins:Reskin(f, noGlow)
	if not f then return end
	f:SetNormalTexture("")
	f:SetHighlightTexture("")
	f:SetPushedTexture("")
	f:SetDisabledTexture("")

	if f.Left then f.Left:SetAlpha(0) end
	if f.Middle then f.Middle:SetAlpha(0) end
	if f.Right then f.Right:SetAlpha(0) end
	if f.LeftSeparator then f.LeftSeparator:Hide() end
	if f.RightSeparator then f.RightSeparator:Hide() end

	f:SetTemplate("Default", true)

	if not noGlow then
		f.glow = CreateFrame("Frame", nil, f)
		f.glow:SetBackdrop({
			edgeFile = IC.Medias.Textures.glow,
			edgeSize = I:Scale(4),
		})
		f.glow:SetOutside(f, 4, 4)
		f.glow:SetBackdropBorderColor(r, g, b)
		f.glow:SetAlpha(0)

		f:HookScript("OnEnter", StartGlow)
		f:HookScript("OnLeave", StopGlow)
	end

	f.tex = Skins:CreateGradient(f)
end

function Skins:CreateTab(f)
	if not f then return end
	f:DisableDrawLayer("BACKGROUND")

	local bg = CreateFrame("Frame", nil, f)
	bg:Point("TOPLEFT", 8, -3)
	bg:Point("BOTTOMRIGHT", -8, 0)
	bg:SetFrameLevel(f:GetFrameLevel()-1)
	Skins:CreateBD(bg)

	f:SetHighlightTexture(IC.Medias.Textures.blank)
	local hl = f:GetHighlightTexture()
	hl:Point("TOPLEFT", 9, -4)
	hl:Point("BOTTOMRIGHT", -9, 1)
	hl:SetVertexColor(r, g, b, .25)
end

function Skins:ReskinScroll(f)
	if not f then return end
	if f:GetName() then
		local frame = f:GetName()

		if _G[frame.."Track"] then _G[frame.."Track"]:Hide() end
		if _G[frame.."BG"] then _G[frame.."BG"]:Hide() end
		if _G[frame.."Top"] then _G[frame.."Top"]:Hide() end
		if _G[frame.."Middle"] then _G[frame.."Middle"]:Hide() end
		if _G[frame.."Bottom"] then _G[frame.."Bottom"]:Hide() end

		local bu = _G[frame.."ThumbTexture"]
		bu:SetAlpha(0)
		bu:Width(17)

		bu.bg = CreateFrame("Frame", nil, f)
		bu.bg:Point("TOPLEFT", bu, 0, -2)
		bu.bg:Point("BOTTOMRIGHT", bu, 0, 4)
		Skins:CreateBD(bu.bg, 0)
		Skins:CreateBackdropTexture(f)
		f.backdropTexture:SetInside(bu.bg, 1, 1)

		local tex = Skins:CreateGradient(f)
		tex:Point("TOPLEFT", bu.bg, 1, -1)
		tex:Point("BOTTOMRIGHT", bu.bg, -1, 1)

		local up = _G[frame.."ScrollUpButton"]
		local down = _G[frame.."ScrollDownButton"]

		up:Width(17)
		down:Width(17)

		Skins:Reskin(up)
		Skins:Reskin(down)

		up:SetDisabledTexture(IC.Medias.Textures.blank)
		local dis1 = up:GetDisabledTexture()
		dis1:SetVertexColor(0, 0, 0, .3)
		dis1:SetDrawLayer("OVERLAY")

		down:SetDisabledTexture(IC.Medias.Textures.blank)
		local dis2 = down:GetDisabledTexture()
		dis2:SetVertexColor(0, 0, 0, .3)
		dis2:SetDrawLayer("OVERLAY")

		local uptex = up:CreateTexture(nil, "ARTWORK")
		uptex:SetTexture("Interface\\AddOns\\IceUI\\medias\\textures\\arrow-up-active")
		uptex:Size(8, 8)
		uptex:SetPoint("CENTER")
		uptex:SetVertexColor(1, 1, 1)

		local downtex = down:CreateTexture(nil, "ARTWORK")
		downtex:SetTexture("Interface\\AddOns\\IceUI\\medias\\textures\\arrow-down-active")
		downtex:Size(8, 8)
		downtex:SetPoint("CENTER")
		downtex:SetVertexColor(1, 1, 1)
	else
		if f.Background then f.Background:SetTexture(nil) end
		if f.trackBG then f.trackBG:SetTexture(nil) end
		if f.Middle then f.Middle:SetTexture(nil) end
		if f.Top then f.Top:SetTexture(nil) end
		if f.Bottom then f.Bottom:SetTexture(nil) end
		if f.ScrollBarTop then f.ScrollBarTop:SetTexture(nil) end
		if f.ScrollBarBottom then f.ScrollBarBottom:SetTexture(nil) end
		if f.ScrollBarMiddle then f.ScrollBarMiddle:SetTexture(nil) end
		if f.ScrollUpButton and f.ScrollDownButton then
			if not f.ScrollUpButton.icon then
				Skins:Reskin(f.ScrollUpButton)
				f.ScrollUpButton:SetDisabledTexture(IC.Medias.Textures.blank)
				f.ScrollUpButton:Width(17)
				local uptex = f.ScrollUpButton:CreateTexture(nil, "ARTWORK")
				uptex:SetTexture("Interface\\AddOns\\IceUI\\medias\\textures\\arrow-up-active")
				uptex:Size(8, 8)
				uptex:SetPoint("CENTER")
				uptex:SetVertexColor(1, 1, 1)
				f.ScrollUpButton.icon = uptex
				local dis1 = f.ScrollUpButton:GetDisabledTexture()
				dis1:SetVertexColor(0, 0, 0, .3)
				dis1:SetDrawLayer("OVERLAY")
			end

			if not f.ScrollDownButton.icon then
				Skins:Reskin(f.ScrollDownButton)
				f.ScrollDownButton:SetDisabledTexture(IC.Medias.Textures.blank)
				f.ScrollDownButton:Width(17)
				local downtex = f.ScrollDownButton:CreateTexture(nil, "ARTWORK")
				downtex:SetTexture("Interface\\AddOns\\IceUI\\medias\\textures\\arrow-down-active")
				downtex:Size(8, 8)
				downtex:SetPoint("CENTER")
				downtex:SetVertexColor(1, 1, 1)
				f.ScrollDownButton.icon = downtex
				local dis2 = f.ScrollDownButton:GetDisabledTexture()
				dis2:SetVertexColor(0, 0, 0, .3)
				dis2:SetDrawLayer("OVERLAY")
			end
			
			if f.thumbTexture then
				local bu = f.thumbTexture
				bu:SetAlpha(0)
				bu:Width(17)

				bu.bg = CreateFrame("Frame", nil, f)
				bu.bg:Point("TOPLEFT", bu, 0, -2)
				bu.bg:Point("BOTTOMRIGHT", bu, 0, 4)
				Skins:CreateBD(bu.bg, 0)
				Skins:CreateBackdropTexture(f)
				f.backdropTexture:SetInside(bu.bg, 1, 1)

				local tex = Skins:CreateGradient(f)
				tex:Point("TOPLEFT", bu.bg, 1, -1)
				tex:Point("BOTTOMRIGHT", bu.bg, -1, 1)
			end
		end
	end
end

function Skins:ReskinDropDown(f)
	if not f then return end
	local frame = f:GetName()

	local left = _G[frame.."Left"]
	local middle = _G[frame.."Middle"]
	local right = _G[frame.."Right"]

	if left then left:SetAlpha(0) end
	if middle then middle:SetAlpha(0) end
	if right then right:SetAlpha(0) end

	local down = _G[frame.."Button"]

	down:ClearAllPoints()
	down:Point("TOPRIGHT", -18, -4)
	down:Point("BOTTOMRIGHT", -18, 8)
	down:SetWidth(19)

	Skins:Reskin(down)

	down:SetDisabledTexture(IC.Medias.Textures.blank)
	local dis = down:GetDisabledTexture()
	dis:SetVertexColor(0, 0, 0, .3)
	dis:SetDrawLayer("OVERLAY")
	dis:SetAllPoints(down)

	local downtex = down:CreateTexture(nil, "ARTWORK")
	downtex:SetTexture("Interface\\AddOns\\IceUI\\medias\\textures\\arrow-down-active")
	downtex:SetSize(8, 8)
	downtex:SetPoint("CENTER")
	downtex:SetVertexColor(1, 1, 1)

	local bg = CreateFrame("Frame", nil, f)
	bg:Point("TOPLEFT", 16, -4)
	bg:Point("BOTTOMRIGHT", -18, 8)
	bg:SetFrameLevel(f:GetFrameLevel()-1)
	Skins:CreateBD(bg, 0)
	Skins:CreateBackdropTexture(bg)

	local gradient = Skins:CreateGradient(f)
	gradient:Point("TOPLEFT", bg, 1, -1)
	gradient:Point("BOTTOMRIGHT", bg, -1, 1)
end

local function colourClose(f)
	if f:IsEnabled() then
		for _, pixel in pairs(f.pixels) do
			pixel:SetVertexColor(r, g, b)
		end
	end
end

local function clearClose(f)
	for _, pixel in pairs(f.pixels) do
		pixel:SetVertexColor(1, 1, 1)
	end
end

function Skins:ReskinClose(f, a1, p, a2, x, y)
	if not f then return end
	f:Size(17, 17)

	if not a1 then
		f:Point("TOPRIGHT", -4, -4)
	else
		f:ClearAllPoints()
		f:Point(a1, p, a2, x, y)
	end

	f:SetNormalTexture("")
	f:SetHighlightTexture("")
	f:SetPushedTexture("")
	f:SetDisabledTexture("")

	Skins:CreateBD(f, 0)
	Skins:CreateBackdropTexture(f)
	Skins:CreateGradient(f)

	f:SetDisabledTexture(IC.Medias.Textures.gloss)
	local dis = f:GetDisabledTexture()
	dis:SetVertexColor(0, 0, 0, .4)
	dis:SetDrawLayer("OVERLAY")
	dis:SetAllPoints()

	f.pixels = {}

	for i = 1, 7 do
		local tex = f:CreateTexture()
		tex:SetColorTexture(1, 1, 1)
		tex:Size(1, 1)
		tex:Point("BOTTOMLEFT", 4+i, 4+i)
		tinsert(f.pixels, tex)
	end

	for i = 1, 7 do
		local tex = f:CreateTexture()
		tex:SetColorTexture(1, 1, 1)
		tex:Size(1, 1)
		tex:Point("TOPLEFT", 4+i, -4-i)
		tinsert(f.pixels, tex)
	end

	f:HookScript("OnEnter", colourClose)
	f:HookScript("OnLeave", clearClose)

	-- local text = f:CreateFontString(nil, "OVERLAY")
	-- text:SetFont(IC.Medias.Textures.pxfont, R.mult*10, "OUTLINE,MONOCHROME")
	-- text:Point("CENTER", 2, 1)
	-- text:SetText("x")

	-- f:HookScript("OnEnter", function(self) text:SetTextColor(1, .1, .1) end)
	-- f:HookScript("OnLeave", function(self) text:SetTextColor(1, 1, 1) end)
end

function Skins:ReskinInput(f, height, width)
	if not f then return end
	local frame = f:GetName()
	if frame then
		if _G[frame.."Left"] then _G[frame.."Left"]:Hide() end
		if _G[frame.."Right"] then _G[frame.."Right"]:Hide() end
		if _G[frame.."Middle"] then _G[frame.."Middle"]:Hide() end
		if _G[frame.."Mid"] then _G[frame.."Mid"]:Hide() end
	end
	if f.Left then f.Left:Hide() end
	if f.Middle then f.Middle:Hide() end
	if f.Right then f.Right:Hide() end

	local bd = CreateFrame("Frame", nil, f)
	bd:Point("TOPLEFT", -2, 0)
	bd:SetPoint("BOTTOMRIGHT")
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	Skins:CreateBD(bd, 0)
	Skins:CreateBackdropTexture(f)

	local gradient = Skins:CreateGradient(f)
	gradient:Point("TOPLEFT", bd, 1, -1)
	gradient:Point("BOTTOMRIGHT", bd, -1, 1)

	if height then f:Height(height) end
	if width then f:Width(width) end
end

function Skins:ReskinArrow(f, direction)
	if not f then return end
	f:Size(18, 18)
	Skins:Reskin(f)

	f:SetDisabledTexture(IC.Medias.Textures.blank)
	local dis = f:GetDisabledTexture()
	dis:SetVertexColor(0, 0, 0, .3)
	dis:SetDrawLayer("OVERLAY")

	local tex = f:CreateTexture(nil, "ARTWORK")
	tex:Size(8, 8)
	tex:SetPoint("CENTER")

	tex:SetTexture("Interface\\AddOns\\IceUI\\medias\\textures\\arrow-"..direction.."-active")
end

function Skins:ReskinCheck(f)
	if not f then return end
	f:SetNormalTexture("")
	f:SetPushedTexture("")
	f:SetHighlightTexture(IC.Medias.Textures.blank)
	local hl = f:GetHighlightTexture()
	hl:SetInside(f, 5, 5)
	hl:SetVertexColor(r, g, b, .2)

	Skins:CreateBackdropTexture(f)
	f.backdropTexture:SetInside(f, 5, 5)

	local bd = CreateFrame("Frame", nil, f)
	bd:SetInside(f, 4, 4)
	bd:SetFrameLevel(f:GetFrameLevel())
	Skins:CreateBD(bd, 0)

	local tex = Skins:CreateGradient(f)
	tex:SetInside(f, 5, 5)

	local ch = f:GetCheckedTexture()
	ch:SetDesaturated(true)
	ch:SetVertexColor(r, g, b)
end

function Skins:ReskinSlider(f)
	if not f then return end
	f:SetBackdrop(nil)
	f.SetBackdrop = R.dummy

	local bd = CreateFrame("Frame", nil, f)
	bd:Point("TOPLEFT", 1, -2)
	bd:Point("BOTTOMRIGHT", -1, 3)
	bd:SetFrameStrata("BACKGROUND")
	bd:SetFrameLevel(f:GetFrameLevel()-1)
	Skins:CreateBD(bd, 0)
	Skins:CreateBackdropTexture(bd)

	local slider = select(4, f:GetRegions())
	slider:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	slider:SetBlendMode("ADD")
end

function Skins:SetBD(f, x, y, x2, y2)
	if not f then return end
	local bg = CreateFrame("Frame", nil, f)
	if not x then
		bg:SetPoint("TOPLEFT")
		bg:SetPoint("BOTTOMRIGHT")
	else
		bg:Point("TOPLEFT", x, y)
		bg:Point("BOTTOMRIGHT", x2, y2)
	end
	bg:SetFrameLevel(f:GetFrameLevel())
	Skins:CreateBD(bg)
	Skins:CreateSD(bg)
	f:HookScript("OnShow", function()
		bg:SetFrameLevel(f:GetFrameLevel())
	end)
end

function Skins:ReskinPortraitFrame(f, isButtonFrame)
	local name = f:GetName()

	_G[name.."Bg"]:Hide()
	_G[name.."TitleBg"]:Hide()
	_G[name.."Portrait"]:Hide()
	_G[name.."PortraitFrame"]:Hide()
	_G[name.."TopRightCorner"]:Hide()
	_G[name.."TopLeftCorner"]:Hide()
	_G[name.."TopBorder"]:Hide()
	_G[name.."TopTileStreaks"]:SetTexture("")
	_G[name.."BotLeftCorner"]:Hide()
	_G[name.."BotRightCorner"]:Hide()
	_G[name.."BottomBorder"]:Hide()
	_G[name.."LeftBorder"]:Hide()
	_G[name.."RightBorder"]:Hide()

	if isButtonFrame then
		_G[name.."BtnCornerLeft"]:SetTexture("")
		_G[name.."BtnCornerRight"]:SetTexture("")
		_G[name.."ButtonBottomBorder"]:SetTexture("")

		f.Inset.Bg:Hide()
		f.Inset:DisableDrawLayer("BORDER")
	end

	Skins:CreateBD(f)
	Skins:CreateSD(f)
	Skins:ReskinClose(_G[name.."CloseButton"])
end

function Skins:CreateBDFrame(f, a)
	local frame
	if f:GetObjectType() == "Texture" then
		frame = f:GetParent()
	else
		frame = f
	end

	local lvl = frame:GetFrameLevel()

	local bg = CreateFrame("Frame", nil, frame)
	bg:Point("TOPLEFT", f, -1, 1)
	bg:Point("BOTTOMRIGHT", f, 1, -1)
	bg:SetFrameLevel(lvl == 0 and 1 or lvl - 1)
	Skins:CreateBD(bg, a or alpha)
	return bg
end

function Skins:ReskinFilterButton(f)
	f.TopLeft:Hide()
	f.TopRight:Hide()
	f.BottomLeft:Hide()
	f.BottomRight:Hide()
	f.TopMiddle:Hide()
	f.MiddleLeft:Hide()
	f.MiddleRight:Hide()
	f.BottomMiddle:Hide()
	f.MiddleMiddle:Hide()

	Skins:Reskin(f)
	f.Icon:SetTexture(Skins["media"].arrowRight)

	f.Text:SetPoint("CENTER")
	f.Icon:SetPoint("RIGHT", f, "RIGHT", -5, 0)
	f.Icon:SetSize(8, 8)
end

local function colourArrow(f)
	if f:IsEnabled() then
		f.tex:SetVertexColor(r, g, b)
	end
end

local function clearArrow(f)
	f.tex:SetVertexColor(1, 1, 1)
end

Skins.colourArrow = colourArrow
Skins.clearArrow = clearArrow

function Skins:ReskinNavBar(f)
	local overflowButton = f.overflowButton
	if not f.GetRegions then return end

	f:GetRegions():Hide()
	f:DisableDrawLayer("BORDER")
	f.overlay:Hide()
	f.homeButton:GetRegions():Hide()

	Skins:Reskin(f.homeButton)
	Skins:Reskin(overflowButton, true)

	local tex = overflowButton:CreateTexture(nil, "ARTWORK")
	tex:SetTexture(Skins["media"].arrowLeft)
	tex:SetSize(8, 8)
	tex:SetPoint("CENTER")
	overflowButton.tex = tex

	overflowButton:HookScript("OnEnter", colourArrow)
	overflowButton:HookScript("OnLeave", clearArrow)
end

function Skins:ReskinIcon(icon)
	icon:SetTexCoord(.08, .92, .08, .92)
	Skins:CreateBG(icon)
end

function Skins:ReskinExpandOrCollapse(f)
	f:SetSize(13, 13)

	Skins:Reskin(f)
	f.SetNormalTexture = R.dummy

	f.minus = f:CreateTexture(nil, "OVERLAY")
	f.minus:Size(7, 1)
	f.minus:SetPoint("CENTER")
	f.minus:SetTexture(IC.Medias.Textures.gloss)
	f.minus:SetVertexColor(1, 1, 1)

	f.plus = f:CreateTexture(nil, "OVERLAY")
	f.plus:Size(1, 7)
	f.plus:SetPoint("CENTER")
	f.plus:SetTexture(IC.Medias.Textures.gloss)
	f.plus:SetVertexColor(1, 1, 1)
end

function Skins:RegisterSkin(name, loadFunc)
	if name == 'IceUI' then
		tinsert(self.SkinFuncs["IceUI"], loadFunc)
	else
		self.SkinFuncs[name] = loadFunc
	end
end

function Skins:ADDON_LOADED(event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") or addon == "IceUI" then return end
	if self.SkinFuncs[addon] then
		self.SkinFuncs[addon]()
		self.SkinFuncs[addon] = nil
	end
end

function Skins:PLAYER_ENTERING_WORLD(event, addon)
	if IsAddOnLoaded("Skinner") or IsAddOnLoaded("Aurora") then return end
	self:UnregisterEvent("PLAYER_ENTERING_WORLD")
	for t, skinfunc in pairs(self.SkinFuncs["IceUI"]) do
		if skinfunc then
			skinfunc()
		end
	end
	wipe(self.SkinFuncs["IceUI"])
end

function Skins:Enable()
	backdropfadecolorr, backdropfadecolorg, backdropfadecolorb, alpha = unpack(IC.Medias.Textures.backdropfadecolor)
	backdropcolorr, backdropcolorg, backdropcolorb = unpack(IC.Medias.Textures.backdropcolor)
	bordercolorr, bordercolorg, bordercolorb = unpack(IC.Medias.Textures.bordercolor)
	for addon, loadFunc in pairs(self.SkinFuncs) do
		if addon ~= "IceUI" then
			if IsAddOnLoaded(addon) then
				loadFunc()
				self.SkinFuncs[addon] = nil
			end
		end
	end

	Skins:RegisterEvent("ADDON_LOADED")
	Skins:RegisterEvent("PLAYER_ENTERING_WORLD")
end

I["Skins"] = Skins
