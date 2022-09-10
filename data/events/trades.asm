; PureRGBnote: CHANGED: different in-game trades

TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; Japanese Red and Green used TRADE_DIALOGSET_CASUAL, and had
	; the same species as English Red and Blue.
	db ODDISH,     PONYTA,    TRADE_DIALOGSET_CASUAL, "Seabiscuit@" ; route 11
	db DROWZEE,    GRIMER,    TRADE_DIALOGSET_CASUAL, "Goopinator@" ; route 2
	db ALAKAZAM,   MAGNETON,  TRADE_DIALOGSET_SPROCKET, "SPROCKET@@@" ; cerulean city rocket house basement
	db PONYTA,     MACHOP,    TRADE_DIALOGSET_CASUAL_COLOR, "HulkSmash@@" ; cinnabar lab
	db ONIX,       GASTLY,    TRADE_DIALOGSET_HAPPY,  "Nebula@@@@@" ; vermilion city
	db TAUROS,     LICKITUNG, TRADE_DIALOGSET_CASUAL_COLOR, "Saliva@@@@@" ; route 18 
	db PIDGEOTTO,  SEEL,      TRADE_DIALOGSET_EVOLUTION, "Slappy@@@@@" ; cerulean city
	db DITTO,      ZUBAT,     TRADE_DIALOGSET_EVOLUTION_COLOR, "EmeraldSDB@" ; cinnabar lab
	db LAPRAS,     SNORLAX,   TRADE_DIALOGSET_HAPPY_COLOR,  "Fatso@@@@@@" ; cinnabar lab 
	db VOLTORB,    TANGELA,   TRADE_DIALOGSET_HAPPY,  "Discombob@@" ; route 5
	assert_table_length NUM_NPC_TRADES

; PureRGBnote: ADDED: some received pokemon use alternate color palettes if the feature is enabled

TradeMonPalettes:
	db %10101100
	db %01