; Much of this is a recoded version of the Champion's room, which serves the same purpose.

SilphGauntlet7F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, SilphGauntlet7F_ScriptPointers
	ld a, [wSilphGauntlet7FCurScript]
	jp CallFunctionInTable

ResetChiefScript:
	xor a
	ld [wJoyIgnore], a
	ld [wSilphGauntlet7FCurScript], a
	ret

SilphGauntlet7F_ScriptPointers:
	;dw ChiefScript0
	dw ChiefScript1
	dw ChiefScript2
	dw ChiefScript3

ChiefScript0:
	ret

ChiefScript1:
	ld a, $ff
	ld [wJoyIgnore], a
	ld hl, wSimulatedJoypadStatesEnd
	ld de, ChiefEntrance_RLEMovement
	call DecodeRLEList
	dec a
	ld [wSimulatedJoypadStatesIndex], a
	call StartSimulatingJoypadStates
	ld a, $2
	ld [wSilphGauntlet7FCurScript], a
	ret

ChiefEntrance_RLEMovement:
	db D_UP, 4
	db -1 ; end

ChiefScript2:
	ld a, [wSimulatedJoypadStatesIndex]
	and a
	ret nz
	call Delay3
	xor a
	ld [wJoyIgnore], a
	ld hl, wOptions
	res 7, [hl]  ; Turn on battle animations like with Blue
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call Delay3
	ld hl, wd72d
	set 6, [hl]
	set 7, [hl]
	ld hl, ChiefDefeatedText
	ld de, ChiefVictoryText
	call SaveEndBattleTextPointers
	
	ld a, OPP_CHIEF
	ld [wCurOpponent], a
	ld a, 1
	ld [wTrainerNo], a
	ld [wIsTrainerBattle], a
	ld a, $1
	
	xor a
	ldh [hJoyHeld], a
	ld a, $3
	ld [wSilphGauntlet7FCurScript], a
	ret

ChiefScript3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, ResetChiefScript
	xor a
	ld [wIsTrainerBattle], a
	call UpdateSprites
	SetEvent EVENT_BEAT_CHIEF
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, $1
	ldh [hSpriteIndexOrTextID], a
	call GaryScript_760c8
	ld a, $1
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld a, $4
	ld [wSilphGauntlet7FCurScript], a
	ret

SilphGauntlet7F_TextPointers:
	dw ChiefMonologue

ChiefMonologue:
	text_far _ChiefMonologue
	text_end

ChiefDefeatedText:
	text_far _ChiefDefeatedText
	text_end

ChiefVictoryText:
	text_far _ChiefVictoryText
	text_end

ChiefAfterBattleText:
	text_far _ChiefAfterBattleText
	text_end

	text_end