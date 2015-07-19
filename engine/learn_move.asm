LearnMove: ; 6e43 (1:6e43)
	call SaveScreenTilesToBuffer1
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, wcd6d
	ld de, wd036
	ld bc, $b
	call CopyData

DontAbandonLearning: ; 6e5b (1:6e5b)
	ld hl, wPartyMon1Moves
	ld bc, $2c
	ld a, [wWhichPokemon]
	call AddNTimes
	ld d, h
	ld e, l
	ld b, $4
.asm_6e6b
	ld a, [hl]
	and a
	jr z, .asm_6e8b
	inc hl
	dec b
	jr nz, .asm_6e6b
	push de
	call TryingToLearn
	pop de
	jp c, AbandonLearning
	push hl
	push de
	ld [wd11e], a
	call GetMoveName
	ld hl, OneTwoAndText
	call PrintText
	pop de
	pop hl
.asm_6e8b
	ld a, [wMoveNum]
	ld [hl], a
	ld bc, $15
	add hl, bc
	push hl
	push de
	dec a
	ld hl, Moves
	ld bc, $6
	call AddNTimes
	ld de, wHPBarMaxHP
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wHPBarNewHP + 1]
	pop de
	pop hl
	ld [hl], a
	ld a, [W_ISINBATTLE]
	and a
	jp z, PrintLearnedMove
	ld a, [wWhichPokemon]
	ld b, a
	ld a, [wPlayerMonNumber]
	cp b
	jp nz, PrintLearnedMove
	ld h, d
	ld l, e
	ld de, wBattleMonMoves
	ld bc, NUM_MOVES
	call CopyData
	ld bc, $11
	add hl, bc
	ld de, wBattleMonPP
	ld bc, $4
	call CopyData
	jp PrintLearnedMove

AbandonLearning: ; 6eda (1:6eda)
	ld hl, AbandonLearningText
	call PrintText
	coord hl, 14, 7
	ld bc, $80f
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jp nz, DontAbandonLearning
	ld hl, DidNotLearnText
	call PrintText
	ld b, $0
	ret

PrintLearnedMove: ; 6efe (1:6efe)
	ld hl, LearnedMove1Text
	call PrintText
	ld b, $1
	ret

TryingToLearn: ; 6f07 (1:6f07)
	push hl
	ld hl, TryingToLearnText
	call PrintText
	coord hl, 14, 7
	ld bc, $80f
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	pop hl
	ld a, [wCurrentMenuItem]
	rra
	ret c
	ld bc, $fffc
	add hl, bc
	push hl
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callab FormatMovesString
	pop hl
.asm_6f39
	push hl
	ld hl, WhichMoveToForgetText
	call PrintText
	coord hl, 4, 7
	ld b, $4
	ld c, $e
	call TextBoxBorder
	coord hl, 6, 8
	ld de, wMovesString
	ld a, [hFlags_0xFFF6]
	set 2, a
	ld [hFlags_0xFFF6], a
	call PlaceString
	ld a, [hFlags_0xFFF6]
	res 2, a
	ld [hFlags_0xFFF6], a
	ld hl, wTopMenuItemY
	ld a, 8
	ld [hli], a ; wTopMenuItemY
	ld a, 5
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, [wNumMovesMinusOne]
	ld [hli], a ; wMaxMenuItem
	ld a, A_BUTTON | B_BUTTON
	ld [hli], a ; wMenuWatchedKeys
	ld [hl], 0 ; wLastMenuItem
	ld hl, hFlags_0xFFF6
	set 1, [hl]
	call HandleMenuInput
	ld hl, hFlags_0xFFF6
	res 1, [hl]
	push af
	call LoadScreenTilesFromBuffer1
	pop af
	pop hl
	bit 1, a
	jr nz, .asm_6fab
	push hl
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	call IsMoveHM
	pop bc
	pop de
	ld a, d
	jr c, .asm_6fa2
	pop hl
	add hl, bc
	and a
	ret
.asm_6fa2
	ld hl, HMCantDeleteText
	call PrintText
	pop hl
	jr .asm_6f39
.asm_6fab
	scf
	ret

LearnedMove1Text: ; 6fb4 (1:6fb4)
	TX_FAR _LearnedMove1Text
	db $b,6,"@"

WhichMoveToForgetText: ; 6fb4 (1:6fb4)
	TX_FAR _WhichMoveToForgetText
	db "@"

AbandonLearningText: ; 6fb9 (1:6fb9)
	TX_FAR _AbandonLearningText
	db "@"

DidNotLearnText: ; 6fbe (1:6fbe)
	TX_FAR _DidNotLearnText
	db "@"

TryingToLearnText: ; 6fc3 (1:6fc3)
	TX_FAR _TryingToLearnText
	db "@"

OneTwoAndText: ; 6fc8 (1:6fc8)
	TX_FAR _OneTwoAndText
	db $a
	TX_ASM
	ld a, SFX_SWAP
	call PlaySoundWaitForCurrent
	ld hl, PoofText
	ret

PoofText: ; 6fd7 (1:6fd7)
	TX_FAR _PoofText
	db $a
ForgotAndText: ; 6fdc (1:6fdc)
	TX_FAR _ForgotAndText
	db "@"

HMCantDeleteText: ; 6fe1 (1:6fe1)
	TX_FAR _HMCantDeleteText
	db "@"
