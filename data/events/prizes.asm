PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db CUBONE
	db BLASTYKE
IF DEF(_RED)
	db CLEFAIRY
ENDC
IF DEF(_BLUE)
	db JIGGLYPUFF
ENDC
	db "@"

PrizeMenuMon1Cost:
	bcd2 200
	bcd2 700
	bcd2 1200
	db "@"

PrizeMenuMon2Entries:
IF DEF(_RED)
	db SCYTHER
ENDC
IF DEF(_BLUE)
	db PINSIR
ENDC
	db CACTUS
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	bcd2 2500
	bcd2 4600
	bcd2 6500
	db "@"

PrizeMenuTMsEntries:
	db MOON_STONE
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	bcd2 3300
	bcd2 5500
	bcd2 7700
	db "@"
