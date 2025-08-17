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
	; post-trade text.
	npctrade NIDORINO,   NIDORINA,  TRADE_DIALOGSET_CASUAL,    "TERRY"
	npctrade ABRA,       MR_MIME,   TRADE_DIALOGSET_CASUAL,    "MARCEL"
	npctrade BUTTERFREE, BEEDRILL,  TRADE_DIALOGSET_HAPPY,     "CHIKUCHIKU" ; unused
	npctrade PONYTA,     SEEL,      TRADE_DIALOGSET_CASUAL,    "SAILOR"
	npctrade SPEAROW,    FARFETCHD, TRADE_DIALOGSET_HAPPY,     "DUX"
	npctrade SLOWBRO,    LICKITUNG, TRADE_DIALOGSET_CASUAL,    "MARC"
	npctrade POLIWHIRL,  JYNX,      TRADE_DIALOGSET_EVOLUTION, "LOLA"
	npctrade RAICHU,     ELECTRODE, TRADE_DIALOGSET_EVOLUTION, "DORIS"
	npctrade VENONAT,    TANGELA,   TRADE_DIALOGSET_HAPPY,     "CRINKLES"
	npctrade NIDORAN_M,  NIDORAN_F, TRADE_DIALOGSET_HAPPY,     "SPOT"
	assert_table_length NUM_NPC_TRADES
