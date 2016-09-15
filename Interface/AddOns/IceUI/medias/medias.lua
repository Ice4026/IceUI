local I, IC, L = select(2, ...):unpack()
local T, C = Tukui:unpack()

C.Medias.Font = [=[Interface\Addons\IceUI\medias\fonts\normal_font.ttf]=]
C.Medias.UnitFrameFont = [[Interface\AddOns\IceUI\medias\fonts\uf_font.ttf]]
C.Medias.DamageFont = [[Interface\AddOns\IceUI\medias\fonts\combat_font.ttf]]
C.Medias.PixelFont = [=[Interface\Addons\IceUI\medias\fonts\pixel_font.ttf]=]
C.Medias.ActionBarFont = [=[Interface\Addons\IceUI\medias\fonts\actionbar_font.ttf]=]

--IceUI Medias
IC["Medias"] = {
    -- Fonts
    ["Fonts"] = {
        normal = [=[Interface\Addons\IceUI\medias\fonts\normal_font.ttf]=],
    },

    --Textures
    ["Textures"] = {
        normal = [[Interface\AddOns\IceUI\medias\textures\statusbar.tga]],
    },
}
