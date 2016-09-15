local I, IC, L = select(2, ...):unpack()
local T, C = Tukui:unpack()

-- Create our own fonts
local TukuiFont = _G["TukuiFont"]
TukuiFont:SetFont(C["Medias"].Font, 12)

local TukuiFontOutline = _G["TukuiFontOutline"]
TukuiFontOutline:SetFont(C["Medias"].Font, 12, "THINOUTLINE")

local TukuiUFFont = _G["TukuiUFFont"]
TukuiUFFont:SetFont(C["Medias"].UnitFrameFont, 12)

local TukuiUFFontOutline = _G["TukuiUFFontOutline"]
TukuiUFFontOutline:SetFont(C["Medias"].UnitFrameFont, 12, "THINOUTLINE")

local PixelFont = _G["TukuiPixelFont"]
PixelFont:SetFont(C["Medias"].PixelFont, 12, "MONOCHROMEOUTLINE")
