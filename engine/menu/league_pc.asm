PKMNLeaguePC: ; 0x7657e
	ld hl, AccessedHoFPCText
	call PrintText
	ld hl, wd730
	set 6, [hl]
	push hl
	ld a, [wcfcb]
	push af
	ld a, [$ffD7]
	push af
	xor a
	ld [$ffD7], a
	ld [W_SPRITEFLIPPED], a
	ld [wcfcb], a
	ld [wTrainerScreenX], a
	ld [wcd42], a
	ld a, [wd5a2]
	ld b, a
	cp a, $33
	jr c, .first
	ld b, $32
	sub b
	ld [wcd42], a
.first
	ld hl, wcd42
	inc [hl]
	push bc
	ld a, [wTrainerScreenX]
	ld [wWhichTrade], a
	callba Func_73b3f
	call Func_765e5
	pop bc
	jr c, .second
	ld hl, wTrainerScreenX
	inc [hl]
	ld a, [hl]
	cp b
	jr nz, .first
.second
	pop af
	ld [$ffD7], a
	pop af
	ld [wcfcb], a
	pop hl
	res 6, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	call GoPAL_SET_CF1C
	jp GBPalNormal

Func_765e5: ; 765e5 (1d:65e5)
	ld c, 6
.third
	push bc
	call Func_76610
	call WaitForTextScrollButtonPress
	ld a, [hJoyHeld]
	bit 1, a
	jr nz, .fifth
	ld hl, wcc6b
	ld de, wcc5b
	ld bc, $0050
	call CopyData
	pop bc
	ld a, [wcc5b]
	cp a, $FF
	jr z, .fourth
	dec c
	jr nz, .third
.fourth
	and a
	ret
.fifth
	pop bc
	scf
	ret

Func_76610: ; 76610 (1d:6610)
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld hl, wcc5b
	ld a, [hli]
	ld [wWhichTrade], a
	ld [wcf91], a
	ld [wd0b5], a
	ld [wcfd9], a
	ld [wcf1d], a
	ld a, [hli]
	ld [wTrainerFacingDirection], a
	ld de, wcd6d
	ld bc, $000B
	call CopyData
	ld b, $0B
	ld c, 0
	call GoPAL_SET
	FuncCoord 12, 5
	ld hl, Coord
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	call GBPalNormal
	FuncCoord 0, 13
	ld hl, Coord
	ld b, 2
	ld c, $12
	call TextBoxBorder
	FuncCoord 1, 15
	ld hl, Coord
	ld de, HallOfFameNoText
	call PlaceString
	FuncCoord 16, 15
	ld hl, Coord
	ld de, wcd42
	ld bc, $0103
	call PrintNumber
	ld b, BANK(Func_702f0)
	ld hl, Func_702f0
	jp Bankswitch

HallOfFameNoText: ; 76670 (1d:6670)
	db "HALL OF FAME No   @"

AccessedHoFPCText: ; 76683 (1d:6683)
	TX_FAR _AccessedHoFPCText
	db "@"
