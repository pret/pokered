SSAnne9Script: ; 61b4b (18:5b4b)
	ld a, $1
	ld [wAutoTextBoxDrawingControl], a
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, SSAnne9TrainerHeaders
	ld de, SSAnne9ScriptPointers
	ld a, [wSSAnne9CurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne9CurScript], a
	ret

SSAnne9ScriptPointers: ; 61b64 (18:5b64)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne9TextPointers: ; 61b6a (18:5b6a)
	dw SSAnne9Text1
	dw SSAnne9Text2
	dw SSAnne9Text3
	dw SSAnne9Text4
	dw SSAnne9Text5
	dw PickUpItemText
	dw SSAnne9Text7
	dw SSAnne9Text8
	dw PickUpItemText
	dw SSAnne9Text10
	dw SSAnne9Text11
	dw SSAnne9Text12
	dw SSAnne9Text13

SSAnne9TrainerHeaders: ; 61b84 (18:5b84)
SSAnne9TrainerHeader0: ; 61b84 (18:5b84)
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_0
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_0
	dw SSAnne9BattleText1 ; TextBeforeBattle
	dw SSAnne9AfterBattleText1 ; TextAfterBattle
	dw SSAnne9EndBattleText1 ; TextEndBattle
	dw SSAnne9EndBattleText1 ; TextEndBattle

SSAnne9TrainerHeader1: ; 61b90 (18:5b90)
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_1
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_1
	dw SSAnne9BattleText2 ; TextBeforeBattle
	dw SSAnne9AfterBattleText2 ; TextAfterBattle
	dw SSAnne9EndBattleText2 ; TextEndBattle
	dw SSAnne9EndBattleText2 ; TextEndBattle

SSAnne9TrainerHeader2: ; 61b9c (18:5b9c)
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_2
	db ($3 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_2
	dw SSAnne9BattleText3 ; TextBeforeBattle
	dw SSAnne9AfterBattleText3 ; TextAfterBattle
	dw SSAnne9EndBattleText3 ; TextEndBattle
	dw SSAnne9EndBattleText3 ; TextEndBattle

SSAnne9TrainerHeader3: ; 61ba8 (18:5ba8)
	dbEventFlagBit EVENT_BEAT_SS_ANNE_9_TRAINER_3
	db ($2 << 4) ; trainer's view range
	dwEventFlagAddress EVENT_BEAT_SS_ANNE_9_TRAINER_3
	dw SSAnne9BattleText4 ; TextBeforeBattle
	dw SSAnne9AfterBattleText4 ; TextAfterBattle
	dw SSAnne9EndBattleText4 ; TextEndBattle
	dw SSAnne9EndBattleText4 ; TextEndBattle

	db $ff

SSAnne9Text1: ; 61bb5 (18:5bb5)
	TX_ASM
	ld hl, SSAnne9TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text2: ; 61bbf (18:5bbf)
	TX_ASM
	ld hl, SSAnne9TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text3: ; 61bc9 (18:5bc9)
	TX_ASM
	ld hl, SSAnne9TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text4: ; 61bd3 (18:5bd3)
	TX_ASM
	ld hl, SSAnne9TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne9Text5: ; 61bdd (18:5bdd)
	TX_ASM
	call SaveScreenTilesToBuffer1
	ld hl, SSAnne9Text_61bf2
	call PrintText
	call LoadScreenTilesFromBuffer1
	ld a, SNORLAX
	call DisplayPokedex
	jp TextScriptEnd

SSAnne9Text_61bf2: ; 61bf2 (18:5bf2)
	TX_FAR _SSAnne9Text_61bf2
	db "@"

SSAnne9Text7: ; 61bf7 (18:5bf7)
	TX_ASM
	ld hl, SSAnne9Text_61c01
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c01: ; 61c01 (18:5c01)
	TX_FAR _SSAnne9Text_61c01
	db "@"

SSAnne9Text8: ; 61c06 (18:5c06)
	TX_ASM
	ld hl, SSAnne9Text_61c10
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c10: ; 61c10 (18:5c10)
	TX_FAR _SSAnne9Text_61c10
	db "@"

SSAnne9Text10: ; 61c15 (18:5c15)
	TX_ASM
	ld hl, SSAnne9Text_61c1f
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c1f: ; 61c1f (18:5c1f)
	TX_FAR _SSAnne9Text_61c1f
	db "@"

SSAnne9Text11: ; 61c24 (18:5c24)
	TX_ASM
	ld hl, SSAnne9Text_61c2e
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c2e: ; 61c2e (18:5c2e)
	TX_FAR _SSAnne9Text_61c2e
	db "@"

SSAnne9Text12: ; 61c33 (18:5c33)
	TX_ASM
	ld hl, SSAnne9Text_61c3d
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c3d: ; 61c3d (18:5c3d)
	TX_FAR _SSAnne9Text_61c3d
	db "@"

SSAnne9Text13: ; 61c42 (18:5c42)
	TX_ASM
	ld hl, SSAnne9Text_61c4c
	call PrintText
	jp TextScriptEnd

SSAnne9Text_61c4c: ; 61c4c (18:5c4c)
	TX_FAR _SSAnne9Text_61c4c
	db "@"

SSAnne9BattleText1: ; 61c51 (18:5c51)
	TX_FAR _SSAnne9BattleText1
	db "@"

SSAnne9EndBattleText1: ; 61c56 (18:5c56)
	TX_FAR _SSAnne9EndBattleText1
	db "@"

SSAnne9AfterBattleText1: ; 61c5b (18:5c5b)
	TX_FAR _SSAnne9AfterBattleText1
	db "@"

SSAnne9BattleText2: ; 61c60 (18:5c60)
	TX_FAR _SSAnne9BattleText2
	db "@"

SSAnne9EndBattleText2: ; 61c65 (18:5c65)
	TX_FAR _SSAnne9EndBattleText2
	db "@"

SSAnne9AfterBattleText2: ; 61c6a (18:5c6a)
	TX_FAR _SSAnne9AfterBattleText2
	db "@"

SSAnne9BattleText3: ; 61c6f (18:5c6f)
	TX_FAR _SSAnne9BattleText3
	db "@"

SSAnne9EndBattleText3: ; 61c74 (18:5c74)
	TX_FAR _SSAnne9EndBattleText3
	db "@"

SSAnne9AfterBattleText3: ; 61c79 (18:5c79)
	TX_FAR _SSAnne9AfterBattleText3
	db "@"

SSAnne9BattleText4: ; 61c7e (18:5c7e)
	TX_FAR _SSAnne9BattleText4
	db "@"

SSAnne9EndBattleText4: ; 61c83 (18:5c83)
	TX_FAR _SSAnne9EndBattleText4
	db "@"

SSAnne9AfterBattleText4: ; 61c88 (18:5c88)
	TX_FAR _SSAnne9AfterBattleText4
	db "@"
