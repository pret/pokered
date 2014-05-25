Func_1a3e0: ; 1a3e0 (6:63e0)
	ld hl, $d730
	res 1, [hl]
	call HandleDoors
	jr nc, .asm_1a406
	ld a, $fc
	ld [wJoyIgnore], a
	ld hl, $d736
	set 1, [hl]
	ld a, $1
	ld [$cd38], a
	ld a, $80
	ld [$ccd3], a
	xor a
	ld [$c102], a
	call Func_3486
	ret
.asm_1a406
	xor a
	ld [$cd3a], a
	ld [$cd38], a
	ld [$ccd3], a
	ld hl, $d736
	res 0, [hl]
	res 1, [hl]
	ld hl, $d730
	res 7, [hl]
	ret

Func_1a41d: ; 1a41d (6:641d)
	ld hl, $d730
	res 7, [hl]
	ld hl, $d72e
	res 7, [hl]
	ld hl, $d736
	res 0, [hl]
	res 1, [hl]
	xor a
	ld [$cf17], a
	ld [$cc57], a
	ld [$cf10], a
	ld [$cd3a], a
	ld [$cd38], a
	ld [$ccd3], a
	ret

PointerTable_1a442: ; 1a442 (6:6442)
	dw Func_1a44c
	dw Func_1a485
	dw Func_1a4a1
	dw Func_1a4a6
	dw Func_1a4f4

Func_1a44c: ; 1a44c (6:644c)
	ld a, [W_XCOORD] ; $d362
	sub $a
	ld [$cca1], a
	jr z, .asm_1a475
	ld b, $0
	ld c, a
	ld hl, $cc97
	ld a, $80
	call FillMemory
	ld [hl], $ff
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	ld de, $cc97
	call MoveSprite
	ld a, $1
	ld [$cf10], a
	jr .asm_1a47a
.asm_1a475
	ld a, $3
	ld [$cf10], a
.asm_1a47a
	ld hl, W_FLAGS_D733
	set 1, [hl]
	ld a, $fc
	ld [wJoyIgnore], a
	ret

Func_1a485: ; 1a485 (6:6485)
	ld a, [$d730]
	bit 0, a
	ret nz
	ld a, [$cca1]
	ld [$cd38], a
	ld [$ff95], a
	ld a, $23
	call Predef
	call Func_3486
	ld a, $2
	ld [$cf10], a
	ret

Func_1a4a1: ; 1a4a1 (6:64a1)
	ld a, [$cd38]
	and a
	ret nz

Func_1a4a6: ; 1a4a6 (6:64a6)
	xor a
	ld [$cd3b], a
	ld a, [$cf13]
	swap a
	ld [$cf17], a
	xor a
	ld [$c206], a
	ld hl, $ccd3
	ld de, RLEList_1a4e9
	call DecodeRLEList
	dec a
	ld [$cd38], a
	ld hl, $cc97
	ld de, RLEList_1a4dc
	call DecodeRLEList
	ld hl, $d72e
	res 7, [hl]
	ld hl, $d730
	set 7, [hl]
	ld a, $4
	ld [$cf10], a
	ret

RLEList_1a4dc: ; 1a4dc (6:64dc)
	db $00, $05
	db $80, $01
	db $00, $05
	db $C0, $03
	db $40, $01
	db $E0, $01
	db $FF

RLEList_1a4e9: ; 1a4e9 (6:64e9)
	db $40, $02
	db $10, $03
	db $80, $05
	db $20, $01
	db $80, $06
	db $FF

Func_1a4f4: ; 1a4f4 (6:64f4)
	ld a, [$cd38]
	and a
	ret nz
	ld a, $0
	ld [$cc4d], a
	ld a, $11
	call Predef ; indirect jump to RemoveMissableObject (f1d7 (3:71d7))
	ld hl, $d730
	res 7, [hl]
	ld hl, $d72e
	res 7, [hl]
	jp Func_314e

PointerTable_1a510: ; 1a510 (6:6510)
	dw Func_1a514
	dw Func_1a56b

Func_1a514: ; 1a514 (6:6514)
	ld a, Bank(Func_9876)
	ld [$c0ef], a
	ld [$c0f0], a
	ld a, MUSIC_MUSEUM_GUY
	ld [$c0ee], a
	call PlaySound
	ld a, [$cf13]
	swap a
	ld [$cf17], a
	call Func_3486
	ld hl, $ccd3
	ld de, RLEList_PewterMuseumPlayer
	call DecodeRLEList
	dec a
	ld [$cd38], a
	xor a
	ld [$d12f], a
	ld a, $4f
	call Predef
	ld hl, $cc97
	ld de, RLEList_PewterMuseumGuy
	call DecodeRLEList
	ld hl, $d72e
	res 7, [hl]
	ld a, $1
	ld [$cf10], a
	ret

RLEList_PewterMuseumPlayer: ; 1a559 (6:6559)
	db $00, $01
	db $40, $03
	db $20, $0D
	db $40, $06
	db $FF

RLEList_PewterMuseumGuy: ; 1a562 (6:6562)
	db $40, $06
	db $80, $0D
	db $40, $03
	db $80, $01
	db $FF

Func_1a56b: ; 1a56b (6:656b)
	ld a, [$cd38]
	and a
	ret nz
	ld hl, $d730
	res 7, [hl]
	ld hl, $d72e
	res 7, [hl]
	jp Func_314e

PointerTable_1a57d: ; 1a57d (6:657d)
	dw Func_1a581
	dw Func_1a56b

Func_1a581: ; 1a581 (6:6581)
	ld a, Bank(Func_9876)
	ld [$c0ef], a
	ld [$c0f0], a
	ld a, MUSIC_MUSEUM_GUY
	ld [$c0ee], a
	call PlaySound
	ld a, [$cf13]
	swap a
	ld [$cf17], a
	xor a
	ld [$c206], a
	ld hl, $ccd3
	ld de, RLEList_PewterGymPlayer
	call DecodeRLEList
	dec a
	ld [$cd38], a
	ld a, $1
	ld [$d12f], a
	ld a, $4f
	call Predef
	ld hl, $cc97
	ld de, RLEList_PewterGymGuy
	call DecodeRLEList
	ld hl, $d72e
	res 7, [hl]
	ld hl, $d730
	set 7, [hl]
	ld a, $1
	ld [$cf10], a
	ret

RLEList_PewterGymPlayer: ; 1a5cd (6:65cd)
	db $00, $01
	db $10, $02
	db $80, $05
	db $20, $0B
	db $40, $05
	db $20, $0F
	db $FF

RLEList_PewterGymGuy: ; 1a5da (6:65da)
	db $00, $02
	db $80, $0F
	db $40, $05
	db $80, $0B
	db $00, $05
	db $C0, $03
	db $FF

; XXX why would this function want to return on POKEMONTOWER_7?
Func_1a5e7: ; 1a5e7 (6:65e7)
	ld a, [W_CURMAP] ; $d35e
	cp POKEMONTOWER_7
	ret z
	ld hl, RivalIDs ; $6605
	ld a, [wEngagedTrainerClass]
	ld b, a
.loop
	ld a, [hli]
	cp $ff
	jr z, .notRival
	cp b
	ret z
	jr .loop
.notRival
	ld a, [$cf13]
	ld [H_DOWNARROWBLINKCNT2], a ; $ff8c
	jp SetSpriteMovementBytesToFF

RivalIDs: ; 1a605 (6:6605)
	db SONY1 + $c8
	db SONY2 + $c8
	db SONY3 + $c8
	db $ff
