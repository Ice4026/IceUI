local I, IC, L = select(2, ...):unpack()
local T, C = Tukui:unpack()
-- local C
local Realm = I["Realm"]
local Name = I["MyName"]

-- if (TukuiConfigPerAccount) then
--     C = TukuiConfigShared.Account
-- else
--     C = TukuiConfigShared[Realm][Name]
-- end

C["General"] = {
    ["AutoScale"] = false,
    ["UIScale"] = 0.75,
    ["BackdropColor"] = { .05, .05, .05, .9},
    ["BorderColor"] = {0, 0, 0, 1},
    ["HideShadows"] = false,
}

C["ActionBars"] = {
    ["Enable"] = true,
    ["EquipBorder"] = true,
    ["HotKey"] = true,
    ["Macro"] = true,
    ["ShapeShift"] = true,
    ["Pet"] = true,
    ["SwitchBarOnStance"] = true,
    ["NormalButtonSize"] = 27,
    ["PetButtonSize"] = 25,
    ["ButtonSpacing"] = 4,
    ["HideBackdrop"] = true,
    ["Font"] = "Tukui Outline",
}

C["Auras"] = {
    ["Enable"] = true,
    ["Consolidate"] = false,
    ["Flash"] = false,
    ["ClassicTimer"] = true,
    ["HideBuffs"] = false,
    ["HideDebuffs"] = false,
    ["Animation"] = false,
    ["BuffsPerRow"] = 12,
    ["Font"] = "Tukui Outline",
}

C["Bags"] = {
    ["Enable"] = true,
    ["ButtonSize"] = 28,
    ["Spacing"] = 4,
    ["ItemsPerRow"] = 11,
    ["PulseNewItem"] = true,
    ["Font"] = "Tukui Outline",
    ["BagFilter"] = false,
}

C["Chat"] = {
    ["Enable"] = true,
    ["WhisperSound"] = true,
    ["LinkColor"] = {0.08, 1, 0.36},
    ["LinkBrackets"] = true,
    ["LootFrame"] = true,
    ["Background"] = false,
    ["ScrollByX"] = 3,
    ["TabFont"] = "Tukui",
    ["ChatFont"] = "Tukui",
}

C["Cooldowns"] = {
    ["Font"] = "Tukui Outline",
}

C["DataTexts"] = {
    ["Battleground"] = true,
    ["LocalTime"] = true,
    ["Time24HrFormat"] = false,
    ["NameColor"] = {1, 1, 1},
    ["ValueColor"] = {1, 1, 1},
    ["Font"] = "Tukui",
}

C["Merchant"] = {
    ["AutoSellGrays"] = true,
    ["SellMisc"] = true,
    ["AutoRepair"] = true,
    ["UseGuildRepair"] = true,
}

C["Misc"] = {
    ["ThreatBarEnable"] = true,
    ["AltPowerBarEnable"] = true,
    ["ExperienceEnable"] = true,
    ["ReputationEnable"] = true,
    ["ErrorFilterEnable"] = true,
    ["AutoInviteEnable"] = false,
    ["TalkingHeadEnable"] = true,
}

C["NamePlates"] = {
    ["Enable"] = true,
    ["Width"] = 110,
    ["Height"] = 6,
    ["CastHeight"] = 4,
    ["Texture"] = "Tukui",
    ["Font"] = "Tukui Outline",
}

C["Party"] = {
    ["Enable"] = true,
    ["Portrait"] = true,
    ["HealBar"] = true,
    ["ShowPlayer"] = true,
    ["ShowHealthText"] = true,
    ["RangeAlpha"] = 0.3,
    ["Font"] = "Tukui UF",
    ["HealthFont"] = "Tukui UF Outline",
    ["PowerTexture"] = "Tukui",
    ["HealthTexture"] = "Tukui",
}

