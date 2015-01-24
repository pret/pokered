PrizeDifferentMenuPtrs: ; 52843 (14:6843)
	dw PrizeMenuMon1Entries
	dw PrizeMenuMon1Cost

	dw PrizeMenuMon2Entries
	dw PrizeMenuMon2Cost

	dw PrizeMenuTMsEntries
	dw PrizeMenuTMsCost

NoThanksText: ; 5284f (14:684f)
	db "NO THANKS@"

PrizeMenuMon1Entries: ; 52859 (14:6859)
	db ABRA
	db CLEFAIRY
IF DEF(_RED)
	db NIDORINA
ENDC
IF DEF(_BLUE)
	db NIDORINO
ENDC
	db "@"

PrizeMenuMon1Cost: ; 5285d (14:685d)
IF DEF(_RED)
	db $01,$80 ; 180 Coins
	db $05,$00 ; 500 Coins
ENDC
IF DEF(_BLUE)
	db $01,$20 ; 120 Coins
	db $07,$50 ; 750 Coins
ENDC
	db $12,$00 ; 1200 Coins
	db "@"

PrizeMenuMon2Entries: ; 52864 (14:6864)
IF DEF(_RED)
	db DRATINI
	db SCYTHER
ENDC
IF DEF(_BLUE)
	db PINSIR
	db DRATINI
ENDC
	db PORYGON
	db "@"

PrizeMenuMon2Cost: ; 52868 (14:6868)
IF DEF(_RED)
	db $28,$00 ; 2800 Coins
	db $55,$00 ; 5500 Coins
	db $99,$99 ; 9999 Coins
ENDC
IF DEF(_BLUE)
	db $25,$00 ; 2500 Coins
	db $46,$00 ; 4600 Coins
	db $65,$00 ; 6500 Coins
ENDC
	db "@"

PrizeMenuTMsEntries: ; 5286f (14:686f)
	db TM_23
	db TM_15
	db TM_50
	db "@"

PrizeMenuTMsCost: ; 52873 (14:6873)
	db $33,$00 ; 3300 Coins
	db $55,$00 ; 5500 Coins
	db $77,$00 ; 7700 Coins
	db "@"
