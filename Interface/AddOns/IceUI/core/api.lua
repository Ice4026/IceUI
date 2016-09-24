local I, IC, L = select(2, ...):unpack()
local T, C, _, _ = Tukui:unpack()

T.Mult = 768/string.match(T.Resolution, "%d+x(%d+)")/C.General.UIScale
T.Scale = function(x) return T.Mult*math.floor(x/T.Mult+.5) end

-- [[ API FUNCTIONS ]] --
local function SetTemplate(f, t, tex)
    local backdropa = 1
    if t == "Transparent" or t == "Border" then
        backdropa = 0.5
    end
    local borderr, borderg, borderb = unpack(C.General.BorderColor)
    local backdropr, backdropg, backdropb = unpack(C.General.BackdropColor)
    
    local texture = C.Medias.Blank

    if tex then
        texture = C.Medias.Normal
    end

    local edgeSize = T.Mult

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

local function CreateShadow(f, t)
    if f.Shadow then return end

    local frameLevel = f:GetFrameLevel() > 1 and f:GetFrameLevel() - 1 or 1
    local backdropr, backdropg, backdropb, backdropa = unpack(IC.Medias.Textures.backdropcolor)

    if t == "Background" then
        backdropr, backdropg, backdropb, backdropa = unpack(IC.Medias.Textures.backdropfadecolor)
    else
        backdropa = 0
    end
    
    local border = CreateFrame("Frame", nil, f)
    border:SetFrameLevel(frameLevel)
    border:SetOutside(f, 1, 1)
    border:SetTemplate("Border")
    hooksecurefunc(border, "SetFrameLevel", function(self, value)
        if value > frameLevel + 1 then
            border:SetFrameLevel(frameLevel)
        end
    end)
    f.Border = f.border or border

    local shadow = CreateFrame("Frame", nil, f)
    shadow:SetFrameLevel(1)
    shadow:SetFrameStrata(f:GetFrameStrata())
    shadow:Point("TOPLEFT", -3, 3)
    shadow:Point("BOTTOMLEFT", -3, -3)
    shadow:Point("TOPRIGHT", 3, 3)
    shadow:Point("BOTTOMRIGHT", 3, -3)

    if C["General"].HideShadows then
        shadow:SetBackdrop( {
            edgeFile = nil, edgeSize = 0,
            insets = {left = 0, right = 0, top = 0, bottom = 0},
        })
    else
        shadow:SetBackdrop( {
            edgeFile = C.Medias.Glow, edgeSize = T.Scale(3),
            insets = {left = T.Scale(5), right = T.Scale(5), top = T.Scale(5), bottom = T.Scale(5)},
        })
    end

    shadow:SetBackdropColor(backdropr, backdropg, backdropb, backdropa)
    shadow:SetBackdropBorderColor(0, 0, 0, 0.8)
    f.Shadow = shadow
end

---------------------------------------------------
-- Merge Tukui API with WoW API
---------------------------------------------------

local function AddAPI(object)
    local mt = getmetatable(object).__index
    mt.SetTemplate = SetTemplate
    mt.CreateShadow = CreateShadow
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
