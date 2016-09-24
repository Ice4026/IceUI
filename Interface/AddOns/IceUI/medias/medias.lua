local I, IC, L = select(2, ...):unpack()
local T, C = Tukui:unpack()

local normal = [[Fonts\skurri.ttf]]
local combat = [[Fonts\skurri.ttf]]

if GetLocale() == "zhCN" then
    normal = [[Fonts\ARKai_T.ttf]]
    combat = [[Fonts\ARKai_C.ttf]]
elseif GetLocale() == "zhTW" then
    normal = [[Fonts\bLEI00D.ttf]]
    combat = [[Fonts\bKAI00M.ttf]]
end

--IceUI Medias
IC["Medias"] = {
    -- Fonts
    ["Fonts"] = {
        normal = normal,
        dmgfont = combat,
        pxfont = [[Interface\AddOns\IceUI\medias\fonts\pixel.ttf]],
        cdfont = [[Interface\AddOns\IceUI\medias\fonts\ROADWAY.ttf]],
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
