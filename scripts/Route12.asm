Route12_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route12TrainerHeader0
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
	ld [hSpriteIndexOrTextID], a
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
	ld [hSpriteIndexOrTextID], a
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

Route12TrainerHeader0:
	dbEventFlagBit EVENT_BEAT_ROUTE_12_TRAINER_0
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_12_TRAINER_0
	dw Route12BattleText1 ; TextBeforeBattle
	dw Route12AfterBattleText1 ; TextAfterBattle
	dw Route12EndBattleText1 ; TextEndBattle
	dw Route12EndBattleText1 ; TextEndBattle

Route12TrainerHeader1:
	dbEventFlagBit EVENT_BEAT_ROUTE_12_TRAINER_1
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_12_TRAINER_1
	dw Route12BattleText2 ; TextBeforeBattle
	dw Route12AfterBattleText2 ; TextAfterBattle
	dw Route12EndBattleText2 ; TextEndBattle
	dw Route12EndBattleText2 ; TextEndBattle

Route12TrainerHeader2:
	dbEventFlagBit EVENT_BEAT_ROUTE_12_TRAINER_2
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_12_TRAINER_2
	dw Route12BattleText3 ; TextBeforeBattle
	dw Route12AfterBattleText3 ; TextAfterBattle
	dw Route12EndBattleText3 ; TextEndBattle
	dw Route12EndBattleText3 ; TextEndBattle

Route12TrainerHeader3:
	dbEventFlagBit EVENT_BEAT_ROUTE_12_TRAINER_3
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_12_TRAINER_3
	dw Route12BattleText4 ; TextBeforeBattle
	dw Route12AfterBattleText4 ; TextAfterBattle
	dw Route12EndBattleText4 ; TextEndBattle
	dw Route12EndBattleText4 ; TextEndBattle

Route12TrainerHeader4:
	dbEventFlagBit EVENT_BEAT_ROUTE_12_TRAINER_4
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_12_TRAINER_4
	dw Route12BattleText5 ; TextBeforeBattle
	dw Route12AfterBattleText5 ; TextAfterBattle
	dw Route12EndBattleText5 ; TextEndBattle
	dw Route12EndBattleText5 ; TextEndBattle

Route12TrainerHeader5:
	dbEventFlagBit EVENT_BEAT_ROUTE_12_TRAINER_5
	db ($4 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_12_TRAINER_5
	dw Route12BattleText6 ; TextBeforeBattle
	dw Route12AfterBattleText6 ; TextAfterBattle
	dw Route12EndBattleText6 ; TextEndBattle
	dw Route12EndBattleText6 ; TextEndBattle

Route12TrainerHeader6:
	dbEventFlagBit EVENT_BEAT_ROUTE_12_TRAINER_6, 1
	db ($1 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_ROUTE_12_TRAINER_6, 1
	dw Route12BattleText7 ; TextBeforeBattle
	dw Route12AfterBattleText7 ; TextAfterBattle
	dw Route12EndBattleText7 ; TextEndBattle
	dw Route12EndBattleText7 ; TextEndBattle

	db $ff

Route12Text1:
	TX_FAR _Route12Text1
	db "@"

Route12Text13:
	TX_FAR _Route12Text13
	db "@"

Route12Text14:
	TX_FAR _Route12Text14
	db "@"

Route12Text2:
	TX_ASM
	ld hl, Route12TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText1:
	TX_FAR _Route12BattleText1
	db "@"

Route12EndBattleText1:
	TX_FAR _Route12EndBattleText1
	db "@"

Route12AfterBattleText1:
	TX_FAR _Route12AfterBattleText1
	db "@"

Route12Text3:
	TX_ASM
	ld hl, Route12TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText2:
	TX_FAR _Route12BattleText2
	db "@"

Route12EndBattleText2:
	TX_FAR _Route12EndBattleText2
	db "@"

Route12AfterBattleText2:
	TX_FAR _Route12AfterBattleText2
	db "@"

Route12Text4:
	TX_ASM
	ld hl, Route12TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText3:
	TX_FAR _Route12BattleText3
	db "@"

Route12EndBattleText3:
	TX_FAR _Route12EndBattleText3
	db "@"

Route12AfterBattleText3:
	TX_FAR _Route12AfterBattleText3
	db "@"

Route12Text5:
	TX_ASM
	ld hl, Route12TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText4:
	TX_FAR _Route12BattleText4
	db "@"

Route12EndBattleText4:
	TX_FAR _Route12EndBattleText4
	db "@"

Route12AfterBattleText4:
	TX_FAR _Route12AfterBattleText4
	db "@"

Route12Text6:
	TX_ASM
	ld hl, Route12TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText5:
	TX_FAR _Route12BattleText5
	db "@"

Route12EndBattleText5:
	TX_FAR _Route12EndBattleText5
	db "@"

Route12AfterBattleText5:
	TX_FAR _Route12AfterBattleText5
	db "@"

Route12Text7:
	TX_ASM
	ld hl, Route12TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText6:
	TX_FAR _Route12BattleText6
	db "@"

Route12EndBattleText6:
	TX_FAR _Route12EndBattleText6
	db "@"

Route12AfterBattleText6:
	TX_FAR _Route12AfterBattleText6
	db "@"

Route12Text8:
	TX_ASM
	ld hl, Route12TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText7:
	TX_FAR _Route12BattleText7
	db "@"

Route12EndBattleText7:
	TX_FAR _Route12EndBattleText7
	db "@"

Route12AfterBattleText7:
	TX_FAR _Route12AfterBattleText7
	db "@"

Route12Text11:
	TX_FAR _Route12Text11
	db "@"

Route12Text12:
	TX_FAR _Route12Text12
	db "@"
