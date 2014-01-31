FanClubScript: ; 59b70 (16:5b70)
	jp EnableAutoTextBoxDrawing

Func_59b73: ; 59b73 (16:5b73)
	ld a, [$d771]
	bit 1, a
	ret nz
	ld b, $6
	call IsItemInBag
	ret nz
	ld b, $2d
	jp IsItemInBag

FanClubTextPointers: ; 59b84 (16:5b84)
	dw FanClubText1
	dw FanClubText2
	dw FanClubText3
	dw FanClubText4
	dw FanClubText5
	dw FanClubText6
	dw FanClubText7
	dw FanClubText8

FanClubText1: ; 59b94 (16:5b94)
	db $08 ; asm
	ld a, [$d771]
	bit 7, a
	jr nz, asm_67b22 ; 0x59b9a
	ld hl, UnnamedText_59bb7
	call PrintText
	ld hl, $d771
	set 6, [hl]
	jr asm_64f01 ; 0x59ba7
asm_67b22 ; 0x59ba9
	ld hl, UnnamedText_59bbc
	call PrintText
	ld hl, $d771
	res 7, [hl]
asm_64f01 ; 0x59bb4
	jp TextScriptEnd

UnnamedText_59bb7: ; 59bb7 (16:5bb7)
	TX_FAR _UnnamedText_59bb7
	db "@"

UnnamedText_59bbc: ; 59bbc (16:5bbc)
	TX_FAR _UnnamedText_59bbc
	db "@"

FanClubText2: ; 59bc1 (16:5bc1)
	db $08 ; asm
	ld a, [$d771]
	bit 6, a
	jr nz, asm_5cd59 ; 0x59bc7
	ld hl, UnnamedText_59be4
	call PrintText
	ld hl, $d771
	set 7, [hl]
	jr asm_59625 ; 0x59bd4
asm_5cd59 ; 0x59bd6
	ld hl, UnnamedText_59be9
	call PrintText
	ld hl, $d771
	res 6, [hl]
asm_59625 ; 0x59be1
	jp TextScriptEnd

UnnamedText_59be4: ; 59be4 (16:5be4)
	TX_FAR _UnnamedText_59be4
	db "@"

UnnamedText_59be9: ; 59be9 (16:5be9)
	TX_FAR _UnnamedText_59be9
	db "@"

FanClubText3: ; 59bee (16:5bee)
	db $8
	ld hl, UnnamedText_59c00
	call PrintText
	ld a, PIKACHU
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

UnnamedText_59c00: ; 59c00 (16:5c00)
	TX_FAR _UnnamedText_59c00
	db "@"

FanClubText4: ; 59c05 (16:5c05)
	db $08 ; asm
	ld hl, UnnamedText_59c17
	call PrintText
	ld a, SEEL
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd

UnnamedText_59c17: ; 59c17 (16:5c17)
	TX_FAR _UnnamedText_59c17
	db "@"

FanClubText5: ; 59c1c (16:5c1c)
	db $08 ; asm
	call Func_59b73
	jr nz, asm_38bb3 ; 0x59c20
	ld hl, UnnamedText_59c65
	call PrintText
	call YesNoChoice
	ld a, [$cc26]
	and a
	jr nz, asm_2c8d7 ; 0x59c2f
	ld hl, UnnamedText_59c6a
	call PrintText
	ld bc, (BIKE_VOUCHER << 8) | 1
	call GiveItem
	jr nc, .BagFull
	ld hl, ReceivedBikeVoucherText
	call PrintText
	ld hl, $d771
	set 1, [hl]
	jr asm_d3c26 ; 0x59c4a
.BagFull
	ld hl, UnnamedText_59c83
	call PrintText
	jr asm_d3c26 ; 0x59c52
asm_2c8d7 ; 0x59c54
	ld hl, UnnamedText_59c79
	call PrintText
	jr asm_d3c26 ; 0x59c5a
asm_38bb3 ; 0x59c5c
	ld hl, UnnamedText_59c7e
	call PrintText
asm_d3c26 ; 0x59c62
	jp TextScriptEnd

UnnamedText_59c65: ; 59c65 (16:5c65)
	TX_FAR _UnnamedText_59c65
	db "@"

UnnamedText_59c6a: ; 59c6a (16:5c6a)
	TX_FAR _UnnamedText_59c6a
	db "@"

ReceivedBikeVoucherText: ; 59c6f (16:5c6f)
	TX_FAR _ReceivedBikeVoucherText ; 0x9a82e
	db $11
	TX_FAR _UnnamedText_59c74 ; 0x9a844
	db "@"

UnnamedText_59c79: ; 59c79 (16:5c79)
	TX_FAR _UnnamedText_59c79
	db "@"

UnnamedText_59c7e: ; 59c7e (16:5c7e)
	TX_FAR _UnnamedText_59c7e
	db "@"

UnnamedText_59c83: ; 59c83 (16:5c83)
	TX_FAR _UnnamedText_59c83
	db "@"

FanClubText6: ; 59c88 (16:5c88)
	TX_FAR _FanClubText6
	db "@"

FanClubText7: ; 59c8d (16:5c8d)
	TX_FAR _FanClubText7
	db "@"

FanClubText8: ; 59c92 (16:5c92)
	TX_FAR _FanClubText8
	db "@"
	
