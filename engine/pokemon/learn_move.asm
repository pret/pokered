LearnMove:
	call SaveScreenTilesToBuffer1
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, wNameBuffer
	ld de, wLearnMoveMonName
	ld bc, NAME_LENGTH
	rst _CopyData

DontAbandonLearning:
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2Moves - wPartyMon1Moves
	ld a, [wWhichPokemon]
	call AddNTimes
	ld d, h
	ld e, l
	ld b, NUM_MOVES
.findEmptyMoveSlotLoop
	ld a, [hl]
	and a
	jr z, .next
	inc hl
	dec b
	jr nz, .findEmptyMoveSlotLoop
	push de
	call TryingToLearn
	pop de
	jp c, AbandonLearning
	push hl
	push de
	ld [wNamedObjectIndex], a
	call GetMoveName
	ld hl, OneTwoAndText
	rst _PrintText
	pop de
	pop hl
.next
	ld a, [wMoveNum]
	ld [hl], a
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc
	push hl
	push de
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wBuffer
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wBuffer + 5] ; a = move's max PP
	pop de
	pop hl
	ld [hl], a
	ld a, [wIsInBattle]
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
	rst _CopyData
	ld bc, wPartyMon1PP - wPartyMon1OTID
	add hl, bc
	ld de, wBattleMonPP
	ld bc, NUM_MOVES
	rst _CopyData
	jp PrintLearnedMove
; PureRGBnote: CHANGED: amount of text is reduced in some scenarios
AbandonLearning:
	CheckEvent FLAG_LEARNING_TM_MOVE
	jr nz, .skipText ; skip this text if learning by TM
	ld hl, AbandonLearningText
	rst _PrintText
	hlcoord 14, 7
	lb bc, 8, 15
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ld a, [wCurrentMenuItem]
	and a
	jp nz, DontAbandonLearning
.skipText
	ld hl, DidNotLearnText
	rst _PrintText
	ld b, 0
	ResetEvent FLAG_LEARNING_TM_MOVE
	ret

; PureRGBnote: CHANGED: amount of text is reduced in some scenarios
PrintLearnedMove:
	ld hl, LearnedMove1Text
	rst _PrintText
	ld b, 1
	ResetEvent FLAG_LEARNING_TM_MOVE
	ret

; PureRGBnote: CHANGED: amount of text is reduced in some scenarios
TryingToLearn:
	push hl
	CheckEvent FLAG_LEARNING_TM_MOVE
	ld hl, CantLearnMoreThanFourMoves
	jr nz, .skipTryingToLearnText
	ld hl, TryingToLearnText
	rst _PrintText
	ld hl, ButCantLearnMoreThanFourMoves

.skipTryingToLearnText

	CheckEvent EVENT_HIDE_ALREADY_HAS_FOUR_MOVES_MSG
	jr nz, .skipFourMovesQuestion

	rst _PrintText
	SetEvent FLAG_SKIP_MULTI_CHOICE_LOADGBPAL
	ld hl, YesNoHideTM
	ld b, A_BUTTON | B_BUTTON
	call DisplayMultiChoiceTextBox
	jr nz, .no ; if B button was pressed assume "no"
	ld a, [wCurrentMenuItem]
	and a
	jr z, .yes ; jump if yes was chosen
	cp 1
	jr z, .no ; return if no was chosen

	SetEvent EVENT_HIDE_ALREADY_HAS_FOUR_MOVES_MSG ; set this flag if SKIP was chosen
	ld hl, SkippedForeverText2
	rst _PrintText
	jr .yes
.no
	pop hl
	scf
	ret
.yes
.skipFourMovesQuestion
	pop hl
	ld bc, -NUM_MOVES
	add hl, bc
	push hl
	ld de, wMoves
	ld bc, NUM_MOVES
	rst _CopyData
	callfar FormatMovesString
	pop hl
.loop
	push hl
	ld hl, WhichMoveToForgetText
	rst _PrintText
	hlcoord 4, 7
	lb bc, 4, 14
	call TextBoxBorder
	hlcoord 6, 8
	ld de, wMovesString
	ldh a, [hUILayoutFlags]
	set BIT_SINGLE_SPACED_LINES, a
	ldh [hUILayoutFlags], a
	call PlaceString
	ldh a, [hUILayoutFlags]
	res BIT_SINGLE_SPACED_LINES, a
	ldh [hUILayoutFlags], a
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
	ld a, A_BUTTON | START | B_BUTTON ; PureRGBnote: ADDED: START button is tracked in this menu 
	ld [hli], a ; wMenuWatchedKeys
	ld [hl], 0 ; wLastMenuItem
	ld hl, hUILayoutFlags
	set BIT_DOUBLE_SPACED_MENU, [hl]
