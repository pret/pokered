UndergroundPathEntranceRoute5Script: ; 5d6a9 (17:56a9)
	ld a, ROUTE_5
	ld [wLastMap], a
	ret

UndergroundPathEntranceRoute5_5d6af: ; 5d6af (17:56af)
	db "@"

UndergroundPathEntranceRoute5TextPointers: ; 5d6b0 (17:56b0)
	dw UndergroundPathEntranceRoute5Text1

UndergroundPathEntranceRoute5Text1: ; 5d6b2 (17:56b2)
	db $08 ; asm
	ld a, $9
	ld [wWhichTrade], a
	predef Predef54
	ld hl, UndergroundPathEntranceRoute5_5d6af
	ret
