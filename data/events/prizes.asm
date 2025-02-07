PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db ABRA
IF DEF(_RED)
	db CLEFAIRY
	db NIDORINA
ENDC
IF DEF(_GREEN)
	db CLEFAIRY
	db NIDORINO
ENDC
IF DEF(_BLUE)
	db PIKACHU
	db HORSEA
ENDC
	db "@"

PrizeMenuMon1Cost:
IF DEF(_RED)
	bcd2 180
	bcd2 500
	bcd2 1200
ENDC
IF DEF(_GREEN)
	bcd2 120
	bcd2 750
	bcd2 1200
ENDC
IF DEF(_BLUE)
	bcd2 159
	bcd2 620
	bcd2 1000
ENDC
	db "@"

PrizeMenuMon2Entries:
IF DEF(_RED)
	db DRATINI
	db SCYTHER
ENDC
IF DEF(_GREEN)
	db PINSIR
	db DRATINI
ENDC
IF DEF(_BLUE)
	db CLEFABLE
	db DRAGONAIR
ENDC
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
IF DEF(_RED)
	bcd2 2800
	bcd2 5500
	bcd2 9999
ENDC
IF DEF(_GREEN)
	bcd2 2500
	bcd2 4600
	bcd2 6500
ENDC
IF DEF(_BLUE)
	bcd2 2880
	bcd2 5400
	bcd2 8300
ENDC
	db "@"

PrizeMenuTMsEntries:
	db TM_DRAGON_RAGE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 3300
	bcd2 5500
	bcd2 7700
	db "@"
