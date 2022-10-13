TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH, TradeMons
	; give mon, get mon, dialog id, nickname
	db POLIWHIRL,  JYNX,      TRADE_DIALOGSET_CASUAL, "LOLA@@@@@@@" ; Jynx trade replaces the useless Nidorino one 
	db ABRA,       MR_MIME,   TRADE_DIALOGSET_CASUAL, "MARCEL@@@@@"
	db BUTTERFREE, BEEDRILL,  TRADE_DIALOGSET_HAPPY,  "CHIKUCHIKU@"
	db HAUNTER,    KADABRA,   TRADE_DIALOGSET_POLITE, "HARRY@@@@@@"	; New trade to complete the 4 main trade evos
	db SPEAROW,    FARFETCHD, TRADE_DIALOGSET_HAPPY,  "DUX@@@@@@@@"
	db PERSIAN,    TAUROS,    TRADE_DIALOGSET_CASUAL, "JIMBO@@@@@@"	; From JP Blue
	db MACHOKE,    HAUNTER,   TRADE_DIALOGSET_POLITE, "MICHELLE@@@" ; From JP Blue
	db KADABRA,    GRAVELER,  TRADE_DIALOGSET_POLITE, "JENNY@@@@@@" ; From JP Blue
	db VENONAT,    TANGELA,   TRADE_DIALOGSET_HAPPY,  "CRINKLES@@@"
	db CUBONE,     MACHOKE,   TRADE_DIALOGSET_HAPPY,  "RICKY@@@@@@"	; From Yellow
	db NO_MON,     NO_MON, 	  TRADE_DIALOGSET_SELF,   "Unseen@@@@@"
	assert_table_length NUM_NPC_TRADES
