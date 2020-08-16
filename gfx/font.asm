PokemonLogoGraphics: INCBIN "gfx/title/pokemon_logo.2bpp"

IF DEF(_ENGLISH)
FontGraphics:: INCBIN "gfx/font/font.1bpp"
FontGraphicsEnd::
ENDC

IF DEF(_GERMAN)
FontGraphics:: INCBIN "gfx/font/font_de_fr.1bpp"
FontGraphicsEnd::
ENDC

ABTiles: INCBIN "gfx/font/AB.2bpp"

IF DEF(_ENGLISH)
HpBarAndStatusGraphics:: INCBIN "gfx/font/font_battle_extra.2bpp"
HpBarAndStatusGraphicsEnd::
ENDC

IF DEF(_GERMAN)
HpBarAndStatusGraphics:: INCBIN "gfx/font/font_battle_extra_de.2bpp"
HpBarAndStatusGraphicsEnd::
ENDC

BattleHudTiles1: INCBIN "gfx/battle/battle_hud_1.1bpp"
BattleHudTiles1End:
BattleHudTiles2: INCBIN "gfx/battle/battle_hud_2.1bpp"
BattleHudTiles3: INCBIN "gfx/battle/battle_hud_3.1bpp"
BattleHudTiles3End:

IF DEF(_ENGLISH)
NintendoCopyrightLogoGraphics: INCBIN "gfx/intro_credits/copyright.2bpp"

GamefreakLogoGraphics: INCBIN "gfx/title/gamefreak_inc.2bpp"
GamefreakLogoGraphicsEnd:
ENDC

IF DEF(_GERMAN)
NintendoCopyrightLogoGraphics: INCBIN "gfx/intro_credits/copyright_eur.2bpp"

GamefreakLogoGraphics: INCBIN "gfx/title/gamefreak_inc.2bpp"
NineTile:              INCBIN "gfx/title/copyright_9_tile.2bpp"
NineTileEnd:
ENDC

TextBoxGraphics:: INCBIN "gfx/font/font_extra.2bpp"
TextBoxGraphicsEnd::

IF DEF(_ENGLISH)
PokedexTileGraphics: INCBIN "gfx/pokedex/pokedex.2bpp"
PokedexTileGraphicsEnd:
ENDC

IF DEF(_GERMAN)
PokedexTileGraphics: INCBIN "gfx/pokedex/pokedex_eur.2bpp"
PokedexTileGraphicsEnd:
ENDC

WorldMapTileGraphics: INCBIN "gfx/town_map/town_map.2bpp"
WorldMapTileGraphicsEnd:

PlayerCharacterTitleGraphics: INCBIN "gfx/title/player.2bpp"
PlayerCharacterTitleGraphicsEnd:
