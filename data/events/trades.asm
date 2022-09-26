TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	db POLIWHIRL,  JYNX,      TRADE_DIALOGSET_CASUAL, "LOLA@@@@@@@" ; Jynx trade replaces the useless Nidorino one 
	db ABRA,       MR_MIME,   TRADE_DIALOGSET_CASUAL, "MARCEL@@@@@"
	db BUTTERFREE, BEEDRILL,  TRADE_DIALOGSET_HAPPY,  "CHIKUCHIKU@"
	db PONYTA,     SEEL,      TRADE_DIALOGSET_CASUAL, "SAILOR@@@@@"
	db SPEAROW,    FARFETCHD, TRADE_DIALOGSET_HAPPY,  "DUX@@@@@@@@"
	db SLOWBRO,    LICKITUNG, TRADE_DIALOGSET_CASUAL, "MARC@@@@@@@"
	db MACHOKE,    HAUNTER,   TRADE_DIALOGSET_POLITE, "GHOSUKE@@@@" ; From JP Blue
	db KADABRA,    GRAVELER,  TRADE_DIALOGSET_POLITE, "SABURO@@@@@" ; From JP Blue
	db VENONAT,    TANGELA,   TRADE_DIALOGSET_HAPPY,  "CRINKLES@@@"
	db NIDORAN_M,  NIDORAN_F, TRADE_DIALOGSET_HAPPY,  "SPOT@@@@@@@"
	db NO_MON,     NO_MON, 	  TRADE_DIALOGSET_SELF,   "Unseen@@@@@"
	assert_table_length NUM_NPC_TRADES
