Func_3ad0e: ; 3ad0e (e:6d0e)
	ld hl, wccd3
	xor a
	ld [hl], a
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld c, a
	ld b, $1
	call Func_3b057

Func_3ad1c: ; 3ad1c (e:6d1c)
	ld a, [$ffd7]
	push af
	xor a
	ld [wd121], a
	dec a
	ld [wWhichPokemon], a ; wWhichPokemon
	push hl
	push bc
	push de
	ld hl, wPartyCount ; wPartyCount
	push hl
asm_3ad2e: ; 3ad2e (e:6d2e)
	ld hl, wWhichPokemon ; wWhichPokemon
	inc [hl]
	pop hl
	inc hl
	ld a, [hl]
	cp $ff
	jp z, Func_3aede
	ld [wHPBarMaxHP], a
	push hl
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld c, a
	ld hl, wccd3
	ld b, $2
	call Func_3b057
	ld a, c
	and a
	jp z, asm_3ad2e
	ld a, [wHPBarMaxHP]
	dec a
	ld b, $0
	ld hl, EvosMovesPointerTable
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, [wcf91]
	push af
	xor a
	ld [wcc49], a
	call LoadMonData
	pop af
	ld [wcf91], a
	pop hl

Func_3ad71: ; 3ad71 (e:6d71)
	ld a, [hli]
	and a
	jr z, asm_3ad2e
	ld b, a
	cp $3
	jr z, .asm_3ad91
	ld a, [W_ISLINKBATTLE] ; W_ISLINKBATTLE
	cp $32
	jr z, asm_3ad2e
	ld a, b
	cp $2
	jr z, .asm_3ada4
	ld a, [wccd4]
	and a
	jr nz, asm_3ad2e
	ld a, b
	cp $1
	jr z, .asm_3adad
.asm_3ad91
	ld a, [W_ISLINKBATTLE] ; W_ISLINKBATTLE
	cp $32
	jp nz, Func_3aed9
	ld a, [hli]
	ld b, a
	ld a, [wcfb9]
	cp b
	jp c, asm_3ad2e
	jr .asm_3adb6
.asm_3ada4
	ld a, [hli]
	ld b, a
	ld a, [wcf91]
	cp b
	jp nz, Func_3aed9
.asm_3adad
	ld a, [hli]
	ld b, a
	ld a, [wcfb9]
	cp b
	jp c, Func_3aeda
.asm_3adb6
	ld [W_CURENEMYLVL], a ; W_CURENEMYLVL
	ld a, $1
	ld [wd121], a
	push hl
	ld a, [hl]
	ld [wHPBarMaxHP + 1], a
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld hl, wPartyMonNicks ; wPartyMonNicks
	call GetPartyMonName
	call CopyStringToCF4B
	ld hl, IsEvolvingText
	call PrintText
	ld c, $32
	call DelayFrames
	xor a
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld hl, wTileMap
	ld bc, $c14
	call ClearScreenArea
	ld a, $1
	ld [H_AUTOBGTRANSFERENABLED], a ; $ffba
	ld a, $ff
	ld [wcfcb], a
	call ClearSprites
	callab Func_7bde9
	jp c, Func_3af2e
	ld hl, EvolvedText
	call PrintText
	pop hl
	ld a, [hl]
	ld [wd0b5], a
	ld [wcf98], a
	ld [wHPBarMaxHP + 1], a
	ld a, MONSTER_NAME
	ld [W_LISTTYPE], a
	ld a, $e
	ld [wPredefBank], a
	call GetName
	push hl
	ld hl, IntoText
	call Func_3c59
	ld a, (SFX_02_3b - SFX_Headers_02) / 3
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld c, $28
	call DelayFrames
	call ClearScreen
	call Func_3aef7
	ld a, [wd11e]
	push af
	ld a, [wd0b5]
	ld [wd11e], a
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld hl, BaseStats
	ld bc, $1c
	call AddNTimes
	ld de, W_MONHEADER
	call CopyData
	ld a, [wd0b5]
	ld [W_MONHDEXNUM], a
	pop af
	ld [wd11e], a
	ld hl, wcfa8
	ld de, wcfba
	ld b, $1
	call CalcStats
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld hl, wPartyMon1Species ; wPartyMon1Species (aliases: wPartyMon1)
	ld bc, $2c
	call AddNTimes
	ld e, l
	ld d, h
	push hl
	push bc
	ld bc, $22
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, wcfbb
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, wcf9a
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a
	dec hl
	pop bc
	call CopyData
	ld a, [wd0b5]
	ld [wd11e], a
	xor a
	ld [wcc49], a
	call Func_3af5b
	pop hl
	predef SetPartyMonTypes
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	and a
	call z, Func_3af52
	predef IndexToPokedex
	ld a, [wd11e]
	dec a
	ld c, a
	ld b, $1
	ld hl, wPokedexOwned ; wPokedexOwned
	push bc
	call Func_3b057
	pop bc
	ld hl, wPokedexSeen ; wd30a
	call Func_3b057
	pop de
	pop hl
	ld a, [wcf98]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jr Func_3aeda

Func_3aed9: ; 3aed9 (e:6ed9)
	inc hl

Func_3aeda: ; 3aeda (e:6eda)
	inc hl
	jp Func_3ad71

Func_3aede: ; 3aede (e:6ede)
	pop de
	pop bc
	pop hl
	pop af
	ld [$ffd7], a
	ld a, [W_ISLINKBATTLE] ; W_ISLINKBATTLE
	cp $32
	ret z
	ld a, [W_ISINBATTLE] ; W_ISINBATTLE
	and a
	ret nz
	ld a, [wd121]
	and a
	call nz, Func_2307
	ret