.menuLoop
	call HandleMenuInput
	bit BIT_A_BUTTON, a ; PureRGBnote: FIXED: Press START to learn a move instead of A to prevent accidental mashing A move-forget woes
	jr nz, .pressStart
	ld hl, hUILayoutFlags
	res BIT_DOUBLE_SPACED_MENU, [hl]
	push af
	call LoadScreenTilesFromBuffer1
	pop af
	pop hl
	bit BIT_B_BUTTON, a
	jr nz, .cancel
	push hl
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	push hl
	push af
	cp STRENGTH ; PureRGBnote: FIXED: if we are allowed to forget HM moves, strength needs to be turned off when we forget it
	call z, ResetStrengthOverworldBit
	pop af
	cp SURF ; PureRGBnote: FIXED: if we are allowed to forget HM moves, surf needs to be turned off when we forget it
	call z, ResetSurfOverworldBit
	pop hl
	pop bc
	;push bc   ; PureRGBnote: FIXED: moves are never considered HMs and can always be deleted if desired
	;call IsMoveHM
	;pop bc
	pop de
	ld a, d
	;jr c, .hm
	pop hl
	add hl, bc
	and a
	ret
;.hm ; FIXED: moves are never considered HMs and can always be deleted if desired
;	ld hl, HMCantDeleteText
;	rst _PrintText
;	pop hl
;	jr .loop
.pressStart ; PureRGBnote: FIXED: explain the start button is used to select a move now if A is pressed.
	push hl
	ld hl, PressStartToLearnText
	rst _PrintText
	pop hl
	jr .menuLoop
.cancel
	scf
	ret

ResetStrengthOverworldBit:
	ld d, STRENGTH
	callfar IsMoveInParty
	ld a, d ; how many pokemon with strength are in current party
	cp 2
	ret nc ; don't clear the bit if another pokemon has strength still
	ld hl, wStatusFlags1
	res BIT_STRENGTH_ACTIVE, [hl]
	ret

ResetSurfOverworldBit:
	; if we're currently surfing, don't clear the autosurf bit, because landing on an island without surf could softlock the player
	ld a, [wWalkBikeSurfState]
	cp SURFING
	ret z
	ld d, SURF
	callfar IsMoveInParty
	ld a, d ; how many pokemon with surf are in current party
	cp 2
	ret nc ; don't clear the bit if another pokemon has surf still
	; check if the player is on an island or map where we want to keep surf active even if deleted
	callfar CheckInSurfRestrictedMapOrArea
	ret c ; if so, don't clear the autosurf bit to avoid softlocks
	ld hl, wStatusFlags1
	res BIT_AUTOSURF, [hl]
	ret

LearnedMove1Text:
	text_far _LearnedMove1Text
	sound_get_item_1 ; plays SFX_GET_ITEM_1 in the party menu (rare candy) and plays SFX_LEVEL_UP in battle
	text_promptbutton
	text_end

WhichMoveToForgetText:
	text_far _WhichMoveToForgetText
	text_end

AbandonLearningText:
	text_far _AbandonLearningText
	text_end

DidNotLearnText:
	text_far _DidNotLearnText
	text_end

TryingToLearnText:
	text_far _TryingToLearnText
	text_end

PressStartToLearnText:
	text_far _PressStartToLearnText
	text_end

OneTwoAndText:
	text_far _OneTwoAndText
	text_pause
	text_asm
	ld a, [wIsInBattle]
	and a
	jr nz, .inBattlePoof ; PureRGBnote: FIXED: SFX_SWAP doesn't exist in the battle audio engine so it would play an arbitrary sound
	ld a, SFX_SWAP
	call PlaySoundWaitForCurrent
	jr .done
.inBattlePoof
	push bc
	farcall Music_LearnMovePoofInBattle ; play in-battle poof sound the same way the pokeflute is played in battle
	pop bc
.done
	ld hl, PoofText
	ret

PoofText:
	text_far _PoofText
	text_pause
ForgotAndText:
	text_far _ForgotAndText
	text_end

ButCantLearnMoreThanFourMoves:
	text_far _ButCantLearnMoreThanFourMoves
	; fall through
CantLearnMoreThanFourMoves:
	text_far _CantLearnMoreThanFourMoves
	text_end

SkippedForeverText2:
	text_far _SkippedForever
	text_end

;HMCantDeleteText: ; PureRGBnote: FIXED: moves are never considered HMs and can always be deleted if desired
;	text_far _HMCantDeleteText
;	text_end
