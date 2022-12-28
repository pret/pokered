Route12_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route12TrainerHeaders
	ld de, Route12_ScriptPointers
	ld a, [wRoute12CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute12CurScript], a
	ret

Route12Script_59606:
	xor a
	ld [wJoyIgnore], a
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12_ScriptPointers:
	dw Route12Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw Route12Script3

Route12Script0:
	CheckEventHL EVENT_BEAT_ROUTE12_SNORLAX
	jp nz, CheckFightingMapTrainers
	CheckEventReuseHL EVENT_FIGHT_ROUTE12_SNORLAX
	ResetEventReuseHL EVENT_FIGHT_ROUTE12_SNORLAX
	jp z, CheckFightingMapTrainers
	ld a, $d
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLVL], a
	ld a, HS_ROUTE_12_SNORLAX
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $3
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12Script3:
	ld a, [wIsInBattle]
	cp $ff
	jr z, Route12Script_59606
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .asm_59664
	ld a, $e
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_59664
	SetEvent EVENT_BEAT_ROUTE12_SNORLAX
	call Delay3
	ld a, $0
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12_TextPointers:
	dw Route12Text1
	dw Route12Text2
	dw Route12Text3
	dw Route12Text4
	dw Route12Text5
	dw Route12Text6
	dw Route12Text7
	dw Route12Text8
	dw PickUpItemText
	dw PickUpItemText
	dw Route12Text11
	dw Route12Text12
	dw Route12Text13
	dw Route12Text14

Route12TrainerHeaders:
	def_trainers 2
Route12TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_0, 4, Route12BattleText1, Route12EndBattleText1, Route12AfterBattleText1
Route12TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_1, 4, Route12BattleText2, Route12EndBattleText2, Route12AfterBattleText2
Route12TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_2, 4, Route12BattleText3, Route12EndBattleText3, Route12AfterBattleText3
Route12TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_3, 4, Route12BattleText4, Route12EndBattleText4, Route12AfterBattleText4
Route12TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_4, 4, Route12BattleText5, Route12EndBattleText5, Route12AfterBattleText5
Route12TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_5, 4, Route12BattleText6, Route12EndBattleText6, Route12AfterBattleText6
Route12TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_6, 1, Route12BattleText7, Route12EndBattleText7, Route12AfterBattleText7
	db -1 ; end

Route12Text1:
	text_far _Route12Text1
	text_end

Route12Text13:
	text_far _Route12Text13
	text_end

Route12Text14:
	text_far _Route12Text14
	text_end

Route12Text2:
	text_asm
	ld hl, Route12TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText1:
	text_far _Route12BattleText1
	text_end

Route12EndBattleText1:
	text_far _Route12EndBattleText1
	text_end

Route12AfterBattleText1:
	text_far _Route12AfterBattleText1
	text_end

Route12Text3:
	text_asm
	ld hl, Route12TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText2:
	text_far _Route12BattleText2
	text_end

Route12EndBattleText2:
	text_far _Route12EndBattleText2
	text_end

Route12AfterBattleText2:
	text_far _Route12AfterBattleText2
	text_end

Route12Text4:
	text_asm
	ld hl, Route12TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText3:
	text_far _Route12BattleText3
	text_end

Route12EndBattleText3:
	text_far _Route12EndBattleText3
	text_end

Route12AfterBattleText3:
	text_far _Route12AfterBattleText3
	text_end

Route12Text5:
	text_asm
	ld hl, Route12TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText4:
	text_far _Route12BattleText4
	text_end

Route12EndBattleText4:
	text_far _Route12EndBattleText4
	text_end

Route12AfterBattleText4:
	text_far _Route12AfterBattleText4
	text_end

Route12Text6:
	text_asm
	ld hl, Route12TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText5:
	text_far _Route12BattleText5
	text_end

Route12EndBattleText5:
	text_far _Route12EndBattleText5
	text_end

Route12AfterBattleText5:
	text_far _Route12AfterBattleText5
	text_end

Route12Text7:
	text_asm
	ld hl, Route12TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText6:
	text_far _Route12BattleText6
	text_end

Route12EndBattleText6:
	text_far _Route12EndBattleText6
	text_end

Route12AfterBattleText6:
	text_far _Route12AfterBattleText6
	text_end

Route12Text8:
	text_asm
	ld hl, Route12TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText7:
	text_far _Route12BattleText7
	text_end

Route12EndBattleText7:
	text_far _Route12EndBattleText7
	text_end

Route12AfterBattleText7:
	text_far _Route12AfterBattleText7
	text_end

Route12Text11:
	text_far _Route12Text11
	text_end

Route12Text12:
	text_far _Route12Text12
	text_end
