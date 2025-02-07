PokemonLogoGraphics: INCBIN "gfx/title/pokemon_logo.2bpp"
FontGraphics:: INCBIN "gfx/font/font.1bpp"
FontGraphicsEnd::

ABTiles: INCBIN "gfx/font/AB.2bpp"

HpBarAndStatusGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp"
HpBarAndStatusGraphicsEnd::

BattleHudTiles1: INCBIN "gfx/battle/battle_hud_1.1bpp"
BattleHudTiles1End:
BattleHudTiles2: INCBIN "gfx/battle/battle_hud_2.1bpp"
BattleHudTiles3: INCBIN "gfx/battle/battle_hud_3.1bpp"
BattleHudTiles3End:

NintendoCopyrightLogoGraphics:
IF DEF(_BLUE)
INCBIN "gfx/splash/copyright_b.2bpp"
ELSE
INCBIN "gfx/splash/copyright.2bpp"
ENDC

GameFreakLogoGraphics: INCBIN "gfx/title/gamefreak_inc.2bpp"
GameFreakLogoGraphicsEnd:

TextBoxGraphics:: INCBIN "gfx/font/font_extra.2bpp"
TextBoxGraphicsEnd::

PokedexTileGraphics: INCBIN "gfx/pokedex/pokedex.2bpp"
PokedexTileGraphicsEnd:

WorldMapTileGraphics: INCBIN "gfx/town_map/town_map.2bpp"
WorldMapTileGraphicsEnd:

PlayerCharacterTitleGraphics:
IF DEF(_BLUE)
INCBIN "gfx/title/player_b.2bpp"
ELSE
INCBIN "gfx/title/player.2bpp"
ENDC

PlayerCharacterTitleGraphicsEnd:
