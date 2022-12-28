Route16_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route16TrainerHeaders
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

Route16TrainerHeaders:
	def_trainers
Route16TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_0, 3, Route16BattleText1, Route16EndBattleText1, Route16AfterBattleText1
Route16TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_1, 2, Route16BattleText2, Route16EndBattleText2, Route16AfterBattleText2
Route16TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_2, 2, Route16BattleText3, Route16EndBattleText3, Route16AfterBattleText3
Route16TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_3, 2, Route16BattleText4, Route16EndBattleText4, Route16AfterBattleText4
Route16TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_4, 2, Route16BattleText5, Route16EndBattleText5, Route16AfterBattleText5
Route16TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_16_TRAINER_5, 4, Route16BattleText6, Route16EndBattleText6, Route16AfterBattleText6
	db -1 ; end

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
