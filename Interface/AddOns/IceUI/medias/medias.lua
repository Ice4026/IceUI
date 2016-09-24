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
        dmgfont = [=[Interface\Addons\IceUI\medias\fonts\normal_font.ttf]=],
        pxfont = [=[Interface\Addons\IceUI\medias\fonts\normal_font.ttf]=],
        cdfont = [=[Interface\Addons\IceUI\medias\fonts\normal_font.ttf]=],
        fontsize = 12,
        fontflag = "THINOUTLINE",
    },

    --Textures
    ["Textures"] = {
        normal = [[Interface\AddOns\IceUI\medias\textures\statusbar.tga]],
        blank = [[Interface\BUTTONS\WHITE8X8]],
        glow = [[Interface\AddOns\RayUI\media\glowTex.tga]],
        gloss = [[Interface\AddOns\RayUI\media\gloss.tga]],
        backdropcolor = { .1, .1, .1 },
        backdropfadecolor = { .04, .04, .04, .7 },
        bordercolor = { 0, 0, 0 },
    },
}
