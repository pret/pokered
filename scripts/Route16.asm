Route16_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route16TrainerHeader0
	ld de, Route16_ScriptPointers
	ld a, [wRoute16CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute16CurScript], a
	ret

Route16Script_59946:
	xor a
	ld [wJoyIgnore], a
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16_ScriptPointers:
	dw Route16Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw Route16Script3

Route16Script0:
	CheckEventHL EVENT_BEAT_ROUTE16_SNORLAX
	jp nz, CheckFightingMapTrainers
	CheckEventReuseHL EVENT_FIGHT_ROUTE16_SNORLAX
	ResetEventReuseHL EVENT_FIGHT_ROUTE16_SNORLAX
	jp z, CheckFightingMapTrainers
	ld a, $a
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLVL], a
	ld a, HS_ROUTE_16_SNORLAX
	ld [wMissableObjectIndex], a
	predef HideObject
	call UpdateSprites
	ld a, $3
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route16Script_59946
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .asm_599a8
	ld a, $b
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_599a8
	SetEvent EVENT_BEAT_ROUTE16_SNORLAX
	call Delay3
	ld a, $0
	ld [wRoute16CurScript], a
	ld [wCurMapScript], a
	ret

Route16_TextPointers:
	dw Route16Text1
	dw Route16Text2
	dw Route16Text3
	dw Route16Text4
	dw Route16Text5
	dw Route16Text6
	dw Route16Text7
	dw Route16Text8
	dw Route16Text9
	dw Route16Text10
	dw Route16Text11

Route16TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_0
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_0
	dw Route16BattleText1 ; TextBeforeBattle
	dw Route16AfterBattleText1 ; TextAfterBattle
	dw Route16EndBattleText1 ; TextEndBattle
	dw Route16EndBattleText1 ; TextEndBattle

Route16TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_1
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_1
	dw Route16BattleText2 ; TextBeforeBattle
	dw Route16AfterBattleText2 ; TextAfterBattle
	dw Route16EndBattleText2 ; TextEndBattle
	dw Route16EndBattleText2 ; TextEndBattle

Route16TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_2
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_2
	dw Route16BattleText3 ; TextBeforeBattle
	dw Route16AfterBattleText3 ; TextAfterBattle
	dw Route16EndBattleText3 ; TextEndBattle
	dw Route16EndBattleText3 ; TextEndBattle

Route16TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_3
	dw Route16BattleText4 ; TextBeforeBattle
	dw Route16AfterBattleText4 ; TextAfterBattle
	dw Route16EndBattleText4 ; TextEndBattle
	dw Route16EndBattleText4 ; TextEndBattle

Route16TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_4
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_4
	dw Route16BattleText5 ; TextBeforeBattle
	dw Route16AfterBattleText5 ; TextAfterBattle
	dw Route16EndBattleText5 ; TextEndBattle
	dw Route16EndBattleText5 ; TextEndBattle

Route16TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_16_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_16_TRAINER_5
	dw Route16BattleText6 ; TextBeforeBattle
	dw Route16AfterBattleText6 ; TextAfterBattle
	dw Route16EndBattleText6 ; TextEndBattle
	dw Route16EndBattleText6 ; TextEndBattle

	db $ff

Route16Text1:
	text_asm
	ld hl, Route16TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText1:
	text_far _Route16BattleText1
	text_end

Route16EndBattleText1:
	text_far _Route16EndBattleText1
	text_end

Route16AfterBattleText1:
	text_far _Route16AfterBattleText1
	text_end

Route16Text2:
	text_asm
	ld hl, Route16TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText2:
	text_far _Route16BattleText2
	text_end

Route16EndBattleText2:
	text_far _Route16EndBattleText2
	text_end

Route16AfterBattleText2:
	text_far _Route16AfterBattleText2
	text_end

Route16Text3:
	text_asm
	ld hl, Route16TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText3:
	text_far _Route16BattleText3
	text_end

Route16EndBattleText3:
	text_far _Route16EndBattleText3
	text_end

Route16AfterBattleText3:
	text_far _Route16AfterBattleText3
	text_end

Route16Text4:
	text_asm
	ld hl, Route16TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText4:
	text_far _Route16BattleText4
	text_end

Route16EndBattleText4:
	text_far _Route16EndBattleText4
	text_end

Route16AfterBattleText4:
	text_far _Route16AfterBattleText4
	text_end

Route16Text5:
	text_asm
	ld hl, Route16TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText5:
	text_far _Route16BattleText5
	text_end

Route16EndBattleText5:
	text_far _Route16EndBattleText5
	text_end

Route16AfterBattleText5:
	text_far _Route16AfterBattleText5
	text_end

Route16Text6:
	text_asm
	ld hl, Route16TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route16BattleText6:
	text_far _Route16BattleText6
	text_end

Route16EndBattleText6:
	text_far _Route16EndBattleText6
	text_end

Route16AfterBattleText6:
	text_far _Route16AfterBattleText6
	text_end

Route16Text7:
	text_far _Route16Text7
	text_end

Route16Text10:
	text_far _Route16Text10
	text_end

Route16Text11:
	text_far _Route16Text11
	text_end

Route16Text8:
	text_far _Route16Text8
	text_end

Route16Text9:
	text_far _Route16Text9
	text_end
