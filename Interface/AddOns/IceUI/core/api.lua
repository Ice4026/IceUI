local I, IC, L = select(2, ...):unpack()
local T, C, _, _ = Tukui:unpack()

T.Mult = 768/string.match(T.Resolution, "%d+x(%d+)")/C.General.UIScale
T.Scale = function(x) return T.Mult*math.floor(x/T.Mult+.5) end

-- [[ API FUNCTIONS ]] --
local function SetTemplate(f, t, tex)
    local balpha = 1
    if t == "Transparent" then balpha = 0.8 end
    local borderr, borderg, borderb = unpack(C.General.BorderColor)
    local backdropr, backdropg, backdropb = unpack(C.General.BackdropColor)
    local backdropa = balpha
    local texture = C.Medias.Blank

    if tex then
        texture = C.Medias.Normal
    end

    local edgeSize = T.Mult
    if t == "Nonborder" then
        edgeSize = 0.0001
    end

    f:SetBackdrop({
      bgFile = texture,
      edgeFile = C.Medias.Glow,
      tile = false, tileSize = 0, edgeSize = edgeSize,
    })

    if not f.isInsetDone then
        local shadow = CreateFrame("Frame", nil, f)
        local size = 3
        shadow:SetFrameLevel(f:GetFrameLevel())
        shadow:SetPoint("TOPLEFT", -size, size) 
        shadow:SetPoint("BOTTOMRIGHT", size, -size) 
        shadow:SetPoint("TOPRIGHT", size, size) 
        shadow:SetPoint("BOTTOMLEFT", -size, -size) 
        shadow:SetBackdrop({edgeFile = C.Medias.Glow, edgeSize = size})
        shadow:SetBackdropColor( .05, .05, .05, .9) 
        shadow:SetBackdropBorderColor(0, 0, 0, 1) 
        f.isInsetDone = true
    end

    f:SetBackdropColor(backdropr, backdropg, backdropb, backdropa)
    f:SetBackdropBorderColor(borderr, borderg, borderb)
end

---------------------------------------------------
-- Merge Tukui API with WoW API
---------------------------------------------------

local function AddAPI(object)
    local mt = getmetatable(object).__index
    mt.SetTemplate = SetTemplate
end

local Handled = {["Frame"] = true}

local Object = CreateFrame("Frame")
AddAPI(Object)
AddAPI(Object:CreateTexture())
AddAPI(Object:CreateFontString())

Object = EnumerateFrames()

while Object do
    if not Object:IsForbidden() and not Handled[Object:GetObjectType()] then
        AddAPI(Object)
        Handled[Object:GetObjectType()] = true
    end

    Object = EnumerateFrames(Object)
end