C["Raid"] = {
    ["Enable"] = true,
    ["HealBar"] = true,
    ["AuraWatch"] = true,
    ["AuraWatchTimers"] = true,
    ["DebuffWatch"] = true,
    ["RangeAlpha"] = 0.3,
    ["ShowRessurection"] = true,
    ["ShowHealthText"] = true,
    ["ShowPets"] = true,
    ["VerticalHealth"] = false,
    ["Highlight"] = true,
    ["MaxUnitPerColumn"] = 10,
    ["Font"] = "Tukui UF",
    ["HealthFont"] = "Tukui UF Outline",
    ["PowerTexture"] = "Tukui",
    ["HealthTexture"] = "Tukui",
    ["GroupBy"] = {
        ["Options"] = {
            ["Group"] = "GROUP",
            ["Class"] = "CLASS",
            ["Role"] = "ROLE",
        },

        ["Value"] = "GROUP",
    },
}

C["Tooltips"] = {
    ["Enable"] = true,
    ["HideOnUnitFrames"] = false,
    ["UnitHealthText"] = true,
    ["ShowSpec"] = true,
    ["MouseOver"] = false,
    ["HealthFont"] = "Tukui Outline",
    ["HealthTexture"] = "Tukui",
}

C["UnitFrames"] = {
    ["Enable"] = true,
    ["Portrait"] = true,
    ["CastBar"] = true,
    ["ComboBar"] = true,
    ["UnlinkCastBar"] = true,
    ["CastBarIcon"] = true,
    ["CastBarLatency"] = true,
    ["Smooth"] = true,
    ["TargetEnemyHostileColor"] = true,
    ["CombatLog"] = false,
    ["HealBar"] = true,
    ["TotemBar"] = true,
    ["AnticipationBar"] = true,
    ["TargetAuras"] = true,
    ["FocusAuras"] = true,
    ["FocusTargetAuras"] = true,
    ["ArenaAuras"] = true,
    ["BossAuras"] = true,
    ["OnlySelfDebuffs"] = false,
    ["OnlySelfBuffs"] = false,
    ["Threat"] = false,
    ["AltPowerText"] = false,
    ["DarkTheme"] = false,
    ["Arena"] = true,
    ["Boss"] = true,
    ["Font"] = "Tukui UF Outline",
    ["PowerTexture"] = "Tukui",
    ["HealthTexture"] = "Tukui",
    ["CastTexture"] = "Tukui",
}

C["Medias"] = {
    -- Fonts
    ["Font"] = IC.Medias.Fonts.normal,
    ["UnitFrameFont"] = IC.Medias.Fonts.normal,
    ["DamageFont"] = IC.Medias.Fonts.combat,
    ["PixelFont"] = IC.Medias.Fonts.pxfont,
    ["ActionBarFont"] = IC.Medias.Fonts.normal,

    -- Textures
    ["Normal"] = [[Interface\AddOns\IceUI\Medias\textures\statusbar]],
    ["Glow"] = [[Interface\AddOns\IceUI\Medias\textures\glowTex]],
    ["Bubble"] = [[Interface\AddOns\Tukui\Medias\Textures\bubbleTex]],
    ["Copy"] = [[Interface\AddOns\Tukui\Medias\Textures\copy]],
    ["Blank"] = [[Interface\AddOns\IceUI\Medias\textures\blank]],
    ["HoverButton"] = [[Interface\AddOns\Tukui\Medias\Textures\button_hover]],
    ["Logo"] = [[Interface\AddOns\Tukui\Medias\Textures\logo]],

    -- colors
    ["BorderColor"] = C.General.BorderColor or { .5, .5, .5 },
    ["BackdropColor"] = C.General.BackdropColor or { .1,.1,.1 },

    -- sound
    ["Whisper"] = [[Interface\AddOns\Tukui\Medias\Sounds\whisper.mp3]],
    ["Warning"] = [[Interface\AddOns\Tukui\Medias\Sounds\warning.mp3]],
}