Func_3aef7: ; 3aef7 (e:6ef7)
	ld a, [wd0b5]
	push af
	ld a, [W_MONHDEXNUM]
	ld [wd0b5], a
	call GetName
	pop af
	ld [wd0b5], a
	ld hl, wcd6d
	ld de, wcf4b
.asm_3af0e
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp $50
	jr nz, .asm_3af0e
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld bc, $b
	ld hl, wPartyMonNicks ; wPartyMonNicks
	call AddNTimes
	push hl
	call GetName
	ld hl, wcd6d
	pop de
	jp CopyData

Func_3af2e: ; 3af2e (e:6f2e)
	ld hl, StoppedEvolvingText
	call PrintText
	call ClearScreen
	pop hl
	call Func_3af52
	jp asm_3ad2e

EvolvedText: ; 3af3e (e:6f3e)
	TX_FAR _EvolvedText
	db "@"

IntoText: ; 3af43 (e:6f43)
	TX_FAR _IntoText
	db "@"

StoppedEvolvingText: ; 3af48 (e:6f48)
	TX_FAR _StoppedEvolvingText
	db "@"

IsEvolvingText: ; 3af4d (e:6f4d)
	TX_FAR _IsEvolvingText
	db "@"

Func_3af52: ; 3af52 (e:6f52)
	ld a, [W_ISLINKBATTLE] ; W_ISLINKBATTLE
	cp $32
	ret z
	jp ReloadTilesetTilePatterns

Func_3af5b: ; 3af5b (e:6f5b)
	ld hl, EvosMovesPointerTable
	ld a, [wd11e]
	ld [wcf91], a
	dec a
	ld bc, $0
	ld hl, EvosMovesPointerTable
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.asm_3af73
	ld a, [hli]
	and a
	jr nz, .asm_3af73
.asm_3af77
	ld a, [hli]
	and a
	jr z, .asm_3afb1
	ld b, a
	ld a, [W_CURENEMYLVL] ; W_CURENEMYLVL
	cp b
	ld a, [hli]
	jr nz, .asm_3af77
	ld d, a
	ld a, [wcc49]
	and a
	jr nz, .asm_3af96
	ld hl, wPartyMon1Moves ; wPartyMon1Moves
	ld a, [wWhichPokemon] ; wWhichPokemon
	ld bc, $2c
	call AddNTimes
.asm_3af96
	ld b, $4
.asm_3af98
	ld a, [hli]
	cp d
	jr z, .asm_3afb1
	dec b
	jr nz, .asm_3af98
	ld a, d
	ld [wd0e0], a
	ld [wd11e], a
	call GetMoveName
	call CopyStringToCF4B
	predef LearnMove
.asm_3afb1
	ld a, [wcf91]
	ld [wd11e], a
	ret

; writes the moves a mon has at level [W_CURENEMYLVL] to [de]
; move slots are being filled up sequentially and shifted if all slots are full
; [wHPBarMaxHP]: (?)
WriteMonMoves: ; 3afb8 (e:6fb8)
	call GetPredefRegisters
	push hl
	push de
	push bc
	ld hl, EvosMovesPointerTable
	ld b, $0
	ld a, [wcf91]  ; cur mon ID
	dec a
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.skipEvoEntriesLoop
	ld a, [hli]
	and a
	jr nz, .skipEvoEntriesLoop
	jr .firstMove
.nextMove
	pop de
.nextMove2
	inc hl
.firstMove
	ld a, [hli]       ; read level of next move in learnset
	and a
	jp z, .done       ; end of list
	ld b, a
	ld a, [W_CURENEMYLVL] ; W_CURENEMYLVL
	cp b
	jp c, .done       ; mon level < move level (assumption: learnset is sorted by level)
	ld a, [wHPBarMaxHP]
	and a
	jr z, .skipMinLevelCheck
	ld a, [wWhichTrade] ; wWhichTrade (min move level)
	cp b
	jr nc, .nextMove2 ; min level >= move level
.skipMinLevelCheck
	push de
	ld c, $4
.moveAlreadyLearnedCheckLoop
	ld a, [de]
	inc de
	cp [hl]
	jr z, .nextMove
	dec c
	jr nz, .moveAlreadyLearnedCheckLoop
	pop de
	push de
	ld c, $4
.findEmptySlotLoop
	ld a, [de]
	and a
	jr z, .writeMoveToSlot2
	inc de
	dec c
	jr nz, .findEmptySlotLoop
	pop de                        ; no empty move slots found
	push de
	push hl
	ld h, d
	ld l, e
	call WriteMonMoves_ShiftMoveData ; shift all moves one up (deleting move 1)
	ld a, [wHPBarMaxHP]
	and a
	jr z, .writeMoveToSlot
	push de
	ld bc, $12
	add hl, bc
	ld d, h
	ld e, l
	call WriteMonMoves_ShiftMoveData ; shift all move PP data one up
	pop de
.writeMoveToSlot
	pop hl
.writeMoveToSlot2
	ld a, [hl]
	ld [de], a
	ld a, [wHPBarMaxHP]
	and a
	jr z, .nextMove
	push hl            ; write move PP value
	ld a, [hl]
	ld hl, $15
	add hl, de
	push hl
	dec a
	ld hl, Moves
	ld bc, $6
	call AddNTimes
	ld de, wHPBarMaxHP
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wHPBarNewHP + 1]
	pop hl
	ld [hl], a
	pop hl
	jr .nextMove
.done
	pop bc
	pop de
	pop hl
	ret

; shifts all move data one up (freeing 4th move slot)
WriteMonMoves_ShiftMoveData: ; 3b04e (e:704e)
	ld c, $3
.asm_3b050
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .asm_3b050
	ret

Func_3b057: ; 3b057 (e:7057)
	predef_jump FlagActionPredef

INCLUDE "data/evos_moves.asm"
