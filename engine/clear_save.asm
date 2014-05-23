Func_1c98a: ; 1c98a (7:498a)
	call ClearScreen
	call GoPAL_SET_CF1C
	call LoadFontTilePatterns
	call LoadTextBoxTilePatterns
	ld hl, ClearSaveDataText
	call PrintText
	FuncCoord 14, 7 ; $c43a
	ld hl, Coord
	ld bc, $80f
	ld a, $7
	ld [$d12c], a
	ld a, $14
	ld [$d125], a
	call DisplayTextBoxID
	ld a, [wCurrentMenuItem] ; $cc26
	and a
	jp z, Init
	callba Func_73b6a
	jp Init

ClearSaveDataText: ; 1c9c1 (7:49c1)
	TX_FAR _ClearSaveDataText
	db "@"
