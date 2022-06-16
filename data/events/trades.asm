TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	db GLOOM,      PONYTA,    TRADE_DIALOGSET_CASUAL, "Seabiscuit@" ; route 11
	db SCYTHER,    GRIMER,    TRADE_DIALOGSET_CASUAL, "Goopinator@" ; route 2
	db ALAKAZAM,    MAGNETON,  TRADE_DIALOGSET_SPROCKET, "SPROCKET@@@" ; cerulean city rocket house basement
	db PONYTA,     MACHOP,    TRADE_DIALOGSET_CASUAL, "HulkSmash@@" ; cinnabar lab
	db ONIX,       GASTLY,    TRADE_DIALOGSET_HAPPY,  "Nebula@@@@@" ; vermilion city
	db TAUROS,     LICKITUNG, TRADE_DIALOGSET_CASUAL, "Saliva@@@@@" ; route 18 
	db PIDGEOTTO,  SEEL,      TRADE_DIALOGSET_POLITE, "Slappy@@@@@" ; cerulean city
	db DITTO,      ZUBAT,     TRADE_DIALOGSET_POLITE, "EmeraldSDB@" ; cinnabar lab
	db LAPRAS,     SNORLAX,   TRADE_DIALOGSET_HAPPY,  "Fatso@@@@@@" ; cinnabar lab 
	db VOLTORB,    TANGELA,   TRADE_DIALOGSET_HAPPY,  "Discombob@@" ; route 5
	assert_table_length NUM_NPC_TRADES

TradeMonPalettes:
	db %10101100
	db %01