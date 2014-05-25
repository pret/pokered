PKMNLeaguePC: ; 0x7657e
	ld hl, AccessedHoFPCText
	call PrintText
	ld hl, $D730
	set 6, [hl]
	push hl
	ld a, [$CFCB]
	push af
	ld a, [$ffD7]
	push af
	xor a
	ld [$ffD7], a
	ld [W_SPRITEFLIPPED], a
	ld [$CFCB], a
	ld [$CD41], a
	ld [$CD42], a
	ld a, [$D5A2]
	ld b, a
	cp a, $33
	jr c, .first
	ld b, $32
	sub b
	ld [$CD42], a
.first
	ld hl, $CD42
	inc [hl]
	push bc
	ld a, [$CD41]
	ld [$CD3D], a
	callba Func_73b3f
	call Func_765e5
	pop bc
	jr c, .second
	ld hl, $CD41
	inc [hl]
	ld a, [hl]
	cp b
	jr nz, .first
.second
	pop af
	ld [$ffD7], a
	pop af
	ld [$CFCB], a
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
	ld hl, $CC6B
	ld de, $CC5B
	ld bc, $0050
	call CopyData
	pop bc
	ld a, [$CC5B]
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
	ld hl, $CC5B
	ld a, [hli]
	ld [$CD3D], a
	ld [$CF91], a
	ld [$D0B5], a
	ld [$CFD9], a
	ld [$CF1D], a
	ld a, [hli]
	ld [$CD3F], a
	ld de, $CD6D
	ld bc, $000B
	call CopyData
	ld b, $0B
	ld c, 0
	call GoPAL_SET
	FuncCoord 12, 5 ; $c410
	ld hl, Coord
	call GetMonHeader
	call LoadFrontSpriteByMonIndex
	call GBPalNormal
	FuncCoord 0, 13 ; $c4a4
	ld hl, Coord
	ld b, 2
	ld c, $12
	call TextBoxBorder
	FuncCoord 1, 15 ; $c4cd
	ld hl, Coord
	ld de, HallOfFameNoText
	call PlaceString
	FuncCoord 16, 15 ; $c4dc
	ld hl, Coord
	ld de, $CD42
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
