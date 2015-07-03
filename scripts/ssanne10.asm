SSAnne10Script: ; 61d55 (18:5d55)
	call EnableAutoTextBoxDrawing
	ld hl, SSAnne10TrainerHeaders
	ld de, SSAnne10ScriptPointers
	ld a, [W_SSANNE10CURSCRIPT]
	call ExecuteCurMapScriptInTable
	ld [W_SSANNE10CURSCRIPT], a
	ret

SSAnne10ScriptPointers: ; 61d68 (18:5d68)
	dw CheckFightingMapTrainers
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle

SSAnne10TextPointers: ; 61d6e (18:5d6e)
	dw SSAnne10Text1
	dw SSAnne10Text2
	dw SSAnne10Text3
	dw SSAnne10Text4
	dw SSAnne10Text5
	dw SSAnne10Text6
	dw SSAnne10Text7
	dw SSAnne10Text8
	dw Predef5CText
	dw Predef5CText
	dw Predef5CText

SSAnne10TrainerHeaders: ; 61d84 (18:5d84)
SSAnne10TrainerHeader0: ; 61d84 (18:5d84)
	db $1 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd809 ; flag's byte
	dw SSAnne10BattleText1 ; TextBeforeBattle
	dw SSAnne10AfterBattleText1 ; TextAfterBattle
	dw SSAnne10EndBattleText1 ; TextEndBattle
	dw SSAnne10EndBattleText1 ; TextEndBattle

SSAnne10TrainerHeader1: ; 61d90 (18:5d90)
	db $2 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd809 ; flag's byte
	dw SSAnne10BattleText2 ; TextBeforeBattle
	dw SSAnne10AfterBattleText2 ; TextAfterBattle
	dw SSAnne10EndBattleText2 ; TextEndBattle
	dw SSAnne10EndBattleText2 ; TextEndBattle

SSAnne10TrainerHeader2: ; 61d9c (18:5d9c)
	db $3 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd809 ; flag's byte
	dw SSAnne10BattleText3 ; TextBeforeBattle
	dw SSAnne10AfterBattleText3 ; TextAfterBattle
	dw SSAnne10EndBattleText3 ; TextEndBattle
	dw SSAnne10EndBattleText3 ; TextEndBattle

SSAnne10TrainerHeader3: ; 61da8 (18:5da8)
	db $4 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd809 ; flag's byte
	dw SSAnne10BattleText4 ; TextBeforeBattle
	dw SSAnne10AfterBattleText4 ; TextAfterBattle
	dw SSAnne10EndBattleText4 ; TextEndBattle
	dw SSAnne10EndBattleText4 ; TextEndBattle

SSAnne10TrainerHeader4: ; 61db4 (18:5db4)
	db $5 ; flag's bit
	db ($2 << 4) ; trainer's view range
	dw wd809 ; flag's byte
	dw SSAnne10BattleText5 ; TextBeforeBattle
	dw SSAnne10AfterBattleText5 ; TextAfterBattle
	dw SSAnne10EndBattleText5 ; TextEndBattle
	dw SSAnne10EndBattleText5 ; TextEndBattle

SSAnne10TrainerHeader5: ; 61dc0 (18:5dc0)
	db $6 ; flag's bit
	db ($3 << 4) ; trainer's view range
	dw wd809 ; flag's byte
	dw SSAnne10BattleText6 ; TextBeforeBattle
	dw SSAnne10AfterBattleText6 ; TextAfterBattle
	dw SSAnne10EndBattleText6 ; TextEndBattle
	dw SSAnne10EndBattleText6 ; TextEndBattle

	db $ff

SSAnne10Text1: ; 61dcd (18:5dcd)
	TX_ASM
	ld hl, SSAnne10TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text2: ; 61dd7 (18:5dd7)
	TX_ASM
	ld hl, SSAnne10TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text3: ; 61de1 (18:5de1)
	TX_ASM
	ld hl, SSAnne10TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text4: ; 61deb (18:5deb)
	TX_ASM
	ld hl, SSAnne10TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text5: ; 61df5 (18:5df5)
	TX_ASM
	ld hl, SSAnne10TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text6: ; 61dff (18:5dff)
	TX_ASM
	ld hl, SSAnne10TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

SSAnne10Text8: ; 61e09 (18:5e09)
	TX_FAR _SSAnne10Text8
	TX_ASM
	ld a, MACHOKE
	call PlayCry
	jp TextScriptEnd

SSAnne10BattleText1: ; 61e16 (18:5e16)
	TX_FAR _SSAnne10BattleText1
	db "@"

SSAnne10EndBattleText1: ; 61e1b (18:5e1b)
	TX_FAR _SSAnne10EndBattleText1
	db "@"

SSAnne10AfterBattleText1: ; 61e20 (18:5e20)
	TX_FAR _SSAnne10AfterBattleText1
	db "@"

SSAnne10BattleText2: ; 61e25 (18:5e25)
	TX_FAR _SSAnne10BattleText2
	db "@"

SSAnne10EndBattleText2: ; 61e2a (18:5e2a)
	TX_FAR _SSAnne10EndBattleText2
	db "@"

SSAnne10AfterBattleText2: ; 61e2f (18:5e2f)
	TX_FAR _SSAnne10AfterBattleText2
	db "@"

SSAnne10BattleText3: ; 61e34 (18:5e34)
	TX_FAR _SSAnne10BattleText3
	db "@"

SSAnne10EndBattleText3: ; 61e39 (18:5e39)
	TX_FAR _SSAnne10EndBattleText3
	db "@"

SSAnne10AfterBattleText3: ; 61e3e (18:5e3e)
	TX_FAR _SSAnne10AfterBattleText3
	db "@"

SSAnne10BattleText4: ; 61e43 (18:5e43)
	TX_FAR _SSAnne10BattleText4
	db "@"

SSAnne10EndBattleText4: ; 61e48 (18:5e48)
	TX_FAR _SSAnne10EndBattleText4
	db "@"

SSAnne10AfterBattleText4: ; 61e4d (18:5e4d)
	TX_FAR _SSAnne10AfterBattleText4
	db "@"

SSAnne10BattleText5: ; 61e52 (18:5e52)
	TX_FAR _SSAnne10BattleText5
	db "@"

SSAnne10EndBattleText5: ; 61e57 (18:5e57)
	TX_FAR _SSAnne10EndBattleText5
	db "@"

SSAnne10AfterBattleText5: ; 61e5c (18:5e5c)
	TX_FAR _SSAnne10AfterBattleText5
	db "@"

SSAnne10BattleText6: ; 61e61 (18:5e61)
	TX_FAR _SSAnne10BattleText6
	db "@"

SSAnne10EndBattleText6: ; 61e66 (18:5e66)
	TX_FAR _SSAnne10EndBattleText6
	db "@"

SSAnne10AfterBattleText6: ; 61e6b (18:5e6b)
	TX_FAR _SSAnne10AfterBattleText6
	db "@"

SSAnne10Text7: ; 61e70 (18:5e70)
	TX_FAR _SSAnne10Text7
	db "@"
