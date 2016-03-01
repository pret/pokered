TradeMons: ; 71b7b (1c:5b7b)
; givemonster, getmonster, textstring, nickname (11 bytes), 14 bytes total
IF DEF(_YELLOW)
	dw LICKITUNG, DUGTRIO
	db 0,"GURIO@@@@@@"

	dw CLEFAIRY,  MR_MIME
	db 0,"MILES@@@@@@"

	dw BUTTERFREE,BEEDRILL
	db 2,"STINGER@@@@"

	dw KANGASKHAN,MUK
	db 0,"STICKY@@@@@"

	dw MEW,       MEW
	db 2,"BART@@@@@@@"

	dw TANGELA,   PARASECT
	db 0,"SPIKE@@@@@@"

	dw PIDGEOT,   PIDGEOT
	db 1,"MARTY@@@@@@"

	dw GOLDUCK,   RHYDON
	db 1,"BUFFY@@@@@@"

	dw GROWLITHE, DEWGONG
	db 2,"CEZANNE@@@@"

	dw CUBONE,    MACHOKE
	db 2,"RICKY@@@@@@"

ELSE
	dw NIDORINO,  NIDORINA
	db 0,"TERRY@@@@@@"

	dw ABRA,      MR_MIME
	db 0,"MARCEL@@@@@"

	dw BUTTERFREE,BEEDRILL
	db 2,"CHIKUCHIKU@"

	dw PONYTA,    SEEL
	db 0,"SAILOR@@@@@"

	dw SPEAROW,   FARFETCHD
	db 2,"DUX@@@@@@@@"

	dw SLOWBRO,   LICKITUNG
	db 0,"MARC@@@@@@@"

	dw POLIWHIRL, JYNX
	db 1,"LOLA@@@@@@@"

	dw RAICHU,    ELECTRODE
	db 1,"DORIS@@@@@@"

	dw VENONAT,   TANGELA
	db 2,"CRINKLES@@@"

	dw NIDORAN_M, NIDORAN_F
	db 2,"SPOT@@@@@@@"

ENDC
