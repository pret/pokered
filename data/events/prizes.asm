PrizeDifferentMenuPtrs:
	dw PrizeMenuMon1Entries, PrizeMenuMon1Cost
	dw PrizeMenuMon2Entries, PrizeMenuMon2Cost
	dw PrizeMenuTMsEntries,  PrizeMenuTMsCost

NoThanksText:
	db "NO THANKS@"

PrizeMenuMon1Entries:
	db ABRA
	db CLEFAIRY
	db NIDORAN_F
	db "@"

PrizeMenuMon1Cost:
	coins 120
	coins 500
	coins 120
	db "@"

PrizeMenuMon2Entries:
	db DRATINI
	db DRATINI
	db PORYGON
	db "@"

PrizeMenuMon2Cost:
	coins 2500
	coins 2500
	coins 9999
	db "@"

PrizeMenuTMsEntries:
	db TM_DOUBLE_TEAM
	db TM_HYPER_BEAM
	db TM_SUBSTITUTE
	db "@"

PrizeMenuTMsCost:
	coins 3300
	coins 5500
	coins 7700
	db "@"
