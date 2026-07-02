MACRO npctrade
; give mon, get mon, dialog id, nickname
	db \1, \2, \3
	dname \4, NAME_LENGTH
ENDM

TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	; TRADE_DIALOGSET_EVOLUTION did not refer to evolution in Japanese
	; Red/Green. Japanese Blue changed _AfterTrade2Text to say your Pokémon
	; "went and evolved" and also changed the trades to match. English
	; Red/Blue uses the original JP Red/Green trades but with the JP Blue
	; post-trade text. English Yellow changed _AfterTrade2Text to
	; not mention evolution.
	npctrade NIDORINO,   NIDORINA,  TRADE_DIALOGSET_CASUAL,    "TERRY"      ; used in ROUTE_11_GATE_2F
	npctrade ABRA,       MR_MIME,   TRADE_DIALOGSET_CASUAL,    "MARCEL"     ; used in ROUTE_2_TRADE_HOUSE
	npctrade BUTTERFREE, BEEDRILL,  TRADE_DIALOGSET_HAPPY,     "CHIKUCHIKU" ; unused
	npctrade PONYTA,     SEEL,      TRADE_DIALOGSET_CASUAL,    "SAILOR"     ; used in CINNABAR_LAB_FOSSIL_ROOM
	npctrade SPEAROW,    FARFETCHD, TRADE_DIALOGSET_HAPPY,     "DUX"        ; used in VERMILION_TRADE_HOUSE
	npctrade SLOWBRO,    LICKITUNG, TRADE_DIALOGSET_CASUAL,    "MARC"       ; used in ROUTE_18_GATE_2F
	npctrade POLIWHIRL,  JYNX,      TRADE_DIALOGSET_EVOLUTION, "LOLA"       ; used in CERULEAN_TRADE_HOUSE
	npctrade RAICHU,     ELECTRODE, TRADE_DIALOGSET_EVOLUTION, "DORIS"      ; used in CINNABAR_LAB_TRADE_ROOM
	npctrade VENONAT,    TANGELA,   TRADE_DIALOGSET_HAPPY,     "CRINKLES"   ; used in CINNABAR_LAB_TRADE_ROOM
	npctrade NIDORAN_M,  NIDORAN_F, TRADE_DIALOGSET_HAPPY,     "SPOT"       ; used in UNDERGROUND_PATH_ROUTE_5
	assert_table_length NUM_NPC_TRADES
