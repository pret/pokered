PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries
	dw PrizeMenuMon1Cost

	dw PrizeMenuMon2Entries
	dw PrizeMenuMon2Cost

	dw PrizeMenuTMsEntries
	dw PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	dw ABRA
	dw CLEFAIRY
IF DEF(_RED)
	dw NIDORINA
ENDC
IF DEF(_BLUE)
	dw NIDORINO
ENDC
	db "@"

PrizeMenuMon1Cost:
IF DEF(_RED)
	coins 180
	coins 500
ENDC
IF DEF(_BLUE)
	coins 120
	coins 750
ENDC
	coins 1200
	db "@"

PrizeMenuMon2Entries:
IF DEF(_RED)
	dw DRATINI
	dw SCYTHER
ENDC
IF DEF(_BLUE)
	dw PINSIR
	dw DRATINI
ENDC
	dw PORYGON
	db "@"

PrizeMenuMon2Cost:
IF DEF(_RED)
	coins 2800
	coins 5500
	coins 9999
ENDC
IF DEF(_BLUE)
	coins 2500
	coins 4600
	coins 6500
ENDC
	db "@"

PrizeMenuTMsEntries:
	dw TM_23
	dw TM_15
	dw TM_50
	db "@"

PrizeMenuTMsCost:
	coins 3300
	coins 5500
	coins 7700
	db "@"
